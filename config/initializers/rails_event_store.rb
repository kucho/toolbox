require "arkency/command_bus"

require_relative "../../lib/store_configuration"

Rails.configuration.to_prepare do
  Rails.configuration.event_store = RailsEventStore::Client.new
  Rails.configuration.command_bus = Arkency::CommandBus.new

  StoreConfiguration.new.call
end
