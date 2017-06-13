# encoding: UTF-8

# This class is used to parse councilman information obtained
# from extract DB
# Dependencies:
#   extract/db_extract
#
# Example of use:
#   parser = SPCouncilman::Parser.new
module SPCouncilman
  class Parser
    def get_debit_object_to_save_in_mysql(debit)
      {
        :debit =>{
          :code => debit['Chave'],
          :filename => debit['NomeArquivo'],
          :cost_center_code => debit['CENTROCUSTOSID'],
          :cost_object => debit['DESPESA'],
          :department => debit['DEPARTAMENTO'],
          :department_type => debit['TIPODEPARTAMENTO'],
          :year => debit['ANO'],
          :month => debit['MES'],
          :cnpj => debit['CNPJ'],
          :provider => debit['FORNECEDOR'].sub("'", ""),
          :value => debit['VALOR'],
        },
        :councilman => {
            :name => debit['VEREADOR']
        }
      }
    end
  end
end

