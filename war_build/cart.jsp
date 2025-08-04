<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cart - InstaSmart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #FF5733 0%, #C70039 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            animation: fadeIn 1s ease-in-out;
            width: 600px;
        }
        .card-header {
            background: #900C3F;
            color: white;
            text-align: center;
            border-radius: 15px 15px 0 0;
        }
        .card-body {
            padding: 2rem;
        }
        .btn-primary {
            background: #FF5733;
            border: none;
            border-radius: 10px;
            width: 100%;
            padding: 10px;
            font-size: 1.1rem;
            transition: background 0.3s ease;
        }
        .btn-primary:hover {
            background: #C70039;
        }
        .btn-danger {
            border-radius: 5px;
            padding: 5px 10px;
        }
        .quantity-control {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="card">
        <div class="card-header">
            <h3><i class="fas fa-shopping-cart"></i> Your Cart</h3>
        </div>
        <div class="card-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        ArrayList<HashMap<String, Object>> cart = (ArrayList<HashMap<String, Object>>) session.getAttribute("cart");
                        double total = 0;
                        if (cart != null && !cart.isEmpty()) {
                            for (int i = 0; i < cart.size(); i++) {
                                HashMap<String, Object> item = cart.get(i);
                                String name = (String) item.get("name");
                                double price = (double) item.get("price");
                                Integer quantityObj = (Integer) item.get("quantity");
                                int quantity = (quantityObj != null) ? quantityObj : 0;
                                total += price * quantity;

                                // Debugging: Print item details
                                out.println("Name: " + name + ", Price: " + price + ", Quantity: " + quantity);
                    %>
                    <tr>
                        <td><%= name %></td>
                        <td>₹<%= String.format("%.2f", price) %></td>
                        <td>
                            <div class="quantity-control">
                                <form action="cartProcess.jsp" method="post" style="display: inline;">
                                    <input type="hidden" name="index" value="<%= i %>">
                                    <input type="hidden" name="action" value="decrease">
                                    <button type="submit" class="btn btn-sm btn-secondary">-</button>
                                </form>
                                <span><%= quantity %></span>
                                <form action="cartProcess.jsp" method="post" style="display: inline;">
                                    <input type="hidden" name="index" value="<%= i %>">
                                    <input type="hidden" name="action" value="increase">
                                    <button type="submit" class="btn btn-sm btn-secondary">+</button>
                                </form>
                            </div>
                        </td>
                        <td>
                            <form action="cartProcess.jsp" method="post">
                                <input type="hidden" name="index" value="<%= i %>">
                                <input type="hidden" name="action" value="remove">
                                <button type="submit" class="btn btn-danger btn-sm">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%  }
                        } else { %>
                    <tr>
                        <td colspan="4">Your cart is empty.</td>
                    </tr>
                    <% } %>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="3">Total</th>
                        <th>₹<%= String.format("%.2f", total) %></th>
                    </tr>
                </tfoot>
            </table>
            <form action="checkout.jsp" method="post">
                <input type="hidden" name="action" value="checkout">
                <button type="submit" class="btn btn-primary"><i class="fas fa-credit-card"></i> Proceed to Checkout</button>
            </form>
            <div class="text-center mt-3">
                <a href="welcome.jsp"><i class="fas fa-arrow-left"></i> Continue Shopping</a>
            </div>
        </div>
    </div>
</body>
</html>