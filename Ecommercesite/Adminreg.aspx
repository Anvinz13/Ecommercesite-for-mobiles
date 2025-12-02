<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminreg.aspx.cs" Inherits="Ecommercesite.Adminreg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #2c3e50, #3498db);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .register-container {
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            width: 350px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.25);
            text-align: center;
        }

        .register-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .btn-register {
            margin-top: 15px;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 6px;
            background: #3498db;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-register:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="register-container">
            <h2>Admin Registration</h2>

            <div class="form-group">
                <label for="TextBox1">Name</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="TextBox2">Email</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="TextBox3">Phone</label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="TextBox4">Username</label>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="TextBox5">Password</label>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" ></asp:TextBox>
            </div>

            <asp:Button ID="Button1" runat="server" Text="Register" CssClass="btn-register" />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" Text="Label"></asp:Label>
        </div>
    </form>
        
</body>
</html>
