<cfoutput>
    <cfif prc.data.profile_id eq session.user?.profile_id >

        <div class="card shadow-lg rounded-4 ">
            <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                <h5 class="fw-bold mb-0">
                    <i class="fa-solid fa-pen-nib me-2 "></i> Create a Post
                </h5>
            </div>
            
            <div class="card-body ">
                <form id="addPostForm">
                    <div class="mb-3">
                        <textarea class="form-control border-3 rounded-3" id="postContent" rows="4" placeholder="What do you want to talk about?"></textarea>
                    </div>
                    <div class="d-flex justify-content-end align-items-center">
                        <!--- <div class="d-flex gap-3">
                            <button type="button" class="btn btn-sm btn-outline-secondary">
                                <i class="fa-solid fa-image me-1"></i> Add Photo
                            </button>
                            
                        </div> --->
                        <button type="submit" class="btn btn-primary rounded-pill px-4">
                            <i class="fa-solid fa-paper-plane me-1"></i> Post
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </cfif>

    <div class=" mt-4 p-5">
        <div class="text-center text-muted py-4 ">
            <i class="fa-solid fa-pen-nib fa-2x mb-2"></i><br>
            No posts added yet.
        </div>
    </div>

    <!-- <div class="card-body text-center text-muted py-4">
        <i class="fa-solid fa-pen-nib fa-2x mb-3"></i>
        <h6 class="fw-bold">No posts to show</h6>
        <p class="mb-0 small">This user hasn't shared any posts yet.</p>
    </div> -->

    <script>
       
       $(document).ready(function () {
            $('##addPostForm').on('submit', function (e) {
                e.preventDefault();

                var postContent = $('##postContent').val().trim();

                if (postContent === "") {
                    Swal.fire("Oops!", "Post content cannot be empty.", "warning");
                    return;
                }

                $.ajax({
                    url: "#event.buildLink('post.add')#", 
                    type: "POST",
                    data: {
                        content: postContent
                    },
                    dataType: "json",
                    success: function (res) {
                        if (res.STATUS === "success") {
                            Swal.fire("Success", "Post added successfully!", "success");
                            $('##postContent').val(''); 

                        } else {
                            Swal.fire("Error", res.MESSAGE || "Something went wrong.", "error");
                        }
                    },
                    error: function () {
                        Swal.fire("Error", "Server error while posting.", "error");
                    }
                });
            });
        });


    </script>

</cfoutput>
