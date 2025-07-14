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
    <div class="container-fluid mt-5 mb-5">
        <div class="card border-0 shadow-lg rounded-4 bg-gradient bg-light position-relative overflow-hidden mb-5">
            <div class="card-body p-4">
                <div class="row align-items-center">
                    <!-- Left: Text Content -->
                    <div class="col-md-8">
                        <h3 class="fw-bold text-dark mb-3">
                            <i class="fa-solid fa-user-group text-primary me-2"></i> Build Meaningful Connections
                        </h3>
                        <p class="text-muted fs-6 mb-3">
                            You're just a few steps away from unlocking professional growth. Discover talented
                            individuals,
                            mentors, collaborators, and teammates by simply following and connecting.
                        </p>
                        <ul class="list-unstyled text-muted mb-4">
                            <li class="mb-2"><i class="fa-solid fa-circle-check text-success me-2"></i>Follow users to
                                stay in the loop</li>
                            <li class="mb-2"><i class="fa-solid fa-circle-check text-success me-2"></i>Connect and
                                exchange ideas or projects</li>
                            <li class="mb-2"><i class="fa-solid fa-circle-check text-success me-2"></i>Start
                                conversations that lead to opportunities</li>
                        </ul>
                        
                    </div>

                    <!-- Right: Illustrative Icon or Avatar Cluster -->
                    <div class="col-md-4 d-none d-md-flex justify-content-center">
                        <div class="position-relative" style="max-width: 200px;">
                            <img src="includes\images\6238849.jpg" alt="Connections" class="img-fluid">
                            <!-- Optional overlay or badges can go here -->
                        </div>
                    </div>
                </div>

                <!-- Tip Banner -->
                <div class="alert alert-primary mt-4 rounded-3 d-flex align-items-center">
                    <i class="fa-solid fa-bolt fs-4 me-3 text-warning"></i>
                    <div>
                        <strong>Quick Tip:</strong> Even one follow today can lead to your next opportunity tomorrow.
                    </div>
                </div>
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
                                        <small class="text-muted"><i class="fa-solid fa-location-dot me-1"></i>#prc.allUsers.address#</small>
                                    </div>


                                    <!--- <div class="mt-3">
                                    <p class="mb-1"><strong>Skills:</strong></p>
                                    <cfloop list="prc.allUsers.skills" index="s">
                                        <span class="badge rounded-pill bg-light text-dark border shadow-sm me-1">s</span>
                                    </cfloop>
                                </div> --->

                                    <div class="mt-auto d-flex justify-content-between align-items-center pt-3">
                                        <button
                                            class="btn btn-outline-primary btn-sm rounded-pill sendConnectBtn pt-1 px-5"
                                            data-id="prc.allUsers.user_id">
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