$(function(){
  $('#foobar').on('pref-click',function(e,data){
    function callback(){
      $('#shokunins > div.active').removeClass('active');
      $('#pref'+data.pref.id).fadeIn();
      $('#pref'+data.pref.id).addClass('active');
    }
    if($('#shokunins > div.active').size()==0)callback();
    else $('#shokunins > div.active').fadeOut('fast',callback)
  });
  $('#foobar').on('pref-move',function(e,data){})
  $('#foobar').on('pref-leave',function(e,data){})

  $('.shokunin').on('click',function(){
    $(this).next('.shokunin-info').toggle('slow');
  });

});
