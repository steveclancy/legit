class AddSlugToWatcher < ActiveRecord::Migration
  def change
    change_table :watchers do |t|
      t.string :slug
    end
    add_index :watchers, :slug, unique: true
  end
end
