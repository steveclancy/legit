class AddStatusToTweet < ActiveRecord::Migration
  def change
    change_table(:tweets) do |t|
      t.references :status
    end
  end
end
