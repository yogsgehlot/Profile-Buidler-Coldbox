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
	
	property name="projectsService" inject="ProjectsService";

	
	function addProject(event,rc,prc){
		// writeDump(rc);abort;
		res= projectsService.addProject(rc);

		return res;
	}

	function getProjectDetails(event,rc,prc){
		// writeDump(rc);abort;
		res= projectsService.getProjectDetails(rc.project_id);

		return res;
	}

	function updateProject(event,rc,prc){
		// writeDump(rc);abort;
		res= projectsService.updateProject(rc);

		return res;
	}

	function deleteProject(event,rc,prc){
		// writeDump(rc);abort;
		res= projectsService.deleteProject(rc);

		return res;
	}


}

