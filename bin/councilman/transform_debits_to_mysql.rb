require_relative '../../lib/brazil/councilman/sp/transform/transformer'

# Setup
transformer = SPCouncilman::Transformer.new

# Act
saved_number = transformer.save_debits
