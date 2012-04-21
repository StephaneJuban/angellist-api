module AngellistApi
  class Client
    # Defines methods related to URLs
    #
    # @see http://angel.co/api/spec/startups
    module Startups
      # Get a startup's information given an ID.
      #
      # @requires_authentication Optional
      # @response_format `json`
      #
      # @param [Integer] id ID of the desired startup.
      #
      # @example Get a startup's information given an ID.
      #   AngellistApi.get_startup(1234)
      def get_startup(id)
        get("1/startups/#{id}", :format => :json, :phoenix => true)
      end

      # Search for a startup given a URL slug. Responds like GET /startups/:id.
      #
      # @requires_authentication Optional
      # @response_format `json`
      #
      # @param [Hash] options A customizable set of options.
      # @option options [String] :slug The URL slug of the desired startup.
      # @option options [String] :domain The domain of the desired startup.
      #   Subdomains are not allowed. Keep in mind that startups can list any
      #   domain as their own. The startup with the most followers will be
      #   returned in the case of multiple hits.
      #
      # @example Search for a startup given a URL slug. Responds like GET /startups/:id.
      #   AngellistApi.startup_search(:slug => '500-startups-fund')
      def startup_search(options={})
        get("1/startups/search", options, :format => :json, :phoenix => true)
      end
    end
  end
end

