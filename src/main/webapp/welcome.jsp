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
        .notification-bar {
            background: linear-gradient(90deg, #ffe0e0 60%, #fffbe0 100%);
            border-radius: 8px;
            box-shadow: 0 2px 8px #ffd6d6;
            padding: 16px 24px;
            margin-bottom: 18px;
            font-size: 1.1rem;
        }
        .notification-title {
            font-weight: bold;
            color: #ff6f61;
            font-size: 1.2rem;
            margin-right: 10px;
        }
        .promo {
            background: #ff6f61;
            color: #fff;
            padding: 2px 8px;
            border-radius: 6px;
        }
        .recommend-bar {
            background: linear-gradient(90deg, #e0f7fa 60%, #e0ffe0 100%);
            border-radius: 8px;
            box-shadow: 0 2px 8px #d6f7ff;
            padding: 16px 24px;
            margin-bottom: 18px;
            font-size: 1.1rem;
        }
        .recommend-title {
            font-weight: bold;
            color: #009688;
            font-size: 1.2rem;
            margin-right: 10px;
        }
        .modal {
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 4px 16px #aaa;
            text-align: center;
        }
        .close {
            color: #ff6f61;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
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
        <div style="display: flex; align-items: center; justify-content: center;">
            <h1>Welcome to InstaSmart, <span style="color:#333;"> <%= session.getAttribute("username") != null ? session.getAttribute("username") : "Guest" %></span>!</h1>
            <p style="font-size:1rem;color:#888;">Shop the latest products and enjoy exclusive deals.</p>
        </div>
        <form action="search.jsp" method="get" style="margin-top:20px;display:flex;justify-content:center;">
            <input type="text" name="query" placeholder="Search products..." style="padding:10px;width:300px;border-radius:20px;border:1px solid #ff6f61;">
            <button type="submit" style="padding:10px 20px;margin-left:10px;background:#ff6f61;color:#fff;border:none;border-radius:20px;cursor:pointer;">Search</button>
        </form>
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
        <div style="display:flex;justify-content:space-between;align-items:center;">
            <h2>Featured Products</h2>
            <div>
                <a href="profile.jsp" style="margin-right:15px;color:#ff6f61;text-decoration:none;font-weight:bold;">My Profile</a>
                <a href="cart.jsp" style="margin-right:15px;color:#ff6f61;text-decoration:none;font-weight:bold;">My Cart</a>
                <a href="orders.jsp" style="color:#ff6f61;text-decoration:none;font-weight:bold;">My Orders</a>
            </div>
        </div>

        <!-- Notifications -->
        <div style="background:#fff3e0;border-left:5px solid #ff6f61;padding:10px 20px;margin-bottom:20px;border-radius:6px;">
        <div class="notification-bar">
            <span class="notification-title">🔔 Notifications</span>
            <ul>
                <li><b>Welcome back, <%= session.getAttribute("username") %>!</b> Check out today’s deals.</li>
                <li><b>Get 10% off</b> on your first order. Use code: <span class="promo">INSTA10</span></li>
                <li><b>Free shipping</b> on orders above <span class="promo">₹5,000</span>!</li>
            </ul>
        </div>
        <div class="recommend-bar">
            <span class="recommend-title">🌟 Recommended for you</span>
            <ul>
                <li><b>Apple Watch Series 7</b> - Stay connected and fit!</li>
                <li><b>Deep Work</b> - Boost your productivity.</li>
                <li><b>Smart TV</b> - Upgrade your entertainment experience.</li>
            </ul>
        </div>
        <div class="products">
            <!-- Product Modal -->
            <div id="productModal" class="modal" style="display:none;">
                <div class="modal-content">
                    <span class="close" onclick="closeModal()">&times;</span>
                    <img id="modalImg" src="" alt="Product" style="width:200px;height:auto;border-radius:8px;box-shadow:0 2px 8px #aaa;">
                    <h2 id="modalTitle"></h2>
                    <p id="modalDesc"></p>
                    <p id="modalPrice" style="font-weight:bold;color:#ff6f61;"></p>
                    <div id="modalReviews">
                        <h3>Reviews & Feedback</h3>
                        <ul>
                            <li>⭐️⭐️⭐️⭐️⭐️ Excellent product!</li>
                            <li>⭐️⭐️⭐️⭐️ Good value for money.</li>
                        </ul>
                        <textarea id="modalComment" placeholder="Add your comment..." style="width:100%;padding:8px;border-radius:6px;margin-top:10px;"></textarea>
                        <button onclick="addComment()" style="margin-top:8px;padding:8px 16px;background:#ff6f61;color:#fff;border:none;border-radius:6px;cursor:pointer;">Submit</button>
                        <div id="userComments"></div>
                    </div>
                </div>
            </div>
            <!-- Product 13: Samsung Galaxy S23 -->
            <div class="product-card">
                <img src="image/samsung.jpeg" alt="Samsung Galaxy S23">
                <h3>Samsung Galaxy S23</h3>
                <p>Flagship Android smartphone.</p>
                <p><strong>₹74,999</strong></p>
                <form action="cartProcess.jsp" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productName" value="Samsung Galaxy S23">
                    <input type="hidden" name="price" value="74999">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <!-- Product 14: Nike Air Max -->
            <div class="product-card">
                <img src="image/nike.jpeg" alt="Nike Air Max">
                <h3>Nike Air Max</h3>
                <p>Comfortable running shoes.</p>
                <p><strong>₹8,499</strong></p>
                <form action="cartProcess.jsp" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productName" value="Nike Air Max">
                    <input type="hidden" name="price" value="8499">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <!-- Product 15: HP Envy Laptop -->
            <div class="product-card">
                <img src="image/hp.jpeg" alt="HP Envy Laptop">
                <h3>HP Envy Laptop</h3>
                <p>Powerful and portable.</p>
                <p><strong>₹89,999</strong></p>
                <form action="cartProcess.jsp" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productName" value="HP Envy Laptop">
                    <input type="hidden" name="price" value="89999">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <!-- Product 16: Kindle Paperwhite -->
            <div class="product-card">
                <img src="image/kindle.jpeg" alt="Kindle Paperwhite">
                <h3>Kindle Paperwhite</h3>
                <p>Read anywhere, anytime.</p>
                <p><strong>₹12,999</strong></p>
                <form action="cartProcess.jsp" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productName" value="Kindle Paperwhite">
                    <input type="hidden" name="price" value="12999">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>
            <!-- Product 1: iPhone 13 Pro -->
            <div class="product-card" onmouseover="openModal('image/iphone.jpeg','iPhone 13 Pro','Super Retina XDR display.','₹59,999')" onmouseout="closeModal()">
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
    <script>
        function openModal(img, title, desc, price) {
            document.getElementById('productModal').style.display = 'block';
            document.getElementById('modalImg').src = img;
            document.getElementById('modalTitle').innerText = title;
            document.getElementById('modalDesc').innerText = desc;
            document.getElementById('modalPrice').innerText = price;
        }
        function closeModal() {
            document.getElementById('productModal').style.display = 'none';
        }
        function addComment() {
            var comment = document.getElementById('modalComment').value;
            if(comment.trim() !== '') {
                var div = document.getElementById('userComments');
                var p = document.createElement('p');
                p.innerText = comment;
                div.appendChild(p);
                document.getElementById('modalComment').value = '';
            }
        }
    </script>
</body>
</html>