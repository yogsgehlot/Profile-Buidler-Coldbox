<cfoutput>
 
        <div class="card shadow-lg rounded-4  ">
            <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0"><i class="fa-solid fa-briefcase me-2"></i>Experience</h5>
                <button class="btn btn-light btn-sm" data-bs-toggle="modal" id="addEducationbtn"
                    data-bs-target="##addExperienceModal">
                    <i class="fa-solid fa-plus "></i>
                </button>
            </div>  
            <cfloop index="i" from="1" to="#prc.experience.recordCount#">
                <cfset collapseID="exp" & i>
                    <div class="card-body">
                        <div class="border rounded-3 p-3 shadow-sm experience-item position-relative"
                            style="transition: 0.3s;">

                            <div class="d-flex justify-content-between align-items-center" data-bs-toggle="collapse"
                                href="###collapseID#" role="button" aria-expanded="false" aria-controls="#collapseID#">
                                <div>
                                    <h6 class="mb-0">
                                        <i class="fa-solid fa-briefcase me-2"></i>#prc.experience.job_title[i]#
                                    </h6>
                                    <small class="text-muted">
                                        #prc.experience.company_name[i]# (#prc.experience.start_year[i]# -
                                        #prc.experience.end_year[i] EQ "" ? "Present" : prc.experience.end_year[i]#)
                                    </small>
                                </div>
                                <div class="d-flex gap-2  justify-content-center align-items-center">

                                    <i class="fa-solid fa-chevron-down text-secondary"></i>
                                    <button class="btn btn-outline-secondary btn-sm  openEditExperienceModalBtn"
                                        data-bs-toggle="modal" data-id="#prc.experience.experience_id[i]#"
                                        data-bs-target="##editExperienceModal">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger btn-sm" id="experienceDelete"
                                        data-id="#prc.experience.experience_id[i]#">
                                        <i class="fa-solid fa-trash "></i>
                                    </button>
                                </div>
                            </div>

                            <div class="collapse mt-3" id="#collapseID#">
                                <p><strong><i class="fa-solid fa-circle-info me-2"></i>Description:</strong><br> #prc.experience.description[i]#</p>
                            </div>


                        </div>
                    </div>
            </cfloop>
        </div>
  

        

    <div class="modal fade" id="addExperienceModal" data-bs-backdrop="static" tabindex="-1"
        aria-labelledby="addExperienceModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content rounded-4 shadow">
                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title" id="addExperienceModalLabel"><i class="fa-solid fa-briefcase me-2"></i>Add
                        Experience</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>

                <form id="experienceForm">
                    <div class="modal-body">
                        <div class="row g-3">
                            <input type="hidden" name="profile_id" value="#prc.data.profile_id#">

                            <div class="col-md-6">
                                <label class="form-label">Job Title</label>
                                <input type="text" class="form-control" name="job_title"
                                    placeholder="e.g., Software Engineer" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Company Name</label>
                                <input type="text" class="form-control" name="company_name"
                                    placeholder="e.g., Microsoft" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Start Year</label>
                                <input type="number" class="form-control" name="start_year" min="1900" max="2099"
                                    required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">End Year</label>
                                <input type="number" class="form-control" name="end_year" id="endYearInput" min="1900"
                                    max="2099">
                                <div class="form-check mt-1">
                                    <input class="form-check-input" type="checkbox" id="presentCheckbox" name="present"
                                        checked>
                                    <label class="form-check-label" for="presentCheckbox">Currently Working Here</label>
                                </div>
                            </div>

                            <div class="col-12">
                                <label class="form-label">Description (optional)</label>
                                <textarea class="form-control" name="description" rows="3"
                                    placeholder="e.g., Worked on cloud infrastructure using AWS."></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="reset" class="btn btn-outline-secondary">Clear</button>
                        <button type="submit" class="btn btn-success">Save Experience</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <div class="modal fade" id="editExperienceModal" data-bs-backdrop="static" tabindex="-1"
        aria-labelledby="editExperienceModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content rounded-4 shadow">
                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title" id="editExperienceModalLabel">
                        <i class="fa-solid fa-pen-to-square me-2"></i>Edit Experience
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>

                <form id="editExperienceForm">
                    <div class="modal-body">

                        <input type="hidden" name="experience_id" id="edit_experience_id">
                        <input type="hidden" name="profile_id" id="edit_profile_id" value="#session.user.profile_id#">

                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Job Title</label>
                                <input type="text" class="form-control" name="job_title" id="edit_job_title" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Company Name</label>
                                <input type="text" class="form-control" name="company_name" id="edit_company_name"
                                    required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Start Year</label>
                                <input type="number" class="form-control" name="start_year" id="edit_exp_start_year"
                                    min="1900" max="2099" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">End Year</label>
                                <input type="number" class="form-control" name="end_year" id="edit_exp_end_year"
                                    min="1900" max="2099">
                                <div class="form-check mt-1">
                                    <input class="form-check-input" type="checkbox" id="edit_presentCheckbox"
                                        name="present">
                                    <label class="form-check-label" for="edit_presentCheckbox">Currently Working
                                        Here</label>
                                </div>
                            </div>

                            <div class="col-12">
                                <label class="form-label">Description (optional)</label>
                                <textarea class="form-control" name="description" id="edit_exp_description"
                                    rows="3"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer justify-content-between">
                        <button type="submit" class="btn btn-success">Update Experience</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <script>


        $(document).ready(function () {

            $('##presentCheckbox').on('change', function () {
                const endYearInput = $('##endYearInput');

                if ($(this).is(':checked')) {
                    endYearInput.prop('disabled', true).val('');
                } else {
                    endYearInput.prop('disabled', false);
                }
            });

            $('##presentCheckbox').trigger('change');

            $.validator.addMethod("greaterThan", function (value, element, param) {
                return parseInt(value) >= parseInt($(param).val());
            }, "Must be greater than start year");

            $('##experienceForm').validate({
                rules: {
                    job_title: {
                        required: true,
                        minlength: 3
                    },
                    company_name: {
                        required: true,
                        minlength: 3
                    },
                    start_year: {
                        required: true,
                        number: true,
                        min: 1900,
                        max: new Date().getFullYear()
                    },
                    end_year: {
                        required: function () {
                            return !$('##presentCheckbox').is(':checked');
                        },
                        number: true,
                        min: 1900,
                        max: 2099,
                        greaterThan: "##experienceForm input[name='start_year']"
                    },
                    description: {
                        required: true,
                        maxlength: 500
                    }
                },
                messages: {
                    job_title: {
                        required: "Please enter your job title",
                        minlength: "Job title must be at least 3 characters"
                    },
                    company_name: {
                        required: "Please enter company name",
                        minlength: "Company name must be at least 3 characters"
                    },
                    start_year: {
                        required: "Enter start year",
                        number: "Must be a valid year",
                        min: "Year must be after 1900",
                        max: "Year can't be in the future"
                    },
                    end_year: {
                        required: "Enter end year",
                        number: "Must be a valid year",
                        min: "Year must be after 1900",
                        max: "Year must be before 2100"
                    },
                    description: {
                        required: "Enter description",
                        maxlength: "Description can't exceed 500 characters"
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
                    let formData = new FormData(form);

                    // Disable end_year if present is checked, just to be safe
                    if ($('##presentCheckbox').is(':checked')) {
                        formData.set('end_year', 'Present');
                    }

                    $.ajax({
                        url: "#event.buildLink('experience.addExperience')#",
                        type: 'POST',
                        data: formData,
                        contentType: false,
                        processData: false,
                        dataType: 'json',
                        success: function (data) {
                            if (data.STATUS == "success") {
                                Swal.fire(data.MESSAGE, "", "success").then(() => {
                                    window.location.href = "#event.buildLink('dashboard.index')#?profile_id=#session.user.profile_id#";
                                });
                            } else {
                                Swal.fire("Failed", data.message, "error");
                            }
                        },
                        error: function () {
                            Swal.fire("Error", "Something went wrong", "error");
                        }
                    });

                    return false; // prevent normal form submit
                }
            });

            $('##addExperienceModal').on('show.bs.modal', function () {
                $('##experienceForm')[0].reset();
                $('##experienceForm').validate().resetForm();
                $('##experienceForm .form-control').removeClass('is-invalid is-valid');
            });

            $('##edit_presentCheckbox').on('change', function () {
                if ($(this).is(':checked')) {
                    $('##edit_exp_end_year').prop('disabled', true).val('');
                } else {
                    $('##edit_exp_end_year').prop('disabled', false);
                }
            });

            $('##editExperienceModal').on('shown.bs.modal', function () {
                $('##edit_presentCheckbox').trigger('change');
            });

            $('##editExperienceForm').validate({
                rules: {
                    job_title: {
                        required: true,
                        minlength: 3
                    },
                    company_name: {
                        required: true,
                        minlength: 3
                    },
                    start_year: {
                        required: true,
                        number: true,
                        min: 1900,
                        max: new Date().getFullYear()
                    },
                    end_year: {
                        required: function () {
                            return !$('##edit_presentCheckbox').is(':checked');
                        },
                        number: true,
                        min: 1900,
                        max: 2099,
                        greaterThan: "##editExperienceForm input[name='start_year']"
                    },
                    description: {
                        required: true,
                        maxlength: 500
                    }
                },
                messages: {
                    job_title: {
                        required: "Please enter your job title",
                        minlength: "Job title must be at least 3 characters"
                    },
                    company_name: {
                        required: "Please enter company name",
                        minlength: "Company name must be at least 3 characters"
                    },
                    start_year: {
                        required: "Enter start year",
                        number: "Must be a valid year",
                        min: "Year must be after 1900",
                        max: "Year can't be in the future"
                    },
                    end_year: {
                        required: "Enter end year",
                        number: "Must be a valid year",
                        min: "Year must be after 1900",
                        max: "Year must be before 2100"
                    },
                    description: {
                        required: "Enter description",
                        maxlength: "Description can't exceed 500 characters"
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
                    let formData = new FormData(form);

                    // Disable end_year if present is checked, just to be safe
                    if ($('##edit_presentCheckbox').is(':checked')) {
                        formData.set('end_year', 'Present');
                    }

                    $.ajax({
                        url: "#event.buildLink('experience.updateExperience')#",
                        type: 'POST',
                        data: formData,
                        contentType: false,
                        processData: false,
                        dataType: 'json',
                        success: function (data) {
                            if (data.STATUS == "success") {
                                Swal.fire(data.MESSAGE, "", "success").then(() => {
                                    window.location.href = "#event.buildLink('dashboard.index')#?profile_id=#session.user.profile_id#";
                                });
                            } else {
                                Swal.fire("Failed", data.message, "error");
                            }
                        },
                        error: function () {
                            Swal.fire("Error", "Something went wrong", "error");
                        }
                    });

                    return false; // prevent normal form submit
                }
            });

        });

        $(document).on("click", ".openEditExperienceModalBtn", function () {
            const experience_id = $(this).data('id');

            $.ajax({
                url: "#event.buildLink('experience.getExperienceDetails')#",
                type: 'POST',
                data: { experience_id },
                dataType: 'json',
                success: function (res) {
                    if (res.STATUS === "success") {
                        const data = res.DATA[0];
                        // console.log(data);
                        $('##edit_experience_id').val(data.experience_id);
                        $('##edit_profile_id').val(data.profile_id);
                        $('##edit_job_title').val(data.job_title);
                        $('##edit_company_name').val(data.company_name);
                        $('##edit_exp_start_year').val(data.start_year);

                        if (!data.end_year || data.end_year === 0) {
                            $('##edit_presentCheckbox').prop('checked', true);
                            $('##edit_exp_end_year').val('').prop('disabled', true);
                        } else {
                            $('##edit_presentCheckbox').prop('checked', false);
                            $('##edit_exp_end_year').val(data.end_year).prop('disabled', false);
                        }

                        $('##edit_exp_description').val(data.description);

                        $('##editExperienceModal').modal('show');
                    } else {
                        Swal.fire("Failed", res.MESSAGE, "error");
                    }
                },
                error: function () {
                    Swal.fire("Error", "Something went wrong", "error");
                }
            });
        });

        $(document).on("click", "##experienceDelete", function () {
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
                    const experience_id = $(this).data('id');
                    $.ajax({
                        url: "#event.buildLink('experience.deleteExperience')#",
                        type: 'POST',
                        data: {experience_id},
                        dataType: 'json',
                        success: function (data) {
                            if (data.STATUS === "success") {
                                Swal.fire("Education Deleted Successful", "", "success").then(() => {
                                    window.location.href = "#event.buildLink('dashboard.index')#?profile_id=#session.user.profile_id#";
                                });
                            } else {
                                Swal.fire("Education not deleted", data.message, "error");
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