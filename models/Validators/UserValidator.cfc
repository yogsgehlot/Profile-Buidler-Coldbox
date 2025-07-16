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
                    message = {
                        required = "Email is required",
                        type = "Invalid email format"
                    }
                },
                "password" = {
                    required = true,
                    size = "6..20",
                    message = {
                        required = "Password is required",
                        size = "length should be in range 6 to 20"
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
					size= 2,
					message = {
						required = "First Name is required",
						type = "Invalide formate",
						size = "Minimum 2 characters"
					}
                },

				"lastName"= {
					required: true,
					type= "string",
					size= 2,
					message = {
						required = "Last Name is required",
						type = "Invalide formate",
						size = "Minimum 2 characters"
					}
				},

                "email" = {
                    required = true,
                    type = "email",
                    message = {
                        required = "Email is required",
                        type = "Invalid email format"
                    }
                },

				"phoneNumber"= {
                        required= true,
                        type= "telephone",
                        size= "10..15",
						message={
							required= "Phone Number is required",
							type= "Invalide formate",
							size=" length should be in range 10 to 15"
						}
				},

                "password" = {
                    required = true,
                    size = "6..20",
                    message = {
                        required = "Password is required",
                        size = "length should be in range 6 to 20"
                    }
                },

				"confirm_password" = {
                    required = true,
                    sameAs = "password",
                    message = {
                        sameAs = "Passwords must match"
                    }
                },

				"address" = {
					required = true,
                    size = "5..100",
					message = {
                        required = "address is required",
                        size = "Minimum 5 characters"
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
					size= "4..30" ,
					message = {
						required = "First Name is required",
						type = "Invalide formate",
						size = "Minimum 2 characters"
					}
                },

				"lastName"= {
					required: true,
					type= "string",
					size= "2..30",
					message = {
						required = "Last Name is required",
						type = "Invalide formate",
						size = "Minimum 2 characters"
					}
				},

                "email" = {
                    required = true,
                    type = "email",
                    message = {
                        required = "Email is required",
                        type = "Invalid email format"
                    }
                },

				"phoneNumber"= {
                    required= true,
                    type= "telephone",
                    size= "10..15",
                    message={
                        required= "Phone Number is required",
                        type= "Invalide formate",
                        size=" length should be in range 10 to 15"
                    }
				},
				
				"dob"= {
                    required= true,
                    type= "date",
					message = {
						required = "dob is required",
                        type = "Invalid format"
					}
                },
				"address" = {
					required = true,
                    size = "5..100",
					message = {
                        required = "address is required",
                        size = "Minimum 5 characters"
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
                    size = "6..20",
                    message = {
                        required = "old Password is required",
                        size = "length should be in range 6 to 20"
                    }
                },

                "newPassword" = {
                    required = true,
                    size = "6..20",
                    message= {
                        required = "new Password is required",
                        size = "length should be in range 6 to 20"
                    }
                },

				"confirmPassword" = {
                    required = true,
                    sameAs = "password",
                    message = {
                        sameAs = "Passwords must match"
                    }
                }
            }
        );
    }
}