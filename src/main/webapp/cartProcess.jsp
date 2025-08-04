<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%
    // Retrieve the session and cart
    HttpSession sessionObj = request.getSession();
    ArrayList<HashMap<String, Object>> cart = (ArrayList<HashMap<String, Object>>) sessionObj.getAttribute("cart");

    // Initialize the cart if it doesn't exist
    if (cart == null) {
        cart = new ArrayList<>();
        sessionObj.setAttribute("cart", cart);
    }

    // Retrieve the action (add, increase, decrease, remove, checkout) and product details
    String action = request.getParameter("action");
    String productName = request.getParameter("productName");
    String priceStr = request.getParameter("price");
    String indexStr = request.getParameter("index");

    // Sanitize the product name
    if (productName != null) {
        productName = productName.trim(); // Remove leading/trailing spaces
        productName = productName.replaceAll("[^a-zA-Z0-9\\s]", ""); // Remove special characters
    }

    // Sanitize the price
    double price = 0;
    if (priceStr != null) {
        try {
            // Remove non-numeric characters (e.g., currency symbols, commas)
            priceStr = priceStr.replaceAll("[^\\d.]", "");
            price = Double.parseDouble(priceStr); // Parse the sanitized price
        } catch (NumberFormatException e) {
            out.println("Invalid price format: " + priceStr);
        }
    }

    // Handle the action
    if ("add".equals(action)) {
        // Add a new item to the cart
        boolean productExists = false;
        for (HashMap<String, Object> item : cart) {
            if (item.get("name").equals(productName)) {
                int quantity = (int) item.get("quantity");
                item.put("quantity", quantity + 1);
                productExists = true;
                break;
            }
        }

        if (!productExists) {
            HashMap<String, Object> newItem = new HashMap<>();
            newItem.put("name", productName);
            newItem.put("price", price);
            newItem.put("quantity", 1);
            cart.add(newItem);
        }
    } else if ("increase".equals(action)) {
        // Increase the quantity of an item
        int index = Integer.parseInt(indexStr);
        if (index >= 0 && index < cart.size()) {
            HashMap<String, Object> item = cart.get(index);
            int quantity = (int) item.get("quantity");
            item.put("quantity", quantity + 1);
        }
    } else if ("decrease".equals(action)) {
        // Decrease the quantity of an item
        int index = Integer.parseInt(indexStr);
        if (index >= 0 && index < cart.size()) {
            HashMap<String, Object> item = cart.get(index);
            int quantity = (int) item.get("quantity");
            if (quantity > 1) {
                item.put("quantity", quantity - 1);
            } else {
                cart.remove(index); // Remove the item if quantity is 1
            }
        }
    } else if ("remove".equals(action)) {
        // Remove an item from the cart
        int index = Integer.parseInt(indexStr);
        if (index >= 0 && index < cart.size()) {
            cart.remove(index);
        }
    } else if ("checkout".equals(action)) {
        // Handle checkout (clear the cart)
        cart.clear();
    }

    // Update the cart in the session
    sessionObj.setAttribute("cart", cart);

    // Redirect back to the cart page
    response.sendRedirect("cart.jsp");
%>