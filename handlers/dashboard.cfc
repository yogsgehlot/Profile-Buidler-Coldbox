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
	
	function index( event, rc, prc ){
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

		event.setView("dashboard/index")
	}

	

}