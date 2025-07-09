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

	
	property name="skillService" inject="SkillService";

	
	function addSkill(event, rc, prc){
		// writeDump(rc);abort;
		res= skillService.addSkill(rc);

		return res;
	}

	function updateSkill(event, rc, prc){
		// writeDump(rc);abort;
		res= skillService.updateSkill(rc);
		
		return res;
	}
}

