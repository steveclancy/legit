namespace :data do
  desc "Import Tweets"
  task import: :environment do
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "1jFn305ISZq4moZsv6mYyGls4"
      config.consumer_secret     = "i8JvIWmswNqA7c9HIpTHJ1nIxZAGGcWyLaGBxfteQXMkNK4DqK"
      config.access_token        = "14191779-n4X4Fs1WDx9IlNqjt5WhDYT0oMttRlmBP3ysoUhII"
      config.access_token_secret = "dixLEBjwapLNrmlZEu2amiB8qcZGihvPnLXoN5d15AgsA"
    end

    watcher = Watcher.create(:name => "Marry Me", :keywords => "marry me")

    # TODO: max_id, since_id
    client.search(watcher.keywords, :count => 100).collect do |tweet|
      Tweet.create(:watcher_id => watcher.id, :tweet_id => tweet.id, :fields => tweet.to_h)
    end

    puts 'Done!'
  end

end
