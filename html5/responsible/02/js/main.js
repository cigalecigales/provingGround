$(function(){
  $("#gallery_items").each(function(){
    var $container = $(this),
        $load_button = $("#load_button"), // さらに表示するボタン
        add_item_count = 3, // 最初に追加する画像数 & さらに表示時に追加する画像数
        added_items = 0, // 追加済み画像数
        all_data = [], // すべてのデータ
        scroll_position = 0; // スクロール位置


    $.getJSON('./json/contents.json', init);

    function init(data){
      all_data = data;
      add_items(false);
      $load_button.bind("click", true, add_items);
    }

    function add_items(flag){
      var elements = [],
          slice_data = all_data.slice(added_items, added_items + add_item_count);

      scroll_position = $load_button.offset().top;

      $.each(slice_data, function(i, item){
        var itemHTML =
                        '<li class="gallery_item">' +
                          '<div class="gallery_image_base">' +
                            '<div class="gallery_title">' + item.title + '</div>' +
                            '<img src="' + item.image + '" class="gallery_image">' +
                          '</div>' +
                        '</li>';
        elements.push($(itemHTML).get(0));
      });
      $container.append(elements);

      added_items += slice_data.length;

      check_added_all();

      if(flag){
        $("html, body").animate({scrollTop: scroll_position}, "1");
      }
    }

    function check_added_all(){
      if(added_items == all_data.length){
        $load_button.css("display", "none");
      }
    }
  });
});
