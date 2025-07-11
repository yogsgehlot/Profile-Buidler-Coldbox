/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="baseHandler"{

	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	this.allowedMethods = {};

	property name="service" inject="UserService";
	property name="eduService" inject="EducationService";
	property name="skillService" inject="SkillService";
	property name="experienceService" inject="ExperienceService";
	property name="projectsService" inject="ProjectsService";
	property name="baseService" inject="BaseService";

	function logout( event, rc, prc ){
		try{
            if(structKeyExists(session,"USER")){
                // deleting session
                structClear(session);

				return event.renderData(type="json", data={
					status = "success",
					message = "logout successfully"
           		})
			}
        } catch (any error) {
            return event.renderData(type="json", data={
				status = "error",
				message = "Server error",
				detail = error.message
        	});
        }
	}

	function editProfile(event, rc, prc){
		res = service.getProfile(session.USER.profile_id);
		if(res.status eq "error"){
			prc.message = res.message;
		}
		prc.data = res.data;
		event.setView("dashboard/editProfile");
	}

	function updateProfile(event, rc, prc){
		// writeDump(rc);abort;
		
		res= service.updateProfile(rc);

		return res;

	}

	function changePassword(event, rc, prc){
		res = service.updatePassword(rc)
		if(res.status == "error"){
			return res; //error
		}
		emailResponce = service.getEmail(rc);
		if(emailResponce.status == "error"){
			return emailResponce; //error
		}

		mailBody = 
		"<table width='100%' cellpadding='0' cellspacing='0' style='background-color: ##f5f5f5; padding: 40px 0; font-family: Roboto, Arial, sans-serif;'>
                <tr>
                    <td align='center'>
                    <table width='600' cellpadding='0' cellspacing='0' style='background: ##ffffff; border-radius: 8px; overflow: hidden; box-shadow: 0 0 10px rgba(0,0,0,0.1);'>
                        <tr>
                        <td style='background-color: ##4285F4; padding: 20px 30px; text-align: center;'>
                            <h1 style='margin: 0; color: ##fff; font-size: 24px;'>Password Changed</h1>
                        </td>
                        </tr>
                        <tr>
                        <td style='padding: 30px;'>
                            <p style='font-size: 16px; color: ##333;'>Hi #emailResponce.data.firstName# #emailResponce.data.lastName#,</p>
                            <p style='font-size: 15px; color: ##444; line-height: 1.6;'>
                            We wanted to let you know that your password was successfully changed.
                            If you made this change, no further action is needed.
                            </p>
                            <p style='font-size: 13px; color: ##888;'>This message was sent automatically. Please do not reply.</p>
                            <p style='font-size: 13px; color: ##888;'>If you have any questions, contact our support team at <a href='mailto:support@example.com'>support@example.com</a>.</p>
                        </td>
                        </tr>
                        <tr>
                        <td style='background-color: ##f1f1f1; text-align: center; padding: 20px; font-size: 12px; color: ##777;'>
                            &copy; #year(now())# Secure Profile. All rights reserved.
                        </td>
                        </tr>
                    </table>
                    </td>
                </tr>
            </table>
		"

		sendEmailResponce = baseService.sendEmail(emailResponce.data.email, "Password Update", mailBody);
		if(sendEmailResponce.status == "error"){
			return sendEmailResponce;
		}

		return {
			status: "success",
			message: "Password changed"
		}

	}

	function downloadPDF(event,rc,prc){
		// writeDump(rc);abort; 
		user = service.getProfile(rc.profile_id);
		
		education= eduService.getEducations(rc.profile_id);
		
		experience= experienceService.getExperiences(rc.profile_id);
		
		skills= skillService.getSkills(rc.profile_id);

		projects = projectsService.getProjects(rc.profile_id);

		
		event.noRender();
	
		pdfContent = '
			<!DOCTYPE html>
			<html lang="en">
			<head>
			<meta charset="UTF-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
			<title>Resume | FAANG Style</title>
			<style>
				* {
				box-sizing: border-box;
				margin: 0;
				padding: 0;
				}

				body {
				font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
				font-size: 14px;
				line-height: 1.6;
				background-color: ##fdfdfd;
				color: ##212121;
				padding: 2rem;
				}

				.container {
				max-width: 800px;
				margin: 0 auto;
				background: ##fff;
				padding: 2rem;
				box-shadow: 0 0 20px rgba(0,0,0,0.08);
				border-radius: 8px;
				}

				h1 {
				font-size: 28px;
				margin-bottom: 0.2rem;
				}

				h2 {
				font-size: 16px;
				color: ##444;
				}

				.section {
				margin-top: 2rem;
				}

				.section h3 {
				border-bottom: 1px solid ##ccc;
				padding-bottom: 0.3rem;
				margin-bottom: 1rem;
				font-size: 16px;
				color: ##222;
				text-transform: uppercase;
				letter-spacing: 1px;
				}

				.job, .project, .edu {
				margin-bottom: 1rem;
				}

				.title {
				font-weight: bold;
				color: ##111;
				}

				.meta {
				font-style: italic;
				color: ##666;
				font-size: 13px;
				}

				ul {
				padding-left: 1rem;
				list-style-type: disc;
				}

				.skills {
				display: flex;
				flex-wrap: wrap;
				gap: 0.5rem;
				}

				.skill-badge {
				background: ##e0e0e0;
				border-radius: 12px;
				padding: 0.3rem 0.75rem !important;
				font-size: 13px;
				}

				@media print {
				body {
					padding: 0;
				}

				.container {
					box-shadow: none;
					border: none;
				}
				}
			</style>
			</head>
			<body>
			<div class="container">
				<header>
				<h1>#user.data.firstName# #user.data.lastName#</h1>
				<!--- <h2>Software Engineer | johndoe@gmail.com | linkedin.com/in/johndoe | github.com/johndoe</h2> --->
				</header>

				<!--- <section class="section">
				<h3>Summary</h3>
				<p>Experienced full-stack engineer with 5+ years building scalable applications. Strong in React, Node.js, and AWS. Passionate about clean code and performance optimization.</p>
				</section> --->

				<section class="section">
				<h3>Education</h3>
		';
		
		for(row in education.data){

			pdfContent &='
				<div class="edu">
					<div class="title">#row.degree#</div>
					<div class="meta">#row.institution#, #dateFormat(row.start_year, "yyyy")# -
						#dateFormat(row.end_year, "yyyy")#</div>
				</div>
			';
		}

		pdfContent &='
			</section>

			<section class="section">
			<h3>Experience</h3>
		';
		
		for(row in experience.data){
			pdfContent &='
				<div class="job">
					<div class="title">#row.job_title#</div>
					<div class="meta">#row.company_name# | #row.start_year# - #row.end_year EQ "" ? "Present" : row.end_year#</div>
					<!--- <p>#row.description#</p> --->
				</div>
			';
		}
			
		pdfContent &='
			</section>

				<section class="section">
				<h3>Projects</h3>
			
		';
		
		for(row in projects.data){
			pdfContent &='
				<div class="project">
					<div class="title">#row.project_title#</div>
					<div class="meta">#Replace("#row.tech_stack#", ",", " | ", "All")#</div>
					<p>#row.description#</p>
				</div>
			';
		}
		pdfContent &='
			</section>
			<section class="section">
				<h3>Skills</h3>
				<div class="skills">
		';

		for(row in skills.data){
			pdfContent &='<span class="skill-badge" >#row.skill_name#</span>';
		}

		pdfContent &='
							</div>
						</section>
					</div>
				</body>
			</html>
		';

		cfcontent( type="application/pdf" );
		cfheader( name="Content-Disposition", value="attachment;filename=profile.pdf" );
		cfdocument (format="pdf"){
		writeOutput(pdfContent);
		}
		return "";
	}
	
	function deleteProfile(event,rc,prc){
		// writeDump(rc);abort;
		res = service.deleteProfile(rc);
		if(res.status == "error"){
			return res; //error
		}

		// deleting session
        structClear(session);

		return {
			status: "success",
			message: "Profile Deleted Successfully"
		}

	}

	function forgotPasswordView(event, rc, prc){
        event.setView("authentication/forgotPassword")
    }

    function forgotPassword(event, rc, prc){
        // writeDump(rc);abort;

        res = service.forgotPassword(rc);
        if(res.status eq "error"){
            return res;
        }
        // writeDump(res);abort;
        mailBody= 
        "
        <body style='font-family: Arial, sans-serif; background-color: ##f8f9fa; padding: 20px;'>
            <div style='max-width: 600px; margin: auto; background-color: ##ffffff; border: 1px solid ##dee2e6; border-radius: .5rem; padding: 30px;'>
            
            <h2 style='color: ##0d6efd; margin-bottom: 20px;'>Password Reset Confirmation</h2>
            
            <p>Hello,</p>
            <p>You recently requested to reset your password. Below is your temporary password:</p>
            
            <div style='background-color: ##f1f3f5; border: 1px dashed ##6c757d; padding: 15px; font-size: 18px; font-weight: bold; color: ##dc3545; text-align: center; border-radius: .25rem; margin: 20px 0;'>
                #res.randomPassword#
            </div>

            <p>Please use this password to log in and update your password immediately for security reasons.</p>
            <p>If you did not request a password reset, please contact our support team right away.</p>

            <hr style='margin: 30px 0;'>
            <p style='font-size: 12px; color: ##6c757d;'> © #year(now())# Secure Profile. All rights reserved.</p>
            </div>
        </body>
        "
        sendEmailResponce = baseService.sendEmail(rc.email, "Password Reset", mailBody);
		if(sendEmailResponce.status == "error"){
			return sendEmailResponce;
		}

		return {
			status: "success",
			message: "Password sent to mail"
		}
    }

}

			