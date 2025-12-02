<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reply.aspx.cs" Inherits="Ecommercesite.reply" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Maxtho Mobiles | Reply to Feedback</title>

    <!-- Google Fonts & Bootstrap -->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        :root {
            --accent: #ffd500; /* Neon Yellow */
            --accent-hover: #ffcc00;
            --text-dark: #1f2933;
            --muted: #6b7280;
            --radius: 14px;
        }

        body {
            margin: 0;
            font-family: 'Manrope', sans-serif;
            background: linear-gradient(180deg, #ffffff, #f8f9fa);
            color: var(--text-dark);
            padding-top: 80px;
        }

        /* Navbar */
        .navbar {
            background: rgba(255, 255, 255, 0.92);
            backdrop-filter: blur(8px);
            border-bottom: 1px solid rgba(0,0,0,0.06);
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }

        .navbar-brand {
            font-family: 'Bebas Neue', cursive;
            font-size: 32px;
            color: var(--accent);
            text-shadow: 0 0 8px rgba(255, 213, 0, 0.5);
            letter-spacing: 1px;
        }

        .nav-link {
            color: var(--text-dark) !important;
            font-weight: 600;
            margin-left: 12px;
            transition: color 0.2s ease;
        }

        .nav-link:hover, .nav-link.active {
            color: var(--accent) !important;
        }

        /* Reply Section */
        .reply-section {
            padding: 60px 20px;
        }

        .reply-card {
            max-width: 700px;
            margin: 0 auto;
            background: #fff;
            border-radius: var(--radius);
            padding: 40px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            animation: fadeUp 0.6s ease-out;
        }

        .reply-card h2 {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 40px;
            text-align: center;
            margin-bottom: 30px;
            color: var(--accent);
        }

        .form-label {
            font-weight: 600;
            color: var(--text-dark);
        }

        .form-control {
            border-radius: 10px;
            padding: 10px 14px;
            border: 1px solid #ddd;
            box-shadow: none;
        }

        .form-control:focus {
            border-color: var(--accent);
            box-shadow: 0 0 6px rgba(255, 213, 0, 0.3);
        }

        .btn-send {
            background: var(--accent);
            border: none;
            color: #000;
            font-weight: 700;
            padding: 14px 20px;
            border-radius: 12px;
            width: 100%;
            transition: all 0.3s ease;
            font-size: 16px;
        }

        .btn-send:hover {
            background: var(--accent-hover);
            transform: translateY(-2px);
            box-shadow: 0 0 12px rgba(255, 213, 0, 0.4);
        }

        /* Footer */
        footer {
            background: #fff;
            color: var(--muted);
            text-align: center;
            padding: 24px 0;
            margin-top: 60px;
            font-size: 15px;
            border-top: 1px solid rgba(0,0,0,0.06);
        }

        footer a {
            color: var(--accent);
            text-decoration: none;
            font-weight: 600;
        }

        footer a:hover {
            text-decoration: underline;
        }

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container">
                <a class="navbar-brand" href="Adminhome.aspx"><i class="bi bi-lightning-charge"></i> Maxtho Admin</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="Adminhome.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="Loginpage.aspx">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Reply Section -->
        <section class="reply-section">
            <div class="reply-card">
                <h2>Send Email Reply</h2>

                <div class="mb-3">
                    <label for="TextBox1" class="form-label">To</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Recipient's email"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label for="TextBox2" class="form-label">From</label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Your email"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label for="TextBox3" class="form-label">Subject</label>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="Subject"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label for="TextBox4" class="form-label">Message</label>
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Write your message here..."></asp:TextBox>
                </div>

                <asp:Button ID="Button1" runat="server" CssClass="btn btn-send" Text="Send Email" OnClick="Button1_Click" />
            </div>
        </section>

        <!-- Footer -->
        <footer>
            <p>© 2025 Maxtho Mobiles | Admin Panel | <a href="Contact.aspx">Contact Support</a></p>
        </footer>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
