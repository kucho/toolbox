module Accounts
  class Configuration
    def call
      command_bus.register(
        Commands::CreateAccount,
        Handlers::CreateAccountHandler.new
      )
      command_bus.register(
        Commands::SetupAccountVerification,
        Handlers::SetupAccountVerificationHandler.new
      )
      command_bus.register(
        Commands::VerifyAccount,
        Handlers::VerifyAccountHandler.new
      )
      command_bus.register(
        Commands::CancelAccount,
        Handlers::CancelAccountHandler.new
      )
    end

    private

    def command_bus
      @command_bus ||= Rails.configuration.command_bus
    end
  end
end
