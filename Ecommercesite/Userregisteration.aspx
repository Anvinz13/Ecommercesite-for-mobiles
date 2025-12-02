<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Userregisteration.aspx.cs" Inherits="Ecommercesite.Userregisteration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Maxtho Mobiles | User Registration</title>

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
            --bg-light: #f9f9fa;
        }

        body {
            margin: 0;
            font-family: 'Manrope', sans-serif;
            background: linear-gradient(180deg, #ffffff, #f7f7f7);
            color: var(--text-dark);
            min-height: 100vh;
        }

        /* ===== NAVBAR ===== */
        .navbar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(8px);
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            padding: 14px 0;
        }

        .navbar-brand {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 34px;
            color: var(--accent);
            letter-spacing: 1px;
            text-shadow: 0 0 6px rgba(255,234,0,0.4);
        }

        /* ===== Registration Card ===== */
        .reg-card {
            background: #fff;
            max-width: 600px;
            margin: 100px auto;
            padding: 45px;
            border-radius: 18px;
            box-shadow: 0 10px 35px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            animation: fadeIn 0.8s ease;
        }

        .reg-card:hover {
            box-shadow: 0 10px 40px rgba(255,234,0,0.3);
        }

        .reg-card h2 {
            text-align: center;
            margin-bottom: 30px;
            font-family: 'Bebas Neue', sans-serif;
            font-size: 48px;
            color: var(--text-dark);
            letter-spacing: 1px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            font-weight: 600;
            margin-bottom: 6px;
            display: block;
        }

        .form-control {
            border-radius: 12px;
            padding: 10px;
            border: 1px solid #ccc;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--accent);
            box-shadow: 0 0 8px rgba(255, 234, 0, 0.4);
        }

        /* ===== Register Button ===== */
        .btn-register {
            width: 100%;
            padding: 12px;
            border-radius: 12px;
            border: none;
            font-weight: 700;
            background: var(--accent);
            color: #000;
            transition: all 0.3s ease;
            font-size: 18px;
            box-shadow: 0 6px 20px rgba(255, 234, 0, 0.3);
        }

        .btn-register:hover {
            background: var(--accent-hover);
            transform: translateY(-3px);
        }

        /* ===== Footer ===== */
        footer {
            background: #fff;
            color: var(--muted);
            text-align: center;
            padding: 25px 0;
            margin-top: 60px;
            font-size: 15px;
        }

        footer a {
            color: var(--accent);
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">
            <a class="navbar-brand" href="Userhome.aspx"><i class="bi bi-phone"></i> Maxtho Mobiles</a>
        </div>
    </nav>

    <!-- Registration Card -->
    <div class="reg-card">
        <h2>Create Account</h2>

        <div class="form-group">
            <label for="txtName">Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtAge">Age</label>
            <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtEmail">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtAddress">Address</label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtPhone">Phone</label>
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtLocation">Location</label>
            <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtPincode">Pincode</label>
            <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="ddlState">State</label>
            <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="ddlDistrict">District</label>
            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="ddlStatus">User Status</label>
            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="txtUsername">Username</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtPassword">Password</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        </div>

        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-register" OnClick="btnRegister_Click" />
        <br /><br />
        <asp:Label ID="Label1" runat="server" Text="" ForeColor="Green"></asp:Label>
    </div>

    <!-- FOOTER -->
    <footer>
        <p>© 2025 <strong>Maxtho Mobiles</strong>. All Rights Reserved. | <a href="Contact.aspx">Contact Us</a></p>
    </footer>
</form>
</body>
</html>
