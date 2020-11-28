<%@ page pageEncoding="utf-8"%>
<section id="form" style="margin-left: 450px;margin-top: 10px;margin-bottom: 50px; width: auto; height: auto;border-radius: 5px; "><!--form-->
    <div class="container" >
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto" style="background-color: rgb(234, 235, 227);">
                <div class="card card-signin my-5">
                    <div class="card-body">
                        <h1 class="card-title text-center">Sign In</h1>
                        <form class="form-signin">
                            <div class="form-label-group">
                                <label for="inputEmail">Email address</label>
                                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>

                            </div>
                            <div class="form-label-group">
                                <label for="inputPassword">Password</label>
                                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>

                            </div>

                            <div class="custom-control custom-checkbox mb-3">
                                <input type="checkbox" class="custom-control-input" id="customCheck1">
                                <label class="custom-control-label" for="customCheck1">Remember password</label>
                            </div>
                            <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button>
                            <hr class="my-4">
                            <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign in with Google</button>
                            <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>