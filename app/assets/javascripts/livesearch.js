$( document ).ready(function(){

	$("#big-search-box").bind("keyup", function() {

	  $("#big-search-box").addClass("loading"); // show the spinner
	  var form = $("#live-search-form"); // grab the form wrapping the search bar.

	  var url = "/search"; // live_search action.   
	  var formData = form.serialize(); // grab the data in the form   
	  $.get(url, formData, function(html) { // perform an AJAX get

	    $("#big-search-box").removeClass("loading"); // hide the spinner

	    $("#live-search-results").html(html); // replace the "results" div with the results

	  });

	}); 


    $("#user_tag_tokens").tokenInput("/tags.json", {
    	crossDomain: false,
    	prePopulate: $("#user_tag_tokens").data('pre'),
    	theme: "facebook",
    	preventDuplicates: true

    });
					
	
});