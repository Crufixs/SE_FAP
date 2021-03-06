
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page import="model.Cart"%>
<%@page import="model.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Cart | Bean&Bean</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
        <link rel="stylesheet" href="cart.css">
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            User u = (User) session.getAttribute("user");
            Cart myCart = (Cart) session.getAttribute("cart");
            if (myCart == null || u == null) {
                response.sendRedirect("home.jsp");
                return;
            }
            List<CartItem> cart = myCart.getCart();
//                User u = (User) session.getAttribute("user");

        %>
    </head>
    <body style="background-color: #F0E7DE;">
        <!-- HEADER -->
        <%@include file="header.jsp" %>

        <div class="container">
            <main>
                <div class="py-5 text-center">
                    <h2>CHECKOUT FORM</h2>
                    <hr>
                </div>
                <div class="row g-5">
                    <div class="col-md-5 col-lg-4 order-md-last">
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-secondary">Your cart</span>
                            <span class="badge bg-secondary rounded-pill"><%=myCart.getQuantityInCart()%></span>
                        </h4>
                        <ul class="list-group mb-3">
                            <%
                                for (CartItem c : cart) {
                                    for (int i = c.getQuantity(); i > 0; i--) {
                            %>
                            <li class="list-group-item justify-content-between lh-sm">
                                <div>
                                    <h6 class="my-0"><%=c.getProduct().getName()%></h6>
                                </div>
                                <span class="text-muted">&#8369;<%=c.getProduct().getPrice()%></span>
                                <form method="POST" action="cart" class="text-end">
                                    <input type="hidden" name="id" value="<%=c.getCartItemID()%>"/>
                                    <button type="submit" name="action" value="remove" class="btn btn-danger">Remove</button>
                                </form>
                            </li>
                            <%
                                    }
                                }
                            %>
                            <li class="list-group-item d-flex justify-content-between">
                                <span>Total</span>
                                <strong>&#8369;<%=myCart.getTotalPrice()%></strong>
                            </li>
                        </ul>
                        <!--<br>-->
                        <p><i>Note: Shipping fee is shouldered by the buyer.</i></p>
                        <!--<input class="form-control" type="text" pattern="^[0-9]*$" placeholder="Change for (PHP):">-->
                        <br>

                        <!--        <br>-->
                        <!--<br>-->
                        <% if (request.getSession().getAttribute("order") != null) {%>
                        <form method="POST" action="PDFServlet" target="_blank">
                            <button class="w-100 btn btn-secondary btn-lg" type="submit">Get Receipt</button>
                            <input type="hidden" name="type" value="receipt">
                        </form>
                        <% }%>

                    </div>
                    <div class="col-md-7 col-lg-8">
                        <h4 class="mb-3">Shipping address</h4>
                        <form method="POST" action="Checkout" class="needs-validation">
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <label for="firstName" class="form-label">First name</label>
                                    <input type="text" name="firstName" class="form-control" id="firstName" placeholder="Your firstname..." value="<%=u.getFirstName()%>" required>
                                    <div class="invalid-feedback">
                                        Valid first name is required.
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <label for="lastName" class="form-label">Last name</label>
                                    <input type="text" name="lastName" class="form-control" id="lastName" placeholder="Your lastname..." value="<%=u.getLastName()%>" required>
                                    <div class="invalid-feedback">
                                        Valid last name is required.
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="username" class="form-label">Phone Number</label>
                                    <div class="input-group has-validation">
                                        <!--                <span class="input-group-text">@</span>-->
                                        <input type="text" name="phoneNumber" class="form-control" id="username" placeholder="e.g. 09123456789" pattern="^(09)\d{9}$" value="<%=u.getPhoneNumber()%>" required>
                                        <div class="invalid-feedback">
                                            Your phone number is required.
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" name="email" class="form-control" id="email" placeholder="e.g. you@gmail.com" value="<%=u.getEmail()%>">
                                    <div class="invalid-feedback">
                                        Please enter a valid email address for shipping updates.
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="address" class="form-label">Street/Landmark</label>
                                    <input type="text" name="street" class="form-control" id="address" placeholder="e.g. 67 Anonas St., near St. Joseph Church" value="<%=u.getStreet()%>"required>
                                    <div class="invalid-feedback">
                                        Please enter your shipping address.
                                    </div>
                                </div>

                                <div class="col-md-5">
                                    <label for="country" class="form-label">Barangay</label>
                                    <input type="text" name="barangay" class="form-control" id="address" placeholder="e.g. Brgy. Quirino 2-A" value="<%=u.getBarangay()%>"required>
                                    <!--              <select class="form-select" id="country" required>
                                                    <option value="">Choose...</option>
                                                    <option>United States</option>
                                                  </select>-->
                                    <div class="invalid-feedback">
                                        Please select a valid barangay.
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label for="state" class="form-label">City</label>
                                    <input type="text" name="city" class="form-control" id="address" placeholder="e.g. Quezon City" value="<%=u.getCity()%>"required>
                                    <!--              <select class="form-select" id="state" required>
                                                    <option value="">Choose...</option>
                                                    <option>California</option>-->
                                    <!-- </select> -->
                                    <div class="invalid-feedback">
                                        Please provide a valid city.
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <label for="zip" class="form-label">Region</label>
                                    <input type="text" name="region" class="form-control" id="address" value="<%=u.getRegion()%>" disabled="disabled" required>
                                    <!--<input type="text" class="form-control" id="zip" placeholder="" required>-->
                                    <!--              <div class="invalid-feedback">
                                                    Zip code required.
                                                  </div>-->
                                </div>
                            </div>

                            <hr class="my-4">

                            <input class="form-control" type="text" placeholder="Note: e.g. sugar level 25%">

                            <hr class="my-4">

                            <h4 class="mb-3">Payment</h4>

                            <div class="my-3">
                                <div class="form-check">
                                    <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
                                    <label class="form-check-label" for="credit">Cash On Delivery</label>
                                </div>
                                <br>
                            </div>
                            <button class="w-100 btn btn-secondary btn-lg" type="submit"><svg style="width: 30px; height: 30px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
                                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                </svg>&nbsp;&nbsp;Place Order</button>
                            <br>
                            <br>
                        </form>
                    </div>
                </div>
            </main>
        </div>
        <!-- Footer -->
        <%@include file="footer.jsp" %>
        <!-- Footer -->
    </body>
</html>