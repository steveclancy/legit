jQuery(document).ready(function() {

  $(".facets .sort.retweets").click(function() {
    $(".facets .sort").removeClass("active");
    $(this).addClass("active");
    event.preventDefault();
    $(".tweet-container").sort(function(a,b){
        return new $(a).attr("data-retweets") > new $(b).attr("data-retweets");
    }).each(function(){
        $(".tweets").prepend(this);
    });
  });

  $(".facets .sort.media").click(function() {
    $(".facets .sort").removeClass("active");
    $(this).addClass("active");
    event.preventDefault();
    $(".tweet-container").sort(function(a,b){
        return new $(a).attr("data-has-media") > new $(b).attr("data-has-media");
    }).each(function(){
        $(".tweets").prepend(this);
    });
  });

  $(".facets .sort.recent").click(function() {
    $(".facets .sort").removeClass("active");
    $(this).addClass("active");
    event.preventDefault();
    $(".tweet-container").sort(function(a,b){
        return new $(a).attr("data-time") > new $(b).attr("data-time");
    }).each(function(){
        $(".tweets").prepend(this);
    });
  });
});