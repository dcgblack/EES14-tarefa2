class Pulication < ActiveRecord::Base
  belongs_to :user

  def publication_name
    "#{public_type}, #{nature}"
  end
end
