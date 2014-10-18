class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.column :tweet_id, :bigint
      t.hstore :fields
      t.belongs_to :watcher

      t.timestamps
    end

    add_index :tweets, :watcher_id
    add_index :tweets, :tweet_id
  end
end
