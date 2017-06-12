require 'net/http'
require 'uri'
require 'json'
require_relative '../../../../../lib/settings'

# This class is used to recovery councilman data from open data
# and save json on mongo
# Dependencies:
#   net/http
#   uri
#   json
#
# Example of use:
#   @requester = Councilman::Requester.new(COUNCILMAN_URL)
#   data = @requester.get

module SPCouncilman
  class Requester
    attr_reader :base_url

    def initialize(url)
      @base_url = url
    end

    def get_debits
      @uri_actual_list = get_all_uris_to_debits(@base_url)
      all_content = []
      @uri_actual_list.each do |uri_by_year|
        uri_by_year[1].each do |uri|
          content = do_request(uri[1])
          all_content.concat(content)
        end
      end
      all_content
    end

    private
    def do_request(uri)
      resp = Net::HTTP.get_response(uri)
      json_to_hash(resp)
    end

    def json_to_hash(resp)
      JSON.parse(resp.body)
    end

    def get_all_uris_to_debits(url)
      from_year = OPEN_DATA_URLS['brazil']['councilman']['sp']['from_year']
      to_year = OPEN_DATA_URLS['brazil']['councilman']['sp']['to_year']
      uris = {}

      while from_year <= to_year do
        uris.merge!({from_year => {}})

        12.times do |month|
          month += 1
          uris[from_year].merge!({ month => URI.parse(url + "ano=#{from_year}&mes=#{month}")})
        end
        from_year += 1
      end

      uris
    end
  end
end