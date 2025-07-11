<cfoutput>
    <div class="container-fluid p-sm-5 p-3">

        <div class="container rounded-5 border shadow-lg " style="min-height: 50vh">
            <div class="p-sm-5 p-3 gap-3 ">
                <div class="row">
                    <div class="col-md-6 d-flex flex-column justify-content-center row">
                        <form id="forgotPasswordForm">                              
                                <div class="mb-3 ">
                                    <label for="email" class="form-label">Enter your Email:</label>
                                    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp">
                                </div>

                                <div class="d-flex  align-items-center">
                                    <button type="submit" class="btn btn-primary">Send Mail</button>                
                                </div>
                        </form>
                    </div>
                    <div class="offset-sm-2 col-md-4 d-flex  justify-content-end">
                        <img src="includes\images\3275434.jpg" class="w-100">
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
         $(document).ready(function () {
            $("##forgotPasswordForm").validate({
                rules: {
                    email: {
                        required: true,
                        email: true
                    }
                },
                messages: {
                    email: {
                        required: "Please enter your email",
                        email: "Please enter a valid email"
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
                        url: "#event.buildLink('authentication.forgotPassword')#",
                        type: 'POST',
                        data: formData,
                        contentType: false,
                        processData: false,
                        dataType: 'json',
                        success: function (data) {
                            if (data.STATUS == "success") {
                                Swal.fire(data.MESSAGE, "", "success").then(() => {
                                    window.location.href = "#event.buildLink('authentication.loginView')#";
                                });
                            } else {

                                Swal.fire("Login Failed", data.MESSAGE, "error");
                            }
                        },
                        error: function () {
                            Swal.fire("Error", "Something went wrong", "error");
                        }
                    });

                    return false;
                }
            });
        });
    </script>
</cfoutput>

