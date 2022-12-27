module Pricing
  class Configuration
    def call
      command_bus.register(Commands::SetPrice, Handlers::SetPrice.new)
    end

    private

    def command_bus
      @command_bus ||= Rails.configuration.command_bus
    end
  end
end
