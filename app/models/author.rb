require 'digest/sha2'

class Author < ActiveRecord::Base
  has_many :pages

  def password=(pass)
    salt = (0...8).map{65.+(rand(25)).chr}.join
    self.password_salt = salt
    self.password_hash = Author.hashify(:salt => salt, :password => pass) 
  end
  
  def password
    raise "password stored as a hash"
  end
  
  def Author.hashify(options)
    salt = options[:salt] || ""
    pass = options[:password] || ""
    Digest::SHA256.hexdigest(pass+salt)
  end
  
  def Author.authenticate(name, password)
    author = Author.find_by_name(name)
    if author && Author.hashify(:salt => author.password_salt, :password => password) == author.password_hash
      author
    else
      nil
    end
  end
end