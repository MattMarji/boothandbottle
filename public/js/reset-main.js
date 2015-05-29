// Generated by CoffeeScript 1.8.0
(function() {
  var getToken, validateToken, validated;

  window.isValid = false;

  getToken = function() {
    var token, url;
    url = window.location.href;
    return token = url.split('?')[1];
  };

  validateToken = function(token) {
    var callback;
    callback = validated;
    return $.ajax({
      url: "https://booth-api.herokuapp.com/validate_token",
      crossDomain: "true",
      dataType: "json",
      type: "POST",
      data: {
        reset_password_token: token
      },
      success: function(data) {
        console.log("SUCCESSFUL TOKEN VALIDATION");
        window.isValid = true;
        return callback();
      },
      error: function(xhr, status, error) {
        console.log("FAILED TOKEN VALIDATION");
        $('#invalid').fadeIn();
        return window.isValid = false;
      }
    });
  };

  validated = function() {
    if (isValid) {
      return $('#reset').fadeIn();
    }
  };

  $(document).ready(function() {
    var pattern, token;
    pattern = Trianglify({
      height: 3000,
      width: 3000,
      cell_size: 40
    });
    document.getElementById("body_background").style.backgroundImage = "url('images/background.png')";
    $('#reset').hide();
    $('#invalid').hide();
    token = getToken();
    validateToken(token);
    return $('#password_reset_form').on('submit', function(event) {
      var reset_token;
      $('#reset_password_error').text("");
      event.preventDefault();
      reset_token = token;
      return $.ajax({
        url: "https://booth-api.herokuapp.com/password_reset",
        crossDomain: "true",
        type: "POST",
        data: {
          password: $('#password1').val(),
          reset_password_token: reset_token
        },
        success: function(data) {
          return console.log("SUCCESS!!");
        },
        error: function(data) {
          return $('#reset_password_error').text("Could not change your password. Please try again.");
        }
      });
    });
  });

}).call(this);
