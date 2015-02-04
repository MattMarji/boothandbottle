
show_form = (custom_title) ->
  # Show contact form...

  if (custom_title == "EMAIL")
    $('#formModal').find('#form_modal_title').text("Contact Us")
    $('#formModal').find('#form_info').html("Have an inquiry? <br>Want your venue on Booth&Bottle? <br>sLet's Chat!")
    $('#formModal').find('#form_button').prop("value", "Send Message")
  else
    $('#formModal').find('#form_modal_title').text("Book @ " + custom_title)
    $('#formModal').find('#form_info').html('Leave us your info. </br>One of our ambassadors will connect with you today to book your night out!')
    $('#formModal').find('#form_button').prop("value", "Let's Connect and Book.")

  $('#formModal').modal('show')

form_validation = (name, email) ->

  # if name is blank or email is blank
  if (name == "")
    $('#formModal').find('#error_name').text("Please enter your name.")
    return false

  if (email == "")
    $('#formModal').find('#error_email').text("Please enter your email address.")
    return false

  re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

  isValidEmail = re.test(email)

  if (!isValidEmail)
    $('#formModal').find('#error_email').text("Please enter a vaild email address.")
    return false

  # Clear error fields before returning.
  $('#formModal').find('#error_email').text("")
  $('#formModal').find('#error_name').text("")
  return true

$(document).ready(() ->

  ########### EVENT HANDLERS FOR VENUES ############

  $('a#70-down_logo').on('click', (event) ->
    event.preventDefault()

    show_form("70 DOWN")
  )

  $('a#bloke_logo').on('click', (event) ->
    event.preventDefault()

    show_form("BLOKE & 4TH")
  )

  $('a#efs_logo').on('click', (event) ->
    event.preventDefault()

    show_form("EFS")
  )

  $('a#fiction_logo').on('click', (event) ->
    event.preventDefault()

    show_form("FICTION")
  )

  $('a#gravity_logo').on('click', (event) ->
    event.preventDefault()

    show_form("GRAVITY SOUND BAR")
  )

  $('a#maison_logo').on('click', (event) ->
    event.preventDefault()

    show_form("MAISON MERCER")
  )

  $('a#hoxton_logo').on('click', (event) ->
    event.preventDefault()

    show_form("THE HOXTON")
  )

  $('a#thompson_logo').on('click', (event) ->
    event.preventDefault()

    show_form("THOMPSON TORONTO")
  )

  $('a#wildflower_logo').on('click', (event) ->
    event.preventDefault()

    show_form("WILDFLOWER")
  )

  $('a#email').on('click', (event) ->
    event.preventDefault()

    show_form("EMAIL")
  )

  ##############################################


  ######## EVENT HANDLER FOR FORM SUBMIT #######

  $('#formModal').on('submit', (event) ->

    event.preventDefault()

    name = $('#formModal').find('#full_name').val()
    email_address = $('#formModal').find('#email').val()
    phone_number = $('#formModal').find('#phone_number').val()
    message = $('#formModal').find('#message_box').val()
    venue = $('#formModal').find('#form_modal_title').text()

    # Pass Required Values for validation
    isValid = form_validation(name, email_address)

    if (!isValid)
      return

    $.ajax({
      type: "GET"
      url: 'scripts/send_form.php'
      data:
        client_name: name
        client_email: email_address
        client_number: phone_number
        client_message: message
        venue_name: venue
      success: () ->
        # Show success modal
        $('#infoModal').modal('show')
    })

    # Assume success. Hide form modal.
    $('#formModal').modal('hide')
  )

  ######## EVENT HANDLER FOR HIDING THE FORM MODAL ######
  $('#formModal').on('hidden.bs.modal', (event) ->
    $('#formModal').find('#form_body')[0].reset()
  )
  #######################################################

  ##### EVENT HANDLER FOR HIDING INFO MODAL ON TIMEOUT ###
  $('#infoModal').on('show.bs.modal', (event) ->
    setTimeout((() ->
      $('#infoModal').modal('hide')), 2000)

  )


)
