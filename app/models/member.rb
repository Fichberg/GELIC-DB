require 'digest/md5'

class Member < ActiveRecord::Base
  self.table_name = "membros"
  self.primary_key = 'id'

  validates_confirmation_of :senha
  validates_presence_of :senha_confirmation

  before_save :encrypt_senha

  def encrypt_senha
    self.senha = Digest::MD5.hexdigest(senha)
  end

  def self.authenticate(email, password)
    member = Member.find_by_email(email)
    if member && member.senha == Digest::MD5.hexdigest(password)
      member
    else
      nil
    end
  end

end
