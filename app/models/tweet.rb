class Tweet < ActiveRecord::Base
  belongs_to :watcher
  belongs_to :status
  store_accessor :fields, :entities, :favorite_count, :filter_level, :in_reply_to_screen_name,
                          :in_reply_to_attrs_id, :in_reply_to_status_id, :in_reply_to_user_id,
                          :lang, :retweet_count, :source, :text, :user
end
