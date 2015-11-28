require 'digest/md5'

class Membro < ActiveRecord::Base
  self.primary_key = 'email'

  def senha=(value)
    encrypted = Digest::MD5.hexdigest(value)
    write_attribute(:senha, encrypted)
  end

end
