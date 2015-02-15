$(document).ready(function() {

  var startLiveVal = document.querySelector('#user_username');

  if (startLiveVal) {

var password = new LiveValidation('user_password');
password.add( Validate.Length, { minimum: 4 } );
password.validMessage = "Good Password";

var email = new LiveValidation('user_email');
email.add( Validate.Email );
email.validMessage = "Valid Email!";


var confirmation = new LiveValidation('user_password_confirmation');
confirmation.add( Validate.Confirmation, { match: 'user_password' } );
confirmation.validMessage = "Password Matches";

  } else {
    console.log('')
  }
});
