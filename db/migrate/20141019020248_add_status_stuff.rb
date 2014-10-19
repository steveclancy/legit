class AddStatusStuff < ActiveRecord::Migration
  def up
    names = ['verified', 'looking', 'unverified']
    names.each do |name|
      Status.create(:name => name)
    end
  end
end
