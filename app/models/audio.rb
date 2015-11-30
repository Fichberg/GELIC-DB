class Audio < ActiveRecord::Base
  self.table_name = "audios"
  self.primary_key = 'id'

  before_save :codigo_valid_format?
  belongs_to :medium, :foreign_key => 'id_midia'

  mount_uploader :codigo, AudioUploader

  def codigo_valid_format?
    raise "File is not a mpeg" unless codigo.file.content_type.eql?("audio/mpeg") || codigo.file.content_type.eql?("audio/x-wav") || codigo.file.content_type.eql?("audio/midi") || codigo.file.content_type.eql?("audio/mp3")
  end

end
