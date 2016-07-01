class AddSurnameToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :surname, :string
  end
end
