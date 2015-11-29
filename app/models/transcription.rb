class Transcription < ActiveRecord::Base

  self.table_name = "transcricoes"
  self.primary_key = 'id'

  belongs_to :media
  belongs_to :city
end
