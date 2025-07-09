<cfoutput>
<script>
    $(document).ready(function () {

        $("##updateProfile_form").validate({
            rules: {
                firstName: {
                    required: true,
                    minlength: 2,
                    maxlength: 50
                },
                lastName: {
                    required: true,
                    minlength: 2,
                    maxlength: 50
                },
                email: {
                    required: true,
                    email: true
                },
                dob: {
                    required: true,
                    date: true
                },
                phoneNumber: {
                    required: true,
                    digits: true,
                    minlength: 10,
                    maxlength: 15
                },
                address: {
                    required: true,
                    minlength: 5,
                    maxlength: 255
                }
            },
            messages: {
                firstName: {
                    required: "Please enter your first name",
                    minlength: "First name must be at least 2 characters",
                    maxlength: "First name must be under 50 characters"
                },
                lastName: {
                    required: "Please enter your last name",
                    minlength: "Last name must be at least 2 characters",
                    maxlength: "Last name must be under 50 characters"
                },
                email: {
                    required: "Please enter your email",
                    email: "Please enter a valid email address"
                },
                dob: {
                    required: "Please enter your date of birth",
                    date: "Please enter a valid date"
                },
                phoneNumber: {
                    required: "Please enter your phone number",
                    digits: "Phone number must contain only digits",
                    minlength: "Phone number must be at least 10 digits",
                    maxlength: "Phone number can't exceed 15 digits"
                },
                address: {
                    required: "Please enter your address",
                    minlength: "Address must be at least 5 characters",
                    maxlength: "Address must be under 255 characters"
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
                    url: "#event.buildLink('profile.updateProfile')#",
                    type: 'POST',
                    data: formData,
                    contentType: false,
                    processData: false,
                    dataType: 'json',
                    success: function (data) {
                        if (data.STATUS == "success") {
                            Swal.fire("Update Successful", "", "success").then(() => {
                                window.location.href = "#event.buildLink('dashboard.index')#?profile_id=#session.user.profile_id#";
                            });
                        } else {
                            Swal.fire("Update Failed", data.MESSAGE, "error");
                        }
                    },
                    error: function () {
                        Swal.fire("Error", "Something went wrong", "error");
                    }
                });

                return false;
            }
        });

        $("##profileImageInput").on("change", function (event) {
            const file = event.target.files[0];
            
            if (file && file.type.startsWith("image/")) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    $("##profileImagePreview").attr("src", e.target.result);
                };
                reader.readAsDataURL(file);
            }
        });

    });
</script>
</cfoutput>
