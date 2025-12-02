<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminhome.aspx.cs" Inherits="Ecommercesite.Adminhome" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Maxtho Mobiles | Admin Dashboard</title>

    <!-- Google Fonts & Bootstrap -->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        :root {
            --accent: #ffd500; /* Neon Yellow */
            --text-dark: #1f2933;
            --muted: #6b7280;
            --bg-light: #f5f5f7;
            --card-bg: #ffffff;
            --radius: 14px;
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
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(8px);
            border-bottom: 1px solid rgba(0, 0, 0, 0.08);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
        }

        .navbar-brand {
            font-family: 'Bebas Neue', cursive;
            font-size: 34px;
            color: var(--accent);
            text-shadow: 0 0 10px rgba(255, 213, 0, 0.3);
            letter-spacing: 1px;
        }

        .nav-link {
            color: var(--text-dark) !important;
            font-weight: 600;
            transition: color 0.2s ease;
        }

        .nav-link:hover {
            color: var(--accent) !important;
        }

        .logout-btn {
            border: 2px solid var(--accent);
            border-radius: 30px;
            color: var(--text-dark);
            padding: 6px 16px;
            font-weight: 600;
            background: linear-gradient(180deg, #ffffff, #fdfdfd);
            transition: all 0.25s ease;
            text-decoration: none;
        }

        .logout-btn:hover {
            background: var(--accent);
            color: #000 !important;
            box-shadow: 0 0 15px rgba(255, 213, 0, 0.4);
        }

        /* Dashboard Section */
        .dashboard-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px 100px;
        }

        .dashboard-container h1 {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 42px;
            color: var(--accent);
            letter-spacing: 1px;
        }

        .dashboard-container p {
            color: var(--muted);
            font-size: 16px;
        }

        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 28px;
            margin-top: 40px;
        }

        .dash-btn {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
            background: var(--card-bg);
            border-radius: var(--radius);
            border: 1px solid rgba(0, 0, 0, 0.08);
            box-shadow: 0 8px 18px rgba(0, 0, 0, 0.04);
            text-decoration: none;
            color: var(--text-dark);
            font-weight: 600;
            transition: all 0.25s ease;
        }

        .dash-btn i {
            font-size: 38px;
            color: var(--accent);
            margin-bottom: 10px;
            transition: transform 0.25s ease;
        }

        .dash-btn:hover {
            transform: translateY(-8px);
            border-color: var(--accent);
            box-shadow: 0 10px 30px rgba(255, 213, 0, 0.2);
        }

        .dash-btn:hover i {
            transform: translateY(-4px);
            color: #000;
        }

        /* Footer */
        footer {
            background: #fff;
            color: var(--muted);
            text-align: center;
            padding: 18px 0;
            border-top: 1px solid rgba(0, 0, 0, 0.05);
        }

        footer a {
            color: var(--accent);
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .navbar-brand { font-size: 28px; }
            .dashboard-container h1 { font-size: 32px; }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container d-flex justify-content-between align-items-center">
            <a class="navbar-brand" href="Adminhome.aspx">
                <i class="bi bi-lightning-charge"></i> Maxtho Admin
            </a>
            <div class="d-flex align-items-center gap-3">
                
               
                <a href="Loginpage.aspx" class="logout-btn">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </a>
            </div>
        </div>
    </nav>

    <!-- DASHBOARD -->
    <main class="dashboard-container text-center">
        <h1>Admin Dashboard</h1>
        <p>Manage your products, categories, and user feedback efficiently.</p>

        <section class="dashboard">
            <a href="Productadd.aspx" class="dash-btn">
                <i class="bi bi-plus-circle"></i>
                Add Product
            </a>
            <a href="Categoryadd.aspx" class="dash-btn">
                <i class="bi bi-tags"></i>
                Add Category
            </a>
            <a href="Editproduct.aspx" class="dash-btn">
                <i class="bi bi-pencil-square"></i>
                Edit Product
            </a>
            <a href="Editcategory.aspx" class="dash-btn">
                <i class="bi bi-folder2-open"></i>
                Edit Category
            </a>
            <a href="Viewfeedback.aspx" class="dash-btn">
                <i class="bi bi-chat-left-text"></i>
                View Feedback
            </a>
            <a href="UserManagement.aspx" class="dash-btn">
                <i class="bi bi-people"></i>
                Manage Users
            </a>
        </section>
    </main>

    <!-- FOOTER -->
    <footer>
        <p>© 2025 Maxtho Mobiles | Designed for Efficiency | <a href="Contact.aspx">Contact Support</a></p>
    </footer>

</form>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
