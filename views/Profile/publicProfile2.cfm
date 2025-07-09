<style>
    .body {
        background: linear-gradient(135deg, #f0f4f8, #d9e2ec);
        /* background: linear-gradient(135deg, #c3e4ff, #f0faff); */
    }

    .profile-container {
        background-color: #ffffff;
        border-radius: 1.5rem;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
    }

    .profile-image {
        width: 200px;
        aspect-ratio: 1/1;
        object-fit: cover;
        border-radius: 1rem;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
    }

    .nav-pills .nav-link.active {
        background-color: #0d6efd !important;
        color: #fff;
    }

    .nav-pills .nav-link {
        color: #0d6efd;
    }
</style>


<cfoutput>
    <!--- <div class="container-fluid">
        <div class="row ">

            <div class="col-md-3 mt-3">
                <img src="#prc.data.profile_image#"
                    class="img-fluid rounded-circle d-flex justify-content-center align-itmes-center "
                    alt="Profile Image" style="width: 100%; aspect-ratio: 1/1; object-fit: fill;">
            </div>

            <div class="col-md-8 offset-md-1 d-flex flex-column justify-content-center align-items-start ps-3 ">

                <h5 class="fs-2 fw-bold">#prc.data.firstName & " " & prc.data.lastName# </h5>
                <p class="mb-2 "><i class="fa-solid fa-envelope me-2 text-primary"></i>#prc.data.email#</p>
                <p class="mb-2"><i class="fa-solid fa-phone me-2 text-success"></i>#prc.data.phoneNumber#
                </p>
                <cfif trim(prc.data.dob).length()>
                    <p class="mb-2"><i class="fa-solid fa-cake-candles me-2  text-info "></i>#prc.data.dob#</p>
                </cfif>
                <p class="mb-2"><i class="fa-solid fa-location-dot me-2 text-danger"></i>#prc.data.address#</p>
            </div>

        </div>
        <!--- for example --->
        <div class="row">
            <div class="container mt-3">
            <h2>Toggleable Pills</h2>
            <br>
            <!-- Nav pills -->
            <ul class="nav nav-pills justify-content-center" role="tablist">
                <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="pill" href="##home">Home</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" data-bs-toggle="pill" href="##menu1">Menu 1</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" data-bs-toggle="pill" href="##menu2">Menu 2</a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div id="home" class="container tab-pane active"><br>
                <h3>HOME</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </div>
                <div id="menu1" class="container tab-pane fade"><br>
                <h3>Menu 1</h3>
                <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
                <div id="menu2" class="container tab-pane fade"><br>
                <h3>Menu 2</h3>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                </div>
            </div>
            </div>
        </div>
        
    </div> --->

<!--- 
    <div class="container py-5">
    <!-- Profile Section -->
    <div class="row bg-white shadow-lg rounded-4 p-2">
        <!-- Profile Image -->
        <div class="col-md-3 d-flex justify-content-start align-items-center ">
            <img src="#prc.data.profile_image#" alt="Profile Image"
                class="shadow-lg rounded-2"
                style="width: 200px; aspect-ratio: 1/1; object-fit: fill;">
        </div>

        <!-- Profile Details -->
        <div class="col-md-9 d-flex flex-column justify-content-center ps-md-5 mt-4 mt-md-0">
            <h2 class="fw-bold text-dark">#prc.data.firstName & " " & prc.data.lastName#</h2>
            <div class="mb-2">
                <i class="fa-solid fa-envelope text-primary me-2"></i>
                <span class="text-muted">#prc.data.email#</span>
            </div>
            <div class="mb-2">
                <i class="fa-solid fa-phone text-success me-2"></i>
                <span class="text-muted">#prc.data.phoneNumber#</span>
            </div>
            <cfif trim(prc.data.dob).length()>
                <div class="mb-2">
                    <i class="fa-solid fa-cake-candles text-info me-2"></i>
                    <span class="text-muted">#prc.data.dob#</span>
                </div>
            </cfif>
            <div class="mb-2">
                <i class="fa-solid fa-location-dot text-danger me-2"></i>
                <span class="text-muted">#prc.data.address#</span>
            </div>
        </div>
    </div>

    <!-- Tabbed Content -->
    <div class="row mt-5">
        <div class="col">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body">
                    <ul class="nav nav-pills justify-content-center mb-4" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active px-4 py-2 rounded-pill" data-bs-toggle="pill" href="##home">Overview</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link px-4 py-2 rounded-pill" data-bs-toggle="pill" href="##menu1">Activity</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link px-4 py-2 rounded-pill" data-bs-toggle="pill" href="##menu2">More Info</a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div id="home" class="tab-pane fade show active">
                            <h4 class="fw-semibold mb-2">About</h4>
                            <p class="text-secondary">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        </div>
                        <div id="menu1" class="tab-pane fade">
                            <h4 class="fw-semibold mb-2">Recent Activity</h4>
                            <p class="text-secondary">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        </div>
                        <div id="menu2" class="tab-pane fade">
                            <h4 class="fw-semibold mb-2">Additional Details</h4>
                            <p class="text-secondary">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
</div>
 --->

    <div class="container-fluid py-5 body d-flex flex-wrap justify-content-center">
        <!-- Profile Section -->
        <div class=" container row profile-container p-4 ">
            <!-- Profile Image -->
            <div class="col-md-3 d-flex justify-content-start align-items-center">
                <img src="#prc.data.profile_image#" alt="Profile Image" class="profile-image">
            </div>

            <!-- Profile Details -->
            <div class="col-md-9 d-flex flex-column justify-content-center ps-md-5 mt-4 mt-md-0">
                <h2 class="fw-bold text-dark">#prc.data.firstName & " " & prc.data.lastName#</h2>
                <div class="mb-2">
                    <i class="fa-solid fa-envelope text-primary me-2"></i>
                    <span class="text-muted">#prc.data.email#</span>
                </div>
                <div class="mb-2">
                    <i class="fa-solid fa-phone text-success me-2"></i>
                    <span class="text-muted">#prc.data.phoneNumber#</span>
                </div>
                <cfif trim(prc.data.dob).length()>
                    <div class="mb-2">
                        <i class="fa-solid fa-cake-candles text-info me-2"></i>
                        <span class="text-muted">#prc.data.dob#</span>
                    </div>
                </cfif>
                <div class="mb-2">
                    <i class="fa-solid fa-location-dot text-danger me-2"></i>
                    <span class="text-muted">#prc.data.address#</span>
                </div>
            </div>

            <div class="card shadow-sm border rounded-4 mt-5">
                    <div class="card-body">
                        <ul class="nav nav-pills justify-content-center mb-4" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active px-4 py-2 rounded-pill" data-bs-toggle="pill" href="##education">Education</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link px-4 py-2 rounded-pill" data-bs-toggle="pill" href="##experience">Experience</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link px-4 py-2 rounded-pill" data-bs-toggle="pill" href="##skills">Skills</a>
                            </li>
                        </ul>

                        <div class="tab-content">
                            <div id="home" class="tab-pane fade show active">
                                <h4 class="fw-semibold mb-2">About</h4>
                                <p class="text-secondary">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                            </div>
                            <div id="menu1" class="tab-pane fade">
                                <h4 class="fw-semibold mb-2">Recent Activity</h4>
                                <p class="text-secondary">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            </div>
                            <div id="menu2" class="tab-pane fade">
                                <h4 class="fw-semibold mb-2">Additional Details</h4>
                                <p class="text-secondary">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

        <!-- Tabbed Content -->
        <div class=" container row mt-5">
            <div class="col">
                
            </div>
        </div>    
</div>


</cfoutput>