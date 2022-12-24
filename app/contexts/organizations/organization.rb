module Organizations
  class Organization
    include AggregateRoot

    attr_reader :uuid

    def initialize(uuid)
      @uuid = uuid
    end

    def create(name:, domain:, subdomain:, slug:, logo:)
      apply(
        Events::OrganizationCreated.new(
          data: {
            name: name,
            logo: logo,
            slug: slug,
            domain: domain,
            subdomain: subdomain,
            organization_uuid: @uuid
          }
        )
      )
    end

    on(Events::OrganizationCreated) { |_| }
  end
end
