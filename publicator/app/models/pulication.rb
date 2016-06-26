class Pulication < ActiveRecord::Base
  def publication_name
    "#{type}, #{nature}"
  end
end
