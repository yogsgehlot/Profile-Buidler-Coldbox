/**
 * I am a new service
 */
component singleton {

	PostsService function init(){
		
		return this;
	}

	function addPost(rc){
		try {
			if (structKeyExists(rc, "media_url") && trim(rc.media_url).length()) {

				uploadedFile = fileUpload( expandPath("./uploads/posts"), "#rc.media_url#", "image/jpeg,image/pjpeg,image/png,image/svg", "MakeUnique" );
				
				if (not listFindNoCase("jpg,jpeg,png,svg,webP", uploadedFile.serverFileExt)) {
					return {
						status: "error", 
						message: "The uploaded media file is not of type JPG/PNG/SVG."
					}
				}
				var imagePath = "/uploads/posts/" & uploadedFile.serverFile;
			}else {
				var imagePath = "";
			}

			
			query_data = queryExecute('INSERT INTO posts(profile_id,content,media_url) values(:profile_id,:content,:media_url)',
            {
				profile_id = { value="#rc.profile_id#", cfsqltype="cf_sql_integer"},
				content = { value="#rc.content#", cfsqltype="cf_sql_longvarchar"},
				media_url = { value=imagePath, cfsqltype="cf_sql_varchar"}
        	});

			return{
				status: "success",
				message: "Post uploaded successfully"
			}
			
		} catch (any error) {
			return {
				status: "error",
				message: "server Error: #error#"
			}
		}
	}

	function getPosts(profile_id){
		try {
			// writeDump(rc);abort;
			query_data = queryExecute('
				SELECT profile_image, CONCAT(firstName, " ", lastName) AS full_name, content, media_url 
				FROM posts INNER JOIN profiles on posts.profile_id = profiles.profile_id
				WHERE posts.profile_id = :profile_id
				ORDER BY posts.created_at DESC',
            {
				profile_id = { value="#profile_id#", cfsqltype="cf_sql_integer"}
        	});

			return{
				status: "success",
				data: query_data,
				message: "Posts read successfully"
			}
			
		} catch (any error) {
			return {
				status: "error",
				message: "server Error: #error#"
			}
		}
	}


}