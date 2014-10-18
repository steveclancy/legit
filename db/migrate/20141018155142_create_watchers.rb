class CreateWatchers < ActiveRecord::Migration
  def change
    create_table :watchers do |t|
      t.string :name
      t.string :keywords

      t.timestamps
    end
  end
end
