class Audio < ActiveRecord::Base
  self.table_name = "audios"
  self.primary_key = 'id'

  before_save :codigo_mpeg?

  belongs_to :medium, :foreign_key => 'id_midia'

  mount_uploader :codigo, AudioUploader

  def codigo_mpeg?
    raise "File is not a mpeg" unless codigo.file.content_type == 'audio/mp3' 
  end

end

