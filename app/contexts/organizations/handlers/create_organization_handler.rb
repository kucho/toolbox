module Organizations
  module Handlers
    class CreateOrganizationHandler
      def initialize
        @repository = AggregateRootRepository.new
      end

      def call(command)
        @repository.with_aggregate(::Organizations::Organization, SecureRandom.uuid) do |organization|
          organization.create(name: command.name, domain: command.domain, slug: command.slug, logo: command.logo)
        end
      end
    end

    class CreateOrganizationJob < EventHandlerJob
      def call(event)
        name = event.data.fetch(:name)
        domain = event.data.fetch(:domain)
        slug = event.data.fetch(:slug)
        logo = event.data.fetch(:logo)

        ::Organization.create!(name: name, domain: domain, subdomain: slug, slug: slug, logo: logo)
      end
    end
  end
end
