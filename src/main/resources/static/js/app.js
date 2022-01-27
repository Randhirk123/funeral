

///^[A-Z]{1,2}[0-9RCHNQ][0-9A-Z]?\s?[0-9][ABD-HJLNP-UW-Z]{2}$|^[A-Z]{2}-?[0-9]{4}$/;

$(function() {
	jQuery.validator.addMethod("lettersonly", function(value, element) {
		return this.optional(element) || /^[a-z\s]+$/i.test(value);
	}, "Only alphabetical characters");
	
	jQuery.validator.addMethod("validPostCode", function(value, element) {
		return this.optional(element) || /^[A-Z]{1,2}[0-9RCHNQ][0-9A-Z]?\s?[0-9][ABD-HJLNP-UW-Z]{2}$|^[A-Z]{2}-?[0-9]{4}$/.test(value);
	}, "Enter valid post code");
	
	jQuery.validator.addMethod("validTitle", function(value, element) {
		return this.optional(element) || !/^A/.test(value);
	}, "Enter valid post code");
	
	// Initialize form validation on the registration form.
	// It has the name attribute "registration"
	$("form[name='registration']").validate({
		// Specify validation rules
		rules: {
			// The key name on the left side is the name attribute
			// of an input field. Validation rules are defined
			// on the right side
			first_name:
			{
				required: true,
				minlength: 3,
				lettersonly: true
			},
			last_name: {
				required: true,
				minlength: 3,
				lettersonly: true
			},

			email: {
				required: true,
				// Specify that email should be validated
				// by the built-in "email" rule
				email: true
			},

			mobile: {
				required: true,
				number: true,
				maxlength: 10,
			},
			postCode: {
				required: true,
				validPostCode:true
			},
			day: {
				number: true,
				maxlength: 2,
				max: 31,
				min: 0
			},
			
			month:{
				required:true,
                 
                       
			},
			
			
			year:{
                        required:true,
                        number: true,
                        min:4
                    }
		},
		
		
		
		
		title:{
            required: {
                depends: function(element){
                    if('none' == $('#title').val()){
                        //Set predefined value to blank.
                        $('#title').val('');
                    }
                    return true;
                }
            }
        },

		funeralType:{
			ignore:'',
			required:true
		},
		
		
		
		// Specify validation error messages
		messages: {
			firstname: "Please enter your firstname",
			lastname: "Please enter your lastname",
			email: "Please enter a valid email address",
			day:"Please select valid date",
			year:"Please select valid year",
			title:"Please select valid Title"
		},
		// Make sure the form is submitted to the destination defined
		// in the "action" attribute of the form when valid
		submitHandler: function(form) {
			form.submit();
		}
	});
});