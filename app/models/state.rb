class State < ActiveRecord::Base
  self.table_name = "estados"
  self.primary_key = 'nome'

end
