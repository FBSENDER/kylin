(function() {
  var article_data, h2_index, h3_index, img_index, p_index, remove_item, txt_change;

  h2_index = 0;

  h3_index = 0;

  p_index = 0;

  img_index = 0;

  article_data = new Array();

  txt_change = function(obj) {
    var id, type;
    type = $(obj).data('mktype');
    id = $(obj).data('id');
    return $('#' + type(+'_pre_' + id)).html($(obj).val());
  };

  remove_item = function(obj) {
    var id, type;
    type = $(obj).data('mktype');
    id = obj.data('id');
    $('#' + type + '_pre_' + id).remove();
    $('#' + type + '_op_' + id).remove();
    return $('#' + type + '_btn_' + id).remove();
  };

  $('#btn_save').click(function() {
    $('#operation input').each(function() {
      var tmp_hash, type;
      type = $(this).data('mktype');
      tmp_hash = new Object();
      tmp_hash["type"] = type;
      tmp_hash["content"] = $(this).val();
      return article_data.push(tmp_hash);
    });
    $('#article_json').val(JSON.stringify(article_data));
    article_data = new Array();
    return $('#btn_submit').removeClass('disabled');
  });

  $('#btn_add_h2').click(function() {
    $('#preview').append('<div><h2 id=' + '"h2_pre_' + h2_index(+'"' + '>二级标题</h2></div>'));
    $('#operation').append('<div><input type="text" id="h2_op_' + h2_index(+'" placeholder="请填写二级标题" class="h2" data-id="' + h2_index(+'" data-mktype="h2" onchange="txt_change(this);"> <button class="btn btn-defalut" onclick="remove_item(this);" data-id="' + h2_index(+'" data-mktype="h2" id="h2_btn_' + h2_index(+'">删除该行</button></div>')))));
    return h2_index += 1;
  });

  $('#btn_add_h3').click(function() {
    $('#preview').append('<div><h3 id=' + '"h3_pre_' + h3_index(+'"' + '>三级标题</h3></div>'));
    $('#operation').append('<div><input type="text" id="h3_op_' + h3_index(+'" placeholder="请填写三级标题" class="h3" data-id="' + h3_index(+'" data-mktype="h3" onchange="txt_change(this);"> <button class="btn btn-defalut" onclick="remove_item(this);" data-id="' + h3_index(+'" data-mktype="h3" id="h3_btn_' + h3_index(+'">删除该行</button></div>')))));
    return h3_index += 1;
  });

  $('#btn_add_p').click(function() {
    $('#preview').append('<div><p id="p_pre_' + p_index(+'">正文 段落</p></div>'));
    $('#operation').append('<div><input type="text" id="p_op_' + p_index(+'" placeholder="请编辑该段落" data-id="' + p_index(+'" data-mktype="p" onchange="txt_change(this);"> <button class="btn btn-defalut" onclick="remove_item(this);" data-id="' + p_index(+'" data-mktype="p" id="p_btn_' + p_index(+'">删除该行</button></div>')))));
    return p_index += 1;
  });

  $('#btn_add_img').click(function() {
    $('#preview').append('<div><img src="#" alt="Í¼Æ¬" id="img_pre_' + img_index(+'"/></div>'));
    $('#operation').append('<div><input type="text" id="img_op_' + img_index(+'" placeholder="图片url" data-id="' + img_index(+'" data-mktype="img"><button class="btn btn-defalut" onclick="remove_item(this);" data-id="' + img_index(+'" data-mktype="img" id="img_btn_' + img_index(+'">删除改行</button></div>')))));
    return img_index += 1;
  });

}).call(this);
(function() {
  var uploader;

  uploader = Qiniu.uploader({
    runtimes: 'html5,flash,html4',
    browse_button: 'upload_img',
    uptoken_url: '/articles/token',
    domain: 'http://7xnj96.com1.z0.glb.clouddn.com',
    container: 'preview',
    max_file_size: '100mb',
    flash_swf_url: 'js/plupload/Moxie.swf',
    max_retries: 3,
    dragdrop: true,
    drop_element: 'preview',
    chunk_size: '4mb',
    auto_start: true,
    init: {
      'FileUploaded': function(up, files, info) {
        var domain, res, sourceLink;
        domain = up.getOption('domain');
        res = $.parseJSON(info);
        sourceLink = domain + '/' + res.key;
        $('#img_pre_' + (img_index - 1)).attr('src', sourceLink);
        return $('#img_op_' + (img_index - 1)).val(sourceLink);
      },
      'Error': function(up, err, errTip) {
        return alert(errTip);
      },
      'Key': function() {
        var key;
        key = "article_img_" + (img_index - 1) + '.jpg';
        return key;
      }
    }
  });

}).call(this);
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

