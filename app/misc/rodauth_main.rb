class RodauthMain < Rodauth::Rails::Auth
  configure do
    # List of authentication features that are loaded.
    enable(
      :create_account,
      :verify_account,
      :verify_account_grace_period,
      :login,
      :logout,
      :remember,
      :reset_password,
      :reset_password_notify,
      :change_password,
      :change_password_notify,
      :change_login,
      :verify_login_change,
      :close_account,
      :active_sessions,
      :audit_logging,
      :internal_request
    )

    # See the Rodauth documentation for the list of available config options:
    # http://rodauth.jeremyevans.net/documentation.html

    # ==> General
    # The secret key used for hashing public-facing tokens for various features.
    # Defaults to Rails `secret_key_base`, but you can use your own secret key.
    # hmac_secret "a7ba4fa7133c889cca7eb84897867c7dcbd21b9593e80562f2dc3974d2f68c166ae376b96fbfb23f366796699514478845581de8265b12cbf14d854ee5a8bc38"

    # Specify the controller used for view rendering and CSRF verification.
    rails_controller { RodauthController }

    # Set on Rodauth controller with the title of the current page.
    title_instance_variable :@page_title

    # Store account status in an integer column without foreign key constraint.
    account_status_column :status

    # Store password hash in a column instead of a separate table.
    account_password_hash_column :password_hash

    # Set password when creating account instead of when verifying.
    verify_account_set_password? false

    # Redirect back to originally requested location after authentication.
    # login_return_to_requested_location? true
    # two_factor_auth_return_to_requested_location? true # if using MFA

    # Autologin the user after they have reset their password.
    # reset_password_autologin? true

    # Delete the account record when the user has closed their account.
    # delete_account_on_close? true

    # Redirect to the app from login and registration pages if already logged in.
    already_logged_in { redirect login_redirect }

    # ==> Emails
    # Use a custom mailer for delivering authentication emails.
    create_reset_password_email do
      RodauthMailer.reset_password(
        self.class.configuration_name,
        account_id,
        reset_password_key_value
      )
    end

    create_verify_account_email do
      RodauthMailer.verify_account(
        self.class.configuration_name,
        account_id,
        verify_account_key_value
      )
    end

    create_verify_login_change_email do |_login|
      RodauthMailer.verify_login_change(
        self.class.configuration_name,
        account_id,
        verify_login_change_key_value
      )
    end

    create_password_changed_email do
      RodauthMailer.password_changed(self.class.configuration_name, account_id)
    end
    # create_email_auth_email do
    #   RodauthMailer.email_auth(self.class.configuration_name, account_id, email_auth_key_value)
    # end
    # create_unlock_account_email do
    #   RodauthMailer.unlock_account(self.class.configuration_name, account_id, unlock_account_key_value)
    # end
    send_email do |email|
      # queue email delivery on the mailer after the transaction commits
      db.after_commit { email.deliver_later }
    end

    # ==> Flash
    # Match flash keys with ones already used in the Rails app.
    # flash_notice_key :success # default is :notice
    # flash_error_key :error # default is :alert

    # Override default flash messages.
    # create_account_notice_flash "Your account has been created. Please verify your account by visiting the confirmation link sent to your email address."
    # require_login_error_flash "Login is required for accessing this page"
    # login_notice_flash nil

    # ==> Validation
    # Override default validation error messages.
    # no_matching_login_message "user with this email address doesn't exist"
    # already_an_account_with_this_login_message "user with this email address already exists"
    # password_too_short_message { "needs to have at least #{password_minimum_length} characters" }
    # login_does_not_meet_requirements_message { "invalid email#{", #{login_requirement_message}" if login_requirement_message}" }

    # Change minimum number of password characters required when creating an account.
    # password_minimum_length 8

    # ==> Remember Feature
    # Remember all logged in users.
    # after_login { remember_login }

    # Or only remember users that have ticked a "Remember Me" checkbox on login.
    after_login { remember_login if param_or_nil("remember") }

    login_redirect { Rails.application.routes.url_helpers.dashboard_path }

    # Extend user's remember period when remembered via a cookie
    extend_remember_deadline? true

    # ==> Hooks
    # Validate custom fields in the create account form.
    # before_create_account do
    #   throw_error_status(422, "name", "must be present") if param("name").empty?
    # end

    # Perform additional actions after the account is created.
    # after_create_account do
    #   Profile.create!(account_id: account_id, name: param("name"))
    # end

    # Do additional cleanup after the account is closed.
    # after_close_account do
    #   Profile.find_by!(account_id: account_id).destroy
    # end

    # ==> Redirects
    # Redirect to home page after logout.
    logout_redirect "/"

    # Redirect to wherever login redirects to after account verification.
    verify_account_redirect { login_redirect }

    # Redirect to login page after password reset.
    reset_password_redirect { login_path }

    # Ensure requiring login follows login route changes.
    require_login_redirect { login_path }
    # ==> Deadlines
    # Change default deadlines for some actions.
    # verify_account_grace_period 3.days
    # reset_password_deadline_interval Hash[hours: 6]
    # verify_login_change_deadline_interval Hash[days: 2]
    # remember_deadline_interval Hash[days: 30]

    after_create_account do
      acc = fetch_account
      Rails.configuration.command_bus.call(
        Accounts::Commands::CreateAccount.new(
          account_uuid: acc.uuid,
          email: acc.email,
          password_hash: acc.password_hash,
          organization_uuid: MultiTenantSupport.current_tenant.uuid
        )
      )
    end

    after_login do
      organization_account =
        OrganizationAccount.find_by(
          account_id: account_id,
          organization_id: MultiTenantSupport.current_tenant_id
        )
      unless organization_account
        throw_error("account_id", "Account not found for tenant")
      end

      OrganizationActiveSession.create!(
        organization_id: MultiTenantSupport.current_tenant_id,
        account_id: account_id,
        session_key_id: session_value
      )
    end

    before_logout do
      org_active_session =
        OrganizationActiveSession.find_by(
          organization_id: MultiTenantSupport.current_tenant_id,
          session_key_id: session_value
        )
      org_active_session.destroy! if org_active_session
    end
  end

  def setup_account_verification
    acc = fetch_account
    Rails.configuration.command_bus.call(
      Accounts::Commands::SetupAccountVerification.new(account_uuid: acc.uuid)
    )
    send_verify_account_email
  end

  def verify_account
    acc = fetch_account
    key = get_verify_account_key(account_id)
    Rails.configuration.command_bus.call(
      Accounts::Commands::VerifyAccount.new(
        account_uuid: acc.uuid,
        verification_key: key
      )
    )
  end

  private

  def fetch_account
    ::Account.find(account_id)
  end
end
