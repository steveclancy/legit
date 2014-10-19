class Watcher < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged
  validates_presence_of :name, :keywords
  validates_uniqueness_of :name

  has_many :tweets, -> { order('tweet_id DESC') }, :dependent => :destroy
end
