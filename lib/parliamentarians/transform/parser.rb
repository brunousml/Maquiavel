require_relative '../extract/db_extract'

# This class is used to parse parliamentarians information obtained
# from extract DB
# Dependencies:
#   extract/db_extract
#
# Example of use:
#   parser = Parliamentarians::Parser.new
module Parliamentarians
  class Parser
    def initialize
      @db_extract = Parliamentarians::DbExtract.new
    end

    def get_contact(parliamentary)
      id = parliamentary['IdentificacaoParlamentar']

      {
          :name => id['NomeParlamentar'],
          :email => id['EmailParlamentar'],
          :photo => id['UrlFotoParlamentar'],
          :uf => id['UfParlamentar'],
          :party => id['SiglaPartidoParlamentar']
      }
    end

    def get_parliamentarians_raw
      parliamentarians = nil
      @db_extract.collection.find({}).sort("value"=>-1).each { |k| parliamentarians = k }
      parliamentarians['parliamentarians']['ListaParlamentarEmExercicio']['Parlamentares']['Parlamentar']
    end
  end
end

