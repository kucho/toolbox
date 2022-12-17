module Organizations
  module Handlers
    class CreateOrganizationHandler
      def initialize
        @repository = AggregateRootRepository.new
      end

      def call(command)
        @repository.with_aggregate(::Organizations::Organization, SecureRandom.uuid) do |organization|
          organization.create(
            name: command.name,
            subdomain: command.subdomain || command.slug || command.name.downcase.underscore,
            domain: command.domain,
            slug: command.slug || command.name.downcase.underscore,
            logo: command.logo
          )
        end
      end
    end

    class CreateOrganizationJob < EventHandlerJob
      def call(event)
        org_attributes = event.data.slice(*::Organization.attribute_names.map(&:to_sym))
        ::Organization.create!(org_attributes)
      end
    end
  end
end
