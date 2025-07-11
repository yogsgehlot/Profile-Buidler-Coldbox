<cfoutput>

    <style>
        .profile-image-wrapper {
            position: relative;
            display: inline-block;
            cursor: pointer;
        }

        .profile-image-wrapper img {
            transition: 0.3s ease;
        }

        .profile-image-wrapper .hover-overlay {
            position: absolute;
            top: 0;
            /* left: 0; */
            width: 150px;
            height: 150px;
            background: rgba(0, 0, 0, 0.5);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: 0.3s ease;
        }

        .profile-image-wrapper:hover .hover-overlay {
            opacity: 1;
        }
    </style>

    <div class="container py-5">
        <div class="card shadow-lg rounded-4 p-3" style="max-width: 720px; margin: auto;">

            <form id="updateProfile_form" enctype="multipart/form-data">
                <div class="row">
                    <div
                        class="col-md-4 text-center d-md-block d-flex flex-column justify-content-center align-items-center">

                        <input type="file" id="profileImageInput" name="image" accept="image/*" class="d-none">

                        <label for="profileImageInput"
                            class="d-flex flex-column justify-content-center align-items-center profile-image-wrapper"
                            style="cursor: pointer; ">
                            <img src="#prc.data.profile_image#?:'includes/images/0684456b-aa2b-4631-86f7-93ceaf33303c.jpg'"
                                alt="Profile Image"
                                class="img-fluid rounded-circle border d-flex justify-center align-itmes-center rounded-circle border"
                                style="width: 150px; height: 150px; object-fit: fill;" id="profileImagePreview">
                            <div class="hover-overlay">
                                <i class="fa fa-camera fa-lg"></i>
                            </div>
                        </label>
                        <div class="mt-2 text-muted">Click to change profile picture</div>

                    </div>

                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-6">
                                <input type="hidden" name="profile_id" value="#prc.data.profile_id#">
                                <label for="firstName" class="col-form-label">First Name:</label>
                                <input type="text" id="first_name" name="firstName" class="form-control"
                                    value="#prc.data.firstName#">
                            </div>

                            <div class="col-md-6">
                                <label for="lastName" class="col-form-label">Last Name:</label>
                                <input type="text" id="last_name" name="lastName" class="form-control"
                                    value="#prc.data.lastName#">
                            </div>
                            <div class="col-md-6">

                                <label for="email" class="col-form-label">Email
                                    :</label>
                                <input type="email" id="update_email" name="email" class="form-control"
                                    value="#prc.data.email#">
                            </div>

                            <div class="col-md-6">

                                <label for="dob" class="col-form-label">Date of Birth:</label>
                                <input type="date" id="update_dob" name="dob" class="form-control"
                                    value="#dateFormat(prc.data.dob, 'yyyy-dd-mm')#">
                            </div>


                            <div class="col-md-6">

                                <label for="phoneNumber" class="col-form-label">Phone :</label>
                                <input type="tel" id="update_phoneNumber" name="phoneNumber" class="form-control"
                                    value="#prc.data.phoneNumber#">

                            </div>

                            <div class="">
                                <label for="address" class="col-form-label">Address:</label>
                                <textarea id="update_address" name="address"
                                    class="form-control">#prc.data.address#</textarea>
                            </div>

                        </div>


                    </div>


                    <div class="card-footer bg-transparent d-flex justify-content-end gap-2 mt-3">
                        <button class="btn btn-primary" type="submit">Update Profile</button>
                    </div>
            </form>

        </div>


    </div>

</cfoutput>