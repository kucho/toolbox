module Organizations
  class Configuration
    def call
      command_bus.register(
        Commands::CreateOrganization,
        Handlers::CreateOrganizationHandler.new
      )
    end

    private

    def command_bus
      @command_bus ||= Rails.configuration.command_bus
    end
  end
end
