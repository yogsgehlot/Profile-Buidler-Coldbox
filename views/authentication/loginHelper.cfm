<cfoutput>
    <script>
         $(document).ready(function () {
            
            // console.log(fullURL.substringAfter("#cgi.http_host#/"));
            // relative = fullURL.substringAfter("127.0.0.1:61980/")
            
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
                    var fullUrl = "#cgi.HTTP_REFERER#"
                    var relativePath = fullUrl.replace(`http://#cgi.http_host#/`, '')
                    // console.log("relative path is : ", relativePath );

                    
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
                                    if (!relativePath.includes("profile_id")) {
                                        window.location.href = "#event.buildLink('main.index')#";
                                        
                                    } else {
                                        var profile_id_index = relativePath.indexOf("=") + 1;
                                        profile_id = relativePath.substring(profile_id_index);
                                        
                                        window.location.href = `#event.buildLink("main.profileView")#?profile_id=${profile_id}`;
                                    }
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