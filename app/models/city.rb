class City < ActiveRecord::Base
  self.table_name = "cidades"
  self.primary_key = 'nome'

end
