require_relative '../../../../../../lib/brazil/councilman/sp/transform/parser'
require 'test/unit'

# This unit test is related to SPCouncilman::Parser class
module TestSPCouncilman
  class TestParser < Test::Unit::TestCase

    # Test get raw councilman debits from extract DB
    def test_get_raw_debits
      # Setup
      parser = SPCouncilman::Parser.new
      debit = {
          "Chave": "1222",
          "NomeArquivo": "20150100000000000000000000222.HTML",
          "CENTROCUSTOSID": 222,
          "DEPARTAMENTO": "GABINETE DE VEREADOR",
          "TIPODEPARTAMENTO": 1,
          "VEREADOR": "ABOU ANNI",
          "ANO": 2015,
          "MES": 1,
          "DESPESA": "COMBUSTIVEL",
          "CNPJ": "43.900.851/0001-01",
          "FORNECEDOR": "PROTOTIPO AUTO POSTO LTDA.",
          "VALOR": 300
      }

      # Act
      raw = parser.get_debit_object_to_save_in_mysql(debit)

      # Assertion
      assert_not_nil(raw)
      assert_not_nil(raw.has_key? "filename")
      assert_not_nil(raw.has_key? "code")
      assert_not_nil(raw.has_key? "value")
    end

  end
end