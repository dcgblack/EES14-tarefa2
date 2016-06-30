class Publication < ActiveRecord::Base
  belongs_to :user

  def publication_name
    "#{title}, #{local}"
  end
end
