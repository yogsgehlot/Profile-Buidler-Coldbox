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
        <div class="card shadow-lg rounded-4">
            <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0"><i class="fa-solid fa-wand-magic-sparkles me-2"></i>Skills & Expertise</h5>
                <button class="btn btn-light btn-sm" data-bs-toggle="modal" id="editSkillsbtn"
                    data-bs-target="##editSkillsModal">
                    <i class="fa-solid fa-pen-to-square"></i>
                </button>
            </div>

            <div class="card-body ">
                <select id="skills" name="skills[]" multiple="multiple" class="form-control select-cust">
                    <cfloop index="i" from="1" to="#prc.skillsList.recordCount#">
                        <option value="#prc.skillsList.skill_name[i]#">#prc.skillsList.skill_name[i]#</option>
                    </cfloop>
                </select>
                <button class="btn btn-dark btn-sm" id="addSkillbtn">
                    <i class="fa-solid fa-plus"></i>
                </button>
            </div>
            
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

            <div class="modal fade" id="editSkillsModal" data-bs-backdrop="static" tabindex="-1"
                aria-labelledby="editSkillsModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content rounded-4 shadow">
                        <div class="modal-header bg-dark text-white">
                            <h5 class="modal-title" id="editSkillsModalLabel">
                                <i class="fa-solid fa-pen-to-square me-2"></i>Edit Skills
                            </h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                aria-label="Close" ></button>
                        </div>
                        <div class="modal-body">
                            <select id="editSkills" multiple="multiple" class="form-control select-cust" style="width: 100%;">
                                <cfloop query="prc.skillsList">
                                    <option value="#prc.skillsList.skill_name#">#prc.skillsList.skill_name#</option>
                                </cfloop>
                            </select>

                            <div class="modal-footer">
                                <button class="btn btn-dark btn-sm" id="updateSkillbtn">
                                     <i class="fa-solid fa-floppy-disk"></i> Update
                                </button>


                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>



    <script>

        $(document).ready(function () {
            $('##skills').select2({
                placeholder: "Select or type to add skills",
                tags: true,                     // Enable custom tags
                tokenSeparators: [','],    // Auto split by comma or space
                allowClear: true,
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

            $('##skills').on('select2:select', function (e) {
                const data = e.params.data;

                setTimeout(function () {
                    $('##skills')
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

            $('##addSkillbtn').on('click', function () {

                const selectedSkills = $('##skills').val(); // Get selected values (array)
                // console.log(selectedSkills);

                if (!selectedSkills || selectedSkills.length === 0) {
                    Swal.fire({
                        icon: 'warning',
                        title: 'No Skills Selected',
                        text: 'Please select or type at least one skill.'
                    });
                    return;
                }

                $.ajax({
                    url: "#event.buildLink('skills.addSkill')#",
                    type: 'POST',
                    data: { skills: selectedSkills, profile_id: #session.user.profile_id# },
                    success: function (data) {
                        if (data.STATUS == "success") {
                            Swal.fire({
                                icon: 'success',
                                title: 'Skills Added!',
                                text: data.MESSAGE,
                                timer: 1500,
                                showConfirmButton: false
                            }).then(() => {
                                $('##skills').val(null).trigger('change'); // Clear select2
                                window.location.href = "#event.buildLink('dashboard.index')#?profile_id=#session.user.profile_id#";
                            })
                        } else {
                            Swal.fire("Failed", data.MESSAGE, "error");
                        }
                    },
                    error: function () {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'Something went wrong while saving skills.'
                        });
                    }
                });
            });

            $('##editSkills').select2({
                tags: true,
                placeholder: "Edit skills",
                tokenSeparators: [','],
                allowClear: true,
                dropdownParent: $('##editSkillsModal'), // important
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

            $('##editSkillsbtn').on('click', function () {
                    $('##editSkills').val("#valueList(prc.userSkills.skill_name)#".split(',').map(s => s.trim())).trigger('change');
    
            });

            $('##updateSkillbtn').on('click', function () {

                const selectedSkills = $('##editSkills').val(); // Get selected values (array)
                // console.log(selectedSkills);

                $.ajax({
                    url: "#event.buildLink('skills.updateSkill')#",
                    type: 'POST',
                    data: { skills: selectedSkills, profile_id: #session.user.profile_id# },
                    success: function (data) {
                        if (data.STATUS == "success") {
                            Swal.fire({
                                icon: 'success',
                                title: 'Skills Updated!',
                                text: data.MESSAGE,
                                timer: 2000,
                                showConfirmButton: false
                            }).then(() => {
                                window.location.href = "#event.buildLink('dashboard.index')#?profile_id=#session.user.profile_id#";
                            })
                        } else {
                            Swal.fire("Failed", data.MESSAGE, "error");
                        }
                    },
                    error: function () {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'Something went wrong while updating skills.'
                        });
                    }
                });

                
            });
            
        });


    </script>


</cfoutput>