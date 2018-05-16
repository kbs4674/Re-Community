$(document).ready(function () {

    var dataSource = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('country'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        prefetch: {
            url: "http://jsbin.com/nepazu/1.json"
        }
    });


    dataSource.initialize();

    $('.typeahead').typeahead({
        highlight: true
    }, {
        displayKey: 'country',
        source: dataSource.ttAdapter()
    });

});