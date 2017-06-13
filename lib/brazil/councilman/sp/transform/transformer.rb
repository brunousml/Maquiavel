require_relative '../extract/db_extract'
require_relative 'db_transform'
require_relative 'parser'

# This class is used to parse and save transformed data from open data
# Dependencies:
#   db_transform
#   parser
#
# Example of use:
#   transformer = SPCouncilman::Transformer.new
#   transformer.save

module SPCouncilman
  class Transformer
    def initialize
      # Set up
      @parser = SPCouncilman::Parser.new
      @db_transform = SPCouncilman::DbTransform.new
      @db_extract = SPCouncilman::DbExtract.new
    end

    # Save debits from extract database to transform database and here is
    # location on we normalize that information.
    def save_debits
      # Get All raw debits from open data saved on our mongodb database
      all_raw_debits = @db_extract.get_debits # TODO: improve

      # Insert into councilmans_debits table each one debit
      all_raw_debits[0]['debits'].each do |raw_debit|
        # Parse open data information to our context
        debits_to_save = @parser.get_debit_object_to_save_in_mysql(raw_debit)

        # Here we need to get or create councilman to create FK in debits
        councilman = get_or_create_councilman(debits_to_save[:councilman][:name], 1, 1)

        # Create debits with councilman_id
        debits = get_or_create_councilman_debits(debits_to_save[:debit], councilman[0]['id'])
      end
    end

    def get_or_create_councilman(name, city_id, state_id)
      # Get Councilman
      query = @db_transform.get({ 'name' => name }, 'councilman')

      # if councilman not exist
      if query[:rows_affected] == 0
        # Save councilman
        to_save = {
            :name => name,
            :city_id => city_id,
            :state_id => state_id
        }
        @db_transform.create(to_save, 'councilman')

        # Get councilman after insertion
        query = @db_transform.get({ :name => name }, 'councilman')
      end
      councilman = query[:result].each(:as => :hash) {|el| el}
      councilman
    end

    def get_or_create_councilman_debits(debit, councilman_id)
      # Get Councilman
      debit[:councilman_id] = councilman_id
      where = debit
      where.delete(:value)
      query = @db_transform.get(where, 'councilman_debits')

      if query[:rows_affected] == 0
        contact_information = @db_transform.create(debit, 'councilman_debits')
        query = @db_transform.get(where, 'councilman_debits')
      end

      result = query[:result].each(:as => :hash) {|el| el}
      result[0]
    end
  end
end

