class Book < ActiveRecord::Base
  has_many :pages
  
  before_save :urlize_title
  
  def to_param
    self.urlized_title
  end
  
  private
  
  def urlize_title(string)
    self.urlized_title = self.title.downcase.gsub(/[^a-z]/, "-").squeeze("-") 
  end
end