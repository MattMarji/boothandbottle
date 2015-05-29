window.isValid = false

getToken= () ->
  url = window.location.href
  token = url.split('?')[1];

validateToken = (token) ->
  callback = validated

  $.ajax({
    url: "https://booth-api.herokuapp.com/validate_token"
    crossDomain: "true"
    dataType: "json"
    type: "POST"
    data:
      reset_password_token: token
    success: (data) ->
      console.log("SUCCESSFUL TOKEN VALIDATION")
      window.isValid = true
      callback()
    error: (xhr, status, error) ->
      console.log("FAILED TOKEN VALIDATION")
      $('#invalid').fadeIn()
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
  $('#reset').hide()
  $('#invalid').hide()

  # GET TOKEN
  token = getToken()

  # Validate the token before doing anything else...
  validateToken(token)


  # If the token is valid, and the user resets w/ a
  # valid password ...

  $('#password_reset_form').on('submit', (event) ->

    # user entered a valid password for reset.
    # reset the password with that value...
    # Reset password error field
    $('#reset_password_error').text("")

    event.preventDefault();
    reset_token = token

    $.ajax({
      url: "https://booth-api.herokuapp.com/password_reset"
      crossDomain: "true"
      type: "POST"
      data:
        password: $('#password1').val()
        reset_password_token: reset_token
      success: (data) ->
        console.log("SUCCESS!!")
        # Redirect the user now...
        #setTimeout((() ->
        #  window.location.replace('index.html')
        #  success_modal.$el.modal('hide')), 3000)

      error: (data) ->
        $('#reset_password_error').text("Could not change your password. Please try again.")
    })
  )

)
