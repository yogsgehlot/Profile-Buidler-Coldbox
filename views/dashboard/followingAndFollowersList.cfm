<cfoutput>
    <div class="modal fade" id="followingListModal" tabindex="-1" data-bs-backdrop="static"  aria-labelledby="followingListModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-scrollable">
            <div class="modal-content rounded-4 shadow-lg">
            
                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title" id="followingListModalLabel">
                        <i class="fa-solid fa-user-group me-2"></i> Following List
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                
                <div class="modal-body" >
                   
                </div>
            
            </div>
        </div>
    </div>

    <div class="modal fade" id="followersListModal" tabindex="-1" data-bs-backdrop="static"  aria-labelledby="followersListModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-scrollable">
            <div class="modal-content rounded-4 shadow-lg">
            
                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title" id="followersListModalLabel">
                        <i class="fa-solid fa-user-group me-2"></i> Followers List
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                
                <div class="modal-body" >
                   
                </div>
            
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $('##followingListModal').on('show.bs.modal', function () {
                $.ajax({
                    url: "#event.buildLink('profile.getFollowingList')#",
                    type: "POST",
                    data: { profile_id: #session.user.profile_id# },
                    dataType: "json",
                    success: function (res) {
                        if (res.STATUS === "success") {
                            // console.log(res);
                            var html = '';
                            if (res.FOLLOWINGLIST.length>0) {
                                res.FOLLOWINGLIST.forEach(function (item) {
                                    html += `
                                        <div class="d-flex justify-content-between align-items-center border rounded-3 p-3 mb-3 shadow-sm bg-light">
                                            <div class="d-flex align-items-center">
                                                <img src="${item.profile_image}" alt="Profile Image" class="rounded-circle me-3 shadow"
                                                    style="width: 60px; height: 60px; object-fit: fill;">
                                                <div>
                                                    <h6 class="mb-1 fw-semibold">${item.full_name}</h6>
                                                    <small class="text-muted">
                                                        <i class="fa-solid fa-location-dot me-1 text-danger"></i>${item.address}
                                                    </small>
                                                    <div class="mt-1">
                                                        <span class="badge bg-success bg-opacity-75 rounded-pill px-3 py-1">
                                                            <i class="fa-solid fa-user-check me-1"></i> Following
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="text-end">
                                                <button onclick="viewProfile(${item.following_id })"
                                                class="btn btn-outline-primary btn-sm rounded-pill px-3 shadow-sm">
                                                    <i class="fa-solid fa-eye me-1"></i> View Profile
                                                </button>
                                            </div>
                                        </div>
                                    `;
                                });
                            }else{
                                html = `
                                <div class="text-center text-muted py-5">
                                    <i class="fa-solid fa-user-slash fa-2x mb-2"></i><br>No following yet.
                                </div>
                                `
                            }

                            $('##followingListModal .modal-body').html(html);

                        } else {
                            Swal.fire("Failed", res.MESSAGE, "error");
                        }
                    },
                    error: function () {
                        Swal.fire("Error", "Something went wrong", "error");
                    }
                });
            });

            $('##followersListModal').on('show.bs.modal', function () {
                $.ajax({
                    url: "#event.buildLink('profile.getFollowersList')#",
                    type: "POST",
                    data: { profile_id: #session.user.profile_id# },
                    dataType: "json",
                    success: function (res) {
                        if (res.STATUS === "success") {
                            console.log(res);
                            var html = '';
                            if (res.FOLLOWERSLIST.length>0) {
                                res.FOLLOWERSLIST.forEach(function (item) {
                                    html += `
                                        <div class="d-flex justify-content-between align-items-center border rounded-3 p-3 mb-3 shadow-sm bg-light">
                                            <div class="d-flex align-items-center">
                                                <img src="${item.profile_image}" alt="Profile Image" class="rounded-circle me-3 shadow"
                                                    style="width: 60px; height: 60px; object-fit: fill;">
                                                <div>
                                                    <h6 class="mb-1 fw-semibold">${item.full_name}</h6>
                                                    <small class="text-muted">
                                                        <i class="fa-solid fa-location-dot me-1 text-danger"></i>${item.address}
                                                    </small>
                                                   <!-- <div class="mt-1">
                                                        <span class="badge bg-success bg-opacity-75 rounded-pill px-3 py-1">
                                                            <i class="fa-solid fa-user-check me-1"></i> Following
                                                        </span>
                                                    </div> -->
                                                </div>
                                            </div>

                                            <div class="text-end">
                                                <button onclick="viewProfile(${item.follower_id })"
                                                class="btn btn-outline-primary btn-sm rounded-pill px-3 shadow-sm">
                                                    <i class="fa-solid fa-eye me-1"></i> View Profile
                                                </button>
                                            </div>
                                        </div>
                                    `;
                                });
                            }else{
                                html = `
                                <div class="text-center text-muted py-5">
                                    <i class="fa-solid fa-user-slash fa-2x mb-2"></i><br>No follower yet.
                                </div>
                                `
                            }

                            $('##followersListModal .modal-body').html(html);

                        } else {
                            Swal.fire("Failed", res.MESSAGE, "error");
                        }
                    },
                    error: function () {
                        Swal.fire("Error", "Something went wrong", "error");
                    }
                });
            });


        })

        function viewProfile (profile_id){
            window.location.href=`#event.buildLink('main.profileView')#?profile_id=${profile_id}`
        }
    </script>

</cfoutput>
