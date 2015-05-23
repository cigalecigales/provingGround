$(function(){
  $("#gallery_items").each(function(){
    var $container = $(this),
        $load_button = $("#load_button"),
        add_item_count = 3,
        added_items = 0,
        all_data = [],
        add_data = [];

    $.getJSON('./json/contents.json', init);

    function init(data){
      all_data = data;
      add_items();
      $load_button.on("click", add_items);
    }

    function add_items(){
      var elements = [],
          slice_data = all_data.slice(added_items, added_items + add_item_count),
          scroll_position;

      $.each(slice_data, function(i, item){
        var itemHTML =
                  '<li class="gallery_item">' +
                    '<div class="gallery_image_base">' +
                      '<img src="' + item.image + '" class="gallery_image">' +
                    '</div>'
                  '</li>';
        elements.push($(itemHTML).get(0));
      });
      $container.append(elements);

      added_items += slice_data.length;

      check_added_all();

      $('html,body').animate({ scrollTop: 0 }, '1');
    }

    function check_added_all(){
      if(added_items == all_data.length){
        $load_button.css("display", "none");
      }
    }

    function set_scroll_position(){

    }
  });
});
