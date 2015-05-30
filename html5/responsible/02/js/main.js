$(function(){
  $("#gallery_items").each(function(){
    var $container = $(this);

    $.getJSON('./json/contents.json', function(data){
      var elements = [];

      $.each(data, function(i, item){
        var itemHTML = '<li class="gallery_item">' +
                          '<div class="gallery_image_base">' +
                            '<img src="' + item.image + '" class="gallery_image">' +
                          '</div>'
                        '</li>';

        elements.push($(itemHTML).get(0));
      });

      $container.append(elements);
    });
  });
});
