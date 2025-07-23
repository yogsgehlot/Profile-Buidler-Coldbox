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
				SELECT 
					profiles.profile_image, 
					CONCAT(profiles.firstName, " ", profiles.lastName) AS full_name, 
					posts.post_id, 
					posts.content, 
					posts.media_url, 
					COUNT(post_likes.post_id) AS total_likes,
					(
						SELECT COUNT(*) 
						FROM post_likes 
						WHERE post_likes.post_id = posts.post_id 
						AND post_likes.profile_id = :logged_in_profile
					) AS isLiked
				FROM posts
				INNER JOIN profiles ON posts.profile_id = profiles.profile_id
				LEFT JOIN post_likes ON posts.post_id = post_likes.post_id
				WHERE posts.profile_id = :profile_id
				GROUP BY posts.post_id, profiles.profile_image, profiles.firstName, profiles.lastName, posts.content, posts.media_url
				ORDER BY posts.created_at DESC',
            {
				profile_id = { value="#profile_id#", cfsqltype="cf_sql_integer"},
				logged_in_profile = { value=structKeyExists(session, "user") && structKeyExists(session.user, "profile_id") ? session.user.profile_id : -1, cfsqltype="cf_sql_integer" }
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

	function toggleLike(rc) {
		try {
	
			var alreadyLiked = queryExecute(
				"SELECT 1 FROM post_likes WHERE post_id = :post_id AND profile_id = :profile_id",
				{ 
					post_id =  { value= rc.post_id, cfsqltype="cf_sql_integer"}, 
					profile_id = { value= rc.profile_id, cfsqltype="cf_sql_integer"} 
				}
			);
	
			if (alreadyLiked.recordCount neq 0) {
				
				queryExecute(
					"DELETE FROM post_likes WHERE post_id = :post_id AND profile_id = :profile_id",
					{ 
						post_id =  { value= rc.post_id, cfsqltype="cf_sql_integer"}, 
						profile_id = { value= rc.profile_id, cfsqltype="cf_sql_integer"} 
					}
				);
				return { 
					status: "success",
					btn_status: "disliked",
					message: "post disliked succesfully"
				};
			} else {
				
				queryExecute(
					"INSERT INTO post_likes (post_id, profile_id) VALUES (:post_id, :profile_id)",
					{
						post_id =  { value= rc.post_id, cfsqltype="cf_sql_integer"}, 
						profile_id = { value= rc.profile_id, cfsqltype="cf_sql_integer"} 
					}
				);
				return { 
					status: "success",
					btn_status: "liked",
					message: "post liked succesfully" 
				};
			}
			
		} catch (any error) {
			return {
				status: "error",
				message: "server Error: #error#"
			}
		}
	}

	function getLikesCount(rc){
		try {
			query_data = queryExecute("
							SELECT COUNT(*) AS total_likes
							FROM post_likes
							WHERE post_id = :post_id",
							{
								post_id =  { value= rc.post_id, cfsqltype="cf_sql_integer"} 
							}
			);

			// writeDump(query_data);abort;

			return { 
				status: "success",
				message: "get likes count succesfully",
				total_likes: query_data.total_likes
			};

		} catch (any error) {
			return {
				status: "error",
				message: "server Error: #error#"
			}
		}
	}

	function updatePost(rc){
		try {
			if (rc.isMediaChanged eq 1) {
				var imagePath = "";
				if (structKeyExists(rc, "media_url") && trim(rc.media_url).length()) {
					
					uploadedFile = fileUpload( expandPath("./uploads/posts"), "#rc.media_url#", "image/jpeg,image/pjpeg,image/png,image/svg", "MakeUnique" );
					
					if (not listFindNoCase("jpg,jpeg,png,svg,webP", uploadedFile.serverFileExt)) {
						return {
							status: "error", 
							message: "The uploaded media file is not of type JPG/PNG/SVG."
						}
					}
					imagePath = "/uploads/posts/" & uploadedFile.serverFile;
										
				}
				previousImage_query_data = queryExecute('select media_url from posts where post_id=:post_id',
				{
					post_id = { value="#rc.post_id#", cfsqltype="cf_sql_integer" }
				});
				
				if (previousImage_query_data.recordCount neq 0) {
					previousImage = previousImage_query_data.media_url;
					
					if (!isNull(previousImage) && len(trim(previousImage))) {
						fullPath = expandPath(previousImage);
						
						if (fileExists(fullPath)) {
							fileDelete(fullPath);
						}
					}
				}
				
				query_data = queryExecute('update posts set content=:content,media_url=:media_url where post_id=:post_id',
				{
					post_id = { value="#rc.post_id#", cfsqltype="cf_sql_integer"},
					content = { value="#rc.content#", cfsqltype="cf_sql_longvarchar"},
					media_url = { value=imagePath, cfsqltype="cf_sql_varchar"}
				});

			}else {
				query_data = queryExecute('update posts set content=:content where post_id=:post_id',
				{
					post_id = { value="#rc.post_id#", cfsqltype="cf_sql_integer"},
					content = { value="#rc.content#", cfsqltype="cf_sql_longvarchar"}
				});

				// writeDump(query_data);abort;
			}

			return{
				status: "success",
				message: "Post updated successfully"
			}
			
		} catch (any error) {
			return {
				status: "error",
				message: "server Error: #error#"
			}
		}
	}

	

}