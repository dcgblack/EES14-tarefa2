class Publication < ActiveRecord::Base
  has_many :authors, dependent: :destroy
  accepts_nested_attributes_for :authors
  belongs_to :user

  def publication_name
    "#{title}, #{local}"
  end
end
