class Reviewer < ActiveRecord::Base
  self.table_name = "membro_revisou_transcricao"
  self.primary_key = 'id_midia'

end
