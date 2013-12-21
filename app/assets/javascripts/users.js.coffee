users = ->
  $('a.reset-password').on 'click', ->
    $('a.reset-password').hide()
    $('.password-reset').removeClass('hidden')

    false


document.addEventListener "page:load", users
$(users)