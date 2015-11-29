class City < ActiveRecord::Base

  self.table_name = "cidades"

  belongs_to :state, :foreign_key => 'nome_estado'
  belongs_to :country, :foreign_key => 'nome_pais'
end
