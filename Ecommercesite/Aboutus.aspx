<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Aboutus.aspx.cs" Inherits="Ecommercesite.Aboutus" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mobizone | About Us</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500;700&family=Poppins:wght@400;500;600&display=swap" rel="stylesheet" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #f9fbff;
        }

        /* Navbar */
        .navbar {
            background: linear-gradient(90deg, #0a192f, #1e2a44);
            box-shadow: 0 4px 15px rgba(0,0,0,0.25);
            padding: 12px 0;
        }

        .navbar-brand {
            font-size: 28px;
            font-weight: 700;
            font-family: 'Orbitron', sans-serif;
            color: #4dabf7 !important;
            letter-spacing: 2px;
            display: flex;
            align-items: center;
            gap: 8px;
            text-shadow: 0 0 8px rgba(77,171,247,0.6);
        }

        .nav-link {
            font-weight: 500;
            color: #fff !important;
            margin: 0 10px;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            color: #4dabf7 !important;
            text-shadow: 0 0 8px rgba(77,171,247,0.6);
        }

        /* Hero Section */
        .hero {
            text-align: center;
            padding: 80px 20px;
            background: linear-gradient(135deg, #e6f0ff, #f9f9f9);
        }

        .hero h1 {
            font-size: 44px;
            font-weight: 700;
            color: #1e2a44;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 18px;
            color: #555;
            max-width: 750px;
            margin: auto;
            margin-bottom: 40px;
        }

        /* About Content */
        .about-section {
            padding: 60px 20px;
            max-width: 1000px;
            margin: auto;
        }

        .about-section h2 {
            font-size: 32px;
            font-weight: 700;
            color: #1e2a44;
            margin-bottom: 20px;
            text-align: center;
        }

        .about-section p {
            font-size: 16px;
            color: #555;
            line-height: 1.8;
            text-align: justify;
        }

        .team-cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            margin-top: 50px;
        }

        .team-card {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
            width: 250px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .team-card:hover {
            transform: translateY(-5px);
        }

        .team-card img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            margin-bottom: 15px;
        }

        .team-card h3 {
            font-size: 20px;
            color: #1e2a44;
            margin-bottom: 5px;
        }

        .team-card p {
            font-size: 14px;
            color: #777;
        }

        /* Footer */
        footer {
            background: #0a192f;
            color: #aaa;
            text-align: center;
            padding: 20px 0;
            margin-top: 50px;
        }

        footer a {
            color: #4dabf7;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand" href="UserHome.aspx">
                    <i class="bi bi-phone-fill"></i> Mobizone
                </a>
                <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="UserHome.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="Userregisteration.aspx">Register</a></li>
                        <li class="nav-item"><a class="nav-link" href="Loginpage.aspx">Login</a></li>
                        <li class="nav-item"><a class="nav-link active" href="About.aspx">About Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- HERO SECTION -->
        <div class="hero">
            <h1>About Mobizone</h1>
            <p>We are dedicated to providing you with the latest mobile technology and the best online shopping experience. Our mission is to make mobile shopping simple, reliable, and fun.</p>
        </div>

        <!-- ABOUT CONTENT -->
        <div class="about-section">
            <h2>Our Story</h2>
            <p>
                Mobizone was founded in 2025 with a vision to revolutionize the online mobile shopping experience. 
                Our platform offers a wide range of mobile phones, accessories, and gadgets, ensuring that our customers have access 
                to the latest technology trends. We value trust, transparency, and customer satisfaction above all.
            </p>

            <h2>Our Team</h2>
            <div class="team-cards">
                <div class="team-card">
                    <img src="images/team1.jpg" alt="Team Member">
                    <h3>John Doe</h3>
                    <p>Founder & CEO</p>
                </div>
                <div class="team-card">
                    <img src="images/team2.jpg" alt="Team Member">
                    <h3>Jane Smith</h3>
                    <p>Head of Operations</p>
                </div>
                <div class="team-card">
                    <img src="images/team3.jpg" alt="Team Member">
                    <h3>Emily Johnson</h3>
                    <p>Marketing Lead</p>
                </div>
            </div>
        </div>

        <!-- FOOTER -->
        <footer>
            <p>© 2025 Mobizone. All Rights Reserved. | <a href="Contact.aspx">Contact Us</a></p>
        </footer>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
