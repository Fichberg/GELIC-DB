class Medium < ActiveRecord::Base
  self.table_name = "midias"
  self.primary_key = 'id'

  belongs_to :city, :foreign_key => 'id_cidade'

end
