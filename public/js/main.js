// Generated by CoffeeScript 1.9.3
(function() {
  var form_validation, show_form;

  show_form = function(custom_title) {
    if (custom_title === "EMAIL") {
      $('#formModal').find('#form_modal_title').text("Contact Us");
      $('#formModal').find('#form_info').html("Have an inquiry? <br>Want your venue on Booth&Bottle? <br>Let's Chat!");
      $('#formModal').find('#form_button').prop("value", "Send Message");
    } else {
      $('#formModal').find('#form_modal_title').text("Book @ " + custom_title);
      $('#formModal').find('#form_info').html('Leave us your info. </br>One of our ambassadors will connect with you today to book your night out!');
      $('#formModal').find('#form_button').prop("value", "Let's Connect and Book.");
    }
    return $('#formModal').modal('show');
  };

  form_validation = function(name, email) {
    var isValidEmail, re;
    if (name === "") {
      $('#formModal').find('#error_name').text("Please enter your name.");
      return false;
    } else {
      $('#formModal').find('#error_name').text("");
    }
    if (email === "") {
      $('#formModal').find('#error_email').text("Please enter your email address.");
      return false;
    } else {
      $('#formModal').find('#error_email').text("");
    }
    re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    isValidEmail = re.test(email);
    if (!isValidEmail) {
      $('#formModal').find('#error_email').text("Please enter a vaild email address.");
      return false;
    } else {
      $('#formModal').find('#error_email').text("");
    }
    return true;
  };

  $(document).ready(function() {
    $('a#70-down_logo').on('click', function(event) {
      event.preventDefault();
      return show_form("70 DOWN");
    });
    $('a#1305duwest_logo').on('click', function(event) {
      event.preventDefault();
      return show_form("1305 DUWEST");
    });
    $('a#bloke_logo').on('click', function(event) {
      event.preventDefault();
      return show_form("BLOKE & 4TH");
    });
    $('a#efs_logo').on('click', function(event) {
      event.preventDefault();
      return show_form("EFS");
    });
    $('a#fiction_logo').on('click', function(event) {
      event.preventDefault();
      return show_form("FICTION");
    });
    $('a#gravity_logo').on('click', function(event) {
      event.preventDefault();
      return show_form("GRAVITY SOUND BAR");
    });
    $('a#maison_logo').on('click', function(event) {
      event.preventDefault();
      return show_form("MAISON MERCER");
    });
    $('a#stori_logo').on('click', function(event) {
      event.preventDefault();
      return show_form("STORI APERITIVO BAR");
    });
    $('a#tattoo_logo').on('click', function(event) {
      event.preventDefault();
      return show_form("TATTOO ROCK PARLOUR");
    });
    $('a#hoxton_logo').on('click', function(event) {
      event.preventDefault();
      return show_form("THE HOXTON");
    });
    $('a#thompson_logo').on('click', function(event) {
      event.preventDefault();
      return show_form("THOMPSON TORONTO");
    });
    $('a#uniun_logo').on('click', function(event) {
      event.preventDefault();
      return show_form("UNIUN");
    });
    $('a#wildflower_logo').on('click', function(event) {
      event.preventDefault();
      return show_form("WILDFLOWER");
    });
    $('a#email').on('click', function(event) {
      event.preventDefault();
      return show_form("EMAIL");
    });
    $('#email_form_body').on('submit', function(event) {
      var email_address, isValidEmail, re;
      event.preventDefault();
      email_address = $('#email_form_body').find('#signup_email').val();
      console.log(email_address);
      re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      isValidEmail = re.test(email_address);
      if (!isValidEmail) {
        return;
      }
      console.log("VALID EMAIL!!");
      return $.ajax({
        type: "GET",
        url: 'scripts/send_signup_form.php',
        data: {
          client_email: email_address
        },
        success: function() {
          return $('#signupModal').modal('show');
        }
      });
    });
    $('#formModal').on('submit', function(event) {
      var email_address, isValid, message, name, phone_number, venue;
      event.preventDefault();
      name = $('#formModal').find('#full_name').val();
      email_address = $('#formModal').find('#email').val();
      phone_number = $('#formModal').find('#phone_number').val();
      message = $('#formModal').find('#message_box').val();
      venue = $('#formModal').find('#form_modal_title').text();
      isValid = form_validation(name, email_address);
      if (!isValid) {
        return;
      }
      $.ajax({
        type: "GET",
        url: 'scripts/send_form.php',
        data: {
          client_name: name,
          client_email: email_address,
          client_number: phone_number,
          client_message: message,
          venue_name: venue
        },
        success: function() {
          return $('#infoModal').modal('show');
        }
      });
      return $('#formModal').modal('hide');
    });
    $('#formModal').on('hidden.bs.modal', function(event) {
      return $('#formModal').find('#form_body')[0].reset();
    });
    $('#infoModal').on('show.bs.modal', function(event) {
      return setTimeout((function() {
        return $('#infoModal').modal('hide');
      }), 3000);
    });
    return $('#signupModal').on('show.bs.modal', function(event) {
      return setTimeout((function() {
        return $('#signupModal').modal('hide');
      }), 3000);
    });
  });

}).call(this);
