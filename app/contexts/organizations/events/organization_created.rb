module Organizations
  module Events
    class OrganizationCreated < Event
      attribute :name, Types::String
      attribute :domain, Types::String
      attribute :slug, Types::String
      attribute :logo, Types::String
      attribute :organization_uuid, Types::UUID
    end
  end
end
