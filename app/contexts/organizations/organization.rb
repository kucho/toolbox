module Organizations
  class Organization
    include AggregateRoot

    attr_reader :uuid

    def initialize(uuid)
      @uuid = uuid
    end

    def create(name:, domain:, slug:, logo:)
      apply(
        Events::OrganizationCreated.new(
          data: {
            name: name,
            logo: logo,
            slug: slug,
            domain: domain,
            subdomain: slug,
            organization_uuid: @uuid
          }
        )
      )
    end

    on(Events::OrganizationCreated) do |_|
      # TODO
    end
  end
end
