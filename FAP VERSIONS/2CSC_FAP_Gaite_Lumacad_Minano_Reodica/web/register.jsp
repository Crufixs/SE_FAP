<%-- 
    Document   : index
    Created on : May 11, 2021, 2:19:03 PM
    Author     : Carlo
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href = "webcss.css"/>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Sign Up | Bean&Bean</title>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            User u = (User) session.getAttribute("user");
            if (u == null || u.getCustomerID() != -1) {
                response.sendRedirect("home.jsp");
                return;
            }

        %>
    </head>
    <body style="background-color: #F0E7DE;">
        <!-- HEADER -->
        <%@include file="header.jsp" %>
        <div class="container">
            <div class="py-4">
                <h1 class="fs-3 fw-bold form-label primary-text">Create Account</h1>
                <hr>
            </div>
            <div class="container mb-5">
                <form method="post" action="Signup" class="rounded divider-color py-3 px-4 mx-lg-5">
                    <label class="fs-3 fw-bold form-label primary-text">Credentials</label>
                    <div class="form-floating mb-3">
                        <input type="text" name="uname" value="${input.uname}" class="form-control primary-text" id="floatingInput" placeholder="Username" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Username must contain at least 6 characters (Letters, Numbers, Symbols e.g. period, dashes, underscore)" pattern="^[a-zA-Z0-9._-]{6,}$" required>
                        <label for="floatingInput">Username</label>
                        <p style="color: red"><i>${errors.usernameTaken}</i></p>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="email" name="email" value="${input.email}" class="form-control primary-text" id="floatingInput" placeholder="Email Address" data-bs-toggle="tooltip" data-bs-placement="bottom" title="e.g. usermail@gmail.com" required>
                        <label for="floatingInput">Email Address</label>
                        <p style="color: red"><i>${errors.emailTaken}</i></p>
                    </div>

                    <div class="row row-cols-1 g-4 row-cols-sm-2">
                        <div class="col">
                            <div class="form-floating mb-3">
                                <input type="password" name="psw" value="${input.psw}" class="form-control primary-text" id="floatingInput" placeholder="Password" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Password must contain at least 8 characters, at least one letter and number." pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" required>
                                <label for="floatingInput">Password</label>
                                <p style="color: red"><i>${errors.pwMismatch}</i></p>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-floating mb-3">
                                <input type="password" name="confirmPsw" value="${input.confirmPsw}" class="form-control primary-text" id="floatingInput" placeholder="Confirm Password" required>
                                <label for="floatingInput">Confirm Password</label>
                            </div>
                        </div>
                    </div>

                    <label class="fs-3 fw-bold form-label primary-text">Full Name</label>
                    <div class="row row-cols-1 g-2">
                        <div class="row row-cols-1 g-2 row-cols-sm-2">
                            <div class="col">
                                <div class="form-floating mb-3">
                                    <input type="text" name="firstName" value="${input.firstName}" class="form-control primary-text" id="floatingInput" placeholder="First Name" required>
                                    <label for="floatingInput">First Name</label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-floating mb-3">
                                    <input type="text" name="lastName" value="${input.lastName}" class="form-control primary-text" id="floatingInput" placeholder="Last Name" required>
                                    <label for="floatingInput">Last Name</label>
                                </div>
                            </div>
                        </div>

                        <label class="fs-3 fw-bold form-label primary-text">Contact No.</label>
                        <div class="form-floating mb-3">
                            <input type="tel" name="phoneNumber" value="${input.phoneNumber}" class="form-control primary-text" id="phone" name="phone" placeholder="Phone Number" data-bs-toggle="tooltip" data-bs-placement="bottom" title="e.g. 09123456789" pattern="^(09)\d{9}$" required>
                            <label for="floatingInput">Phone Number</label>
                        </div>
                    </div>

                    <div>  
                        <label class="fs-3 fw-bold form-label primary-text">Permanent Address</label>
                        <div class="row row-cols-1 row-cols-sm-2">
                            <div class="col">
                                <div class="form-floating mb-3">
                                    <input type="text" name="region" value="National Capital Region" class="form-control primary-text" disabled="disabled" required>
                                    <!--                        <select id="region" name="region"  class="form-select form-select-md mb-3 primary-text" aria-label=".form-select-lg example" required>
                                                                <option value="" disabled selected>Region</option>
                                                            </select>-->
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-floating mb-3">
                                    <input type="text" name="city" value="${input.city}" class="form-control primary-text" id="floatingInput" placeholder="City"
                                           data-bs-toggle="tooltip" data-bs-placement="bottom" title="e.g. Quezon City" required>
                                    <label for="floatingInput">City</label>
                                </div>
                                <!--                        <select id="province" name="province" class="form-select form-select-md mb-3 primary-text" aria-label=".form-select-lg example" required>
                                                            <option value="" disabled selected>Province</option>
                                                        </select>-->
                            </div>
                            <div class="col">
                                <div class="form-floating mb-3">
                                    <input type="text" name="barangay" value="${input.barangay}" class="form-control primary-text" id="floatingInput" placeholder="Barangay" data-bs-toggle="tooltip" data-bs-placement="bottom" title="e.g. Barangay Quirino 2-A" required>
                                    <label for="floatingInput">Barangay</label>
                                </div>
                                <!--                        <select id="city" name="city" class="form-select form-select-md mb-3 primary-text" aria-label=".form-select-lg example" required>
                                                            <option value="" disabled selected>City</option>
                                                        </select>-->
                            </div>
                            <div class="col">
                                <div class="form-floating mb-3">
                                    <input type="text" name="street" value="${input.street}" class="form-control primary-text" id="floatingInput" placeholder="Street/Landmark" data-bs-toggle="tooltip" data-bs-placement="bottom" title="e.g. 67 Anonas St., near St. Joseph Church" required>
                                    <label for="floatingInput">Street/Landmark</label>
                                </div>
                                <!--                        <select id="barangay" name="barangay" class="form-select form-select-md mb-3 primary-text" aria-label=".form-select-lg example" required>
                                                            <option value="" disabled selected>Barangay</option>
                                                        </select>-->
                            </div>
                        </div>
                    </div>
                    <!--<input type="text" name="street" class="form-control primary-text" placeholder="Street/Landmark" aria-describedby="emailHelp" required>-->
                    <!--<br>-->
                    <!-- <label class="fs-3 fw-bold form-label primary-text">Mobile Number</label> -->
                    <div class="text-center">     
                        <div class="col">
                            <label class="fs-3 fw-bold form-label primary-text">What can you see?</label>
                            <br>
                            <img src="CaptchaGenerator" alt="None">
                            <br><br>
                            <input type="text" name="captcha" class="form-control primary-text" id="captcha" name="captcha" placeholder="Captcha" required>
                            <p style="color: red"><i>${errors.captcha}</i></p>
                        </div>

                        <div class="col">
                            <div>
                                <button type="submit" class="w-100 btn btn-secondary">Sign Up</button>
                            </div>
                        </div>
                    </div>
                    <br>

                </form>
            </div>
        </div>
        <!-- Footer -->
        <%@include file="footer.jsp" %>
        <!-- Footer -->
        <!--        <script type="text/javascript">
                    var my_handlers = {
        
                        fill_provinces: function () {
        
                            var region_code = $(this).val();
                            $('#province').ph_locations('fetch_list', [{"region_code": region_code}]);
        
                        },
        
                        fill_cities: function () {
        
                            var province_code = $(this).val();
                            $('#city').ph_locations('fetch_list', [{"province_code": province_code}]);
                        },
        
                        fill_barangays: function () {
        
                            var city_code = $(this).val();
                            $('#barangay').ph_locations('fetch_list', [{"city_code": city_code}]);
                        }
                    };
        
                    $(function () {
                        $('#region').on('change', my_handlers.fill_provinces);
                        $('#province').on('change', my_handlers.fill_cities);
                        $('#city').on('change', my_handlers.fill_barangays);
                        $('#region').ph_locations({'location_type': 'regions'});
                        $('#province').ph_locations({'location_type': 'provinces'});
                        $('#city').ph_locations({'location_type': 'cities'});
                        $('#barangay').ph_locations({'location_type': 'barangays'});
                        $('#region').ph_locations('fetch_list');
        
                        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                            return new bootstrap.Tooltip(tooltipTriggerEl)
                        })
                    });
                </script>-->
    </body>
</html>
