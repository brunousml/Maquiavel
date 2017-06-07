require 'net/http'
require 'uri'
require 'json'


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
    def initialize(url)
      @uri_actual_list = get_all_uris(url)
    end

    def get
      all_content = []
      @uri_actual_list.each do |uri_by_year|
        uri_by_year[1].each do |uri|
          content = do_request(uri[1])
          all_content << content
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

    def get_all_uris(url)
      year = 2015
      uris = {}

      while year <= 2017 do
        uris.merge!({year => {}})

        13.times do |month|
          next if month == 0
          uris[year].merge!({ month => URI.parse(url + "ano=#{year}&mes=#{month}")})
        end
        year += 1
      end

      uris
    end
  end
end