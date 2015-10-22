$(document).ready( ->
  uploader = Qiniu.uploader(
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
      'FileUploaded': (up, files, info) ->
        domain = up.getOption('domain')
        res = $.parseJSON(info)
        sourceLink = domain + '/' + res.key
        $('#img_pre_' + (img_index - 1)).attr('src', sourceLink)
        $('#img_op_' + (img_index - 1)).val(sourceLink)
      'Error': (up, err, errTip) ->
        alert(errTip)
      'Key': () ->
        key = "article_img_" + (img_index - 1) + '.jpg'
        key
    }
  )
)
