class Page < ActiveRecord::Base
  belongs_to :book
  belongs_to :author
  
  has_many :child_pages, :class_name => "Page"
  belongs_to :parent_page, :class_name => "Page", :foreign_key => "page_id"
end
