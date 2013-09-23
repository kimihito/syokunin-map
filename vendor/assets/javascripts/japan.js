$(function(){
  $('.japan-svg-map').each(function(){
    var $el=$(this);
    var path=$el.data('src');
    $.get(path,function(data){svgload($el,data);},'text');
    var width=$el.data('width');
    var height=$el.data('height');
    if(width)$el.css('width',width);
    if(height)$el.css('height',height);
  });
  function svgload($el,data){
    var width=$el.data('width');
    var height=$el.data('height');
    $el.html("<svg>"+data+"</svg>");
    if(width)$el.find('svg').attr('width',width);
    if(height)$el.find('svg').attr('height',height);
    var prefColor=$el.data('pref-color');
    var $prefs=$el.find('path[data-id]');
    $prefs.each(function(){
      $(this).attr('fill',prefColor[$(this).data('id')]);
    });
    $prefs.mouseleave(function(e){
      var id=$(this).data('id'),name=$(this).data('name');
      $(this).attr({'stroke-width':''});
      $el.find('svg').css({cursor:'default'});
      $el.trigger('pref-leave',[{pref:{id:id,name:name}}]);
    });
    $prefs.click(function(e){
      var id=$(this).data('id'),name=$(this).data('name');
      $el.trigger('pref-click',[{pref:{id:id,name:name},x:e.offsetX,y:e.offsetY}]);
    });
    $prefs.mouseenter(function(e){
      var id=$(this).data('id'),name=$(this).data('name');
      $(this).attr({'stroke-width':20}).appendTo($(this).parent());
      $el.find('svg').css({cursor:'pointer'});
      $el.trigger('pref-enter',[{pref:{id:id,name:name},x:e.offsetX,y:e.offsetY}]);
    });
    $prefs.mousemove(function(e){
      var id=$(this).data('id'),name=$(this).data('name');
      $el.trigger('pref-move',[{pref:{id:id,name:name},x:e.offsetX,y:e.offsetY}]);
    });
  }
});
