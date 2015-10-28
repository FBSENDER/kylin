$(document).ready( ->
  window.h2_index = 0
  window.h3_index = 0
  window.p_index = 0
  window.img_index = 0
  window.a_index = 0
  window.ul_index = 0
  
  window.txt_change = (obj)->
    type = $(obj).data('mktype')
    id = $(obj).data('id')
    $('#'+type+'_pre_'+id).html($(obj).val())

  window.a_text_change = (obj)->
    id = $(obj).data('id')
    data = $(obj).val().split("|")
    $('#a_pre_'+id).html(data[1])
    $('#a_pre_'+id).attr("href",data[0])

  window.ul_text_change = (obj)->
    id = $(obj).data('id')
    data = $(obj).val().split("|")
    $('#ul_pre_'+id).children('li').each ->
      this.remove()
    $.each(data, ->
      $('#ul_pre_'+id).append('<li>'+this+'</li>') 
    )
  window.remove_item = (obj) ->
    type = $(obj).data('mktype')
    id = $(obj).data('id')
    $('#'+type+'_pre_'+id).remove()
    $('#'+type+'_op_'+id).remove()
    $('#'+type+'_btn_'+id).remove()
  
  $('#btn_save').click ->
    article_data = new Array()
    $('#operation input').each ->
      type = $(this).data('mktype')
      tmp_hash = new Object()
      tmp_hash["type"] = type
      tmp_hash["content"] = $(this).val()
      article_data.push(tmp_hash)
    $('#article_json').val(JSON.stringify(article_data))
    article_data = new Array()
    $('#btn_submit').removeClass('disabled')
  
  $('#btn_add_h2').click ->
    $('#preview').append('<div><h2 id="h2_pre_'+h2_index+'"'+'>二级标题</h2></div>')
    $('#operation').append('<div><input type="text" id="h2_op_'+h2_index+'" placeholder="请填写二级标题" class="h2" data-id="'+h2_index+'" data-mktype="h2" onchange="txt_change(this);"> <button class="btn btn-defalut" onclick="remove_item(this);" data-id="'+h2_index+'" data-mktype="h2" id="h2_btn_'+h2_index+'">删除该行</button></div>')
    h2_index += 1
  $('#btn_add_h3').click ->
    $('#preview').append('<div><h3 id="h3_pre_'+h3_index+'">三级标题</h3></div>')
    $('#operation').append('<div><input type="text" id="h3_op_'+h3_index+'" placeholder="请填写三级标题" class="h3" data-id="'+h3_index+'" data-mktype="h3" onchange="txt_change(this);"> <button class="btn btn-defalut" onclick="remove_item(this);" data-id="'+h3_index+'" data-mktype="h3" id="h3_btn_'+h3_index+'">删除该行</button></div>')
    h3_index += 1
  $('#btn_add_p').click ->
    $('#preview').append('<div><p id="p_pre_'+p_index+'">正文 段落</p></div>')
    $('#operation').append('<div><input type="text" id="p_op_'+p_index+'" placeholder="请编辑该段落" data-id="'+p_index+'" data-mktype="p" onchange="txt_change(this);"> <button class="btn btn-defalut" onclick="remove_item(this);" data-id="'+p_index+'" data-mktype="p" id="p_btn_'+ p_index+'">删除该行</button></div>')
    p_index += 1
  $('#btn_add_img').click -> 
    $('#preview').append('<div><img src="#" alt="图片" id="img_pre_'+img_index+'"/></div>')
    $('#operation').append('<div><input type="text" id="img_op_'+img_index+'" placeholder="图片url" data-id="'+img_index+'" data-mktype="img"><button class="btn btn-defalut" onclick="remove_item(this);" data-id="'+img_index+'" data-mktype="img" id="img_btn_'+img_index+'">删除改行</button></div>')
    img_index += 1
  $('#btn_add_a').click ->
    $('#preview').append('<div><a href="#" id="a_pre_'+a_index+'" target="_blank">链接</a></div>')
    $('#operation').append('<div><input type="text" id="a_op_'+a_index+'" placeholder="网址|文本" data-id="'+a_index+'" data-mktype="a" onchange="a_text_change(this);"><button class="btn btn-default" onclick="remove_item(this);" data-id="'+a_index+'" data-mktype="a" id="a_btn_'+a_index+'">删除该行</button></div>')
    a_index += 1
  $('#btn_add_ul').click ->
    $('#preview').append('<div><ul id="ul_pre_'+ul_index+'"><li>列表</li></ul><div>')
    $('#operation').append('<div><input type="text" id="ul_op_'+ul_index+'" placeholder="列表内容（用 | 分割）" data-id="'+ul_index+'" data-mktype="ul" onchange="ul_text_change(this);"><button class="btn btn-default" onclick="remove_item(this);" data-id="'+ul_index+'" data-mktype="ul" id="ul_btn_'+ul_index+'">删除该行</button></div>')
    ul_index += 1
)
