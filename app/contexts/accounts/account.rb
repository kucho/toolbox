module Accounts
  class Account
    include AggregateRoot

    AlreadyRegistered = Class.new(StandardError)
    AlreadyConfirmed = Class.new(StandardError)

    attr_reader :uuid

    def initialize(uuid)
      @uuid = uuid
      @organization_uuid = MultiTenantSupport.current_tenant.uuid
      @state = :unverified
    end

    def create(email:, password_hash:)
      raise AlreadyRegistered if @created

      apply(
        Events::AccountCreated.new(
          data: {
            account_uuid: @uuid,
            organization_uuid: @organization_uuid,
            email: email,
            password_hash: password_hash
          }
        )
      )
    end

    def setup_verification
      key = SecureRandom.urlsafe_base64(32)

      apply(
        Events::AccountVerificationSetup.new(
          data: {
            account_uuid: @uuid,
            verification_key: key
          }
        )
      )
    end

    def verify(key)
      raise AlreadyConfirmed if @state == :verified

      apply(
        Events::AccountVerified.new(
          data: {
            account_uuid: @uuid,
            verification_key: key
          }
        )
      )
    end

    def cancel(reason)
      apply(
        Events::AccountCancelled.new(
          data: {
            account_uuid: @uuid,
            reason: reason
          }
        )
      )
    end

    on(Events::AccountCreated) { |_event| @created = true }

    on(Events::AccountVerified) { |_event| @status = :verified }

    on(Events::AccountCancelled) { |_event| @status = :closed }

    on(Events::AccountVerificationSetup) do |_event|
      @verification_sent = Time.current
    end
  end
end
