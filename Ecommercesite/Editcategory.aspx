<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Editcategory.aspx.cs" Inherits="Ecommercesite.Editcategory" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Maxtho Mobiles | Edit Category</title>

    <!-- Google Fonts & Bootstrap -->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        :root {
            --accent: #ffd500; /* Neon Yellow */
            --text-dark: #1f2933;
            --muted: #6b7280;
            --bg-light: #f7f7f9;
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
            background: rgba(255,255,255,0.9);
            backdrop-filter: blur(8px);
            border-bottom: 1px solid rgba(0,0,0,0.06);
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }

        .navbar-brand {
            font-family: 'Bebas Neue', cursive;
            font-size: 32px;
            color: var(--accent);
            text-shadow: 0 0 10px rgba(255, 213, 0, 0.4);
            letter-spacing: 1px;
        }

        /* Neon buttons for Home + Logout */
        .logout-btn {
            border: 2px solid var(--accent);
            border-radius: 30px;
            color: var(--text-dark);
            padding: 6px 16px;
            font-weight: 600;
            background: linear-gradient(180deg, #ffffff, #fdfdfd);
            transition: all 0.25s ease;
            text-decoration: none;
            margin-left: 10px;
        }

        .logout-btn:hover {
            background: var(--accent);
            color: #000 !important;
            box-shadow: 0 0 15px rgba(255, 213, 0, 0.4);
        }

        /* Header */
        .page-header {
            text-align: center;
            padding: 60px 20px 20px;
        }

        .page-header h1 {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 42px;
            letter-spacing: 1px;
            color: var(--accent);
        }

        .page-header p {
            color: var(--muted);
            font-size: 16px;
        }

        /* Main Container */
        .gridview-container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 30px;
            background: #fff;
            border-radius: var(--radius);
            box-shadow: 0 8px 22px rgba(0, 0, 0, 0.06);
            animation: fadeUp 0.6s ease-out;
        }

        .gridview-container h3 {
            margin-bottom: 20px;
            color: var(--text-dark);
            font-weight: 700;
            text-align: left;
        }

        .gridview-container .table {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0,0,0,0.03);
        }

        .gridview-container th {
            background: var(--accent);
            color: #000;
            font-weight: 700;
            font-size: 15px;
            text-align: center;
        }

        .gridview-container td {
            background: #fff;
            vertical-align: middle;
            color: var(--text-dark);
            font-weight: 500;
        }

        .gridview-container img {
            border-radius: 6px;
            margin-top: 4px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }

        /* Action buttons */
        .btn-outline-primary {
            border-radius: 8px;
            border: 2px solid var(--accent);
            font-weight: 600;
            color: var(--text-dark);
            transition: all 0.3s ease;
        }

        .btn-outline-primary:hover {
            background: var(--accent);
            color: #000;
            box-shadow: 0 6px 16px rgba(255,212,0,0.4);
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

        @media (max-width: 768px) {
            .navbar-brand { font-size: 26px; }
            .gridview-container { padding: 20px; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container">
                <a class="navbar-brand" href="Adminhome.aspx">
                    <i class="bi bi-lightning-charge me-2"></i> Maxtho Admin
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
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
            <h1>Edit Categories</h1>
            <p>Update and manage your product categories below.</p>
        </div>

        <!-- GRIDVIEW -->
        <div class="gridview-container">
            <h3>Category List</h3>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                CssClass="table table-bordered table-hover text-center align-middle"
                DataKeyNames="Category_id"
                OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowEditing="GridView1_RowEditing"
                OnRowUpdating="GridView1_RowUpdating">

                <Columns>
                    <asp:BoundField DataField="Category_id" HeaderText="ID" ReadOnly="true" />
                    <asp:BoundField DataField="Category_name" HeaderText="Category Name" />
                    <asp:BoundField DataField="Category_description" HeaderText="Description" />
                    <asp:BoundField DataField="Category_status" HeaderText="Status" />

                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <img src='<%# Eval("Category_image") %>' alt="Category" width="80" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("Category_image") %>' />
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("Category_image") %>' Width="100px" Height="100px" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField HeaderText="Actions" ShowEditButton="True" ButtonType="Button" />
                </Columns>
            </asp:GridView>

            <br />
            <asp:Label ID="Label1" runat="server" CssClass="d-block text-success fw-bold"></asp:Label>
            <br />
            <a href="Adminhome.aspx" class="btn btn-outline-primary">
                <i class="bi bi-house-door"></i> Go to Admin Home
            </a>
        </div>

        <!-- FOOTER -->
        <footer>
            <p>© 2025 Maxtho Mobiles | Admin Panel | <a href="Contact.aspx">Contact Support</a></p>
        </footer>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
