$(function(){
  // 子カテゴリ用option作成
  function appendOption(category){
    var html = `<option value="${category.id}">
                  ${category.name}
                </option>`;
    return html;
  }
  // 子カテゴリセレクトボックスhtml作成
  function appendChildrenSelection(insertHtml){
    var childrenSelectHtml = "";
    childrenSelectHtml = `<select class="select-default" id="children_categories" name="item[category]">
                            <option value="">選択して下さい</option>
                            ${insertHtml}
                          </select>`;
    $(".form-detail__category__input").append(childrenSelectHtml);
  }


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
      var insertHtml = "";
      // 子カテゴリoptionを1つづつ作成
      children.forEach(function(child){
        insertHtml += appendOption(child);
      });
      // 子カテゴリセレクションの表示
      appendChildrenSelection(insertHtml);
      // 親カテゴリが変更されると、子カテゴリを取り除く
      $("#category_select").on("change", function(){
        $("#children_categories").remove()
      })
    })
    .fail(function(){
      alert("カテゴリー取得に失敗しました");
    })
  });
  // 子カテゴリ選択でイベント発火
  $(document).on("change", "#children_categories", function(){
    // 取得した子カテゴリのvalueを代入
    var childCategory = document.getElementById("children_categories").value;
    $.ajax ({
      url: "/categories/grandchildren_category",
      type: "GET",
      data: {childCategory: childCategory},
      dataType: "json"
    })
    .done(function(grandchildren){
      
    })
  })
});
