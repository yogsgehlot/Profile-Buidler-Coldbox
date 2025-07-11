<cfoutput>
    <!--- #writeDump(cgi)# --->
    <div class="container-fluid p-sm-5 p-3">

        <div class="container rounded-5 border shadow-lg " style="min-height: 50vh">
            <div class="p-sm-5 p-3 gap-3 ">
                <div class="row">
                    
                    <div class=" col-md-4 d-flex  justify-content-end">
                        <img src="includes\images\6310507.jpg" class="w-100">
                    </div>

                    <div class="offset-sm-1 col-md-6 d-flex flex-column justify-content-center row">
                        <form id="login_form">                              
                                <div class="mb-3 ">
                                    <label for="email" class="form-label">Email address</label>
                                    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp">
                                </div>

                                <div class="mb-3 ">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" name="password" class="form-control" id="password">
                                </div>

                                <div class="gap-3 d-flex  align-items-center">

                                    <button type="submit" class="btn btn-primary">Login</button>
                                    <a href="#event.buildLink("authentication.forgotPasswordView") #">Forgot Password</a>
                                </div>
                        </form>
                        <a class="my-2" href="#event.buildLink("authentication.registerView") #">don't have an account..?</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</cfoutput>

