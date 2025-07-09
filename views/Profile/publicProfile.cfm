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
                        <p class="mb-2 "><i class="fa-solid fa-envelope me-2 text-primary"></i>#prc.data.email#</p>
                        <p class="mb-2"><i class="fa-solid fa-phone me-2 text-success"></i>#prc.data.phoneNumber#
                        </p>
                        <cfif trim(prc.data.dob).length()>
                            <p class="mb-2"><i class="fa-solid fa-cake-candles me-2  text-info "></i>#prc.data.dob#</p>
                        </cfif>
                        <p class="mb-2"><i class="fa-solid fa-location-dot me-2 text-danger"></i>#prc.data.address#</p>
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

                <div class="card shadow-lg rounded-4 ">
                    <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
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
                                                <strong><i class="fa-solid fa-tags me-2"></i>Tech Stack:</strong><br>
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
                    <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                        <h5 class="mb-0"><i class="fa-solid fa-wand-magic-sparkles me-2"></i>Skills & Expertise</h5>

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
        </div>
    </div>

</cfoutput>