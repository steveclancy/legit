# legit

http://sndmakeslegit.herokuapp.com

Legit was created as a hackathon project at #SNDMakes Boston, October 17-19, 2014.  For more about the idea, #SNDMakes hackathons, or the project team, visit the project site at http://steveclancy.github.io/legit/.

### The Future

- Hoax bot - for false items, tweet at people who retweet this.
- Different/better sorting criteria
- Adjustable sorting weights
- Combining tweets from multiple keywords
- More social sources (instagram, reddit)
- Management of rate limiting
- Outputs:
    - dashboard for editorial use
    - quick view for reader use
    - auto-creation of storify


## Getting Started

Install Ruby 2.1.3 and Bundler.

    bundle install
    rake db:create
    rake db:migrate
    foreman start

Go to http://0.0.0.0:3000

## API/URLs

### Create form

Form fields on page:

* Name of event: `name`
* Hashtag/keyword: `keyword`
* Location (future feature?)

Submit form to URL: _TBD_

### Initial Results page

Upon receiving this request, server:

1. Requests the data from the Twitter API ([GET
   example](https://dev.twitter.com/rest/reference/get/search/tweets))
2. Extract and sort by our criteria.
3. Create a new json object which keeps the same format as that
   returned by the Twitter API (sample on that same [API doc page]
   (https://dev.twitter.com/rest/reference/get/search/tweets)),
   but with the tweets sorted as defined by our criteria.

### Action API

The ajax call made from the results page when a verifier has decided
that the tweet is `verified`, `falsified`, or needs verification
(`tbd`) (but with more details).

Request: `/act` POSTed to the server with json payload. Examples:

Verified:

    {
        "id": 250075927172759552,
        "action": "verified",
        "comment": "Spoke with PR rep from Hammer University.",
        "user": "Fakey McFakerson"
    }

Falsified:

    {
        "id": 250075927172759552,
        "action": "falsified",
        "comment": "Twitter user @OnTheScene posted photos disproving",
        "user": "Fakey McFakerson"
    }


Needs verification:

    {
        "id": 250075927172759552,
        "action": "tbd",
        "comment": "DM'd @OnTheScene requesting phone call or more details",
        "user": "Fakey McFakerson"
    }

Response: 

_TBD_, possibilities:

* simple response verifying receipt and valid json format
* updated json data reflecting the result

## Sort/Filter criteria

Possibilities for refining the tweets or improving the sort

### Number of Followers

On the theory that an account which has built trust has more followers.

Available in json data returned from twitter as `followers_count`.

### Proximity

On the theory that tweets that are closer to the event have more
authority.

Include the `geocode` parameter to specify the latitude, longitude and
radius. This is documented on the
[search documentation page](https://dev.twitter.com/rest/reference/get/search/tweets). This
covers searching within a defined radius, but doesn't seem to provide
distance. So, we can limit the search by distance but can't easily use
this to sort.

### Media inclusion

On the theory that tweets that include an image are more authoritative. 

If the reqeust for tweets has `include_entities` set to true, the data
for the attached entities are included in the tweet data
([docs & example](https://dev.twitter.com/overview/api/entities-in-twitter-objects)). Inside the entities node of a status in the Twitter API, this data
gets exposed.

    "media": [
        {
            "display_url": "pic.twitter.com/lX5LVZO",
            "expanded_url": "http://twitter.com/fakekurrik/status/244204973972410368/photo/1",
            "id": 244204973989187584,
            "id_str": "244204973989187584",
            "indices": [
                44,
                63
            ],
            "media_url": "http://pbs.twimg.com/media/A2OXIUcCUAAXj9k.png",
            "media_url_https": "https://pbs.twimg.com/media/A2OXIUcCUAAXj9k.png",
            "sizes": {
                "large": {
                    "h": 175,
                    "resize": "fit",
                    "w": 333
                },
                "medium": {
                    "h": 175,
                    "resize": "fit",
                    "w": 333
                },
                "small": {
                    "h": 175,
                    "resize": "fit",
                    "w": 333
                },
                "thumb": {
                    "h": 150,
                    "resize": "crop",
                    "w": 150
                }
            },
            "type": "photo",
            "url": "http://t.co/lX5LVZO"
        }
    ]

