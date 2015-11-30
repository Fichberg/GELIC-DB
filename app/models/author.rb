class Author < ActiveRecord::Base
  self.table_name = "membro_fez_transcricao"
  self.primary_key = 'id_midia'

end
