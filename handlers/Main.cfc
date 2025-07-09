component extends="baseHandler" {

	property name="service" inject="UserService";
	property name="eduService" inject="EducationService";
	property name="skillService" inject="SkillService";
	property name="experienceService" inject="ExperienceService";
	property name="projectsService" inject="ProjectsService";


	function index( event, rc, prc ){
		prc.welcomeMessage = "Welcome to ColdBox!";
		event.setView( "main/index" );
	}

	function searchUsers(event ,rc, prc){
		// writeDump(rc);abort;
		res = service.searchUsers(rc.searchKey);
		// writeDump(res);abort;
		return res; 
	}

	function profileView(event, rc, prc){
		// writeDump(rc);abort;
		res = service.getProfile(rc.profile_id);
		if(res.status eq "error"){
			prc.message = res.message;
		}else {
			
			prc.data = res.data;
		}

		res= eduService.getEducations(rc.profile_id);
		// writeDump(res);abort;	
		if(res.status eq "error"){
			prc.message = res.message;
		}else {
			
			prc.edu = res.data;
		}

		res= experienceService.getExperiences(rc.profile_id);
		// writeDump(res);abort;	
		if(res.status eq "error"){
			prc.message = res.message;
		}else {
			
			prc.experience = res.data;
		}

		res= skillService.getSkills(rc.profile_id);

		if(res.status eq "error"){
			prc.message = res.message;
		}else {
			
			prc.userSkills = res.data;
		}

		res = skillService.getAllSkills();
		if(res.status eq "error"){
			prc.message = res.message;
		}else {
			
			prc.skillsList = res.data;
		}

		res = projectsService.getProjects(rc.profile_id);
		if(res.status eq "error"){
			prc.message = res.message;
		}else {
			
			prc.projects = res.data;
		}

		event.setView("profile/publicProfile");
	}
	function onAppInit( event, rc, prc ){
	}

	function onRequestStart(event, rc, prc) {
		
        if (structKeyExists(session, "user")) {
            var currentEvent = event.getCurrentEvent();
			var exempt = [
				"authentication.loginView",
				"authentication.registerView"
			];
           
            if (exempt.contains(currentEvent)) {
                relocate("main.index");
            }

        } else {
			var currentEvent = event.getCurrentEvent();
            var securedEvents = ["dashboard"];
           
            for (var securedEvent in securedEvents) {
                if (listFirst(currentEvent, ".") == securedEvent) {
                    relocate("main.index");
                }
            }
        }
    }

	function onRequestEnd( event, rc, prc ){
	}

	function onSessionStart( event, rc, prc ){
	}

	function onSessionEnd( event, rc, prc ){
		var sessionScope     = event.getValue( "sessionReference" );
		var applicationScope = event.getValue( "applicationReference" );
	}

	function onException( event, rc, prc ){
		event.setHTTPHeader( statusCode = 500 );
		// Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		// Place exception handler below:
	}

}
