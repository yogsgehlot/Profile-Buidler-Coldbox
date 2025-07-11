/**
 * I am a new service
 */
component singleton {

	UserService function init(){
		return this;
	}

	function register(rc){
		try {
	
			check_email = queryExecute('SELECT EXISTS(SELECT 1 FROM profiles WHERE email = :email) as emailExists',
			{
				email = { value="#rc.email#", cfsqltype="cf_sql_varchar"}
			})
			// writeDump(query_data.emailExists);abort;
			if (check_email.emailExists eq 1) {
				return {
					status: "error",
					message: "User already exists"
				}				
			}

           query_data = queryExecute('insert into profiles(firstName, lastName, email, password, phoneNumber, address, profile_image ) values(:firstName, :lastName,:email,:password,:phoneNumber,:address, :profile_image)',
            {
				firstName = { value="#rc.firstName#", cfsqltype="cf_sql_varchar" },
				lastName = { value="#rc.lastName#", cfsqltype="cf_sql_varchar" },
				email = { value="#rc.email#", cfsqltype="cf_sql_varchar" },
				password = { value="#hash("#rc.password#", "SHA-256", "UTF-8")#", cfsqltype="cf_sql_varchar" },
				phoneNumber = { value="#rc.phoneNumber#", cfsqltype="cf_sql_varchar" },
				address = { value="#rc.address#", cfsqltype="cf_sql_longvarchar" },
				profile_image = { value="includes\images\0684456b-aa2b-4631-86f7-93ceaf33303c.jpg", cfsqltype="cf_sql_varchar" },
        	});
			// writeDump(query_data);abort;
			
			return {
				status: "success",
				message: "Registered Successfully"
			}
			
    	} catch (any error) {
			return {
				status: "error",
				message: error
			}
			
		}
	}

	function login(rc) {
        try {
            query_data = queryExecute(
                "SELECT  profile_id, firstName, lastName, email, address, phoneNumber FROM profiles WHERE email = :email AND password = :password",
                {
                    email = { value = rc.email, cfsqltype = "cf_sql_varchar" },
                    password = { value="#hash("#rc.password#", "SHA-256", "UTF-8")#", cfsqltype = "cf_sql_varchar" }
                }
            );
            // writeDump(query_data);abort;
            if (query_data.recordCount EQ 0) {
                return {
					status: "error",
					message: "Invalid credentials"
				}

            } else {
                session.user = {
                    profile_id = query_data.profile_id,
                    firstName = query_data.firstName,
                    lastName = query_data.lastName,
                    email = query_data.email
                };
            
				return {
				status: "success",
				message = "Logged in successfully"
				}
            }
        } catch (any error) {
            return {
				status: "error",
				message: error
			}
        }
    }
       
	function updateProfile(rc){
		// writeDump(arguments);abort;

		try {
			
			if (structKeyExists(rc, "image") && trim(rc.image).length()) {

				uploadedFile = fileUpload( expandPath("./uploads"), "#rc.image#", "image/jpeg,image/pjpeg,image/png,image/svg", "MakeUnique" );
				
				if (not listFindNoCase("jpg,jpeg,png,svg,webP", uploadedFile.serverFileExt)) {
					return {
						status: "error", 
						message: "The uploaded file is not of type JPG."
					}
				}
				var imagePath = "/uploads/" & uploadedFile.serverFile;

				previousImage_query_data = queryExecute('select profile_image from profiles where profile_id=:profile_id',
				{
					profile_id = { value="#rc.profile_id#", cfsqltype="cf_sql_integer" }
				});

				if (previousImage_query_data.recordCount > 0) {
					previousImage = previousImage_query_data.profile_image;

					if (!isNull(previousImage) && len(trim(previousImage))) {
						fullPath = expandPath(previousImage);
						if (fileExists(fullPath)) {
							fileDelete(fullPath);
						}
					}
				}

				query_data = queryExecute('UPDATE profiles SET firstName= :firstName, lastName= :lastName, email=:email,phoneNumber=:phoneNumber, address=:address, profile_image=:profile_image, dob=:dob where profile_id = :profile_id ',
				{
					firstName = { value="#rc.firstName#", cfsqltype="cf_sql_varchar" },
					lastName = { value="#rc.lastName#", cfsqltype="cf_sql_varchar" },
					email = { value="#rc.email#", cfsqltype="cf_sql_varchar" },
					phoneNumber = { value="#rc.phoneNumber#", cfsqltype="cf_sql_varchar" },
					address = { value="#rc.address#", cfsqltype="cf_sql_longvarchar" },
					dob = { value="#rc.dob#", cfsqltype="cf_sql_date" },
					profile_image = { value="#imagePath#", cfsqltype="cf_sql_varchar" },
					profile_id = { value="#rc.profile_id#", cfsqltype="cf_sql_integer" }
				});
				// writeDump(query_data); abort;
				return {
					status: "success", 
					message: "Profile updated Successfully"
				}
			}else {
				query_data = queryExecute('UPDATE profiles SET firstName= :firstName, lastName= :lastName, email=:email,phoneNumber=:phoneNumber, address=:address, dob=:dob where profile_id = :profile_id ',
				{
					firstName = { value="#rc.firstName#", cfsqltype="cf_sql_varchar" },
					lastName = { value="#rc.lastName#", cfsqltype="cf_sql_varchar" },
					email = { value="#rc.email#", cfsqltype="cf_sql_varchar" },
					phoneNumber = { value="#rc.phoneNumber#", cfsqltype="cf_sql_varchar" },
					address = { value="#rc.address#", cfsqltype="cf_sql_longvarchar" },
					dob = { value="#rc.dob#", cfsqltype="cf_sql_date" },
					profile_id = { value="#rc.profile_id#", cfsqltype="cf_sql_integer" }
				});
				// writeDump(query_data); abort;
				return {
					status: "success", 
					message: "Profile updated Successfully"
				}
			}

		} catch (any error) {
			// writeDump(error);abort;
            return {
                status: "error", 
                message: "Server Error",
                error: error
            }
		}
	}

	function getProfile(profile_id){
		try {

			
			query_data = queryExecute("SELECT profile_id, firstName, lastName, email, address, phoneNumber, dob, profile_image FROM profiles WHERE profile_id = :profile_id", 
			{
				profile_id={value=profile_id, cfsqltype="cf_sql_integer"}
			});

			// writeDump(query_data); abort;

			
			if(query_data.recordCount eq 0){
				return {
					status: "error",
					message: "user not found"
				}
			}
			
			query_data.dob = dateFormat(query_data.dob, 'dd-mm-yyyy' )
			// writeDump(query_data.dob);abort;

			return {status: "succes", data: query_data}
		
			
		} catch (any error) {
			return {
				status: "error",
				message: "SERVER error"
			}
			
		}

	}

	function searchUsers(searchKey){
		try {
			searchKey = "%" & searchKey & "%";
			query_data = queryExecute("
			SELECT profile_id, profile_image, CONCAT(firstName, ' ', lastName) AS full_name
			FROM profiles
			WHERE firstName LIKE :searchKey OR lastName LIKE :searchKey OR email LIKE :searchKey LIMIT 10",
			{
				searchKey={value=searchKey, cfsqltype="cf_sql_varchar"}
			});

			// writeDump(query_data); abort;
			
			if(query_data.recordCount eq 0){
				return {
					status: "error",
					message: "user not found"
				}
			}
		
			return {status: "succes", data: query_data}
		
			
		} catch (any error) {
			return {
				status: "error",
				message: "SERVER error #error#"
			}
			
		}

	}

	function updatePassword(rc){
		try {
			// writeDump(rc);abort;
			check_password = queryExecute('select password from profiles  where profile_id=:profile_id',
            {
				profile_id = { value="#rc.profile_id#", cfsqltype="cf_sql_integer"}
        	});
			// writeDump(check_password);abort;

			if (check_password.recordCount neq 0) {
				if(check_password.password eq hash("#rc.oldPassword#", "SHA-256", "UTF-8")){
					query_data = queryExecute('update profiles set password=:password where profile_id=:profile_id',
					{
						profile_id = { value="#rc.profile_id#", cfsqltype="cf_sql_integer"},
						password = { value="#hash("#rc.newPassword#", "SHA-256", "UTF-8")#", cfsqltype="cf_sql_varchar" }
						
					});
					return {
						status: "success",
						message: "Password updated successfully"
					}

				}else {
					return {
						status: "error",
						message: "password not matched"
					}
				}
			}
			
		} catch (any error) {
			return {
				status: "error",
				message: "Server Error #error#"
			}
			
		}
	}

	function getEmail(rc){
		try {
			query_data = queryExecute('select email, firstName, lastName from profiles where profile_id=:profile_id',
            {
				profile_id = { value="#rc.profile_id#", cfsqltype="cf_sql_integer"}
        	});

			if(query_data.recordCount eq 0){
				return {
					status: "error",
					message: "User email not found"
				}
			}

			return{
				status: "success",
				data: query_data
			}
			
		} catch (any error) {
			return {
				status: "error",
				message: "server Error"
			}
		}

	}

	string function generateRandomPassword() {
		var characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		var password = "";
		var maxIndex = len(characters);
		var i = 0;
		for (i = 1; i <= 6; i++) {
			password &= mid(characters, randRange(1, maxIndex), 1);
		}
		return password;
	}

	function forgotPassword(rc){
		try {
			check_email = queryExecute('SELECT EXISTS(SELECT 1 FROM profiles WHERE email = :email) as emailExists',
			{
				email = { value="#rc.email#", cfsqltype="cf_sql_varchar"}
			})
			// writeDump(query_data.emailExists);abort;
			if (check_email.emailExists eq 0) {
				return {
					status: "error",
					message: "Email is not exist"
				}				
			}
			randomPassword = generateRandomPassword();
			// writeDump(randomPassword);abort;
			query_data = queryExecute('update profiles set password=:password where email=:email',
						{
							email = { value="#rc.email#", cfsqltype="cf_sql_varchar"},
							password = { value="#hash("#randomPassword#", "SHA-256", "UTF-8")#", cfsqltype="cf_sql_varchar" }
				
						});
			return{
					status: "success",
					randomPassword: randomPassword
				}
			
		} catch (any error) {
			return{
					status: "error",
					message: "Server Error: #error# " 
				};
		}
	}

	function deleteProfile(rc){
		try {

			check_education = queryExecute('SELECT EXISTS(SELECT 1 FROM educations WHERE profile_id = :profile_id) as educationExists',
			{
				profile_id = { value="#rc.profile_id#", cfsqltype="cf_sql_integer"}
			})
			// writeDump(query_data.emailExists);abort;
			if (check_education.educationExists eq 1) {
				delete_education_query = queryExecute('DELETE FROM educations where profile_id=:profile_id',
										{
											profile_id = { value="#rc.profile_id#", cfsqltype="cf_sql_integer"}
										});				
			}

			query_data = queryExecute('DELETE FROM profiles where profile_id=:profile_id',
            {
				profile_id = { value="#rc.profile_id#", cfsqltype="cf_sql_integer"}
        	});

			// DO DELETE SKILLS

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

	function getPublicProfiles(){
		try {
			query_data = queryExecute("
			SELECT profile_id, profile_image, CONCAT(firstName, ' ', lastName) AS full_name, address
			FROM profiles ");

			// writeDump(query_data); abort;
			
			if(query_data.recordCount eq 0){
				return {
					status: "error",
					message: "user not found"
				}
			}
		
			return {status: "succes", data: query_data}
		
			
		} catch (any error) {
			return {
				status: "error",
				message: "SERVER error #error#"
			}
			
		}
	}

	

}