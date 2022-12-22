module ProductCatalog
  class Configuration
    def call
      command_bus.register(Commands::RegisterProduct, Handlers::RegisterProduct.new)
      command_bus.register(Commands::NameProduct, Handlers::NameProduct.new)
    end

    private

    def command_bus
      @command_bus ||= Rails.configuration.command_bus
    end
  end
end
