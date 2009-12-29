require 'digest/sha2'

class Author < ActiveRecord::Base
  attr_accessor :password
  
  has_many :pages

  before_save :encrypt_password
  
  def password_match?(password)
    self.password_hash == Author.hashify(:salt => self.password_salt, :password => password) ? true : false
  end
  
  def Author.authenticate(name, password)
    author = Author.find_by_name(name)
    author && author.password_match?(password) ? author : nil
  end
  
  def Author.hashify(options)
    options[:salt] ||= ""
    options[:password] ||= ""
    Digest::SHA256.hexdigest(options[:password] + options[:salt])
  end
    
  private
  
  def encrypt_password
    self.password_salt = (0...8).map{65.+(rand(25)).chr}.join
    self.password_hash = Author.hashify(:salt => self.password_salt, :password => self.password)
  end
end