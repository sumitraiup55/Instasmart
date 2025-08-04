<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Confirmation - InstaSmart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #ff9a9e, #fad0c4);
            color: #333;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            animation: fadeIn 1s ease-in-out;
            width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
        }
        .card-header {
            background: #900C3F;
            color: white;
            text-align: center;
            border-radius: 15px 15px 0 0;
            padding: 15px;
        }
        .card-body {
            padding: 20px;
        }
        .btn-primary {
            background: #FF5733;
            border: none;
            border-radius: 10px;
            width: 100%;
            padding: 10px;
            font-size: 1.1rem;
            color: #fff;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        .btn-primary:hover {
            background: #C70039;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="card">
        <div class="card-header">
            <h3><i class="fas fa-check-circle"></i> Payment Confirmation</h3>
        </div>
        <div class="card-body">
            <%
                // Retrieve payment details from the request
                String cardNumber = request.getParameter("cardNumber");
                String expiryDate = request.getParameter("expiryDate");
                String cvv = request.getParameter("cvv");

                // Retrieve the cart from the session
                ArrayList<HashMap<String, Object>> cart = (ArrayList<HashMap<String, Object>>) session.getAttribute("cart");
                double total = 0;
                if (cart != null && !cart.isEmpty()) {
                    for (HashMap<String, Object> item : cart) {
                        double price = (double) item.get("price");
                        int quantity = (int) item.get("quantity");
                        total += price * quantity;
                    }
                }
            %>
            <h4>Order Summary</h4>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (cart != null && !cart.isEmpty()) {
                        for (HashMap<String, Object> item : cart) {
                            String name = (String) item.get("name");
                            double price = (double) item.get("price");
                            int quantity = (int) item.get("quantity");
                    %>
                    <tr>
                        <td><%= name %></td>
                        <td>₹<%= price %></td>
                        <td><%= quantity %></td>
                        <td>₹<%= price * quantity %></td>
                    </tr>
                    <% }
                    } else { %>
                    <tr>
                        <td colspan="4">Your cart is empty.</td>
                    </tr>
                    <% } %>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="3">Total</th>
                        <th>₹<%= total %></th>
                    </tr>
                </tfoot>
            </table>
            <h4>Payment Details</h4>
            <p><strong>Card Number:</strong> **** **** **** <%= cardNumber.substring(cardNumber.length() - 4) %></p>
            <p><strong>Expiry Date:</strong> <%= expiryDate %></p>
            <p><strong>CVV:</strong> ***</p>
            <form action="welcome.jsp" method="post">
                <button type="submit" class="btn btn-primary">Continue Shopping</button>
            </form>
        </div>
    </div>
</body>
</html>