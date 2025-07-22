<style>
    .hover-shadow:hover {
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
        transition: box-shadow 0.2s ease;
    }

    .card {
        transition: transform 0.2s ease;
    }

    .card:hover {
        transform: translateY(-2px);
    }

    .card-footer button {
        transition: 0.20 ease;
    }

    .card-footer button:hover {
        color: #0d6efd;
        scale: 101%;
        /* font-weight: bold; */
    }
</style>

<cfoutput>
    <cfif prc.data.profile_id eq session.user?.profile_id>

        <div class="card shadow-lg rounded-4 ">
            <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                <h5 class="fw-bold mb-0">
                    <i class="fa-solid fa-pen-nib me-2 "></i> Create a Post
                </h5>
            </div>

            <div class="card-body ">
                <form id="addPostForm" enctype="multipart/form-data">
                    <input type="hidden" name="profile_id" value="#prc.data.profile_id#">
                    <div class="mb-3">
                        <textarea class="form-control border-3 rounded-3" id="postContent" rows="4" name="content"
                            placeholder="What do you want to talk about?"></textarea>
                    </div>
                    <div class="mb-3">
                        <div class="rounded-4 overflow-hidden mb-3 " style=" max-width: 60%;">
                            <img src="" id="postMediaView" class="img-fluid d-none" style=" object-fit: fill">
                        </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="d-flex gap-3">

                            <div class="btn btn-sm btn-outline-secondary" name="">
                                <input type="file" id="mediaInput" name="media_url" accept="image/*" class="d-none">
                                <label for="mediaInput">
                                    <i class="fa-solid fa-image me-1"></i> Add Photo
                                </label>
                            </div>

                        </div>
                        <button type="submit" class="btn btn-primary rounded-pill px-4">
                            <i class="fa-solid fa-paper-plane me-1"></i> Post
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </cfif>

    <cfif prc.posts.recordCount EQ 0>
        <div class=" mt-4 p-5">
            <div class="text-center text-muted py-4 ">
                <i class="fa-solid fa-pen-nib fa-2x mb-2"></i><br>
                No posts added yet.
            </div>
        </div>

    <cfelse>
        <div class="my-4">
            <cfloop query="prc.posts">
                <div class="card shadow-sm rounded-4 mb-4 ">
                    <div class="card-header bg-white border-0 d-flex align-items-center rounded-4 pt-3">
                        <img src="#prc.posts.profile_image#" class="rounded-circle me-3" width="48" height="48" alt="User">
                        <div>
                            <h6 class="mb-0 fw-bold">#prc.posts.full_name#</h6>
                            <small class="text-muted">Software Engineer - 1h ago</small>
                        </div>
                       <div class="ms-auto dropdown dropstart">
                            <button class="btn btn-sm text-muted" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa-solid fa-ellipsis"></i>
                            </button>
                            <ul class="dropdown-menu">
                                <li>
                                    <button class="dropdown-item"
                                        onclick="openEditModal(#prc.posts.post_id#, '#encodeForJavaScript(prc.posts.content)#', '#prc.posts.media_url#')">
                                        <i class="fa-solid fa-pen-to-square me-2 text-primary"></i> Edit Post
                                    </button>
                                </li>
                                <li>
                                    <button class="dropdown-item" onclick="openDeleteModal(#post_id#)">
                                        <i class="fa-solid fa-trash me-2 text-danger"></i> Delete
                                    </button>
                                </li>
                            </ul>
                            
                        </div>
                    </div>
    
                    <div class="card-body pb-2">
                        <p class="mb-2">#prc.posts.content#</p>
                        <cfif len(trim(prc.posts.media_url)) neq 0>
                            <img src="#prc.posts.media_url#" class="img-fluid rounded-3 mb-2" alt="Post image">
                        </cfif>
                    </div>
    
                    <div class="px-3 pb-2 text-muted small d-flex justify-content-between border-bottom">
                        <div>
                            <i class="fa-solid fa-thumbs-up text-primary me-1"></i>
                            <span id="likes_#prc.posts.post_id#">#prc.posts.total_likes#</span> Likes
                        </div>
                        <div>
                            <span>18 Comments</span> | <span>7 Shares</span>
                        </div>
                    </div>
    
                    <div class="card-footer border-0 d-flex justify-content-around">
                       
                           <button class="btn like-btn #prc.posts.isLiked eq 1 ? 'text-primary' : ''#" data-post-id="#prc.posts.post_id#">
                                <i class="fa-thumbs-up me-1 #prc.posts.isLiked eq 1 ? 'fa-solid' : 'fa-regular'# "></i> Like
                            </button>
                       
                        <button class="btn py-1 me-2" data-bs-toggle="collapse" data-bs-target="##collapseComments" aria-expanded="false" aria-controls="collapseComments">
                            <i class="fa-regular fa-comment me-1"></i> Comment
                        </button>
                        <button class="btn py-1">
                            <i class="fa-solid fa-share me-1"></i> Share
                        </button>
                    </div>

                    <div class="card-footer border-0 collapse" id="collapseComments">
                       
                        <div class="d-flex mb-3 ">
                            <!-- Commenter Image -->
                            <img src="{commenter_image_url}" alt="User" width="40" height="40" class="rounded-circle me-2 shadow-sm">

                            <!-- Comment Content -->
                            <div class="bg-light rounded-3 px-3 py-2 w-100">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="mb-1 fw-semibold">{commenter_name}</h6>
                                    <small class="text-muted">{comment_time}</small>
                                </div>
                                <p class="mb-1 text-dark">{comment_text}</p>
                                <div class="d-flex gap-3 small text-muted">
                                    <a href="" class="text-decoration-none">Like</a>
                                    <a href="" class="text-decoration-none">Reply</a>
                                </div>
                            </div>
                        </div>                       
                        <p class="">
                            <button class="btn btn-link" type="button" >
                                load more comments
                            </button>
                        </p>
                    </div>
                </div>
            </cfloop>
        </div>
    </cfif>

    <div class="modal fade" id="editPostModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="editPostLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content rounded-4 shadow">
                <div class="modal-header border-0  bg-dark text-white">
                    <h5 class="modal-title fw-semibold" id="editPostLabel"><i class="fa-solid fa-pen-to-square me-2"></i>Edit Post</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="editPostForm" novalidate>
                    <div class="modal-body">
                        <input type="hidden" name="post_id" id="editPostId">

                        <div class="mb-3">
                            <textarea class="form-control border-2 rounded-3" id="editPostContent" name="content" rows="5" placeholder="Update your thoughts..." ></textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Change Image (optional):</label>
                            <input type="file" class="form-control" id="editMediaInput" name="media">
                            <img id="editPostMediaPreview" class="img-fluid rounded-3 mt-3 d-none" alt="Preview">
                        </div>
                    </div>

                    <div class="modal-footer border-0 pt-0">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary px-4 rounded-pill">Update Post</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    

    <script>

        $(document).ready(function () {

            $('##mediaInput').on("change", function (e) {

                const file = e.target.files[0];

                if (file && file.type.startsWith("image/")) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        $("##postMediaView").attr("src", e.target.result);
                        $("##postMediaView").removeClass("d-none");

                    };
                    reader.readAsDataURL(file);
                }
            })

            $('##addPostForm').on('submit', function (e) {
                e.preventDefault();

                var postContent = $('##postContent').val().trim();

                if (postContent === "") {
                    Swal.fire("Oops!", "Post content cannot be empty.", "warning");
                    return;
                }

                let formData = new FormData(this);

                $.ajax({
                    url: "#event.buildLink('posts.addPost')#",
                    type: "POST",
                    data: formData,
                    dataType: "json",
                    contentType: false,
                    processData: false,
                    success: function (res) {
                        if (res.STATUS === "success") {
                            Swal.fire("Success", "Post added successfully!", "success");
                            $("##postMediaView").attr("src", "");
                            $("##postMediaView").addClass("d-none");
                            $('##addPostForm')[0].reset();


                        } else {
                            Swal.fire("Error", res.MESSAGE || "Something went wrong.", "error");
                        }
                    },
                    error: function () {
                        Swal.fire("Error", "Server error while posting.", "error");
                    }
                });
            });

            $(".like-btn").on("click", function () {
                const post_id = $(this).data("post-id");
                const btn = $(this);

                $.ajax({
                    url: "#event.buildLink('posts.toggleLike')#",
                    type: "POST",
                    data: { post_id: post_id, profile_id : #session.user?.profile_id# },
                    success: function (res) {
                        if (res.BTN_STATUS === "liked") {
                            btn.addClass("text-primary");
                            btn.find("i").removeClass("fa-regular").addClass("fa-solid");
                        } else {
                            btn.removeClass("text-primary");
                            btn.find("i").removeClass("fa-solid").addClass("fa-regular");
                        }
                        getLikesCount(post_id)
                    }
                });
            });

            $("##editMediaInput").on("change", function (e) {
                const file = e.target.files[0];
                if (file && file.type.startsWith("image/")) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        $("##editPostMediaPreview").attr("src", e.target.result).removeClass("d-none");
                    };
                    reader.readAsDataURL(file);
                } else{
                    $("##editPostMediaPreview").attr("src", "").addClass("d-none");
                }
            });

            $("##editPostForm").on("submit", function (e) {
                e.preventDefault();

                const form = this;
                const formData = new FormData(form);

                const content = formData.get("content").trim();

                if (!content) {
                    Swal.fire("Oops!", "Post content cannot be empty.", "warning");
                    return;
                }

                $.ajax({
                    url: "#event.buildLink('posts.updatePost')#",
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (res) {
                    if (res.status === "success") {
                        $("##editPostModal").modal("hide");
                        // Optionally reload or update the specific post
                        location.reload(); // or use AJAX to update UI dynamically
                    } else {
                        alert(res.message || "Something went wrong while updating.");
                    }
                    },
                    error: function () {
                    alert("Server error during update.");
                    }
                });
            });

        });

        function getLikesCount(post_id) {
            $.ajax({
                url: "#event.buildLink('posts.getLikesCount')#",
                type: "POST",
                data: { post_id: post_id },
                success: function (res) {
                    const element_id = `likes_${post_id}`;
                    // console.log("Updating element:", res.TOTAL_LIKES);
                    $(`##${element_id}`).html(`${res.TOTAL_LIKES}`);
                }
            });
        }

        function openEditModal(postId, content, mediaUrl) {
            $("##editPostId").val(postId);
            $("##editPostContent").val(content);

            if (mediaUrl) {
                $("##editPostMediaPreview").attr("src", mediaUrl).removeClass("d-none");
            } else {
                $("##editPostMediaPreview").addClass("d-none");
            }

            $("##editPostModal").modal("show");
        }


    </script>

</cfoutput>