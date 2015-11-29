class Country < ActiveRecord::Base
  self.table_name = "paises"
  self.primary_key = 'nome'

end
