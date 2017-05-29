require_relative '../../../lib/b'

# This class is used to parse parliamentarians information obtained
# from extract DB
# Dependencies:
#
#
# Example of use:
#
module Parliamentarians
  class Parser
    def initialize(env='development')
      #@db = Parliamentarians::DbExtract.new(EXTRACT_MONGO_DB_SETTINGS[env])
    end

    def get_contact
      true
    end

    def get_parliamentarians_raw
      true
    end
  end
end

