<style>
    .skill-tag {
        display: inline-flex;
        align-items: center;
        padding: 6px 14px;
        background: linear-gradient(135deg, #fcfdff, #babcbe);
        border-radius: 50px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
        font-weight: 500;
        font-size: 14px;
        color: #333;
        transition: all 0.2s ease;
        margin: 4px;
        cursor: default;

    }

    .skill-tag:hover {
        background: linear-gradient(135deg, #acb1c2, #0b0f13);
        color: #fcfdff;
        transform: scale(1.05);
    }

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
    <!--- #writeDump(cgi)# --->
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-md-4 bg-dark text-white pb-3">
                <div class="d-flex flex-column gap-3 ">
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
                            <button class="text-center btn btn-link text-decoration-none # structKeyExists(session, "user" ) ? 'pe-auto' : 'pe-none'#" data-bs-toggle="modal" data-bs-target="##followersListModal" >                        
                                    <strong class="text-white" id="followerNumber">#prc.followersCount#</strong>&nbsp;<small class="text-muted">Followers</small>
                            </button>

                            <button class="text-center btn btn-link text-decoration-none # structKeyExists(session, "user" ) ? 'pe-auto' : 'pe-none'# " id="getFollowingList" data-bs-toggle="modal" data-bs-target="##followingListModal">
                                    <strong class="text-white" id="followingNumber">#prc.FollowingCount#</strong>&nbsp;<small class="text-muted">Following</small>
                            </button>
                        </div>


                        <p class="mb-1"><i class="fa-solid fa-location-dot me-2 text-danger"></i>#prc.data.address#</p>
                    </div>

                    <cfif NOT structKeyExists(session, "user" )>

                        <div class=" rounded shadow-sm p-3 border-top">
                            <h6 class="fw-bold mb-2">
                                <i class="fa-solid fa-rocket me-1 text-primary"></i> Ready to Connect?
                            </h6>
                            <p class="text-muted small mb-3">Join a network of professionals building careers and sharing
                                experiences.</p>
                            <a href="#event.buildLink('authentication.loginView')#" class="btn btn-success btn-sm w-100">
                                <i class="fa-solid fa-user-plus me-1"></i> Create Your Profile
                            </a>
                        </div>
                    <cfelse>
                        <!--- #writeDump(prc)# --->
                        <cfif prc.isFollowing eq false>
                            <button class="btn btn-outline-primary btn-sm px-5 py-1 mx-3" id="followBtn"
                            data-id="#prc.data.profile_id#">
                            <i class="fa-solid fa-user-plus me-1"></i>Follow</button>

                        <cfelse>
                            <div class="d-flex flex-wrap justify-content-start align-items-center gap-2 ps-3 ">

                                <button class="btn btn-outline-secondary btn-sm px-3 py-1  d-flex justify-content-center align-items-center" id="unfollowBtn"
                                data-id="#prc.data.profile_id#">
                                <i class="fa-solid fa-user-minus me-1"></i>Unfollow
                                </button>
                                
                                <button class="btn btn-outline-secondary btn-sm px-3 py-1 d-flex justify-content-center align-items-center" id="messageBtn"
                                data-id="#prc.data.profile_id#">
                                <i class="fa-solid fa-message me-1"></i> Message
                                </button>
                            </div>

                    </cfif>
                        
                    </cfif>
                    <!-- Platform Features -->
                    <div class="bg-dark text-white rounded shadow-lg p-3 border-top">
                        <h6 class="text-uppercase text-muted small mb-2">Platform Features</h6>
                        <ul class="list-unstyled small">
                            <li class="mb-2"><i class="fa-solid fa-user-check me-2 text-warning"></i>Verified Profiles
                            </li>
                            <li class="mb-2"><i class="fa-solid fa-comments me-2 text-info"></i>Direct Messaging</li>
                            <li class="mb-2"><i class="fa-solid fa-briefcase me-2 text-success"></i>Project Showcases
                            </li>
                            <li class="mb-2"><i class="fa-solid fa-graduation-cap me-2 text-secondary"></i>Education
                                Insights</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-lg-9 col-md-8 container d-flex flex-column gy-2 gap-2 pb-3">

                <ul class="nav nav-pills justify-content-center  px-2 pt-2 border-bottom bg-transparent" role="tablist">
                    
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
                <div class="tab-content mt-3 fade show">
                     <div class="tab-pane fade show active" id="posts_content" role="tabpanel" aria-labelledby="pill-tab-2">
                        <cfinclude template="../posts/posts.cfm">
                    </div>

                    <div class="tab-pane fade  " id="proflie_content"
                        role="tabpanel" aria-labelledby="pill-tab-0">
                       <cfif NOT structKeyExists(session, "user" )>
                            
                            <div class="card shadow-lg rounded-4  text-center">
                                <div class="card-body">
                                    <i class="fa-solid fa-lock fa-3x text-secondary mb-3"></i>
                                    <h4 class="mb-3 fw-bold">Want to View the Full Profile?</h4>
                                    <p class="text-muted mb-4">Sign in to unlock full access to skills, experience,
                                        education, and more.</p>
                                    <a href="#event.buildLink('authentication.loginView')#"
                                        class="btn btn-primary btn-lg px-4 rounded-pill shadow-sm">
                                        <i class="fa-solid fa-right-to-bracket me-2"></i> Login to Continue
                                    </a>
                                    <p class="mt-3 small text-muted">Don't have an account? <a href="/register"
                                            class="text-decoration-none">Sign up</a></p>
                                </div>
                            </div>

                            <div class="card border-0 shadow-sm rounded-4 mt-4 text-white" style="background: linear-gradient(135deg, ##212529, ##4e4e4e);">
                                <div class="card-body text-center p-4">
                                    <h5 class="fw-bold mb-3"><i class="fa-solid fa-people-group me-2"></i>Join Our Vibrant Community</h5>
                                    <p class="text-light small">Thousands of learners, developers, and creators are sharing knowledge and building connections here daily. Be part of something impactful.</p>
                                    <div class="d-flex justify-content-center gap-2 mt-3 flex-wrap">
                                        <span class="badge bg-white text-dark px-3 py-2">Collaboration</span>
                                        <span class="badge bg-white text-dark px-3 py-2">Growth</span>
                                        <span class="badge bg-white text-dark px-3 py-2">Mentorship</span>
                                        <span class="badge bg-white text-dark px-3 py-2">Innovation</span>
                                    </div>
                                </div>
                            </div>


                            <cfelse>
                                <div class="d-flex flex-column gy-2 gap-2 pb-3">
                                    <div class="card shadow-lg rounded-4 ">
                                        <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                                            <h5 class="mb-0"><i class="fa-solid fa-graduation-cap me-2"></i>Education</h5>
                                        </div>

                                        <cfif prc.edu.recordCount EQ 0>
                                            <div class="card-body text-center text-muted py-4">
                                                <i class="fa-solid fa-user-graduate fa-2x mb-2"></i><br>No education added yet.
                                            </div>
                                        </cfif>

                                        <cfloop index="i" from="1" to="#prc.edu.recordCount#">
                                            <cfset collapseID="edu" & i>
                                                <div class="card-body">
                                                    <div class=" border rounded-3 p-3 shadow-sm education-item position-relative"
                                                        style="transition: 0.3s;">

                                                        <div class="d-flex justify-content-between align-items-center"
                                                            data-bs-toggle="collapse" href="###collapseID#" role="button"
                                                            aria-expanded="false" aria-controls="#collapseID#">
                                                            <div>
                                                                <h6 class="mb-0">
                                                                    <i class="fa-solid fa-user-graduate me-2"></i>#prc.edu.degree[i]#
                                                                </h6>
                                                                <small class="text-muted">
                                                                    #prc.edu.institution[i]# (#dateFormat(prc.edu.start_year[i], 'yyyy')# -
                                                                    #dateFormat(prc.edu.end_year[i], 'yyyy')#)
                                                                </small>
                                                            </div>
                                                            <div class="d-flex gap-2  justify-content-center align-items-center">

                                                                <i class="fa-solid fa-chevron-down text-secondary"></i>

                                                            </div>
                                                        </div>

                                                        <div class="collapse mt-3" id="#collapseID#">
                                                            <p><strong>Grade:</strong> #prc.edu.grade[i]#</p>
                                                            <p><strong>Description:</strong> #prc.edu.description[i]#</p>
                                                        </div>


                                                    </div>
                                                </div>
                                        </cfloop>
                                    </div>

                                    <div class="card shadow-lg rounded-4 ">
                                        <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                                            <h5 class="mb-0"><i class="fa-solid fa-briefcase me-2"></i>Experience</h5>

                                        </div>
                                        <cfif prc.experience.recordCount EQ 0>
                                            <div class="card-body text-center text-muted py-4">
                                                <i class="fa-solid fa-briefcase fa-2x mb-2"></i><br>No experience added yet.
                                            </div>
                                        </cfif>

                                        <cfloop index="i" from="1" to="#prc.experience.recordCount#">
                                            <cfset collapseID="exp" & i>
                                                <div class="card-body">
                                                    <div class=" border rounded-3 p-3 shadow-sm experience-item position-relative"
                                                        style="transition: 0.3s;">

                                                        <div class="d-flex justify-content-between align-items-center"
                                                            data-bs-toggle="collapse" href="###collapseID#" role="button"
                                                            aria-expanded="false" aria-controls="#collapseID#">
                                                            <div>
                                                                <h6 class="mb-0">
                                                                    <i class="fa-solid fa-briefcase me-2"></i>#prc.experience.job_title[i]#
                                                                </h6>
                                                                <small class="text-muted">
                                                                    #prc.experience.company_name[i]# (#prc.experience.start_year[i]# -
                                                                    #prc.experience.end_year[i] EQ "" ? "Present" :
                                                                    prc.experience.end_year[i]#)
                                                                </small>
                                                            </div>
                                                            <div class="d-flex gap-2  justify-content-center align-items-center">

                                                                <i class="fa-solid fa-chevron-down text-secondary"></i>

                                                            </div>
                                                        </div>

                                                        <div class="collapse mt-3" id="#collapseID#">
                                                            <p><strong>Description:</strong> #prc.experience.description[i]#</p>
                                                        </div>


                                                    </div>
                                                </div>
                                        </cfloop>
                                    </div>
                                
                                    <div class="card shadow-lg rounded-4 ">
                                        <div
                                            class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                                            <h5 class="mb-0">
                                                <i class="fa-solid fa-diagram-project me-2"></i>Projects
                                            </h5>
                                        </div>

                                        <cfif prc.projects.recordCount EQ 0>
                                            <div class="card-body text-center text-muted py-4">
                                                <i class="fa-solid fa-folder-open fa-2x mb-2"></i><br>No projects added yet.
                                            </div>
                                        </cfif>

                                        <cfloop index="i" from="1" to="#prc.projects.recordCount#">
                                            <cfset collapseID="project" & i>
                                                <div class="card-body ">
                                                    <div class="border rounded-3 p-3 shadow-sm bg-light" style="transition: 0.3s;">
                                                        <div class="d-flex justify-content-between align-items-center"
                                                            data-bs-toggle="collapse" href="###collapseID#" role="button"
                                                            aria-expanded="false" aria-controls="#collapseID#">

                                                            <div>
                                                                <h6 class="mb-1 ">
                                                                    <i
                                                                        class="fa-solid fa-code-branch me-2"></i>#prc.projects.project_title[i]#
                                                                </h6>
                                                                <small class="text-muted d-block">
                                                                    #prc.projects.client_name[i]#
                                                                    (#prc.projects.start_year[i]# -
                                                                    <cfif len(trim(prc.projects.end_year[i])) EQ 0>Present<cfelse>
                                                                            #prc.projects.end_year[i]#</cfif>)
                                                                </small>
                                                            </div>

                                                            <div class="d-flex gap-2 justify-content-center align-items-center">
                                                                <i class="fa-solid fa-chevron-down text-secondary"></i>
                                                            </div>
                                                        </div>

                                                        <div class="collapse mt-3" id="#collapseID#">

                                                            <div class="d-flex flex-wrap gap-2 mt-2">
                                                                <a href="#prc.projects.live_link[i]#" target="_blank"
                                                                    class="btn btn-outline-success btn-sm rounded-pill px-3">
                                                                    <i class="fa-solid fa-globe me-1"></i> Live Site
                                                                </a>

                                                                <a href="#prc.projects.github_link[i]#" target="_blank"
                                                                    class="btn btn-outline-dark btn-sm rounded-pill px-3">
                                                                    <i class="fa-brands fa-github me-1"></i> GitHub
                                                                </a>
                                                            </div>
                                                            <cfif len(trim(prc.projects.tech_stack[i]))>
                                                                <p class="mt-4">
                                                                    <strong><i class="fa-solid fa-tags me-2"></i>Tech
                                                                        Stack:</strong><br>
                                                                    <cfloop list="#prc.projects.tech_stack[i]#" index="tech">
                                                                        <span class="badge bg-secondary me-1">#tech#</span>
                                                                    </cfloop>
                                                                </p>
                                                            </cfif>

                                                            <p class="mt-4">
                                                                <strong><i
                                                                        class="fa-solid fa-circle-info me-2"></i>Description:</strong><br>
                                                                #prc.projects.description[i]#

                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                        </cfloop>

                                    </div>

                                    <div class="card shadow-lg rounded-4">
                                        <div
                                            class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                                            <h5 class="mb-0"><i class="fa-solid fa-wand-magic-sparkles me-2"></i>Skills & Expertise
                                            </h5>

                                        </div>
                                        <cfif prc.userSkills.recordCount EQ 0>
                                            <div class="card-body text-center text-muted py-4">
                                                <i class="fa-solid fa-lightbulb fa-2x mb-2"></i><br>No skills added yet.
                                            </div>
                                        </cfif>

                                        <div class="card-body">
                                            <div class="d-flex flex-wrap gap-2">
                                                <cfloop index="i" from="1" to="#prc.userSkills.recordCount#">
                                                    <div class="skill-tag" data-bs-toggle="tooltip" data-bs-placement="top"
                                                        title="Expert in responsive layouts and flexbox/grid.">
                                                        #prc.userSkills.skill_name[i]#
                                                    </div>
                                                </cfloop>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                        </cfif>
                    </div>

                </div>

                

                <cfinclude template="./followingAndFollowersList.cfm">
            </div>
        </div>
    </div>


    <script>
        $(document).on("click", "##followBtn", function () {
       
            follower_id = #session.user?.profile_id#;
            following_id = #prc.data?.profile_id#;
            
            $.ajax({
                url: "#event.buildLink('profile.follow')#",
                type: 'POST',
                data: { following_id, follower_id},
                dataType: 'json',
                success: function (res) {
                    // console.log(res);
                    
                    if (res.STATUS == "success") {
                         window.location.href=`#event.buildLink('main.profileView')#?profile_id=${following_id}&follower_id=${follower_id}`
                    }
                },
                error: function () {
                    Swal.fire("Error", "Something went wrong", "error");
                }
            });
        });

        $(document).on("click", "##unfollowBtn", function () {
       
            follower_id = #session.user?.profile_id#;
            following_id = #prc.data?.profile_id#;
            
            $.ajax({
                url: "#event.buildLink('profile.unfollow')#",
                type: 'POST',
                data: { following_id, follower_id},
                dataType: 'json',
                success: function (res) {
                    
                    if (res.STATUS == "success") {
                         window.location.href=`#event.buildLink('main.profileView')#?profile_id=${following_id}&follower_id=${follower_id}`
                    }
                },
                error: function () {
                    Swal.fire("Error", "Something went wrong", "error");
                }
            });
        });
    </script>
</cfoutput>