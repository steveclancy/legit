# legit

...to quit

## Getting Started

`rake db:create`

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

