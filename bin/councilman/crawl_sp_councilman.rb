
# This file is used to import councilman though command line
# Dependencies:
#   lib/brazil/councilman/sp/transform/transformer
#
# Execute command to use:
#   ruby bin/crawl_sp_councilman.rb

require_relative 'ETL/extract_debits'
require_relative 'ETL/transform_debits_to_mysql'
