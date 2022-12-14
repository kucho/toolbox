module Organizations
  module Commands
    class CreateOrganization < Command
      attribute :name, Types::String
      attribute :domain, Types::String
      attribute :slug, Types::String
      attribute :logo, Types::String
    end
  end
end
