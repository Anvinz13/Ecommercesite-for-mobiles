<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="singleprd.aspx.cs" Inherits="Ecommercesite.viewallprod" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Maxtho Mobiles | Product Details</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet" />
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        :root {
            --accent: #ffd400;
            --accent-dark: #e6c200;
            --text-dark: #1f1f1f;
            --muted: #6b7280;
            --bg-light: #f9f9f9;
        }

        body {
            font-family: 'Manrope', sans-serif;
            background: linear-gradient(180deg, #ffffff, var(--bg-light));
            color: var(--text-dark);
            padding-top: 80px;
        }

        /* NAVBAR */
        .navbar {
            background: #fff;
            border-bottom: 1px solid rgba(0,0,0,0.08);
            box-shadow: 0 4px 16px rgba(0,0,0,0.05);
        }
        .navbar-brand {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 32px;
            color: var(--accent) !important;
            letter-spacing: 1px;
            text-shadow: 0 0 8px rgba(255,212,0,0.5);
        }
        .nav-link {
            color: var(--text-dark) !important;
            font-weight: 600;
            margin: 0 12px;
            transition: 0.2s;
        }
        .nav-link:hover { color: var(--accent) !important; }

        /* PRODUCT CARD */
        .product-card {
            background: #fff;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 12px 32px rgba(0,0,0,0.08);
            transition: transform 0.3s ease;
        }
        .product-card:hover { transform: translateY(-4px); }

        .product-title {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 34px;
            letter-spacing: 1px;
            color: var(--text-dark);
        }
        .product-price {
            font-size: 26px;
            font-weight: 700;
            color: var(--accent);
        }
        .product-description {
            font-size: 0.95rem;
            color: var(--muted);
            margin: 14px 0;
        }
        .stock-status {
            font-weight: 600;
            margin-top: 6px;
        }
        .stock-status.in { color: green; }
        .stock-status.out { color: red; }

        /* Quantity controls */
        .quantity-box {
            display: flex;
            gap: 10px;
            align-items: center;
            margin-top: 20px;
        }
        .quantity-box .form-control {
            text-align: center;
            font-weight: 600;
        }

        /* Buttons */
        .btn-cart {
            background: var(--accent);
            color: #000;
            font-weight: 700;
            border-radius: 12px;
            padding: 10px 26px;
            transition: 0.25s;
        }
        .btn-cart:hover {
            background: var(--accent-dark);
            transform: translateY(-3px);
        }
        .btn-outline-dark {
            font-weight: 600;
            border-radius: 12px;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">
            <a class="navbar-brand" href="UserHome.aspx">
                <i class="bi bi-phone"></i> Maxtho Mobiles
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="Userhome.aspx">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="userpage.aspx">Products</a></li>
                    <li class="nav-item"><a class="nav-link" href="viewcart.aspx"><i class="bi bi-cart"></i> Cart</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- PRODUCT DETAILS -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-9 product-card">
                <div class="row g-4 align-items-center">
                    <!-- Image -->
                    <div class="col-md-5 text-center">
                        <asp:Image ID="Image1" runat="server" CssClass="img-fluid rounded shadow" />
                    </div>
                    <!-- Info -->
                    <div class="col-md-7">
                        <asp:Label ID="Label6" runat="server" CssClass="product-title"></asp:Label>
                        <div class="product-price mt-2">₹ <asp:Label ID="Label7" runat="server"></asp:Label></div>
                        <div class="product-description"><asp:Label ID="Label8" runat="server"></asp:Label></div>
                        <div class="stock-status in">Stock: <asp:Label ID="Label9" runat="server"></asp:Label></div>

                        <!-- Quantity -->
                        <div class="quantity-box">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="-" CssClass="btn btn-outline-secondary btn-sm" />
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Width="70px"></asp:TextBox>
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="+" CssClass="btn btn-outline-secondary btn-sm" />
                        </div>

                        <!-- Actions -->
                        <div class="mt-4">
                            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Add to Cart" CssClass="btn btn-cart me-2" />
                            <asp:Button ID="Button4" runat="server" Text="Continue Shopping" PostBackUrl="Userhome.aspx" CssClass="btn btn-outline-dark" />
                        </div>

                        <!-- Hidden IDs -->
                        <asp:Label ID="Label10" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="Label11" runat="server" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
