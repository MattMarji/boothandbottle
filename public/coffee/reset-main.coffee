window.isValid = false

getToken= () ->
  url = window.location.href
  token = url.split('?')[1];

validateToken = (token) ->
  callback = validated

  $.ajax({
    url: PARTNER_API_LINK + "/partners/v1/token/reset"
    crossDomain: "true"
    type:"GET"
    beforeSend: (request) ->
      request.setRequestHeader('Authorization', 'Basic ' + btoa(':'+ token))
    success: (data) ->
      window.isValid = true
      callback()
    error: (xhr, status, error) ->
      window.isValid = false
  })

validated = () ->
  # If isValid -> show page
  if (isValid)
    $('#reset').fadeIn()


$(document).ready(() ->
  
  pattern = Trianglify({
    height: 3000,
    width: 3000,
    cell_size: 40}
  )

  document.getElementById("body_background").style.backgroundImage = "url('images/background.png')";

  # By default do not show this page...
  #$('#reset').hide()

  # GET TOKEN
  token = getToken()

  console.log(token)
  # Validate the token before doing anything else...
  #validateToken(token)


  # If the token is valid, and the user resets w/ a
  # valid password ...

  $('#password_reset_form').on('submit', (event) ->

    # user entered a valid password for reset.
    # reset the password with that value...
    # Reset password error field
    $('#reset_password_error').text("")

    event.preventDefault();
    admin_token = token


    $.ajax({
      url: "/partners/v1/token/reset"
      crossDomain: "true"
      type: "POST"
      data:
        password: $('#password1').val()
      success: (data) ->

        # Redirect the user now...
        setTimeout((() ->
          window.location.replace('index.html')
          success_modal.$el.modal('hide')), 3000)

      error: (data) ->
        $('#reset_password_error').text("Could not change your password. Please try again.")
    })
  )

)
