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
    $('.download-photo').each (index, photo) ->
      iframe = $('<iframe />');
      iframe.attr('src', photo.href);
      iframe.css('visibility', 'hidden');
      iframe.css('height', '0');
      iframe.appendTo(document.body);

    false

document.addEventListener "page:load", photos
$(photos)