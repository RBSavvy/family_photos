photos = ->
  $('#new_photo').fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(gif|jpe?g|png)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        data.context = $(tmpl("template-upload", file))
        $('#new_photo').append(data.context)
        data.submit()
      else
        alert("#{file.name} is not a gif, jpeg, or png image file")
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        bar = data.context.find('.progress-bar')
        bar.css('width', progress + '%')
        if progress == 100
          fadeOut = =>
            $(data.context).hide('slow')
          setTimeout(fadeOut, 5000);


  $('#upload-btn').on 'click', ->
    $('#upload-field').trigger('click')

  $('#download-album').on 'click', ->
    for photo in $('.download-photo')
      window.open(photo.href)
    false

document.addEventListener "page:load", photos
$(photos)