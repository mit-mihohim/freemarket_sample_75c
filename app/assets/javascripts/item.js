  $(function(){

    const prevContent = $('.label-content').prev();
    const initial = $(".hidden-checkbox").length;
    var initial_preview_count = initial;

    function buildHTML(id, image) {
      var html = `<div class="preview-box new-preview-box" data-preview-id= ${id}>
                    <div class="upper-box">
                      <img src=${image} alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="delete-box new-delete-box" data-delete-id= ${id}>
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }

    function buildForm() {
      var form = `<input class="hidden-field new-image" type="file" name="item[item_images_attributes][${initial + 4}][src]" id="item_item_images_attributes_${initial + 4}_src">`
      return form
    }

    function setLabel(count, initial_preview_count) {
      if (count == 5) { 
        $('.label-content').hide();
      } else {
        $('.label-content').show();
        labelWidth = (620 - parseInt($(prevContent).css('width')));
        $('.label-content').css('width', labelWidth);
        $('.label-box').attr({for: `item_item_images_attributes_${count + initial - initial_preview_count}_src`});
      }
    }

    // 投稿編集時///////////////////////////////////////////////////////////////
    if (window.location.href.match(/\/items\/\d+\/edit/)){
      var count = $('.preview-box').length;
      setLabel(count, initial_preview_count);
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
        setLabel(count, initial_preview_count);
      }
    });

    $(document).on('click', '.delete-box', function() {
      var id = $(this).attr('data-delete-id')
      $(this).parent().parent().remove();
      var count = $('.preview-box').length;

      if ($(`#item_item_images_attributes_${id}__destroy`).length == 0) {
        $(`#item_item_images_attributes_${id}_src`).remove();
        $(".new-preview-box").each(function(index, box) {
          $(box).attr('data-preview-id', index + initial);
        });
        $(".new-delete-box").each(function(index, box) {
          $(box).attr('data-delete-id', index + initial);
        });
        $(".new-image").each(function(index, box) {
          $(box).attr('id', `item_item_images_attributes_${index + initial}_src`);
          $(box).attr('name', `item[item_images_attributes][${index + initial}][src]`);
        });
        var form = buildForm();
        $(".hidden-content").append(form);
      } else {
        $(`#item_item_images_attributes_${id}__destroy`).prop('checked',true);
        initial_preview_count -= 1;
      }

      setLabel(count, initial_preview_count);
    });
  });