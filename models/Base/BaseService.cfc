/**
 * I am a new service
 */
component singleton {


	BaseService function init(){
		
		return this;
	}

	function sendEmail(toEmail, subject, message) {
		try {
			cfmail(
				to=arguments.toEmail,
				from="theyogsofficial@gmail.com",
				subject=arguments.subject,
				server="smtp.gmail.com"
				username="theyogsofficial@gmail.com",
				password="wcxl akxb nuri owmn",
				port="587",
				useTLS="yes",
				useSSL="no",
				type="html",
			) {
				writeOutput(arguments.message);
			}
			return {
				status: "success",
				message: "Email sent successfully."
			} 
		} catch (any error) {
			return {
				status: "error",
				message: error.message 
			} 
		}
	}
	
}