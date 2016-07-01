class ChangeDateFormatInPublications < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :publications do |t|
        dir.up   { t.change :year_of_publication, :date }
        dir.down { t.change :year_of_publication, :string }
      end
    end
  end
end
