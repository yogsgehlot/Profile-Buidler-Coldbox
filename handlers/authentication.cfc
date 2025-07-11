/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="coldbox.system.EventHandler"{    

	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	this.allowedMethods = {};

	property name="service" inject="UserService";
	property name="baseService" inject="BaseService";

	function loginView( event, rc, prc ){
        // writeDump(cgi);abort;
		event.setView("authentication/login")
	}

    function login(event, rc, prc) {
       res = service.login(rc);
       if(res.status eq "error"){return res}
       return{
            status: "success",
            message: "Logged in succesfully"
        }
    }
        
	function registerView( event, rc, prc ){
		event.setView("authentication/register");
	}
	
	function register( event, rc, prc ){
        // writeDump(rc);abort;
		res = service.register(rc);
        if (res.status eq "error") {
            return res;
        }
        mailBody = 
        '
            <div class="container py-5 px-4 bg-white" style="max-width: 600px; margin: auto; font-family: Roboto, Arial, sans-serif;">
                
                
                <h2 class="text-dark fw-bold mb-3">Welcome to Secure Profile</h2>

                
                <p class="text-dark mb-3">
                    Hi <strong>#rc.firstName#</strong>,
                </p>
                <p class="text-dark mb-4">
                    Your registration was successful. You can now access all features of your account, manage your profile, and explore your personalized dashboard.
                </p>

                <ul class="list-unstyled mb-4">
                    <li><i class="fa-solid fa-check text-success me-2"></i> Secure and private access</li>
                    <li><i class="fa-solid fa-user-gear text-primary me-2"></i> Fully customizable profile</li>
                    <li><i class="fa-solid fa-rocket text-danger me-2"></i> Get started in minutes</li>
                </ul>

                
                <p class="text-muted small">
                    If you did not create this account, please ignore this message.
                </p>
                <hr>
                <p class="text-center text-muted small mb-0">
                    &copy; #year(now())# Secure Profile. All rights reserved.
                </p>
            </div>

        '

        sendEmailResponce = baseService.sendEmail(rc.email, "New Registration", mailBody);
		if(sendEmailResponce.status == "error"){
			return sendEmailResponce;
		}

        return{
            status: "success",
            message: "Registered succesfully"
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