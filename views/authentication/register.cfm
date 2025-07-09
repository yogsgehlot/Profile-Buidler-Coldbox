<cfoutput>
    <div class="container-fluid p-5">

        <div class="container rounded-5 border shadow-lg " style="min-height: 50vh">
            <div class="p-5 gap-3 ">
                <div class="row">
                    <div class=" col-md-4  d-flex justify-content-end">
                        <img src="includes\images\3094352.jpg" class="w-100">
                    </div>

                    <div class=" col-md-6 d-flex flex-column justify-content-center row">
                        <form id="register_form">
                            <div class="row">

                                <div class="mb-3 col-md-6">
                                    <label for="name" class="form-label"> First Name</label>
                                    <input type="text" class="form-control" id="firstName" name="firstName"
                                        aria-describedby="nameHelp">
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label for="name" class="form-label">Last Name</label>
                                    <input type="text" class="form-control" id="lastName" name="lastName"
                                        aria-describedby="nameHelp">
                                </div>

                                <div class="mb-3 col-md-6">
                                    <label for="email" class="form-label">Email address</label>
                                    <input type="email" class="form-control" id="email" name="email"
                                        aria-describedby="emailHelp">

                                </div>

                                <div class="mb-3 col-md-6">
                                    <label for="phoneNumber" class="form-label">PhoneNumber</label>
                                    <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber"
                                        aria-describedby="phoneHelp">
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="password" name="password">
                                </div>


                                <div class="mb-3 col-md-6">
                                    <label for="confirm_password" class="form-label">Confirm Password</label>
                                    <input type="password" class="form-control" id="confirm_password"
                                        name="confirm_password">
                                </div>

                                <div class="mb-3 ">
                                    <label for="address" class="form-label">Address</label>
                                    <textarea class="form-control" id="address" aria-describedby="addressHelp"
                                        name="address" placeholder="Enter your Address"></textarea>
                                </div>
                            </div>

                             <div class="gap-3 d-flex  align-items-center">
                                <button type="submit" class="btn btn-primary">Register</button>
                                <a class="my-2" href="#event.buildLink("authentication.loginView") #">already have an account..?</a>
                            </div>
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>

</cfoutput>