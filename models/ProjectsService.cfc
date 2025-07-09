/**
 * I am a new service
 */
component singleton {

	// DI

	/**
	 * Constructor
	 */
	ProjectsService function init(){
		
		return this;
	}

	function getProjects(profile_id){
		try {
			// writeDump(rc);abort;
			query_data = queryExecute('
				select * from projects where profile_id = :profile_id 
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
				message: "Projects get successfully"
			}
			
		} catch (any error) {
			return {
				status: "error",
				message: "server Error: #error#"
			}
		}
	}

	function addProject(rc){
		transaction { 
			// writeDump(rc.tech_stack);abort;
			try {
				for (skill in rc.tech_stack) {
					
					existSkill = queryExecute('SELECT skill_id FROM skills WHERE skill_name = :skill_name ',
					{
						skill_name = { value="#trim(skill)#", cfsqltype="cf_sql_varchar" }
					})
					// writeDump(existSkill.skill_id);abort;
					if (existSkill.recordCount eq 0) {
						// query_data = queryExecute('INSERT INTO skills(skill_name) values(:skill_name)',
						// 	{
						// 		skill_name = { value="#trim(skill)#", cfsqltype="cf_sql_varchar" }
						// 	});
						queryExecute('INSERT INTO skills(skill_name) values(:skill_name)',
							{
								skill_name = { value="#trim(skill)#", cfsqltype="cf_sql_varchar" }
							},
							{
								result: 'local.result'
							}	
						);
						// return local.result.generatedkey;
						// writeDump(local.result);abort;
						// writeDump( result);abort;
						
					}
				}

				query_data = queryExecute(
					'
					INSERT INTO projects (
						profile_id, project_title, client_name,
						start_year, end_year, live_link,
						github_link, tech_stack, description
					) VALUES (
						:profile_id, :project_title, :client_name,
						:start_year, :end_year, :live_link,
						:github_link, :tech_stack, :description
					)
					',
					{
						profile_id    = { value = rc.profile_id, cfsqltype = "cf_sql_integer" },
						project_title = { value = rc.project_title, cfsqltype = "cf_sql_varchar" },
						client_name   = { value = rc.client_name, cfsqltype = "cf_sql_varchar" },
						start_year    = { value = rc.start_year, cfsqltype = "cf_sql_integer" },
						end_year      = {
							value = (rc.end_year EQ "Present" ? javacast("null", "") : rc.end_year),
							cfsqltype = "cf_sql_integer"
						},
						live_link     = { value = rc.live_link, cfsqltype = "cf_sql_varchar" },
						github_link   = { value = rc.github_link, cfsqltype = "cf_sql_varchar" },
						tech_stack    = { value = arrayToList(rc.tech_stack, ","), cfsqltype = "cf_sql_longvarchar" },
						description   = { value = rc.description, cfsqltype = "cf_sql_longvarchar" }
					}
				);
				transaction action="commit";
				return {
					status: "success",
					message: "Project added successfully"
				};

			} catch (any error) {
				transaction action="rollback";
				return {
					status: "error",
					message: "Server Error: #error#"
				};
			}
		}
	}
	
	function getProjectDetails(project_id){
		try {
			// writeDump(rc);abort;
			query_data = queryExecute('select * from projects where project_id = :project_id',
            {
				project_id = { value="#project_id#", cfsqltype="cf_sql_integer"}
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

	function updateProject(rc){
		transaction { 
			// writeDump(rc.tech_stack);abort;
			try {
				for (skill in rc.tech_stack) {
					
					existSkill = queryExecute('SELECT skill_id FROM skills WHERE skill_name = :skill_name ',
					{
						skill_name = { value="#trim(skill)#", cfsqltype="cf_sql_varchar" }
					})
					// writeDump(existSkill.skill_id);abort;
					if (existSkill.recordCount eq 0) {
						// query_data = queryExecute('INSERT INTO skills(skill_name) values(:skill_name)',
						// 	{
						// 		skill_name = { value="#trim(skill)#", cfsqltype="cf_sql_varchar" }
						// 	});
						queryExecute('INSERT INTO skills(skill_name) values(:skill_name)',
							{
								skill_name = { value="#trim(skill)#", cfsqltype="cf_sql_varchar" }
							},
							{
								result: 'local.result'
							}	
						);
						// return local.result.generatedkey;
						// writeDump(local.result);abort;
						// writeDump( result);abort;
					}
				}

				query_data = queryExecute(
					'
					update projects set
						project_title=:project_title, client_name=:client_name,
						start_year=:start_year, end_year=:end_year, live_link=:live_link,
						github_link=:github_link, tech_stack=:tech_stack, description=:description
						where project_id= :project_id
					',
					{
						project_id    = { value = rc.project_id, cfsqltype = "cf_sql_integer" },
						project_title = { value = rc.project_title, cfsqltype = "cf_sql_varchar" },
						client_name   = { value = rc.client_name, cfsqltype = "cf_sql_varchar" },
						start_year    = { value = rc.start_year, cfsqltype = "cf_sql_integer" },
						end_year      = {
							value = (rc.end_year EQ "Present" ? javacast("null", "") : rc.end_year),
							cfsqltype = "cf_sql_integer"
						},
						live_link     = { value = rc.live_link, cfsqltype = "cf_sql_varchar" },
						github_link   = { value = rc.github_link, cfsqltype = "cf_sql_varchar" },
						tech_stack    = { value = arrayToList(rc.tech_stack, ","), cfsqltype = "cf_sql_longvarchar" },
						description   = { value = rc.description, cfsqltype = "cf_sql_longvarchar" }
					}
				);
				transaction action="commit";
				return {
					status: "success",
					message: "Project added successfully"
				};

			} catch (any error) {
				transaction action="rollback";
				return {
					status: "error",
					message: "Server Error: #error#"
				};
			}
		}
	}

	function deleteProject(rc){
		try {
			query_data = queryExecute('DELETE FROM projects where project_id=:project_id',
            {
				project_id = { value="#rc.project_id#", cfsqltype="cf_sql_integer"}
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