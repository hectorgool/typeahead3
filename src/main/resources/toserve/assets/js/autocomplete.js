//https://github.com/bassjobsen/Bootstrap-3-Typeahead
//http://stackoverflow.com/questions/9477095/trouble-updating-bootstraps-typeahead-data-source-with-post-response

function myAutocomplete(data) {

    var autocomplete = $('#autocomplete').typeahead();
    autocomplete.data('typeahead').source = data;

};





