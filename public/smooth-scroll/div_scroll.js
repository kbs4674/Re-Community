$(document).ready(function() {
    // Initialize scrollers.
    $('.scroll').TrackpadScrollEmulator();
    $('.demo2').TrackpadScrollEmulator();
    // Demonstration of changing the vertical scroller content and dimensions.
    $('.add-more').on('click', function(e){
      e.preventDefault();
      $('.scroll .tse-content').append('<p class="odd">Additional content 1</p><p>Additional content 2</p><p p class="odd">Additional content 3</p><p>Additional content 4</p>');
      $('.scroll').TrackpadScrollEmulator('recalculate');
    });
    $('.toggle-height').on('click', function(e){
      e.preventDefault();
      if ($('.scroll').height() === 400) {
        $('.scroll').height(300);
      } else {
        $('.scroll').height(400);
      }
      $('.scroll').TrackpadScrollEmulator('recalculate');
    });
    // Demonstration of changing the horizontal scroller content and dimensions.
    $('.add-more-horiz').on('click', function(e){
      e.preventDefault();
      $('.demo2 .tse-content .boxes').append('<div class="box">A</div><div class="box">B</div><div class="box">C</div><div class="box">D</div>');
      $('.demo2').TrackpadScrollEmulator('recalculate');
    });
    $('.toggle-width').on('click', function(e){
      e.preventDefault();
      if ($('.demo2').width() === 600) {
        $('.demo2').width(500);
      } else {
        $('.demo2').width(600);
      }
      $('.demo2').TrackpadScrollEmulator('recalculate');
    });
});