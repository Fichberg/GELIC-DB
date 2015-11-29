class State < ActiveRecord::Base

  self.table_name = "estados"

  belongs_to :country, :foreign_key => 'nome_pais'
end
