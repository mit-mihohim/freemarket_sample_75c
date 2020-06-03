  $(function(){

    const prevContent = $('.label-content').prev();

    function buildHTML(id, image) {
      var html = `<div class="preview-box">
                    <div class="upper-box">
                      <img src=${image} alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="delete-box" data-delete-id= ${id}>
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }

    function setLabel(count) {
      if (count == 5) { 
        $('.label-content').hide();
      } else {
        $('.label-content').show();
        labelWidth = (620 - parseInt($(prevContent).css('width')));
        $('.label-content').css('width', labelWidth);
        $('.label-box').attr({for: `item_item_images_attributes_${count}_src`});
      }
    }

    // 投稿編集時///////////////////////////////////////////////////////////////
    if (window.location.href.match(/\/items\/\d+\/edit/)){
      var count = $('.preview-box').length;
      setLabel(count);
    }
    ///////////////////////////////////////////////////////////////////////////

    $(document).on('change', '.hidden-field', function() {
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
      
      reader.onload = function() {
        var image = this.result;
        var html = buildHTML(id, image);
        $(prevContent).append(html);
        if ($(`#item_item_images_attributes_${id}__destroy`)){
          $(`#item_item_images_attributes_${id}__destroy`).prop('checked',false);
        } 
        var count = $('.preview-box').length;
        setLabel(count);
      }
    });

    $(document).on('click', '.delete-box', function() {
      var id = $(this).attr('data-delete-id')
      if ($(`#item_item_images_attributes_${id}__destroy`).length) {
        $(`#item_item_images_attributes_${id}__destroy`).prop('checked',true);
      }
      $(this).parent().parent().remove();
      $(`#item_item_images_attributes_${id}_src`).val("");
      var count = $('.preview-box').length;
      setLabel(count);
    });
  });