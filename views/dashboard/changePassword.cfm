<cfoutput>
    <div class="modal fade" id="changePasswordModal" data-bs-backdrop="static" tabindex="-1"
        aria-labelledby="changePasswordModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content rounded-4 shadow">
                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title" id="changePasswordModalLabel"><i
                                class="fa-solid fa-key"></i> Change Password</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>

                <div class="modal-body ">
                    <form id="changePasswordForm">

                        <ul class="list-group">
                            <li class="list-group-item d-flex  justify-content-center align-items-center gap-2">
                                <i class="fa-solid fa-lock"></i><input type="password" class="form-control"
                                    placeholder="Old Password" name="oldPassword">
                            </li>
                            <li class="list-group-item d-flex  justify-content-center align-items-center gap-2">
                                <i class="fa-solid fa-lock"></i> <input type="password" class="form-control"
                                    placeholder="New Password" name="newPassword">
                            </li>
                            <li class="list-group-item d-flex  justify-content-center align-items-center gap-2">
                                <i class="fa-solid fa-lock"></i> <input type="password" class="form-control"
                                    placeholder="Confirm Password" name="confirmPassword">
                            </li>
                        </ul>

                        <div class="modal-body">
                            <button class="card-link btn btn-primary " id="updatePassword">Update Password</button>
                            <a href="#event.buildLink('authentication.forgotPasswordView')#" class="card-link">Forgot
                                Password</a>
                        </div>
                    </form>
                </div>
                
            </div>
        </div>
    </div>

    <!--- <div class="card text-center col-md-4 p-0">
        <div class="card-header">
            Change Password
        </div>

        <div class="card-body ">
            <form id="changePasswordForm">

                <ul class="list-group">
                    <li class="list-group-item d-flex  justify-content-center align-items-center gap-2">
                        <i class="fa-solid fa-lock"></i><input type="password" class="form-control"
                            placeholder="Old Password" name="oldPassword">
                    </li>
                    <li class="list-group-item d-flex  justify-content-center align-items-center gap-2">
                        <i class="fa-solid fa-lock"></i> <input type="password" class="form-control"
                            placeholder="New Password" name="newPassword">
                    </li>
                    <li class="list-group-item d-flex  justify-content-center align-items-center gap-2">
                        <i class="fa-solid fa-lock"></i> <input type="password" class="form-control"
                            placeholder="Confirm Password" name="confirmPassword">
                    </li>
                </ul>

                <div class="card-body">
                    <button class="card-link btn btn-primary " id="updatePassword">Update Password</button>
                    <a href="#event.buildLink('authentication.forgotPasswordView')#" class="card-link">Forgot
                        Password</a>
                </div>
            </form>
        </div>
    </div> --->

    <script>
        $(document).ready(function () {

            $('##changePasswordForm').validate({
                rules: {
                    oldPassword: {
                        required: true,
                        minlength: 6
                    },
                    newPassword: {
                        required: true,
                        minlength: 6
                    },
                    confirmPassword: {
                        required: true,
                        equalTo: '[name="newPassword"]'
                    }
                },
                messages: {
                    oldPassword: {
                        required: "Please enter your old password",
                        minlength: "Must be at least 6 characters"
                    },
                    newPassword: {
                        required: "Please enter a new password",
                        minlength: "Must be at least 6 characters"
                    },
                    confirmPassword: {
                        required: "Please confirm your new password",
                        equalTo: "Passwords do not match"
                    }
                },
                errorClass: "is-invalid",
                validClass: "is-valid",
                errorElement: "div",
                highlight: function (element) {
                    $(element).addClass('is-invalid').removeClass('is-valid');
                },
                unhighlight: function (element) {
                    $(element).removeClass('is-invalid').addClass('is-valid');
                },
                errorPlacement: function (error, element) {
                    error.addClass('invalid-feedback');
                    error.insertAfter(element.parent());

                },
                submitHandler: function (form) {
                    let formData = new FormData(form);
                    formData.append("profile_id", #prc.data.profile_id#);

                    $.ajax({
                        url: "#event.buildLink('profile.changePassword')#",
                        type: 'POST',
                        data: formData,
                        contentType: false,
                        processData: false,
                        dataType: 'json',
                        success: function (data) {
                            if (data.STATUS == "success") {
                                Swal.fire("Password changed Successful", "", "success").then(() => {
                                    window.location.href = "#event.buildLink('dashboard.index')#?profile_id=#session.user.profile_id#";
                                });
                            } else {

                                Swal.fire("Failed", data.message, "error");
                            }
                        },
                        error: function () {
                            Swal.fire("Error", "Something went wrong", "error");
                        }
                    });
                    return false;
                }
            });

            $('##changePasswordModal').on('show.bs.modal', function () {
                $('##changePasswordForm')[0].reset();
                $('##changePasswordForm').validate().resetForm();
                $('##changePasswordForm .form-control').removeClass('is-invalid is-valid');
            });
        });
    </script>
</cfoutput>