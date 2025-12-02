<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="Ecommercesite.Feedback" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Maxtho Mobiles | Feedback</title>

    <!-- Google Fonts & Bootstrap -->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        :root {
            --accent: #ffea00;
            --accent-hover: #ffd500;
            --text-dark: #1f2933;
            --muted: #6b7280;
            --bg-light: #f9f9fa;
        }

        body {
            margin: 0;
            font-family: 'Manrope', sans-serif;
            background: linear-gradient(180deg, #ffffff, var(--bg-light));
            color: var(--text-dark);
            padding-top: 80px;
        }

        /* Navbar */
        .navbar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(8px);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        }

        .navbar-brand {
            font-family: 'Bebas Neue', cursive;
            font-size: 34px;
            color: var(--accent);
            text-shadow: 0 0 5px rgba(255, 230, 0, 0.6);
        }

        .nav-link {
            color: var(--text-dark) !important;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .nav-link:hover, .nav-link.active {
            color: var(--accent) !important;
        }

        /* Feedback Section */
        .feedback-section {
            padding: 120px 20px 80px;
            text-align: center;
        }

        .feedback-section h2 {
            font-family: 'Bebas Neue', cursive;
            font-size: 46px;
            margin-bottom: 15px;
        }

        .feedback-section p {
            font-size: 16px;
            color: var(--muted);
            margin-bottom: 40px;
        }

        .feedback-box {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            max-width: 650px;
            margin: 0 auto;
            padding: 40px;
            text-align: left;
        }

        .form-label {
            font-weight: 600;
            color: var(--text-dark);
        }

        .form-control {
            border-radius: 12px;
            padding: 12px;
            margin-bottom: 20px;
        }

        /* Star Rating */
        .rating i {
            font-size: 28px;
            color: #ddd;
            cursor: pointer;
            transition: color 0.3s ease;
        }
        .rating i.active,
        .rating i:hover,
        .rating i:hover ~ i {
            color: var(--accent);
        }

        /* Submit Button */
        .btn-submit {
            background: var(--accent);
            color: #000;
            border: none;
            font-weight: 700;
            padding: 12px 32px;
            border-radius: 12px;
            transition: all 0.3s ease;
        }

        .btn-submit:hover {
            background: var(--accent-hover);
            transform: translateY(-3px);
            box-shadow: 0 4px 15px rgba(255, 230, 0, 0.3);
        }

        footer {
            background: #fff;
            color: var(--muted);
            text-align: center;
            padding: 28px 0;
            margin-top: 70px;
            font-size: 15px;
        }

        footer a {
            color: var(--accent);
            font-weight: 600;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container">
                <a class="navbar-brand" href="Userhome.aspx"><i class="bi bi-phone"></i> Maxtho Mobiles</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="Userhome.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="Userregisteration.aspx">Register</a></li>
                       
                        <li class="nav-item"><a class="nav-link active" href="Feedback.aspx">Feedback</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Feedback Section -->
        <section class="feedback-section">
            <h2>We Value Your Feedback</h2>
            <p>Your suggestions help us improve our services.</p>

            <div class="feedback-box">
                <!-- Rating -->
                <div class="mb-4 text-center">
                    <asp:Label ID="Label3" runat="server" CssClass="form-label d-block mb-2" Text="Rate your experience"></asp:Label>
                    <div class="rating">
                        <i class="bi bi-star" onclick="setRating(1)"></i>
                        <i class="bi bi-star" onclick="setRating(2)"></i>
                        <i class="bi bi-star" onclick="setRating(3)"></i>
                        <i class="bi bi-star" onclick="setRating(4)"></i>
                        <i class="bi bi-star" onclick="setRating(5)"></i>
                    </div>
                </div>

                <!-- Feedback Text -->
                <div class="mb-3">
                    <asp:Label ID="Label1" runat="server" CssClass="form-label" Text="Your Review"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Type your feedback here..."></asp:TextBox>
                </div>

                <!-- Submit Button -->
                <div class="text-center">
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-submit" Text="Submit Feedback" OnClick="Button1_Click" />
                </div>

                <!-- Success Message -->
                <div class="mt-3 text-center">
                    <asp:Label ID="Label2" runat="server" CssClass="text-success fw-semibold"></asp:Label>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer>
            <p>© 2025 <strong>Maxtho Mobiles</strong>. All Rights Reserved. | <a href="Contact.aspx">Contact Us</a></p>
        </footer>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Star Rating (Frontend)
        function setRating(stars) {
            const starIcons = document.querySelectorAll('.rating i');
            starIcons.forEach((star, index) => {
                if (index < stars) {
                    star.classList.add('active');
                    star.classList.remove('bi-star');
                    star.classList.add('bi-star-fill');
                } else {
                    star.classList.remove('active');
                    star.classList.remove('bi-star-fill');
                    star.classList.add('bi-star');
                }
            });
        }
    </script>
</body>
</html>
