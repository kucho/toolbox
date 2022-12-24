module Inventory
  class Configuration
    def call
      command_bus.register(Commands::Supply, Handlers::Supply.new)
    end

    private

    def command_bus
      @command_bus ||= Rails.configuration.command_bus
    end
  end
end
