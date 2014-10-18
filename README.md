# legit

http://sndmakeslegit.herokuapp.com

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

