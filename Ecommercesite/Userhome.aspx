<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Userhome.aspx.cs" Inherits="Ecommercesite.Userhome" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Maxtho Mobiles | Home</title>

    <!-- Google Fonts & Bootstrap -->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        :root {
            --accent: #ffea00;
            --accent-hover: #ffe600;
            --text-dark: #1f2933;
            --muted: #6b7280;
            --bg-light: #f4f4f6;
        }

        body {
            margin: 0;
            font-family: 'Manrope', sans-serif;
            background: linear-gradient(180deg, #ffffff, #f9f9fa);
            color: var(--text-dark);
            padding-top: 80px;
        }

        /* ===== Navbar ===== */
        .navbar {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(8px);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        }

        .navbar-brand {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 34px;
            letter-spacing: 1px;
            color: var(--accent);
            text-shadow: 0 0 5px rgba(255, 230, 0, 0.5);
        }

        .nav-link {
            color: var(--text-dark) !important;
            font-weight: 600;
            transition: color 0.3s ease;
            position: relative;
        }

        .nav-link:hover {
            color: var(--accent) !important;
        }

        .nav-link.active {
            color: var(--accent) !important;
        }

        .nav-link.active::after {
            content: "";
            position: absolute;
            bottom: -6px;
            left: 0;
            width: 100%;
            height: 2px;
            background: var(--accent);
            border-radius: 2px;
        }

        /* ===== Hero Section ===== */
        .hero {
            text-align: center;
            padding: 140px 20px 120px;
            background: linear-gradient(135deg, #ffffff 40%, #f7f7f7 100%);
            position: relative;
            overflow: hidden;
        }

        /* Neon circle effect */
        .hero::before {
            content: "";
            position: absolute;
            top: -200px;
            left: 50%;
            width: 600px;
            height: 600px;
            transform: translateX(-50%);
            background: radial-gradient(circle, rgba(255,234,0,0.3) 0%, transparent 70%);
            border-radius: 50%;
            animation: pulse 6s infinite;
            z-index: 0;
        }

        .hero h1 {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 64px;
            letter-spacing: 1px;
            margin-bottom: 20px;
            position: relative;
            animation: fadeInUp 1s ease-out forwards, glowText 3s ease-in-out infinite;
        }

        .hero p {
            max-width: 700px;
            margin: 0 auto 40px;
            font-size: 19px;
            color: var(--muted);
            position: relative;
        }

        /* Shop button */
        .btn-shop {
            font-size: 18px;
            padding: 14px 36px;
            border-radius: 14px;
            background: var(--accent);
            color: #000;
            font-weight: 700;
            border: none;
            box-shadow: 0 8px 25px rgba(255, 230, 0, 0.4);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .btn-shop:hover {
            background: var(--accent-hover);
            transform: translateY(-4px);
        }

        .btn-shop::after {
            content: "";
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,234,0,0.3) 20%, transparent 60%);
            opacity: 0;
            transform: scale(0.5);
            animation: pulse 3s infinite;
            z-index: -1;
        }

        /* ===== Features Section ===== */
        .features {
            padding: 80px 0;
            background: #fff;
        }

        .feature-box {
            text-align: center;
            padding: 30px;
            transition: all 0.3s ease;
            border-radius: 16px;
        }

        .feature-box:hover {
            background: #fffbe6;
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(255, 234, 0, 0.2);
        }

        .feature-box i {
            font-size: 36px;
            color: var(--accent);
            margin-bottom: 12px;
        }

        /* ===== Footer ===== */
        footer {
            background: #f7f7f7;
            color: var(--muted);
            text-align: center;
            padding: 28px 0;
            margin-top: 60px;
            font-size: 15px;
            border-top: 3px solid var(--accent);
        }

        footer a {
            color: var(--accent);
            text-decoration: none;
            font-weight: 600;
        }

        footer a:hover {
            text-decoration: underline;
        }

        /* ===== Animations ===== */
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes glowText {
            0%, 100% { text-shadow: 0 0 6px var(--accent), 0 0 15px var(--accent); }
            50% { text-shadow: 0 0 12px #000, 0 0 22px var(--accent); }
        }

        @keyframes pulse {
            0% { opacity: 0.4; transform: scale(0.5); }
            50% { opacity: 0; transform: scale(1.5); }
            100% { opacity: 0; transform: scale(2); }
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">
            <a class="navbar-brand" href="Userhome.aspx"><i class="bi bi-phone"></i> Maxtho Mobiles</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link active" href="Userhome.aspx">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="Userregisteration.aspx">Register</a></li>
                   
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="nav-link" PostBackUrl="~/Feedback.aspx">
                            Feedback
                        </asp:LinkButton>
                     <li class="nav-item"><a class="nav-link" href="Loginpage.aspx">Logout</a></li>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- HERO -->
    <section class="hero">
        <h1>Welcome to Maxtho Mobiles</h1>
        <p>Discover the latest smartphones, unbeatable offers, and trusted mobile accessories.  
           Shop with us and stay connected to innovation.</p>

        <asp:Button ID="btnShopNow" runat="server" CssClass="btn-shop" Text="Shop Now" OnClick="btnShopNow_Click" />
    </section>

    <!-- FEATURES -->
    <section class="features">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="feature-box shadow-sm">
                        <i class="bi bi-phone-flip"></i>
                        <h5>Latest Smartphones</h5>
                        <p>Explore new launches from top brands at competitive prices.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-box shadow-sm">
                        <i class="bi bi-shield-check"></i>
                        <h5>Trusted Quality</h5>
                        <p>All our products are 100% genuine and quality checked.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-box shadow-sm">
                        <i class="bi bi-truck"></i>
                        <h5>Fast Delivery</h5>
                        <p>Enjoy reliable and quick delivery across major locations.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FOOTER -->
    <footer>
        <p>© 2025 <strong>Maxtho Mobiles</strong>. All Rights Reserved. | <a href="Contact.aspx">Contact Us</a></p>
    </footer>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
