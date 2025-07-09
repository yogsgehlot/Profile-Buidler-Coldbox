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

	property name="eduService" inject="EducationService";

	/**
	 * someAction
	 */
	
	function addEducation(event, rc, prc){
		// writeDump(rc);abort;
		res= eduService.addEducation(rc);

		return res;
	}

	function getEducation(event, rc, prc){
		// writeDump(rc);abort;
		res = eduService.getEducationDetail(rc.education_id);
		// writeDump(res);abort;
		return res; 

	}

	function editEducation(event, rc, prc){
		// writeDump(rc);abort;
		res = eduService.updateEducation(rc);
		// writeDump(res);abort;
		return res; 
	}

	function deleteEducation(event,rc,prc){
		// writeDump(rc);abort;
		res = eduService.deleteEducation(rc);
		
		return res; 

	}

}

