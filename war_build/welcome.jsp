<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome - InstaSmart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #ff9a9e, #fad0c4);
            color: #333;
        }

        header {
            background-color: #fff;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            color: #ff6f61;
            margin: 0;
            font-size: 2.5rem;
        }

        header p {
            margin: 5px 0 0;
            font-size: 1.2rem;
            color: #555;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        nav a {
            color: #ff6f61;
            text-decoration: none;
            font-size: 1rem;
            margin: 0 10px;
        }

        nav a:hover {
            text-decoration: underline;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .products {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-top: 20px;
        }

        .product-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .product-card img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }

        .product-card h3 {
            margin: 15px;
            font-size: 1.2rem;
            color: #ff6f61;
        }

        .product-card p {
            margin: 0 15px 15px;
            color: #555;
        }

        .product-card button {
            display: block;
            width: 100%;
            padding: 10px;
            background: linear-gradient(135deg, #ff6f61, #ff9a9e);
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 1rem;
            transition: background 0.3s ease;
        }

        .product-card button:hover {
            background: linear-gradient(135deg, #ff9a9e, #ff6f61);
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to InstaSmart, <%= session.getAttribute("username") %>!</h1>
        
    </header>

    <nav>
        <div>
            <a href="welcome.jsp">Home</a>
            <a href="product.jsp">Products</a>
            <a href="cart.jsp">Cart</a>
            <a href="profile.jsp">Profile</a>
        </div>
        <a href="logout.jsp">Logout</a>
    </nav>

    <div class="container">
        <h2>Featured Products</h2>
        <div class="products">
            <!-- Product 1: iPhone 13 Pro -->
            <div class="product-card">
                <img src="image/iphone.jpeg" alt="iPhone 13 Pro">
                <h3>iPhone 13 Pro</h3>
                <p>Super Retina XDR display.</p>
                <p><strong>₹59,999</strong></p>
                <form action="cartProcess.jsp" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productName" value="iPhone 13 Pro">
                    <input type="hidden" name="price" value="59999">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <!-- Product 2: MacBook Air -->
            <div class="product-card">
                <img src="image/watch.jpeg" alt="MacBook Air">
                <h3>Apple Watch series 7</h3>
                <p>Stay connected with the latest watch.</p>
                <p><strong>₹5000</strong></p>
                <form action="cartProcess.jsp" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productName" value="MacBook Air">
                    <input type="hidden" name="price" value="99999">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <!-- Product 3: Dell XPS 13 -->
            <div class="product-card">
                <img src="image/dell.jpeg" alt="Dell XPS 13">
                <h3>Dell XPS 13</h3>
                <p>Ultra-thin laptop.</p>
                <p><strong>₹1,29,999</strong></p>
                <form action="cartProcess.jsp" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productName" value="Dell XPS 13">
                    <input type="hidden" name="price" value="129999">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <!-- Product 4: Red Dress -->
            <div class="product-card">
                <img src="image/dress.jpeg" alt="Red Dress">
                <h3>Red Dress</h3>
                <p>Elegant and stylish.</p>
                <p><strong>₹1,999</strong></p>
                <form action="cartProcess.jsp" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productName" value="Red Dress">
                    <input type="hidden" name="price" value="1999">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <!-- Product 5: Floral Dress -->
            <div class="product-card">
                <img src="image/f.jpeg" alt="Floral Dress">
                <h3>Floral Dress</h3>
                <p>Perfect for summer.</p>
                <p><strong>₹2,499</strong></p>
                <form action="cartProcess.jsp" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productName" value="Floral Dress">
                    <input type="hidden" name="price" value="2499">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <!-- Product 6: Black Gown -->
            <div class="product-card">
                <img src="image/B.jpeg" alt="Black Gown">
                <h3>Black Gown</h3>
                <p>Classic evening wear.</p>
                <p><strong>₹3,499</strong></p>
                <form action="cartProcess.jsp" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productName" value="Black Gown">
                    <input type="hidden" name="price" value="3499">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <!-- Product 7: Smart TV -->
            <div class="product-card">
                <img src="image/tv.jpeg" alt="Smart TV">
                <h3>Smart TV</h3>
                <p>4K UHD display.</p>
                <p><strong>₹45,999</strong></p>
                <form action="cartProcess.jsp" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productName" value="Smart TV">
                    <input type="hidden" name="price" value="45999">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <!-- Product 8: Sony WH-1000XM4 -->
            <div class="product-card">
                <img src="image/s.jpeg" alt="Sony WH-1000XM4">
                <h3>Sony WH-1000XM4</h3>
                <p>Noise-canceling.</p>
                <p><strong>₹34,999</strong></p>
                <form action="cartProcess.jsp" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productName" value="Sony WH-1000XM4">
                    <input type="hidden" name="price" value="34999">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <!-- Product 9: JBL Speaker -->
            <div class="product-card">
                <img src="image/jbl.jpeg" alt="JBL Speaker">
                <h3>JBL Speaker</h3>
                <p>Powerful sound.</p>
                <p><strong>₹9,999</strong></p>
                <form action="cartProcess.jsp" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productName" value="JBL Speaker">
                    <input type="hidden" name="price" value="9999">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <!-- Product 10: Atomic Habits -->
            <div class="product-card">
                <img src="image/A.jpeg" alt="Atomic Habits">
                <h3>Atomic Habits</h3>
                <p>Self-improvement.</p>
                <p><strong>₹499</strong></p>
                <form action="cartProcess.jsp" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productName" value="Atomic Habits">
                    <input type="hidden" name="price" value="499">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <!-- Product 11: Rich Dad Poor Dad -->
            <div class="product-card">
                <img src="image/r.jpeg" alt="Rich Dad Poor Dad">
                <h3>Rich Dad Poor Dad</h3>
                <p>Financial wisdom.</p>
                <p><strong>₹399</strong></p>
                <form action="cartProcess.jsp" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productName" value="Rich Dad Poor Dad">
                    <input type="hidden" name="price" value="399">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <!-- Product 12: Deep Work -->
            <div class="product-card">
                <img src="image/deepwork.jpeg" alt="Deep Work">
                <h3>Deep Work</h3>
                <p>Focus mastery.</p>
                <p><strong>₹599</strong></p>
                <form action="cartProcess.jsp" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productName" value="Deep Work">
                    <input type="hidden" name="price" value="599">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>