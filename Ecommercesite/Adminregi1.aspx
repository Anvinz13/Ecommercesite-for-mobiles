<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminregi1.aspx.cs" Inherits="Ecommercesite.Adminregi1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Registration | Maxtho Mobiles</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet" />

    <style>
        :root {
            --bg-start: #ffffff;
            --bg-end: #f4f4f6;
            --neon-main: #ffd400;  /* Yellow */
            --neon-alt: #ff007a;   /* Accent pink */
            --text-dark: #1f2933;
            --muted: #6b7280;
            --card-radius: 12px;
        }

        body {
            margin: 0;
            font-family: 'Manrope', sans-serif;
            background: linear-gradient(135deg, var(--bg-start), var(--bg-end));
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 420px;
            background: #fff;
            padding: 36px 28px;
            border-radius: var(--card-radius);
            box-shadow: 0 10px 28px rgba(0,0,0,0.12);
            animation: fadeUp 0.6s ease-out forwards;
        }

        h2 {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 32px;
            text-align: center;
            margin-bottom: 22px;
            letter-spacing: 1px;
            color: var(--text-dark);
        }

        .form-group {
            margin-bottom: 16px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 6px;
            font-size: 14px;
            color: var(--text-dark);
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            outline: none;
            font-size: 14px;
            transition: border-color .2s, box-shadow .2s;
        }

        .form-control:focus {
            border-color: var(--neon-main);
            box-shadow: 0 0 8px rgba(255, 212, 0, 0.5);
        }

        .btn {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: 700;
            color: #fff;
            background: var(--neon-main);
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: transform .2s, box-shadow .2s, background .2s;
        }
        .btn:hover {
            transform: translateY(-3px);
            background: var(--neon-alt);
            box-shadow: 0 10px 20px rgba(255, 0, 122, 0.25);
        }

        .message {
            text-align: center;
            margin-top: 14px;
            font-size: 14px;
            font-weight: 600;
            color: green;
        }

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Admin Registration</h2>
            
            <div class="form-group">
                <label for="txtName">Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtPhone">Phone</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtUsername">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn" OnClick="btnRegister_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
