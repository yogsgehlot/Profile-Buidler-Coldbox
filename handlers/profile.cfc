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
		res = service.getProfile(rc.profile_id);
		if(res.status eq "error"){
			return res;
		}
		event.noRender();
	
		pdfContent = "
			<html>
			<head>
				<meta charset='utf-8'>
				<style>
					body {
						font-family: Arial, sans-serif;
						background-color: ##f8f9fa;
						padding: 30px;
					}
					.card {
						background: ##ffffff;
						border: 2px solid ##0d6efd;
						border-radius: 20px;
						padding: 30px;
						max-width: 700px;
						margin: auto;
						box-shadow: 0 4px 12px rgba(0,0,0,0.1);
					}
					.header {
						display: flex;
						align-items: center;
						margin-bottom: 20px;
					}
					.header img {
						border-radius: 50%;
						border: 3px solid ##0d6efd;
						width: 100px;
						height: 100px;
						margin-right: 20px;
						object-fit: fill;
					}
					.header h2 {
						margin: 0;
						color: ##0d6efd;
					}
					.header p {
						margin: 5px 0;
						color: ##6c757d;
					}
					.badge {
						background-color: ##198754;
						color: ##fff;
						padding: 5px 10px;
						border-radius: 5px;
						font-size: 0.9rem;
					}
					.info {
						margin-top: 20px;
						color: ##212529;
					}
					.info div {
						margin-bottom: 10px;
					}
					.info strong {
						color: ##000;
					}
					.stats {
						background: ##f1f3f5;
						padding: 15px;
						border-radius: 10px;
						margin-top: 30px;
					}
					.stats h4 {
						color: ##0d6efd;
						margin-bottom: 15px;
					}
					.stats div {
						display: flex;
						justify-content: space-between;
						margin-bottom: 10px;
						color: ##495057;
					}
					.footer {
						margin-top: 30px;
						text-align: right;
						color: ##adb5bd;
						font-size: 0.85rem;
					}
				</style>
			</head>
			<body>
				<div class='card'>
					<div class='header'>
						<img src='#res.data.profile_image#'>
						<div>
							<h2>#res.data.firstName# #res.data.lastName#</h2>
							<span class='badge'>Active</span>
						</div>
					</div>

					<hr>

					<div class='info'>
						<div><strong> Email:</strong> #res.data.email#</div>
						<div><strong> Phone:</strong> #res.data.phoneNumber#</div>
						<div><strong> DOB:</strong> #res.data.dob#</div>
						<div><strong> Address:</strong> #res.data.address#</div>

					<div class='footer'>
						Generated on #dateFormat(now(), 'dd-mmm-yyyy')#
					</div>
				</div>
			</body>
			</html>
		"
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

