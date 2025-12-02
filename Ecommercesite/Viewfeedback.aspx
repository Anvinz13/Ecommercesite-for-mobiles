<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Viewfeedback.aspx.cs" Inherits="Ecommercesite.Viewfeedback" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Maxtho Mobiles | View Feedback</title>

    <!-- Google Fonts & Bootstrap -->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        :root {
            --accent: #ffd500; /* Neon Yellow */
            --text-dark: #1f2933;
            --muted: #6b7280;
            --bg-light: #f9f9fa;
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
            background: #fff;
            border-bottom: 1px solid rgba(0,0,0,0.06);
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
        }

        .navbar-brand {
            font-family: 'Bebas Neue', cursive;
            font-size: 30px;
            color: var(--accent);
            letter-spacing: 1px;
        }

        .nav-link, .logout-btn {
            font-weight: 600;
            color: var(--text-dark) !important;
            margin-left: 12px;
            border-radius: 30px;
            padding: 6px 16px;
            border: 2px solid var(--accent);
            background: #fff;
            transition: all 0.25s ease;
        }

        .nav-link:hover, .logout-btn:hover {
            background: var(--accent);
            color: #000 !important;
            box-shadow: 0 0 12px rgba(255,213,0,0.4);
        }

        /* Page Header */
        .page-header {
            text-align: center;
            padding: 60px 20px 20px;
        }

        .page-header h1 {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 42px;
            color: var(--accent);
            margin-bottom: 10px;
        }

        .page-header p {
            color: var(--muted);
            font-size: 16px;
        }

        /* GridView */
        .gridview-container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 30px;
            background: #fff;
            border-radius: var(--radius);
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
            animation: fadeUp 0.6s ease-out;
        }

        .gridview-container h3 {
            margin-bottom: 20px;
            font-weight: 700;
            color: var(--text-dark);
        }

        .gridview-container .table {
            border-radius: 12px;
            overflow: hidden;
        }

        .gridview-container th {
            background: var(--accent);
            text-align: center;
            color: #000;
            font-weight: 700;
            font-size: 15px;
        }

        .gridview-container td {
            text-align: center;
            vertical-align: middle;
            font-weight: 500;
        }

        /* Reply Button */
        .reply-link {
            display: inline-block;
            border: 2px solid var(--accent);
            border-radius: 8px;
            padding: 6px 14px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            color: var(--text-dark);
        }

        .reply-link:hover {
            background: var(--accent);
            color: #000 !important;
            box-shadow: 0 0 10px rgba(255,213,0,0.4);
        }

        /* Footer */
        footer {
            background: #fff;
            color: var(--muted);
            text-align: center;
            padding: 20px 0;
            border-top: 1px solid rgba(0,0,0,0.06);
            margin-top: 60px;
        }

        footer a {
            color: var(--accent);
            font-weight: 600;
            text-decoration: none;
        }

        footer a:hover { text-decoration: underline; }

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container">
                <a class="navbar-brand" href="Adminhome.aspx">
                    <i class="bi bi-lightning-charge"></i> Maxtho Admin
                </a>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a href="Adminhome.aspx" class="logout-btn">Home</a></li>
                        <li class="nav-item"><a href="Loginpage.aspx" class="logout-btn">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- HEADER -->
        <div class="page-header">
            <h1>Customer Feedback</h1>
            <p>View and respond to customer reviews.</p>
        </div>

        <!-- FEEDBACK GRID -->
        <div class="gridview-container">
            <h3>Feedback List</h3>

            <asp:GridView ID="gridview1" runat="server"
                CssClass="table table-bordered table-hover"
                AutoGenerateColumns="False"
                DataKeyNames="Review_id">

                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Username" />
                    <asp:BoundField DataField="Review_message" HeaderText="Feedback" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server"
                                CommandArgument='<%# Eval("Review_id") %>'
                                OnCommand="LinkButton1_Command1"
                                CssClass="reply-link">
                                Reply
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:Label ID="Label1" runat="server" CssClass="d-block mt-3 text-success fw-bold"></asp:Label>
            <a href="Adminhome.aspx" class="btn btn-outline-dark mt-3">
                <i class="bi bi-house-door"></i> Back to Admin Home
            </a>
        </div>

        <!-- FOOTER -->
        <footer>
            <p>© 2025 <strong>Maxtho Mobiles</strong> | Admin Panel | <a href="Contact.aspx">Contact Support</a></p>
        </footer>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
