/**
 * I am a new service
 */
component singleton {

	property name="validationManager" inject="ValidationManager@cbvalidation";
	
	UserValidator function init(){
		
		return this;
	}


	function validateLogin( data ) {
        return validationManager.validate(
            target = data,
            constraints = {
                "email" = {
                    required = true,
                    type = "email",
                    messages = {
                        required = "Email is required",
                        type = "Invalid email format"
                    }
                },
                "password" = {
                    required = true,
                    minLength = 6,
                    messages = {
                        required = "Password is required",
                        minLength = "Minimum 6 characters"
                    }
                }
            }
        );
    }

	function validateRegister( data ) {
        return validationManager.validate(
            target = data,
            constraints = {
				"firstName"= {
					required= true,
					type= "string",
					minlength= 2,
					messages = {
						required = "First Name is required",
						type = "Invalide formate",
						minlength = "Minimum 6 characters"
					}
                },

				"lastName"= {
					required: true,
					type= "string",
					minlength= 2,
					messages = {
						required = "Last Name is required",
						type = "Invalide formate",
						minlength = "Minimum 6 characters"
					}
				},

                "email" = {
                    required = true,
                    type = "email",
                    messages = {
                        required = "Email is required",
                        type = "Invalid email format"
                    }
                },

				"phoneNumber"= {
                        required= true,
                        type= "telephone",
                        minlength= 10,
                        maxlength= 15,
						messages={
							required= "Phone Number is required",
							type= "Invalide formate",
							minlength=" Minimum 10 Digits",
							maxlength= "Maximum 15 Digits",
						}
				},

                "password" = {
                    required = true,
                    minLength = 6,
                    messages = {
                        required = "Password is required",
                        minLength = "Minimum 6 characters"
                    }
                },

				"confirm_password" = {
                    required = true,
                    sameAs = "password",
                    messages = {
                        sameAs = "Passwords must match"
                    }
                },

				"address" = {
					required = true,
                    minlength = 5,
					messages = {
                        required = "address is required",
                        minLength = "Minimum 5 characters"
                    }
				}
            }
        );
    }

	function validateUser( data ) {
        return validationManager.validate(
            target = data,
            constraints = {
				"firstName"= {
					required= true,
					type= "string",
					minlength= 2,
					messages = {
						required = "First Name is required",
						type = "Invalide formate",
						minlength = "Minimum 6 characters"
					}
                },

				"lastName"= {
					required: true,
					type= "string",
					minlength= 2,
					messages = {
						required = "Last Name is required",
						type = "Invalide formate",
						minlength = "Minimum 6 characters"
					}
				},

                "email" = {
                    required = true,
                    type = "email",
                    messages = {
                        required = "Email is required",
                        type = "Invalid email format"
                    }
                },

				"phoneNumber"= {
                        required= true,
                        type= "telephone",
                        minlength= 10,
                        maxlength= 15,
						messages={
							required= "Phone Number is required",
							type= "Invalide formate",
							minlength=" Minimum 10 Digits",
							maxlength= "Maximum 15 Digits",
						}
				},
				
				"dob"= {
                    required= true,
                    type= "date",
					messages = {
						required = "dob is required",
                        type = "Invalid format"
					}
                },
				"address" = {
					required = true,
                    minlength = 5,
					messages = {
                        required = "address is required",
                        minLength = "Minimum 5 characters"
                    }
				}
            }
        );
    }

	function validateChangePassword( data ) {
        return validationManager.validate(
            target = data,
            constraints = {
				
                "oldPassword" = {
                    required = true,
                    minLength = 6,
                    messages = {
                        required = "old Password is required",
                        minLength = "Minimum 6 characters"
                    }
                },

                "newPassword" = {
                    required = true,
                    minLength = 6,
                    messages = {
                        required = "new Password is required",
                        minLength = "Minimum 6 characters"
                    }
                },

				"confirmPassword" = {
                    required = true,
                    sameAs = "password",
                    messages = {
                        sameAs = "Passwords must match"
                    }
                }
            }
        );
    }

	





}