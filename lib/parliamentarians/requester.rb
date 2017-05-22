#!/usr/bin/env ruby
require 'net/http'
require 'uri'
require 'json'

module Parliamentarians
  class Requester
    def initialize
      @@uri_actual_list = URI.parse("http://legis.senado.leg.br/dadosabertos/senador/lista/atual")
    end

    def get_json_raw
      # @raw_data = Net::HTTP.get(URI.parse(@@uri_actual_list))
      @resp = Net::HTTP.new(@@uri_actual_list.host,
                           @@uri_actual_list.port).start {|http| http.request(create_json_request) }
    end

    def parse
      @resp ||= get_json_raw
      @list = JSON.parse(@resp.body)
    end

    def length
      @list ||= parse
      @list['ListaParlamentarEmExercicio']['Parlamentares']['Parlamentar'].length
    end

    private
    def create_json_request
      header = {'Content-Type' =>'application/json'}
      req = Net::HTTP::Get.new(@@uri_actual_list,
                               initheader = header)
      req['Accept'] = "application/json"

      req
    end
  end
end