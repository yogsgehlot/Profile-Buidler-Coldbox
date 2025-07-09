<cfoutput>
    <script>
         $(document).ready(function () {
            $("##login_form").validate({
                rules: {
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 6
                    }
                },
                messages: {
                    email: {
                        required: "Please enter your email",
                        email: "Please enter a valid email"
                    },
                    password: {
                        required: "Please enter your password",
                        minlength: "Your password must be at least 6 characters"
                    }
                },
                highlight: function (element) {
                    $(element).addClass("is-invalid");
                },
                unhighlight: function (element) {
                    $(element).removeClass("is-invalid");
                },
                errorElement: 'div',
                errorClass: 'invalid-feedback',
                errorPlacement: function (error, element) {
                    if (element.parent('.input-group').length) {
                        error.insertAfter(element.parent());
                    } else {
                        error.insertAfter(element);
                    }
                },

                submitHandler: function (form) {
                    let formData = new FormData(form);
                    
                    $.ajax({
                        url: "#event.buildLink('authentication.login')#",
                        type: 'POST',
                        data: formData,
                        contentType: false,
                        processData: false,
                        dataType: 'json',
                        success: function (data) {
                            if (data.STATUS == "success") {
                                Swal.fire("Login Successful", "", "success").then(() => {
                                    window.location.href = "#event.buildLink('main.index')#";
                                });
                            } else {

                                Swal.fire("Login Failed", data.MESSAGE, "error");
                            }
                        },
                        error: function () {
                            Swal.fire("Error", data.MESSAGE, "error");
                        }
                    });

                    return false;
                }
            });
        });
    </script>
</cfoutput>