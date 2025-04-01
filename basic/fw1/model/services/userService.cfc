
component accessors="true" {
    property fw;

    /**
	 * Store a user
	 *
	 * @param	username		Username
	 * @param	password		Password
	 * @param	email	Emailaddress
	 * @param	roleId			Role (optional)
	 */
	public struct function store(
		required string username,
		required string password,
		required string email,
		string roleId
		
	) {
		local.user = entityNew("User");
		local.user.setUsername(left(arguments.username, 50));
		local.user.setPasswordHash(GenerateBCryptHash(arguments.password));
		local.user.setEmail(arguments.email);

		local.user.setCreated(now());
		if (!structKeyExists(arguments, "roleId")) {
			arguments.roleId = 1;
		}
		local.user.setRole(arguments.roleId);
		entitySave(local.user);
		ORMFlush();
		entityReload(local.user);

		return  {
			"id": local.user.getId(),
			"username": local.user.getUsername(),
			"email": local.user.getEmail(),
			"roleId": local.user.getRoleId() ,
			"created": local.user.getCreated()
		};;
	}


	// /**
    //  * Log in a user securely
    //  *
    //  * @param email  User's login email
    //  * @param password  Plain-text password
    //  * @return Struct   User details with token if successful
    //  */
    // public struct function login(
    //     required string email,
    //     required string password
    // ) {
    //     local.users = entityLoad("User", { email = arguments.email });

    //     if (arrayLen(local.user) == 0) {
    //         throw( type="AuthenticationError", message="Invalid username or password." );
    //     }

    //     local.user = local.users[1];

    //     // Verify the password using BCrypt
    //     if (!verifyBCryptHash(arguments.password, local.user.getPasswordHash())) {
    //         throw( type="AuthenticationError", message="Invalid username or password." );
    //     }

    //     // 3. Generate a JWT token for authentication
    //     local.token = generateJWT( local.user );

    //     // 4. Update last login timestamp
    //     local.user.setLastLogin( now() );
    //     entitySave(local.user);

    //     // 5. Return success response
    //     return {
    //         success = true,
    //         message = "Login successful",
    //         token = local.token,
    //         user = {
    //             id = local.user.getId(),
    //             username = local.user.getUsername(),
    //             email = local.user.getEmail(),
    //             roleId = local.user.getRoleId()
    //         }
    //     };
    // }

    // /**
    //  * Generate JWT Token
    //  */
    // private string function generateJWT(required struct user) {
    //     var payload = {
    //         "id": user.getId(),
    //         "username": user.getUsername(),
    //         "roleId": user.getRoleId(),
    //         "exp": dateAdd("h", 2, now()) // Token expires in 2 hours
    //     };

    //     return jwtSign(
    //         payload=payload,
    //         secret="YOUR_SECRET_KEY",
    //         algorithm="HS256"
    //     );
    // }
    
}