class Video < ActiveRecord::Base
  self.table_name = "videos"
  self.primary_key = 'id'

  belongs_to :medium, :foreign_key => 'id_midia'

end