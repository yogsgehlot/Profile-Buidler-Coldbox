<style>
     .select2-container {
        width: unset !important;
        min-width: 250px;
    }

    .select-cust {
        width: unset;
    }

    .select2-selection__choice {
        border-radius: 20px !important;
        font-size: 14px !important;
        font-weight: 500 !important;
        margin-top: 5px !important;
        background: linear-gradient(135deg, #fcfdff, #babcbe) !important;
        /* border: 1px solid #ccc; */
        color: #000000;
        transition: background 0.3s ease;
    }

    .select2-results__option--highlighted[aria-selected] {
        background-color: #198754;
        color: white;
    }

    .select2-selection__choice.new-skill {
        background-color: #ffc107 !important;
        /* Yellow */
        border-color: #e0a800;
        color: black !important;
    }
</style>

<cfoutput>

<!--- 
        <div class="card shadow-lg rounded-4 mt-4">
    <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
        <h5 class="mb-0">
            <i class="fa-solid fa-diagram-project me-2"></i>Projects
        </h5>
        <button class="btn btn-light btn-sm" data-bs-toggle="modal" id="addProjectBtn"
            data-bs-target="##addProjectModal">
            <i class="fa-solid fa-plus"></i>
        </button>
    </div>

    <cfloop index="i" from="1" to="3">
        <cfset collapseID = "project" & i>
        <div class="card-body">
            <div class="mb-3 border rounded-3 p-3 shadow-sm project-item position-relative" style="transition: 0.3s;">
                <div class="d-flex justify-content-between align-items-center" data-bs-toggle="collapse"
                    href="###collapseID#" role="button" aria-expanded="false" aria-controls="#collapseID#">

                    <div>
                        <h6 class="mb-0">
                            <i class="fa-solid fa-code-branch me-2"></i>prc.projects.project_title[i]
                        </h6>
                        <small class="text-muted">
                            prc.projects.client_name[i] (prc.projects.start_year[i] - 
                            <cfif len(1) EQ 0>Present<cfelse>prc.projects.end_year[i]</cfif>)
                        </small>
                    </div>

                    <div class="d-flex gap-2 justify-content-center align-items-center">
                        <i class="fa-solid fa-chevron-down text-secondary"></i>

                        <button class="btn btn-outline-secondary btn-sm m-2 openEditProjectModalBtn"
                            data-bs-toggle="modal" data-id="prc.projects.project_id[i]"
                            data-bs-target="##editProjectModal">
                            <i class="fa-solid fa-pen"></i>
                        </button>

                        <button type="button" class="btn btn-danger btn-sm" id="projectDelete"
                            data-id="prc.projects.project_id[i]">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </div>
                </div>

                <div class="collapse mt-3" id="#collapseID#">
                    <p><strong>Description:</strong> prc.projects.description[i]</p>
                </div>
            </div>
        </div>
    </cfloop>
</div> 
--->

<div class="card shadow-lg rounded-4 ">
    <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
        <h5 class="mb-0">
            <i class="fa-solid fa-diagram-project me-2"></i>Projects
        </h5>
        <button class="btn btn-light btn-sm" data-bs-toggle="modal" id="addProjectBtn" data-bs-target="##addProjectModal">
            <i class="fa-solid fa-plus"></i>
        </button>
    </div>

    <cfif prc.projects.recordCount EQ 0>
        <div class="card-body text-center text-muted py-4">
            <i class="fa-solid fa-folder-open fa-2x mb-2"></i><br>No projects added yet.
        </div>
    </cfif>

    <cfloop index="i" from="1" to="#prc.projects.recordCount#">
        <cfset collapseID = "project" & i>
        <div class="card-body ">
            <div class="border rounded-3 p-3 shadow-sm " style="transition: 0.3s;">
                <div class="d-flex justify-content-between align-items-center" data-bs-toggle="collapse"
                    href="###collapseID#" role="button" aria-expanded="false" aria-controls="#collapseID#">

                    <div>
                        <h6 class="mb-1 ">
                            <i class="fa-solid fa-code-branch me-2"></i>#prc.projects.project_title[i]#
                        </h6>
                        <small class="text-muted d-block">
                            #prc.projects.client_name[i]# 
                            (#prc.projects.start_year[i]# - 
                            <cfif len(trim(prc.projects.end_year[i])) EQ 0>Present<cfelse>#prc.projects.end_year[i]#</cfif>)
                        </small>
                    </div>

                    <div class="d-flex gap-2 justify-content-center align-items-center">
                        <i class="fa-solid fa-chevron-down text-secondary"></i>

                        <button class="btn btn-outline-secondary btn-sm openEditProjectModalBtn"
                            data-bs-toggle="modal" data-id="#prc.projects.project_id[i]#"
                            data-bs-target="##editProjectModal">
                            <i class="fa-solid fa-pen"></i>
                        </button>

                        <button class="btn btn-danger btn-sm" id="projectDelete" data-id="#prc.projects.project_id[i]#">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </div>
                </div>

                <div class="collapse mt-3" id="#collapseID#"> 

                    <div class="d-flex flex-wrap gap-2 mt-2">
                        <a href="#prc.projects.live_link[i]#" target="_blank" class="btn btn-outline-success btn-sm rounded-pill px-3">
                            <i class="fa-solid fa-globe me-1"></i> Live Site
                        </a>

                        <a href="#prc.projects.github_link[i]#" target="_blank" class="btn btn-outline-dark btn-sm rounded-pill px-3">
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
                        <strong><i class="fa-solid fa-circle-info me-2"></i>Description:</strong><br>
                        #prc.projects.description[i]#

                    </p>
                </div>
            </div>
        </div>
    </cfloop>

</div>


<div class="modal fade" id="addProjectModal" data-bs-backdrop="static" tabindex="-1"
    aria-labelledby="addProjectModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header bg-dark text-white">
                <h5 class="modal-title" id="addProjectModalLabel">
                    <i class="fa-solid fa-diagram-project me-2"></i>Add Project
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>

            <form id="addProjectForm">
                <div class="modal-body">
                    <input type="hidden" name="profile_id" value="#session.user.profile_id#">
                 
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Project Title</label>
                            <input type="text" class="form-control" name="project_title" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Client / Company</label>
                            <input type="text" class="form-control" name="client_name">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Start Year</label>
                            <input type="number" class="form-control" name="start_year" min="1900" max="2099" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">End Year</label>
                            <input type="number" class="form-control" name="end_year" min="1900" max="2099">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Live Link</label>
                            <input type="url" class="form-control" name="live_link" placeholder="https://example.com">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">GitHub Link</label>
                            <input type="url" class="form-control" name="github_link" placeholder="https://github.com/...">
                        </div>

                        <div class="col-12">
                            <label class="form-label">Tech Stack</label>
                            <select name="tech_stack[]" id="tech_stack" class="form-control select-cust" multiple="multiple">
                                <!--- <cfdump var="#prc#"> --->
                                <cfloop index="i" from="1" to="#prc.skillsList.recordCount#">
                                    <option value="#prc.skillsList.skill_name[i]#">#prc.skillsList.skill_name[i]#</option>
                                </cfloop>
                            </select>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Project Description</label>
                            <textarea class="form-control" name="description" rows="4" placeholder="Brief about project..."></textarea>
                        </div>
                    </div>
                </div>

                <div class="modal-footer justify-content-between">
                    <button type="reset" class="btn btn-outline-secondary">Clear</button>
                    <button type="submit" class="btn btn-success">
                        <i class="fa-solid fa-plus me-1"></i>Save Project
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="editProjectModal" data-bs-backdrop="static" tabindex="-1"
    aria-labelledby="editProjectModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header bg-dark text-white">
                <h5 class="modal-title" id="editProjectModalLabel">
                    <i class="fa-solid fa-pen-to-square me-2"></i>Edit Project
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>

            <form id="editProjectForm">
                <div class="modal-body">
                    <input type="hidden" name="project_id" id="edit_project_id">
                    <input type="hidden" name="profile_id" value="#session.user.profile_id#">

                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Project Title</label>
                            <input type="text" class="form-control" name="project_title" id="edit_project_title" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Client / Company</label>
                            <input type="text" class="form-control" name="client_name" id="edit_client_name">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Start Year</label>
                            <input type="number" class="form-control" name="start_year" id="edit_project_start_year" min="1900" max="2099" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">End Year</label>
                            <input type="number" class="form-control" name="end_year" id="edit_project_end_year" min="1900" max="2099">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Live Link</label>
                            <input type="url" class="form-control" name="live_link" id="edit_live_link" placeholder="https://example.com">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">GitHub Link</label>
                            <input type="url" class="form-control" name="github_link" id="edit_github_link" placeholder="https://github.com/...">
                        </div>

                        <div class="col-12">
                            <label class="form-label">Tech Stack</label>
                            <select name="tech_stack[]" id="edit_tech_stack" class="form-control select-cust" multiple="multiple">
                                <cfloop index="i" from="1" to="#prc.skillsList.recordCount#">
                                    <option value="#prc.skillsList.skill_name[i]#">#prc.skillsList.skill_name[i]#</option>
                                </cfloop>
                            </select>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Project Description</label>
                            <textarea class="form-control" name="description" id="edit_project_description" rows="4"
                                placeholder="Brief about project..."></textarea>
                        </div>
                    </div>
                </div>

                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">
                        <i class="fa-solid fa-floppy-disk me-1"></i>Update Project
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {
        $('##tech_stack').select2({
            placeholder: "Select or type to add tech",
            tags: true,                     // Enable custom tags
            tokenSeparators: [','],    // Auto split by comma or space
            allowClear: true,
            dropdownParent: $('##addProjectModal'), // important
            createTag: function (params) {
                let term = $.trim(params.term);
                if (term === '') {
                    return null;
                }
                return {
                    id: term,
                    text: term,
                    newTag: true // add additional class for styling if needed
                };
            }
        });

        $('##tech_stack').on('select2:select', function (e) {
            const data = e.params.data;

            setTimeout(function () {
                $('##tech_stack')
                    .next('.select2-container')
                    .find('.select2-selection__choice')
                    .each(function () {
                        if ($(this).text().includes(data.text)) {
                            if (data.newTag) {
                                $(this).addClass('new-skill');
                            }
                        }
                    });
            }, 0);
        });

        $('##addProjectModal').on('show.bs.modal', function () {
            $('##addProjectForm')[0].reset();
            $('##addProjectForm').validate().resetForm();
            $('##addProjectForm .form-control').removeClass('is-invalid is-valid');
        });

        $('##addProjectForm').validate({
            rules: {
                project_title: {
                    required: true,
                    minlength: 3
                },
                client_name: {
                    minlength: 3
                },
                start_year: {
                    required: true,
                    number: true,
                    min: 1900,
                    max: new Date().getFullYear()
                },
                end_year: {
                    number: true,
                    min: 1900,
                    max: 2099,
                    greaterThan: "##addProjectForm input[name='start_year']"
                },
                live_link: {
                    url: true
                },
                github_link: {
                    url: true
                },
                description: {
                    required: true,
                    maxlength: 1000
                }
            },
            messages: {
                project_title: {
                    required: "Enter project title",
                    minlength: "Title must be at least 3 characters"
                },
                client_name: {
                    minlength: "Client name must be at least 3 characters"
                },
                start_year: {
                    required: "Enter start year",
                    number: "Must be a valid year",
                    min: "Year must be after 1900",
                    max: "Year can't be in the future"
                },
                end_year: {
                    number: "Must be a valid year",
                    min: "Year must be after 1900",
                    max: "Year must be before 2100"
                },
                live_link: {
                    url: "Enter a valid URL"
                },
                github_link: {
                    url: "Enter a valid GitHub URL"
                },
                description: {
                    required: "Please add project description",
                    maxlength: "Description can't exceed 1000 characters"
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
                error.insertAfter(element);
            },
            submitHandler: function (form) {
                const formData = new FormData(form);

                $.ajax({
                    url: "#event.buildLink('project.addProject')#",
                    type: 'POST',
                    data: formData,
                    contentType: false,
                    processData: false,
                    dataType: 'json',
                    success: function (data) {
                        if (data.STATUS === "success") {
                            Swal.fire(data.MESSAGE, "", "success").then(() => {
                                window.location.href = "#event.buildLink('dashboard.index')#?profile_id=#session.user.profile_id#";
                            });
                        } else {
                            Swal.fire("Failed", data.MESSAGE, "error");
                        }
                    },
                    error: function () {
                        Swal.fire("Error", "Something went wrong", "error");
                    }
                });

                return false;
            }
        });

        $.validator.addMethod("greaterThan", function (value, element, param) {
            return parseInt(value) >= parseInt($(param).val());
        }, "Must be greater than start year");

        $('##edit_tech_stack').select2({
            placeholder: "Select or type to add skills",
            tags: true,                     // Enable custom tags
            tokenSeparators: [','],    // Auto split by comma or space
            allowClear: true,
            dropdownParent: $('##editProjectModal'), // important
            createTag: function (params) {
                let term = $.trim(params.term);
                if (term === '') {
                    return null;
                }
                return {
                    id: term,
                    text: term,
                    newTag: true // add additional class for styling if needed
                };
            }
        });

        $('##edit_tech_stack').on('select2:select', function (e) {
            const data = e.params.data;

            setTimeout(function () {
                $('##edit_tech_stack')
                    .next('.select2-container')
                    .find('.select2-selection__choice')
                    .each(function () {
                        if ($(this).text().includes(data.text)) {
                            if (data.newTag) {
                                $(this).addClass('new-skill');
                            }
                        }
                    });
            }, 0);
        });

        $(document).on("click", ".openEditProjectModalBtn", function () {
            const project_id = $(this).data('id');

            $.ajax({
                url: "#event.buildLink('project.getProjectDetails')#",
                type: "POST",
                data: { project_id },
                dataType: "json",
                success: function (res) {
                    if (res.STATUS === "success") {
                        const data = res.DATA[0];

                        $('##edit_project_id').val(data.project_id);
                        $('##edit_project_title').val(data.project_title);
                        $('##edit_client_name').val(data.client_name);
                        $('##edit_project_start_year').val(data.start_year);
                        $('##edit_project_end_year').val(data.end_year);
                        $('##edit_live_link').val(data.live_link);
                        $('##edit_github_link').val(data.github_link);
                        $('##edit_project_description').val(data.description);

                        // Tech stack handling
                        if (data.tech_stack && data.tech_stack.length > 0) {
                            let stackArray = data.tech_stack.includes(",")
                                ? data.tech_stack.split(",")
                                : [data.tech_stack];

                            $('##edit_tech_stack').val(stackArray).trigger('change');
                        } else {
                            $('##edit_tech_stack').val([]).trigger('change');
                        }

                        $('##editProjectModal').modal('show');
                    } else {
                        Swal.fire("Failed", res.MESSAGE, "error");
                    }
                },
                error: function () {
                    Swal.fire("Error", "Something went wrong", "error");
                }
            });
        });

        $('##editProjectForm').validate({
            rules: {
                project_title: {
                    required: true,
                    minlength: 3
                },
                client_name: {
                    minlength: 3
                },
                start_year: {
                    required: true,
                    number: true,
                    min: 1900,
                    max: new Date().getFullYear()
                },
                end_year: {
                    number: true,
                    min: 1900,
                    max: 2099,
                    greaterThan: "##editProjectForm input[name='start_year']"
                },
                live_link: {
                    url: true
                },
                github_link: {
                    url: true
                },
                description: {
                    required: true,
                    maxlength: 1000
                }
            },
            messages: {
                project_title: {
                    required: "Enter project title",
                    minlength: "Title must be at least 3 characters"
                },
                client_name: {
                    minlength: "Client name must be at least 3 characters"
                },
                start_year: {
                    required: "Enter start year",
                    number: "Must be a valid year",
                    min: "Year must be after 1900",
                    max: "Year can't be in the future"
                },
                end_year: {
                    number: "Must be a valid year",
                    min: "Year must be after 1900",
                    max: "Year must be before 2100"
                },
                live_link: {
                    url: "Enter a valid URL"
                },
                github_link: {
                    url: "Enter a valid GitHub URL"
                },
                description: {
                    required: "Please add project description",
                    maxlength: "Description can't exceed 1000 characters"
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
                error.insertAfter(element);
            },
            submitHandler: function (form) {
                const formData = new FormData(form);

                $.ajax({
                    url: "#event.buildLink('project.updateProject')#",
                    type: 'POST',
                    data: formData,
                    contentType: false,
                    processData: false,
                    dataType: 'json',
                    success: function (data) {
                        if (data.STATUS === "success") {
                            Swal.fire(data.MESSAGE, "", "success").then(() => {
                                window.location.href = "#event.buildLink('dashboard.index')#?profile_id=#session.user.profile_id#";
                            });
                        } else {
                            Swal.fire("Failed", data.MESSAGE, "error");
                        }
                    },
                    error: function () {
                        Swal.fire("Error", "Something went wrong", "error");
                    }
                });

                return false;
            }
        });
        
        $(document).on("click", "##projectDelete", function () {
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
                    const project_id = $(this).data('id');
                    $.ajax({
                        url: "#event.buildLink('project.deleteProject')#",
                        type: 'POST',
                        data: {project_id},
                        dataType: 'json',
                        success: function (data) {
                            if (data.STATUS === "success") {
                                Swal.fire("Project Deleted Successful", "", "success").then(() => {
                                    window.location.href = "#event.buildLink('dashboard.index')#?profile_id=#session.user.profile_id#";
                                });
                            } else {
                                Swal.fire("Project not deleted", data.message, "error");
                            }
                        },
                        error: function () {
                            Swal.fire("Error", "Something went wrong", "error");
                        }
                    });
                }
            });
    
    
            });
    });

</script>


</cfoutput>