class Book < ActiveRecord::Base
  has_many :pages

  def title=(string)
    self.title = string
    self.urlized_title = Book.urlize_title(string)
  end
  
  def urlized_title=
    raise "Set with the title= method"
  end
  
  def Book.urlize_title(string)
    string.downcase.gsub(/[^a-z]/, "-").squeeze("-")    
  end
end