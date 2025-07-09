<cfoutput>
    <div class="container-fluid" >
        <div class="row">
            <div class="col-lg-3 col-md-4 bg-dark text-white pb-3">
                <div class="d-flex flex-column gap-5 ">
                    <div class=" d-flex justify-content-center  align-items-center ">
                        <img src="#prc.data.profile_image#"
                            class="img-fluid rounded-circle d-flex justify-center align-itmes-center d-none d-md-block mt-3"
                            alt="Profile Image" style="width: 90%; aspect-ratio: 1/1; object-fit: fill;">
                        
                        <div class="row d-md-none">
                            <div class="col-3 mt-3"><img src="#prc.data.profile_image#"
                            class="img-fluid rounded-circle d-flex justify-content-center align-itmes-center "
                            alt="Profile Image" style="width: 100%; aspect-ratio: 1/1; object-fit: fill;"></div>
                            <div class="col-8 d-flex justify-content-start align-items-center"><h5 class="fs-2 fw-bold ">#prc.data.firstName & " " & prc.data.lastName# </h5></div>
                        </div>

                    </div>
                    <div class="d-flex flex-column justify-content-center align-items-start ps-3">

                        <h5 class="fs-2 fw-bold d-none d-md-block ">#prc.data.firstName & " " & prc.data.lastName# </h5>
                        <p class="mb-2 "><i class="fa-solid fa-envelope me-2 text-primary"></i>#prc.data.email#</p>
                        <p class="mb-2"><i class="fa-solid fa-phone me-2 text-success"></i>#prc.data.phoneNumber#
                        </p>
                        <cfif trim(prc.data.dob).length()>
                            <p class="mb-2"><i class="fa-solid fa-cake-candles me-2  text-info "></i>#prc.data.dob#</p>
                        </cfif>
                        <p class="mb-2"><i class="fa-solid fa-location-dot me-2 text-danger"></i>#prc.data.address#</p>
                    </div>
                    <div class="d-flex flex-md-column flex-wrap  gap-3 w-auto ps-3">
                        <a class="btn btn-primary" href="#event.buildLink(" dashboard.editProfile")#">Edit Profile <i
                                class="fa-solid fa-user-pen ms-1"></i></a>
                        <button id="downoladPDF" class="btn btn-success text-white">Resume <i
                                class="fa-solid fa-download"></i></button>
                        <button id="passwordConfig" class="btn btn-secondary text-white" data-bs-toggle="modal" id="changePasswordbtn" data-bs-target="##changePasswordModal">Change Password <i
                                class="fa-solid fa-key"></i></button>
                        <button class="btn btn-outline-danger" id="logout">Logout<i
                                class="fa-solid fa-right-from-bracket ms-1"></i></button>
                        <button class="btn btn-outline-danger" id="delete">Delete Account <i
                                class="fa-solid fa-user-minus"></i></button>
                    </div>
                </div>

            </div>

            <div class="col-lg-9 col-md-8 container d-flex flex-column gy-2 gap-2 pb-3">

                <cfinclude template="./changePassword.cfm">

                <cfinclude template="./education.cfm">

                <cfinclude template="./experience.cfm">

                <cfinclude template="./projects.cfm">

                <cfinclude template="./skills.cfm">

            </div>

            <!--- 
            <div class="col-md-7">

                <div class="card">
                    <div class="row">
                        <div class="card-body col-md-4 d-flex justify-content-center  align-items-center ">
                            <img src="#prc.data.profile_image#"
                                class="img-fluid rounded-circle border d-flex justify-center align-itmes-center"
                                alt="Profile Image" style="width: 140px; height: 140px; object-fit: fill;">
                        </div>
                        <div class="col-md-8 d-flex justify-content-center align-items-center">
                            <div class="card-body">
                                <h5 class="card-title fw-bold">#prc.data.firstName & " " & prc.data.lastName# </h5>
                                <p class="mb-2"><i class="fa-solid fa-envelope me-2 text-primary"></i>#prc.data.email#
                                </p>
                                <p class="mb-2"><i
                                        class="fa-solid fa-phone me-2 text-success"></i>#prc.data.phoneNumber#
                                </p>
                                <cfif trim(prc.data.dob).length()>
                                    <p class="mb-2"><i
                                            class="fa-solid fa-cake-candles me-2  text-info "></i>#prc.data.dob#
                                    </p>
                                </cfif>
                                <p class="mb-2"><i
                                        class="fa-solid fa-location-dot me-2 text-danger"></i>#prc.data.address#
                                </p>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="d-flex flex-wrap gap-3 m-3">
                    <a class="btn btn-primary" href="#event.buildLink(" dashboard.editProfile")#">Edit Profile <i
                            class="fa-solid fa-user-pen ms-1"></i></a>
                    <button id="downoladPDF" class="btn btn-success text-white">Download PDF <i
                            class="fa-solid fa-download"></i></button>
                    <button class="btn btn-outline-danger" id="logout">Logout<i
                            class="fa-solid fa-right-from-bracket ms-1"></i></button>
                    <button class="btn btn-outline-danger" id="delete">Delete Account <i
                            class="fa-solid fa-user-minus"></i></button>
                </div>
            </div>
           

            <cfinclude template="./changePassword.cfm">

            <cfinclude template="./education.cfm">

            <cfinclude template="./experience.cfm">

            <cfinclude template="./skills.cfm">

--->

        </div>
    </div>



    <script>

        $(document).on("click", "##downoladPDF", function () {
            window.location.href = "#event.buildLink('dashboard.downloadPDF')#?profile_id=#session.user.profile_id#";
        });

        $(document).on("click", "##delete", function () {
            // window.location.href = "#event.buildLink('dashboard.deleteProfile')#?profile_id=#session.user.profile_id#";
            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "##3085d6",
                cancelButtonColor: "##d33",
                confirmButtonText: "Yes, delete it!"
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: "#event.buildLink('dashboard.deleteProfile')#?profile_id=#session.user.profile_id#",
                        type: 'POST',
                        contentType: false,
                        processData: false,
                        dataType: 'json',
                        success: function (data) {
                            if (data.STATUS === "success") {
                                Swal.fire("Profile Deleted Successful", "", "success").then(() => {
                                    window.location.href = "#event.buildLink('main.index')#";
                                });
                            } else {
                                Swal.fire("Profile not deleted", data.error, "error");
                            }
                        },
                        error: function () {
                            Swal.fire("Error", "Something went wrong", "error");
                        }
                    });
                }
            });


        });


    </script>
</cfoutput>