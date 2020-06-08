$(function(){

  function buildChild(category){
    let html = `<a class="category child_category" id="${category.id}"
                  href="/categories/${category.id}">${category.name}</a>`;
    return html;
  }

  function buildGrandChild(category){
    let html = `<a class="category grandchild_category" id="${category.id}"
                  href="/categories/${category.id}">${category.name}</a>`;
    return html;
  }

  // マウスが乗ったらカテゴリー欄を出す
  $("#category-search").on("mouseover", function(){
    $(".category-menu").css('visibility', 'visible');
  })
  // マウスが離れたらカテゴリー欄を消す
  $(".category-menu").on("mouseleave", function(){
    $(".category-menu").css('visibility', 'hidden');
  })

  //-----------------------------------------------------------------------
  // マウスが親カテゴリーに乗ったとき
  $(".parent_category").on("mouseover", function(){
    let id = this.id;
    $(".selected-parent").removeClass("selected-parent");
    $('#' + id).addClass("selected-parent");
    
    $.ajax({
      type: 'GET',
      url: "/categories/children_category",
      data: {parentCategory: id},
      dataType: 'json'
    }).done(function(children){
      $(".children-list").empty();
      $(".grandchildren-list").empty();
      children.forEach(function(category){
        let html = buildChild(category);
        $(".children-list").append(html);
      })
    });
  });

  //------------------------------------------------------------------------
  // マウスが子カテゴリーに乗ったとき
  $(document).on("mouseover", ".child_category", function(){
    let id = this.id;
    $(".selected-child").removeClass("selected-child");
    $('#' + id).addClass("selected-child");
    
    $.ajax({
      type: 'GET',
      url: "/categories/grandchildren_category",
      data: {childCategory: id},
      dataType: 'json'
    }).done(function(grandchildren){
      $(".grandchildren-list").empty();
      grandchildren.forEach(function(category){
        let html = buildGrandChild(category);
        $(".grandchildren-list").append(html);
      })
    });
  });
});