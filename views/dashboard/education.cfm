<cfoutput>
    
        <div class="card shadow-lg rounded-4 " >
            <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0"><i class="fa-solid fa-graduation-cap me-2"></i>Education</h5>
                <button class="btn btn-light btn-sm" data-bs-toggle="modal" id="addEducationbtn"
                    data-bs-target="##addEducationModal">
                    <i class="fa-solid fa-plus "></i>
                </button>
            </div>
            <cfloop index="i" from="1" to="#prc.edu.recordCount#">
                <cfset collapseID="edu" & i>
                    <div class="card-body">
                        <div class="border rounded-3 p-3 shadow-sm education-item position-relative "
                            style="transition: 0.3s; " >

                            <div class="d-flex justify-content-between align-items-center" data-bs-toggle="collapse"
                                href="###collapseID#" role="button" aria-expanded="false" aria-controls="#collapseID#">
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
                                    <button class="btn btn-outline-secondary btn-sm openEditModalBtn"
                                        data-bs-toggle="modal" data-id="#prc.edu.education_id[i]#"
                                        data-bs-target="##editEducationModal">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger btn-sm" id="eduDelete"
                                        data-id="#prc.edu.education_id[i]#">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="collapse mt-3" id="#collapseID#">
                                <p> <strong><i class="fa-solid fa-star me-2"></i>Grade / Score:</strong> #prc.edu.grade[i]#</p>
                                <p><strong><i class="fa-solid fa-circle-info me-2"></i>Description:</strong><br> #prc.edu.description[i]#</p>
                            </div>


                        </div>
                    </div>
            </cfloop>
        </div>
   
    <div class="modal fade" id="addEducationModal" data-bs-backdrop="static" tabindex="-1"
        aria-labelledby="addEducationModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content rounded-4 shadow">
                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title" id="addEducationModalLabel"><i
                            class="fa-solid fa-graduation-cap me-2"></i>Add Education</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>

                <form id="educationForm">
                    <div class="modal-body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <input type="hidden" name="profile_id" value="#prc.data.profile_id#">
                                <label class="form-label">Degree / Course</label>
                                <input type="text" class="form-control" name="degree" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Institution / School</label>
                                <input type="text" class="form-control" name="institution" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Start Year</label>
                                <input type="number" class="form-control" name="start_year" min="1900" max="2099"
                                    required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">End Year</label>
                                <input type="number" class="form-control" name="end_year" min="1900" max="2099"
                                    required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Grade / Score</label>
                                <input type="text" class="form-control" name="grade"
                                    placeholder="e.g., CGPA 8.5 or 92%">
                            </div>

                            <div class="col-12">
                                <label class="form-label">Description (optional)</label>
                                <textarea class="form-control" name="description" rows="3"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="reset" class="btn btn-outline-secondary">Clear</button>
                        <button type="submit" class="btn btn-success">Save Education</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="editEducationModal" data-bs-backdrop="static" tabindex="-1"
        aria-labelledby="editEducationModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content rounded-4 shadow">
                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title" id="editEducationModalLabel">
                        <i class="fa-solid fa-pen-to-square me-2"></i>Edit Education
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>

                <form id="editEducationForm">
                    <div class="modal-body">

                        <input type="hidden" name="education_id" id="edit_education_id">

                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Degree / Course</label>
                                <input type="text" class="form-control" name="degree" id="edit_degree" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Institution / School</label>
                                <input type="text" class="form-control" name="institution" id="edit_institution"
                                    required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Start Year</label>
                                <input type="number" class="form-control" name="start_year" id="edit_start_year"
                                    min="1900" max="2099" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">End Year</label>
                                <input type="number" class="form-control" name="end_year" id="edit_end_year" min="1900"
                                    max="2099" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Grade / Score</label>
                                <input type="text" class="form-control" name="grade" id="edit_grade">
                            </div>

                            <div class="col-12">
                                <label class="form-label">Description (optional)</label>
                                <textarea class="form-control" name="description" id="edit_description"
                                    rows="3"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer justify-content-between ">
                        <div>
                            <button type="submit" class="btn btn-success">Update Education</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <script>

        $(document).ready(function () {

            $('##educationForm').validate({
                rules: {
                    degree: {
                        required: true,
                        minlength: 3
                    },
                    institution: {
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
                        required: true,
                        number: true,
                        min: 1900,
                        max: 2099,
                        greaterThan: "##educationForm input[name='start_year']"
                    },
                    grade: {
                        required: true,
                        maxlength: 50
                    },
                    description: {
                        required: true,
                        maxlength: 500
                    }
                },
                messages: {
                    degree: {
                        required: "Please enter your degree",
                        minlength: "Degree must be at least 3 characters"
                    },
                    institution: {
                        required: "Please enter institution name",
                        minlength: "Institution must be at least 3 characters"
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
                        max: "Year must be before 2100",
                        greaterThan: "End year must be greater than start year"
                    },
                    grade: {
                        required: "Enter Grade",
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

                    $.ajax({
                        url: "#event.buildLink('education.addEducation')#",
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
                    return false;
                }
            });
            
            $('##editEducationForm').validate({
                rules: {
                    degree: {
                        required: true,
                        minlength: 3
                    },
                    institution: {
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
                        required: true,
                        number: true,
                        min: 1900,
                        max: 2099,
                        greaterThan: "##editEducationForm input[name='start_year']"
                    },
                    grade: {
                        maxlength: 50
                    },
                    description: {
                        maxlength: 500
                    }
                },
                messages: {
                    degree: {
                        required: "Please enter your degree",
                        minlength: "Degree must be at least 3 characters"
                    },
                    institution: {
                        required: "Please enter institution name",
                        minlength: "Institution must be at least 3 characters"
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
                        max: "Year must be before 2100",
                        greaterThan: "End year must be greater than start year"
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
                    // formData.append("profile_id", #session.user.profile_id#)

                    $.ajax({
                        url: "#event.buildLink('education.editEducation')#",
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
                    return false;
                }
            });

            $.validator.addMethod("greaterThan", function (value, element, param) {
                return parseInt(value) > parseInt($(param).val());
            }, "Must be greater than start year");

            $('##addEducationModal').on('show.bs.modal', function () {
                $('##educationForm')[0].reset();
                $('##educationForm').validate().resetForm();
                $('##educationForm .form-control').removeClass('is-invalid is-valid');
            });
        });

        $(document).on("click", "##eduDelete", function () {
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
                    const education_id = $(this).data('id');
                    $.ajax({
                        url: "#event.buildLink('education.deleteEducation')#",
                        type: 'POST',
                        data: {education_id},
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

        $(document).on("click", ".openEditModalBtn", function () {
            const education_id = $(this).data('id');
            $.ajax({
                url: "#event.buildLink('education.getEducation')#",
                type: 'POST',
                data: {education_id},
                dataType: 'json',
                success: function (res) {
                    if (res.STATUS == "success") {
                       
                        $('##edit_education_id').val( res.DATA[0].education_id);
                        $('##edit_degree').val(res.DATA[0].degree);
                        $('##edit_institution').val(res.DATA[0].institution);
                        $('##edit_start_year').val(new Date(res.DATA[0].start_year).getFullYear());
                        $('##edit_end_year').val(new Date(res.DATA[0].end_year).getFullYear());
                        $('##edit_grade').val(res.DATA[0].grade);
                        $('##edit_description').val(res.DATA[0].description);
                    } else {

                        Swal.fire("Failed", res.MESSAGE, "error");
                    }
                },
                error: function () {
                    Swal.fire("Error", "Something went wrong", "error");
                }
            });

        })



    </script>
</cfoutput>