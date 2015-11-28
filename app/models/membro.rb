require 'digest/md5'

class Membro < ActiveRecord::Base
  self.primary_key = 'id'

  validates_confirmation_of :senha
  validates_presence_of :senha_confirmation

  before_save :encrypt_senha

  def encrypt_senha
    self.senha = Digest::MD5.hexdigest(senha)
  end

  def self.authenticate(email, password)
    membro = Membro.find_by_email(email)
    if membro && membro.senha == Digest::MD5.hexdigest(password)
      membro
    else
      nil
    end
  end

end
