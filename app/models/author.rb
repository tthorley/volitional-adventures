require 'digest/sha2'

class Author < ActiveRecord::Base
  has_many :pages

  def password=(pass)
    salt = (0...8).map{65.+(rand(25)).chr}.join
    self.password_salt = salt
    self.password_hash = Author.hashify(salt + pass) 
  end
  
  def self.hashify(string)
    Digest::SHA256.hexdigest(string)
  end
end
