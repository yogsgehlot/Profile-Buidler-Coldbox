/**
 * I am a new service
 */
component singleton {

	EducationService function init(){
		
		return this;
	}

	function addEducation(rc){
		try {
			query_data = queryExecute('INSERT INTO educations(profile_id,degree,institution,start_year,end_year,grade,description) values(:profile_id,:degree,:institution,:start_year,:end_year,:grade,:description)',
            {
				profile_id = { value="#rc.profile_id#", cfsqltype="cf_sql_integer"},
				degree = { value="#rc.degree#", cfsqltype="cf_sql_varchar"},
				institution = { value="#rc.institution#", cfsqltype="cf_sql_varchar"},
				start_year = { value="#rc.start_year#", cfsqltype="cf_sql_integer"},
				end_year = { value="#rc.end_year#", cfsqltype="cf_sql_integer"},
				grade = { value="#rc.grade#", cfsqltype="cf_sql_varchar"},
				description = { value="#rc.description#", cfsqltype="cf_sql_longvarchar"},
        	});

			return{
				status: "success",
				message: "Education Added successfully"
			}
			
		} catch (any error) {
			return {
				status: "error",
				message: "server Error: #error#"
			}
		}
	}

	function getEducations(profile_id){
		try {
			// writeDump(rc);abort;
			query_data = queryExecute('
				select * from educations inner join profiles on educations.profile_id = profiles.profile_id 
				where educations.profile_id = :profile_id 
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
				message: "Education Added successfully"
			}
			
		} catch (any error) {
			return {
				status: "error",
				message: "server Error: #error#"
			}
		}
	}

	function getEducationDetail(education_id){
		try {
			// writeDump(rc);abort;
			query_data = queryExecute('select * from educations where education_id = :education_id',
            {
				education_id = { value="#education_id#", cfsqltype="cf_sql_integer"}
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

	function updateEducation(rc){
		try {
			query_data = queryExecute('update educations set degree=:degree,institution=:institution,start_year=:start_year,end_year=:end_year,grade=:grade,description=:description where education_id=:education_id',
            {
				education_id = { value="#rc.education_id#", cfsqltype="cf_sql_integer"},
				degree = { value="#rc.degree#", cfsqltype="cf_sql_varchar"},
				institution = { value="#rc.institution#", cfsqltype="cf_sql_varchar"},
				start_year = { value="#rc.start_year#", cfsqltype="cf_sql_integer"},
				end_year = { value="#rc.end_year#", cfsqltype="cf_sql_integer"},
				grade = { value="#rc.grade#", cfsqltype="cf_sql_varchar"},
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

	function deleteEducation(rc){
		try {
			query_data = queryExecute('DELETE FROM educations where education_id=:education_id',
            {
				education_id = { value="#rc.education_id#", cfsqltype="cf_sql_integer"}
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