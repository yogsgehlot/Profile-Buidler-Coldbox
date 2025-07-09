<cfoutput>
    
    
    <script>
        
        $(document).ready(function () {
            $("##register_form").validate({
                rules: {
                    firstName: {
                        required: true,
                        minlength: 2
                    },
                    lastName: {
                        required: true,
                        minlength: 2
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    phoneNumber: {
                        required: true,
                        digits: true,
                        minlength: 10,
                        maxlength: 15
                    },
                    password: {
                        required: true,
                        minlength: 6
                    },
                    confirm_password: {
                        required: true,
                        equalTo: "##password"
                    },
                    address: {
                        required: true,
                        minlength: 5
                    }
                },
                messages: {
                    firstName: "Please enter your first name",
                    lastName: "Please enter your last name",
                    email: "Please enter a valid email",
                    phoneNumber: "Enter a valid phone number",
                    password: "Password must be at least 6 characters",
                    confirm_password: "Passwords do not match",
                    address: "Please enter your address"
                },
                errorElement: "small",
                errorClass: "text-danger",

                submitHandler: function (form) {
                    const formData = new FormData(form);

                    $.ajax({
                        url: "#event.buildLink('authentication/register')#",
                        data: formData,
                        type: 'post',
                        dataType: "json",
                        contentType: false,
                        processData: false,
                        success: function (data) {
                            if (data.STATUS === "success") {
                                Swal.fire({
                                    title: "Registered Successfully",
                                    icon: "success",
                                    confirmButtonText: "Login"
                                }).then(() => {
                                    window.location.href = "#event.buildLink('authentication.loginView')#";
                                });
                            } else {
                                Swal.fire("Registration failed", data.MESSAGE, "warning");
                            }
                        },
                        error: function (xhr, status, error) {
                            console.log('Error:', error);
                        }
                    });
                }   
            });
        });
      
    </script>

</cfoutput>