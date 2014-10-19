jQuery(document).ready(function() {
  // Code here 
  $(".facets .sort").click(function() {
    $(".facets .sort").removeClass("active");
    $(this).addClass("active");
    if ($(this).hasClass("recent") == true) {
      $(".tweet-container").tsort('',{order:'asc',attr:'time'});
    }
    else if ($(this).hasClass("retweets") == true) {
      $(".tweet-container").tsort('',{order:'asc',attr:'retweets'});
    }
    else if ($(this).hasClass("media") == true) {
      $(".tweet-container").tsort('',{order:'asc',attr:'has-media'});
    }
    return false;
  }); 
});