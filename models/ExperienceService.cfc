/**
 * I am a new service
 */
component singleton {

	// DI

	/**
	 * Constructor
	 */
	ExperienceService function init(){
		
		return this;
	}

	function getExperiences(profile_id){
		try {
			// writeDump(rc);abort;
			query_data = queryExecute('
				SELECT * FROM experience
				WHERE profile_id = :profile_id
				ORDER BY 
					CASE 
						WHEN end_year IS NULL THEN 9999 
						ELSE end_year 
					END DESC,
					start_year DESC',
            {
				profile_id = { value="#profile_id#", cfsqltype="cf_sql_integer"}
        	});

			return{
				status: "success",
				data: query_data,
				message: "Education read successfully"
			}
			
		} catch (any error) {
			return {
				status: "error",
				message: "server Error: #error#"
			}
		}
	}
	
	function addExperience(rc){
		try {
			endYearValue = isNumeric(rc.end_year) ? rc.end_year : NULL;

			query_data = queryExecute('INSERT INTO experience(profile_id,job_title,company_name,start_year,end_year,description) values(:profile_id,:job_title,:company_name,:start_year,:end_year,:description)',
            {
				profile_id = { value="#rc.profile_id#", cfsqltype="cf_sql_integer"},
				job_title = { value="#rc.job_title#", cfsqltype="cf_sql_varchar"},
				company_name = { value="#rc.company_name#", cfsqltype="cf_sql_varchar"},
				start_year = { value="#rc.start_year#", cfsqltype="cf_sql_integer"},
				end_year = { value=endYearValue, cfsqltype="cf_sql_integer"},
				description = { value="#rc.description#", cfsqltype="cf_sql_longvarchar"},
        	});

			return{
				status: "success",
				message: "Experience Added successfully"
			}
			
		} catch (any error) {
			return {
				status: "error",
				message: "server Error: #error#"
			}
		}
	}

	function getExperienceDetails(experience_id){
		try {
			// writeDump(rc);abort;
			query_data = queryExecute('select * from experience where experience_id = :experience_id',
            {
				experience_id = { value="#experience_id#", cfsqltype="cf_sql_integer"}
        	});

			return{
				status: "success",
				data: query_data
			}
			
		} catch (any error) {
			return {
				status: "error",
				message: "server Error: #error#"
			}
		}
	}

	function updateExperience(rc){
		try {
			endYearValue = isNumeric(rc.end_year) ? rc.end_year : NULL;

			query_data = queryExecute('update experience set job_title=:job_title,company_name=:company_name,start_year=:start_year,end_year=:end_year,description=:description where experience_id=:experience_id',
            {
				experience_id = { value="#rc.experience_id#", cfsqltype="cf_sql_integer"},
				profile_id = { value="#rc.profile_id#", cfsqltype="cf_sql_integer"},
				job_title = { value="#rc.job_title#", cfsqltype="cf_sql_varchar"},
				company_name = { value="#rc.company_name#", cfsqltype="cf_sql_varchar"},
				start_year = { value="#rc.start_year#", cfsqltype="cf_sql_integer"},
				end_year = { value=endYearValue, cfsqltype="cf_sql_integer"},
				description = { value="#rc.description#", cfsqltype="cf_sql_longvarchar"},
        	});

			return{
				status: "success",
				message: "Education Updated successfully"
			}
			
		} catch (any error) {
			return {
				status: "error",
				message: "server Error: #error#"
			}
		}
	}

	function deleteExperience(rc){
		try {
			query_data = queryExecute('DELETE FROM experience where experience_id=:experience_id',
            {
				experience_id = { value="#rc.experience_id#", cfsqltype="cf_sql_integer"}
        	});

			return{
				status: "success",
				data: query_data
			}
			
		} catch (any error) {
			return {
				status: "error",
				message: "server Error",
				error: error
			}
		}
	}


}