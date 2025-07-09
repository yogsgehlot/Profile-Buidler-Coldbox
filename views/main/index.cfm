<cfoutput>
	<div class="container-fluid p-5">
		<div class="container rounded-5 border shadow-lg" style="min-height: 50vh">
			<div class="p-5 gap-3">
				<cfif NOT structKeyExists(session, "user" )>
					<div class="row">
						<div class="d-flex justify-content-center d-md-none">
							<img src="includes\images\notebook-icon-left-side-white-background.jpg" class="w-100">
						</div>
						<div class="col-md-8 d-flex flex-column justify-content-center ">
							<h2>Your Personal Dashboard, Reimagined.</h2>
							<p>Manage your identity, share your story, and build your presence - all in one place.</p>
							<ul class="list-unstyled mt-3">
								<li><i class="fa-solid fa-check text-success me-2"></i> Secure, fast login</li>
								<li><i class="fa-solid fa-check text-success me-2"></i> Fully customizable profile</li>
								<li><i class="fa-solid fa-check text-success me-2"></i> Insightful dashboard analytics
								</li>
							</ul>
							<div class="p-3">
								<a class="btn btn-primary" href="#event.buildLink('authentication.loginView')#">Login <i
										class="fa-solid fa-right-to-bracket"></i></a>
								<a class="btn btn-primary"
									href="#event.buildLink('authentication.registerView')#">Register <i
										class="fa-solid fa-user-plus"></i></a>
							</div>
						</div>
						<div class="col-md-4 d-flex justify-content-end d-none d-md-block">
							<img src="includes\images\notebook-icon-left-side-white-background.jpg" class="w-100">
						</div>
					</div>
					<cfelse>
						<div class="row">
							<div class="d-flex justify-content-center d-md-none">
								<img src="includes\images\19198853.jpg" class="w-100 rounded-3 shadow-lg ">
							</div>
							<div class="col-md-8 d-flex flex-column justify-content-center align-items-center mt-3">
								<h2 class="text-primary">Welcome, #session.user.FirstName#! <i
										class="fa-regular fa-face-smile"></i></h2>
								<p>Ready to explore your dashboard and manage your digital profile?</p>
								<ul class="list-unstyled mt-3">
									<li><i class="fa-solid fa-circle-check text-success me-2"></i> Your account is
										active and
										secure.</li>
									<li><i class="fa-solid fa-user-gear text-primary me-2"></i> Profile setup is nearly
										complete.</li>
									<li><i class="fa-solid fa-bolt text-warning me-2"></i> Dashboard features are ready
										to
										explore.</li>
								</ul>

								<div class="p-3 ">
									<a class="btn btn-success my-1" href="#event.buildLink('dashboard.index')#?profile_id=#session.user.profile_id#">Go to
										Dashboard <i class="fa-solid fa-gauge-high"></i></a>
									<button class="btn btn-outline-danger my-1" id="logout">Logout <i class="fa-solid fa-right-from-bracket ms-1"></i></button>
								</div>
							</div>
							<div class="col-md-4 d-flex justify-content-end d-none d-md-block">
								<img src="includes\images\19198853.jpg" class="w-100 rounded-3 shadow-lg ">
							</div>
						</div>
				</cfif>
			</div>
		</div>
	</div>
	<div class="container mt-5">
		<div class="row text-center">
			<div class="col-md-4">
				<i class="fa-solid fa-lock fa-2x text-primary mb-3"></i>
				<h5>Secure Profiles</h5>
				<p>Your data is encrypted and safe with us.</p>
			</div>
			<div class="col-md-4">
				<i class="fa-solid fa-pen-nib fa-2x text-primary mb-3"></i>
				<h5>Personalized Design</h5>
				<p>Customize your look, feel, and personal brand.</p>
			</div>
			<div class="col-md-4">
				<i class="fa-solid fa-chart-line fa-2x text-primary mb-3"></i>
				<h5>Real-Time Insights</h5>
				<p>Get real-time stats and profile engagement metrics.</p>
			</div>
		</div>
	</div>
	
    <div class="container mt-5">
        <div class="row text-center">
            <div class="col-md-4">
                <i class="fa-solid fa-user-check fa-2x text-success mb-3"></i>
                <h5>Profile Status</h5>
                <p>Track your profile completion and verification status.</p>
            </div>
            <div class="col-md-4">
                <i class="fa-solid fa-bell fa-2x text-warning mb-3"></i>
                <h5>Notifications</h5>
                <p>Stay updated with important alerts and updates.</p>
            </div>
            <div class="col-md-4">
                <i class="fa-solid fa-database fa-2x text-info mb-3"></i>
                <h5>Data Overview</h5>
                <p>Get quick access to your stored information and stats.</p>
            </div>
        </div>

        <div class="container my-5">
            <h4 class="mb-3">Dashboard Quick Help</h4>
            <div class="accordion " id="dashboardHelpAccordion">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" aria-expanded="true"
                            data-bs-target="##dash1">
                            How do I update my profile?
                        </button>
                    </h2>
                    <div id="dash1" class="accordion-collapse collapse show">
                        <div class="accordion-body">
                            Go to the Profile section from the sidebar and click the "Edit" button to update your
                            information.
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" aria-expanded="true"
                            data-bs-toggle="collapse" data-bs-target="##dash2">
                            How can I view my activity logs?
                        </button>
                    </h2>
                    <div id="dash2" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            Click on "Activity" in the main menu to view your latest login, updates, and actions taken.
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" aria-expanded="true"
                            data-bs-toggle="collapse" data-bs-target="##dash3">
                            Where can I find analytics?
                        </button>
                    </h2>
                    <div id="dash3" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            Visit the "Analytics" section to view your profile's engagement metrics in real-time.
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>



	<script>
		
	</script>

</cfoutput>