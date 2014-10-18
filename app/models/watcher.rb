class Watcher < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  has_many :tweets
end
