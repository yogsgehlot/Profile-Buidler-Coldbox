/**
 * I am a new service
 */
component singleton {

	// DI

	/**
	 * Constructor
	 */
	SkillService function init() {

		return this;
	}

	function addSkill(rc) {
		transaction { 
			try {
				for (skill in rc.skills) {
				skill_id = 0;
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
					
					skill_id = result.generatedKey;
				}else {
					skill_id = existSkill.skill_id;
				}

				addedSkill = queryExecute('SELECT EXISTS(SELECT 1 FROM userskills WHERE profile_id = :profile_id and skill_id = :skill_id) as skillExists',
					{
						profile_id = { value="#rc.profile_id#", cfsqltype="cf_sql_integer" },
						skill_id = { value="#skill_id#", cfsqltype="cf_sql_integer" },
					});
					
				if (addedSkill.skillExists neq 1) {
					
					query_data = queryExecute('INSERT INTO userskills(skill_id, profile_id) values(:skill_id, :profile_id)',
					{
						skill_id = { value="#skill_id#", cfsqltype="cf_sql_integer" },
						profile_id = { value="#rc.profile_id#", cfsqltype="cf_sql_integer" }
					});
				}
				
			}
			transaction action="commit";
			return {
				status: "success",
				message: "Skills Added successfully"
			}

		} catch (any error) {
			transaction action="rollback"; 
			return {
				status: "error",
				message: "server Error: #error#"
			}
		}
		}
	}

	function getSkills(profile_id) {
		try {
			// writeDump(profile_id);abort;
			query_data = queryExecute(
				"SELECT skill_name 
				FROM skills 
				INNER JOIN userskills ON skills.skill_id = userskills.skill_id 
				WHERE userskills.profile_id = :profile_id 
				ORDER BY skill_name",
				{
					profile_id = { value = profile_id, cfsqltype = "cf_sql_integer" }
				}
			);

			// writeDump(query_data);abort;
			return {
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

	function getAllSkills() {
		try {
			// writeDump(profile_id);abort;
			query_data = queryExecute(
				"SELECT skill_name 
				FROM skills"
			);

			// writeDump(query_data);abort;
			return {
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

	function updateSkill(rc) {
		transaction { 
			try {
				// writeDump(rc);abort;
			
				selectedSkills = structKeyExists(rc, "skills") ? rc.skills : [];

				queryExecute(
					"DELETE FROM userskills WHERE profile_id = :profile_id",
					{ profile_id: { value: rc.profile_id, cfsqltype: "cf_sql_integer" } }
				);
				
				for (skill in selectedSkills) {
				skill_id = 0;
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
					
					skill_id = result.generatedKey;
				}else {
					skill_id = existSkill.skill_id;
				}

				query_data = queryExecute('INSERT INTO userskills(skill_id, profile_id) values(:skill_id, :profile_id)',
					{
						skill_id = { value="#skill_id#", cfsqltype="cf_sql_integer" },
						profile_id = { value="#rc.profile_id#", cfsqltype="cf_sql_integer" }
					});
				
			}
			transaction action="commit";
			return {
				status: "success",
				message: "Skills updated successfully"
			}

		} catch (any error) {
			transaction action="rollback"; 
			return {
				status: "error",
				message: "server Error: #error#"
			}
		}
		}
	}
}