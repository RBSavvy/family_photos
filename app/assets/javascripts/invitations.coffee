invitations = ->
  $('a.account-already').on 'click', ->
    $('.sign-up-form').addClass('hidden')
    $('.login-form').removeClass('hidden')

  $('a.needs-signup').on 'click', ->
    $('.sign-up-form').removeClass('hidden')
    $('.login-form').addClass('hidden')

document.addEventListener "page:load", invitations
$(invitations)