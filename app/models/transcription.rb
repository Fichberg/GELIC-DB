class Transcription < ActiveRecord::Base
  self.table_name = "transcricoes"
  self.primary_key = 'id'

  belongs_to :medium, :foreign_key => 'id_midia'
  belongs_to :city, :foreign_key => 'id_cidade'

  mount_uploader :codigo, TranscriptionUploader
end
