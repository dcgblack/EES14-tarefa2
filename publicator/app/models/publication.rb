class Publication < ActiveRecord::Base
  has_many :authors, dependent: :destroy
  belongs_to :user

  def publication_name
    "#{title}, #{local}"
  end
end
