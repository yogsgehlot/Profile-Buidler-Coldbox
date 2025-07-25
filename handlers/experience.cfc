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

	property name="experienceService" inject="ExperienceService";


	
	function addExperience(event, rc, prc){
		// writeDump(rc);abort;
		res= experienceService.addExperience(rc);

		return res;
	}

	function getExperienceDetails(event, rc, prc){
		// writeDump(rc);abort;
		res= experienceService.getExperienceDetails(rc.experience_id);

		return res;
	}

	function updateExperience(event, rc, prc){
		// writeDump(rc);abort;
		res= experienceService.updateExperience(rc);

		return res;
	}

	function deleteExperience(event,rc,prc){
		// writeDump(rc);abort;
		res = experienceService.deleteExperience(rc);
		
		return res; 

	}



}

