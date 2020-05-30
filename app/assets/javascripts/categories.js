$(function(){
  // 親カテゴリーセレクトボックスの選択を変えたら、イベント発火
  $("#category_select").on("change", function(){
    // 取得した親カテゴリーのvalueをcategoryに代入
    var parentCategory = document.getElementById("category_select").value;
    // ajaxにて、controllerへ送信
    $.ajax({
      url: "/categories/children_category",
      type: "GET",
      data: {parentCategory: parentCategory},
      dataType: "json",
    })
    .done(function(children){
      children.forEach(function(child){
      })
    })
  })
});
