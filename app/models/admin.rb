class Admin < ActiveRecord::Base
  self.table_name = "administradores"
  self.primary_key = 'email'

end
