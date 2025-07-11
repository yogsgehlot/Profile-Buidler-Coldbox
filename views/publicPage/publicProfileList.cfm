<style>
    .card-hover {
        transition: all 0.2s ease-in-out;
        cursor: pointer;
    }

    .card-hover:hover {
        scale: 101%;
        transform: translateY(-2px);
        box-shadow: 0 12px 24px rgba(0, 0, 0, 0.18);


    }

    .card-body-bg {
        background-color: #f8f9fa;

    }
</style>
<cfoutput>
    <div class="container mt-5 mb-5">
        <div class="card shadow-lg  rounded-4">
            <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0"><i class="fa-solid fa-users me-2"></i>All Professionals</h5>

            </div>

            <div class="card-body card-body-bg ">
                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 ">

                    <cfloop query="prc.allUsers">
                        <div class="col">

                            <div class="card h-100  rounded-3 border-2 border-muted position-relative card-hover "
                                onclick="window.location.href='#event.buildLink('main.profileView')#?profile_id=#prc.allUsers.profile_id#'">
                                <div class="card-body d-flex flex-column align-items-center gap-3">
                                    <img src="#prc.allUsers.profile_image#" alt="Profile Image"
                                        class="rounded-circle shadow-sm"
                                        style="width: 100px; height: 100px; object-fit: fill;">

                                    <div class="d-flex flex-column align-items-center gap-2">
                                        <h6 class="mb-1">#prc.allUsers.full_name#</h6>
                                        <!--- <small class="text-muted">prc.allUsers.job_title</small><br> --->
                                        <small class="text-muted"><i
                                                class="fa-solid fa-location-dot me-1"></i>#prc.allUsers.address#</small>
                                    </div>


                                    <!--- <div class="mt-3">
                                    <p class="mb-1"><strong>Skills:</strong></p>
                                    <cfloop list="prc.allUsers.skills" index="s">
                                        <span class="badge rounded-pill bg-light text-dark border shadow-sm me-1">s</span>
                                    </cfloop>
                                </div> --->

                                    <div class="mt-auto d-flex justify-content-between align-items-center pt-3">
                                        <button
                                            class="btn btn-outline-primary btn-sm rounded-pill sendConnectBtn pt-1 px-5" data-id="prc.allUsers.user_id">
                                            <i class="fa-solid fa-user-plus me-1"></i>Connect
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </cfloop>
                </div>
                <!--- prc.allUsers.recordCount --->
                <cfif 1 EQ 0>
                    <div class="text-center text-muted py-5">
                        <i class="fa-solid fa-user-xmark fa-2x mb-3"></i><br>
                        No users found.
                    </div>
                </cfif>
            </div>
        </div>
    </div>



</cfoutput>