class AddUserIdToPublications < ActiveRecord::Migration
  def change
    add_reference :publications, :user, index: true, foreign_key: true
  end
end
