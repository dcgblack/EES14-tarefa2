class AddUserIdToPulications < ActiveRecord::Migration
  def change
    add_reference :pulications, :user, index: true, foreign_key: true
  end
end
