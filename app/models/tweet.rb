class Tweet < ActiveRecord::Base
  belongs_to :watcher
  belongs_to :status
  store_accessor :fields, :entities, :favorite_count, :filter_level, :in_reply_to_screen_name,
                          :in_reply_to_attrs_id, :in_reply_to_status_id, :in_reply_to_user_id,
                          :lang, :retweet_count, :source, :text, :user

  def has_media?
    e = eval(entities)
    media = e.fetch(:media, nil)
    media.present?
  end

  def screen_name
    u = eval(user)
    u.fetch(:screen_name, nil)
  end
end
