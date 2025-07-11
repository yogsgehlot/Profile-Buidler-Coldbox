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
</style>

<cfoutput>
    <!--- #writeDump(cgi)# --->
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
                        
                        <p class="mb-2"><i class="fa-solid fa-location-dot me-2 text-danger"></i>#prc.data.address#</p>
                    </div>

                    <cfif NOT structKeyExists(session, "user" )>

                        <div class=" rounded shadow-sm p-3">
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

                         <div class="rounded shadow-lg p-3" >
                            <h6 class="fw-bold mb-2">
                                <i class="fa-solid fa-handshake me-1 text-primary"></i> Connect with #prc.data.firstName#
                            </h6>
                            <p class="text-muted small mb-3">
                                Start building your professional network by sending a connection request or message.
                            </p>

                            <div class="d-grid gap-2">
                                <button class="btn btn-outline-primary btn-sm w-100" id="connectBtn"
                                    data-id="#prc.data.profile_id#">
                                    <i class="fa-solid fa-user-plus me-1"></i> Send Connection Request
                                </button>

                                <button class="btn btn-outline-secondary btn-sm w-100" id="messageBtn"
                                    data-id="#prc.data.profile_id#">
                                    <i class="fa-solid fa-message me-1"></i> Send Message
                                </button>
                            </div>
                        </div>
                    </cfif>



                    <!-- Platform Features -->
                    <div class="bg-dark text-white border-top p-3 mt-2">
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

                <cfelse>
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

                </cfif>


            </div>
        </div>
    </div>

</cfoutput>