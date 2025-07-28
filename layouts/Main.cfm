<cfoutput>

	<!doctype html>
	<html lang="en">

	<head>
		<!--- Metatags --->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="ColdBox Application Template">
		<meta name="author" content="Ortus Solutions, Corp">

		<!---Base URL --->
		
		<base href="#event.getHTMLBaseURL()#" />

		<!---
		CSS
		- Bootstrap
		- Alpine.js
	--->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
			integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
			crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
			integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
			crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.21.0/jquery.validate.min.js"
			integrity="sha512-KFHXdr2oObHKI9w4Hv1XPKc898mE4kgYx58oqsc/JqqdLMDI4YjOLzom+EMlW8HFUd0QfjfAvxSL6sEq/a42fQ=="
			crossorigin="anonymous" referrerpolicy="no-referrer"></script>

		<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

		<style>
			.text-blue {
				color: ##379BC1;
			}

			/* Form container spacing */
			/* Spacing for the form */
			##userSearchForm {
				margin-right: 1rem  !important;
			}

			/* Select2 container styling */
			.select2-container--default .select2-selection--single {
				height: 42px;
				padding: 6px 12px;
				border: 1px solid ##ced4da;
				border-radius: 8px;
				background-color: ##f8f9fa;
				transition: border 0.3s ease;
				font-size: 0.95rem;
			}

			/* Placeholder text */
			.select2-container--default .select2-selection--single .select2-selection__placeholder {
				color: ##6c757d  !important;
				font-style: italic;
			}

			/* Selected value */
			.select2-container--default .select2-selection--single .select2-selection__rendered {
				color: ##212529  !important;
				font-weight: 500  !important;
				line-height: 30px  !important;
			}

			/* Fix the arrow icon */
			.select2-container--default .select2-selection--single .select2-selection__arrow b {
				border-color: ##6c757d transparent transparent transparent  !important;
			}

			/* Dropdown styling */
			.select2-container--default .select2-results > .select2-results__options {
				max-height: 250px  !important;
				background-color: ##fff  !important;
				border: 1px solid ##dee2e6  !important;
				border-radius: 0.5rem  !important;
				padding: 4px  !important;
				overflow-y: auto  !important;
			}

			/* Individual option */
			.select2-container--default .select2-results__option {
				padding: 10px 12px  ;
				font-size: 0.95rem  ;
				border-radius: 4px  ;
				transition: background 0.2s ease  ;
			}

			/* Hover effect for dropdown items */
			.select2-container--default .select2-results__option--highlighted[aria-selected] {
				background-color: ##212529 !important ;
				color: ##fff  !important;
			}

			/* Selected option inside dropdown */
			.select2-container--default .select2-results__option[aria-selected="true"] {
				background-color: ##e9ecef;
				font-weight: 600;
			}

			/* Search input inside dropdown (styled to match theme) */
			.select2-container--default .select2-search--dropdown .select2-search__field {
				border-radius: 6px;
				padding: 8px 12px;
				border: 1px solid ##ced4da;
				margin-bottom: 8px;
			}

			/* Hide the extra border on focus */
			.select2-container--default .select2-search--dropdown .select2-search__field:focus {
				border-color: ##0d6efd  !important;
				outline: none  !important;
				box-shadow: none  !important;
			}


		
		</style>

		<!--- Title --->
		<title>Welcome to Coldbox!</title>
	</head>

	<body data-spy="scroll" data-target=".navbar" data-offset="50" class="d-flex flex-column h-100">

		<div "d-flex flex-column min-vh-100">



			<!--- <header class="container-fluid shadow-lg ">
				<div class="container">
					<nav class="navbar navbar-expand-lg">
						<a class="navbar-brand text-white" href=""><img
								src="includes\images\01235d02-4d95-4680-8ab8-44e0b3af4441.jpg" class="rounded-circle "
								width="70px"></a>
						<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
							data-bs-target="##mainNavbar">
							<span class="navbar-toggler-icon"></span>
						</button>

						<div class="collapse navbar-collapse" id="mainNavbar">
							<ul class="navbar-nav ms-auto gap-3">
								<li class="nav-item">
									<a class="nav-link"
									href="">Home <i class="fa-solid fa-house"></i></a>
								</li>
								<cfif NOT structKeyExists(session, "user" )>
									<li class="nav-item">
										<a class="btn btn-primary"
										href="#event.buildLink('authentication.registerView')#">Signup <i
										class="fa-solid fa-user-plus"></i></a>
									</li>
								<cfelse>
									<li class="nav-item">
										<a class="nav-link" href="#event.buildLink('dashboard.index')#?profile_id=#session.user.profile_id#">Dashboard <i class="fa-solid fa-gauge-high"></i></a>
									</li>
									
									<li class="nav-item">
										<button class="btn btn-outline-danger" id="logout">Logout <i class="fa-solid fa-right-from-bracket ms-1"></i></button>
									</li>
									
								</cfif>
							</ul>
						</div>
					</nav>
				</div>
			</header> --->

			<header class="container-fluid shadow-lg">
				<div class="container">
					<nav class="navbar navbar-expand-lg">
						<a class="navbar-brand text-white" href="">
							<img src="includes/images/01235d02-4d95-4680-8ab8-44e0b3af4441.jpg" class="rounded-circle"
								width="70px">
						</a>

						<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
							data-bs-target="##mainNavbar">
							<span class="navbar-toggler-icon"></span>
						</button>

						<div class="collapse navbar-collapse" id="mainNavbar">
							
							

							<ul class="navbar-nav ms-auto gap-3">
								<li class="nav-item">
									<form class="" id="userSearchForm">
										<select id="userSearch" class="form-control" style="width: 250px;"  >
											<option></option>
										</select>
									</form>
								</li>
								
								<li class="nav-item">
									<a class="nav-link" href="">Home <i class="fa-solid fa-house"></i></a>
								</li>
								<li class="nav-item">
									<a class="nav-link " href="#event.buildLink('main.getPublicProfiles')#">
										Profiles
										<i class="fa-solid fa-users  "></i>
									</a>
								</li>

								<cfif NOT structKeyExists(session, "user" )>
									<li class="nav-item">
										<a class="btn btn-primary"
											href="#event.buildLink('authentication.registerView')#">
											Signup <i class="fa-solid fa-user-plus"></i>
										</a>
									</li>
									<cfelse>
										<li class="nav-item">
											<a class="nav-link"
												href="#event.buildLink('dashboard.index')#?profile_id=#session.user.profile_id#">
												Dashboard <i class="fa-solid fa-gauge-high"></i>
											</a>
										</li>
										
										<li class="nav-item">
											<a href="/chat" class="nav-link">
												Message
												<i class="fa-solid fa-comments fa-lg"></i>
												
											</a>
										</li>

										<li class="nav-item">
											<button class="btn btn-outline-danger" id="logout">
												Logout <i class="fa-solid fa-right-from-bracket ms-1"></i>
											</button>
										</li>
								</cfif>
							</ul>
						</div>
					</nav>
				</div>
			</header>


			<!---Container And Views --->
			<main class=" ">
				#view()#
			</main>

			<!--- Footer --->
			<footer class="bg-dark text-white text-center py-3 ">
				&copy; 2025 my Company
			</footer>

			<!---
		JavaScript
		- Bootstrap
		- Popper
		- Alpine.js
	--->

		</div>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
			integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
			integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
			crossorigin="anonymous"></script>
		<script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
	</body>

	</html>
	<script>
		$(document).on("click", "##logout", function () {
			// console.log("hii");
			$.ajax({
				url: "#event.buildLink('profile.logout')#",
				type: 'POST',
				contentType: false,
				processData: false,
				dataType: 'json',
				success: function (data) {
					if (data.STATUS === "success") {
						Swal.fire("Logout Successful", "", "success").then(() => {
							window.location.href = "#event.buildLink('main.index')#";
						});
					} else {
						Swal.fire("Logout Failed", data.message, "error");
					}
				},
				error: function () {
					Swal.fire("Error", "Something went wrong", "error");
				}
			});
		});

		$(document).ready(function () {
			$('##userSearch').select2({
				placeholder: "Search user...",
				allowClear: true,
				width: 'resolve', // ensures proper width
				theme: "default", // can be "bootstrap-5" if using bootstrap theme
				ajax: {
					url: "#event.buildLink('main.searchUsers')#",
					dataType: 'json',
					delay: 250,
					data: function (params) {
						return { searchKey: params.term };
					},
					processResults: function (data) {
						// console.log(data);
						
						return {
							results: data.DATA.map(function (user) {
								return {
									id: user.profile_id,
									text: user.full_name,
									image: user.profile_image
								};
							})
						};
					},
					cache: true
				},
				minimumInputLength: 1,
				templateResult: function (user) {
					if (!user.id) return user.text;

					return $(`
						<div class="d-flex align-items-center">
							<img src="${user.image}" class="rounded-circle me-2" width="32" height="32" style="object-fit: fill;">
							<span>${user.text}</span>
						</div>
					`);
				},

			});

			$('##userSearch').on('select2:select', function (e) {
				// console.log(e.params);
				const selectedId = e.params.data.id;
				window.location.href = "#event.buildLink('main.profileView')#?profile_id=" + selectedId;
			});
		});
	</script>
</cfoutput>