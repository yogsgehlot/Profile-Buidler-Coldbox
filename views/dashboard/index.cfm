<style>
  .nav-pills .nav-link {
    border-radius: 0px;
    transition: all 0.3s ease;
    font-weight: 500;
    color: #212529;
    

  }

  .nav-pills .nav-link:hover {
     color: #0876e4;
    /* color: #fff; */
    /* scale: 103%; */
    /* font-weight: 5px; */
  }

  .nav-pills .nav-link.active {
    /* background-color: #ffffff; */
    color: #212529;
    border-bottom: 1px solid #212529;

    /* box-shadow: 0 0 10px rgba(13, 110, 253, 0.3); */
  }

  .tab-content {
    transition: all 0.5s ease;
  }
</style>

<cfoutput>
    <div class="container-fluid">
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
                            <div class="col-8 d-flex justify-content-start align-items-center">
                                <h5 class="fs-2 fw-bold ">#prc.data.firstName & " " & prc.data.lastName# </h5>
                            </div>
                        </div>

                    </div>
                    <div class="d-flex flex-column justify-content-center align-items-start ps-3">

                        <h5 class="fs-2 fw-bold d-none d-md-block ">#prc.data.firstName & " " & prc.data.lastName# </h5>

                        <div class="d-flex align-items-center gap-3 my-3">
                            <i class="fa-solid fa-user-group me-1 text-info"></i>
                            <button class="text-center btn btn-link text-decoration-none #structKeyExists(session, "user" ) ? 'pe-auto' : 'pe-none' #" data-bs-toggle="modal"
                                data-bs-target="##followersListModal">
                                <strong class="text-white" id="followerNumber">#prc.followersCount#</strong>&nbsp;<small
                                    class="text-muted">Followers</small>
                            </button>

                            <button class="text-center btn btn-link text-decoration-none #structKeyExists(session, "user" ) ? 'pe-auto' : 'pe-none' # " id=" getFollowingList" data-bs-toggle="modal"
                                data-bs-target="##followingListModal">
                                <strong class="text-white"
                                    id="followingNumber">#prc.FollowingCount#</strong>&nbsp;<small
                                    class="text-muted">Following</small>
                            </button>
                        </div>

                        <p class="mb-2"><i class="fa-solid fa-envelope me-2 text-primary"></i>#prc.data.email#</p>
                        <p class="mb-2"><i class="fa-solid fa-phone me-2 text-success"></i>#prc.data.phoneNumber#
                        </p>
                        <cfif trim(prc.data.dob).length()>
                            <p class="mb-2"><i class="fa-solid fa-cake-candles me-2  text-info "></i>#prc.data.dob#</p>
                        </cfif>
                        <p class="mb-2"><i class="fa-solid fa-location-dot me-2 text-danger"></i>#prc.data.address#</p>
                    </div>
                    <div class="d-flex flex-md-column flex-wrap  gap-3 w-auto ps-3">

                        <a class="btn btn-primary" href="#event.buildLink(" profile.editProfile")#">Edit Profile <i
                                class="fa-solid fa-user-pen ms-1"></i></a>
                        <button id="downoladPDF" class="btn btn-success text-white">Resume <i
                                class="fa-solid fa-download"></i></button>
                        <button id="passwordConfig" class="btn btn-secondary text-white" data-bs-toggle="modal"
                            id="changePasswordbtn" data-bs-target="##changePasswordModal">Change Password <i
                                class="fa-solid fa-key"></i></button>
                        <button class="btn btn-outline-danger" id="logout">Logout<i
                                class="fa-solid fa-right-from-bracket ms-1"></i></button>
                        <button class="btn btn-outline-danger" id="delete">Delete Account <i
                                class="fa-solid fa-user-minus"></i></button>
                    </div>
                </div>

            </div>
            
            <cfinclude template="./changePassword.cfm">

            <div class="col-lg-9 col-md-8  d-flex flex-column gy-2 gap-2 pb-3 ">
                <ul class="nav nav-pills justify-content-center px-2 pt-2 border-bottom bg-transparent" role="tablist">

                    <li class="nav-item mx-1">
                        <a class="nav-link active d-flex align-items-center gap-1 px-4 py-2 bg-transparent"
                            id="pill-tab-2" data-bs-toggle="pill" href="##posts_content" role="tab"
                            aria-controls="pill-tabpanel-2" aria-selected="false">
                            <i class="fa-solid fa-pen-nib"></i> Posts
                        </a>
                    </li>

                    <li class="nav-item mx-1">
                        <a class="nav-link  d-flex align-items-center gap-1 px-4 py-2 bg-transparent " id="pill-tab-0"
                            data-bs-toggle="pill" href="##proflie_content" role="tab" aria-controls="pill-tabpanel-0"
                            aria-selected="true">
                            <i class="fa-solid fa-user"></i> Profile
                        </a>
                    </li>

                    
                </ul>

                <!-- Tab Content -->
                <div class="tab-content mt-3 fade show" >
                    <div class="tab-pane fade " id="proflie_content"
                        role="tabpanel" aria-labelledby="pill-tab-0">
                        <div class="d-flex flex-column gy-2 gap-2 px-md-5">
                                <cfinclude template="./education.cfm">
                                <cfinclude template="./experience.cfm">
                                <cfinclude template="./projects.cfm">
                                <cfinclude template="./skills.cfm">
                        </div>
                    </div>

                    <div class="tab-pane fade  show active" id="posts_content" role="tabpanel" aria-labelledby="pill-tab-2">
                        <div class="d-flex flex-column gy-2 gap-2 px-md-5">
                            <cfinclude template="../posts/posts.cfm">
                        </div>
                    </div>

                </div>
            </div>

            <cfinclude template="./followingAndFollowersList.cfm">

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
            window.location.href = "#event.buildLink('profile.downloadPDF')#?profile_id=#session.user.profile_id#";
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
                        url: "#event.buildLink('profile.deleteProfile')#?profile_id=#session.user.profile_id#",
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