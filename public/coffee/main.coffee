
show_form = (custom_title) ->
  # Show contact form...
  $('#formModal').find('#form_modal_title').text("Book @ " + custom_title)
  $('#formModal').modal('show')

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

  ##############################################


  ######## EVENT HANDLER FOR FORM SUBMIT #######

  $('#formModal').on('submit', (event) ->

  )

)
