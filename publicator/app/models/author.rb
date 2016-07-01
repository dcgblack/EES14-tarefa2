class Author < ActiveRecord::Base
  belongs_to :user
  belongs_to :publication
  validates_presence_of :name, :surname
end
