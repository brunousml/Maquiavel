#!/usr/bin/env ruby
require 'net/http'
require 'uri'
require 'json'

module Parliamentarians
  class Requester
    def initialize(url)
      @@uri_actual_list = URI.parse(url)
    end

    def get_json_raw
      do_request(create_json_request)
    end

    def length
      @list ||= json_to_hash
      @list['ListaParlamentarEmExercicio']['Parlamentares']['Parlamentar'].length
    end

    private
    def do_request(req)
      @resp = Net::HTTP.new(@@uri_actual_list.host,
                            @@uri_actual_list.port).start {|http| http.request(req) }
    end

    def json_to_hash
      @resp ||= get_json_raw
      @list = JSON.parse(@resp.body)
    end

    def create_json_request
      header = {'Content-Type' =>'application/json'}
      req = Net::HTTP::Get.new(@@uri_actual_list,
                               initheader = header)
      req['Accept'] = "application/json"

      req
    end
  end
end