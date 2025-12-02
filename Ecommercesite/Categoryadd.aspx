<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categoryadd.aspx.cs" Inherits="Ecommercesite.Categoryadd" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Category | Maxtho Mobiles</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        :root {
            --neon-main: #ffd400;   /* Yellow */
            --neon-alt: #ff007a;    /* Pink accent */
            --text-dark: #1f2933;
            --muted: #6b7280;
            --card-radius: 14px;
        }

        body {
            font-family: 'Manrope', sans-serif;
            background: linear-gradient(135deg, #ffffff, #f4f4f6);
            margin: 0;
            padding: 0;
        }

        .card {
            border-radius: var(--card-radius);
            background: #fff;
            box-shadow: 0 10px 28px rgba(0,0,0,0.08);
            animation: fadeUp 0.7s ease-out forwards;
        }

        .card-header {
            background: var(--neon-main);
            color: #000;
            border-radius: var(--card-radius) var(--card-radius) 0 0;
            text-align: center;
            padding: 18px;
        }

        .card-header h4 {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 28px;
            margin: 0;
            letter-spacing: 1px;
        }

        .form-label {
            font-weight: 600;
            color: var(--text-dark);
        }

        .form-control, .form-select {
            border-radius: 8px;
            border: 1px solid #d1d5db;
            transition: all 0.3s ease;
        }
        .form-control:focus, .form-select:focus {
            border-color: var(--neon-main);
            box-shadow: 0 0 8px rgba(255, 212, 0, 0.6);
        }

        .btn-success {
            background-color: var(--neon-main);
            border: none;
            border-radius: 8px;
            font-weight: 700;
            color: #000;
            transition: all 0.3s ease;
        }
        .btn-success:hover {
            background-color: var(--neon-alt);
            color: #fff;
            transform: translateY(-3px);
            box-shadow: 0 8px 18px rgba(255, 0, 122, 0.3);
        }

        a {
            color: var(--neon-alt);
            font-weight: 600;
            text-decoration: none;
        }
        a:hover {
            color: var(--neon-main);
            text-decoration: underline;
        }

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="card border-0">
                        <div class="card-header">
                            <h4><i class="bi bi-folder-plus me-2"></i>Add New Category</h4>
                        </div>
                        <div class="card-body p-4">
                            <!-- Category Name -->
                            <div class="mb-3">
                                <label for="txtCategoryName" class="form-label">Category Name</label>
                                <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control" placeholder="Enter category name"></asp:TextBox>
                            </div>

                            <!-- Category Image -->
                            <div class="mb-3">
                                <label for="fuCategoryImage" class="form-label">Category Image</label>
                                <asp:FileUpload ID="fuCategoryImage" runat="server" CssClass="form-control" />
                            </div>

                            <!-- Description -->
                            <div class="mb-3">
                                <label for="txtDescription" class="form-label">Description</label>
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Enter category description"></asp:TextBox>
                            </div>

                            <!-- Status -->
                            <div class="mb-3">
                                <label for="ddlStatus" class="form-label">Status</label>
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                    <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <!-- Buttons -->
                            <div class="d-flex justify-content-between align-items-center">
                                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success px-4" OnClick="btnSave_Click" />
                                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Adminhome.aspx">Go to Home Page</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
