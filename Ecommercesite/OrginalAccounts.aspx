<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrginalAccounts.aspx.cs" Inherits="Ecommercesite.OrginalAccounts" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Maxtho Mobiles | Account</title>

    <!-- Bootstrap + Google Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet" />

    <style>
        body {
            font-family: 'Manrope', sans-serif;
            background: #f4f4f6;
            margin: 0;
        }

        /* HEADER */
        .header-navbar {
            background: #fff;
            padding: 15px 30px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
            display:flex;
            align-items:center;
        }
        .header-navbar i {
            font-size:34px;
            color:#ffea00;
            margin-right:10px;
            text-shadow:0 0 5px rgba(255,230,0,0.5);
        }
        .header-navbar span {
            font-family: 'Bebas Neue', cursive;
            font-size: 34px;
            color:#ffea00;
            text-shadow:0 0 5px rgba(255,230,0,0.5);
        }

        /* CARD STYLING */
        .aspNetPanel {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            padding: 30px;
            margin-top: 30px;
        }

        /* FORM ELEMENTS */
        .form-label {
            font-weight: 600;
            font-size: 14px;
            margin-bottom: 6px;
            display: block;
            color: #333;
        }

        .form-control, .aspNetTextBox, .aspNetDropDown {
            width: 100%;
            padding: 10px 12px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 14px;
            margin-bottom: 12px;
        }

        /* BUTTONS */
        .btn-action {
            border: none;
            border-radius: 12px;
            padding: 10px 25px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
        }
        .btn-submit {
            background: #ffea00;
            color: #000;
        }
        .btn-submit:hover {
            background: #ffd700;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(255,230,0,0.3);
        }

        /* VALIDATOR */
        .aspNetValidator {
            color: red;
            font-size: 13px;
            margin-left: 5px;
        }

        /* Center form */
        .form-container {
            max-width: 650px;
            margin: 40px auto;
        }

        h5.section-title {
            font-weight: 700;
            margin-bottom: 20px;
            font-size: 20px;
            color: #111;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <!-- HEADER -->
        <div class="header-navbar">
            <i class="bi bi-phone"></i>
            <span>Maxtho Mobiles</span>
        </div>

        <!-- FORM -->
        <div class="form-container">
            <div class="aspNetPanel">
                <!-- Panel1: Account Details -->
                <asp:Panel ID="Panel1" runat="server">
                    <h5 class="section-title">Enter Your Account Details</h5>

                    <label for="TextBox1" class="form-label">Account Number</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"
                        OnTextChanged="TextBox1_TextChanged" AutoPostBack="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="TextBox1" CssClass="aspNetValidator"
                        ErrorMessage="Please Enter Account Number"></asp:RequiredFieldValidator>

                    <label for="DropDownList1" class="form-label">Account Type</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                        <asp:ListItem>Current Account</asp:ListItem>
                        <asp:ListItem>Fixed Account</asp:ListItem>
                        <asp:ListItem>Savings Account</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="DropDownList1" CssClass="aspNetValidator"
                        ErrorMessage="Please select the account type"></asp:RequiredFieldValidator>

                    <label for="TextBox2" class="form-label">Balance Amount</label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>

                    <asp:Button ID="Button1" runat="server" Text="SUBMIT" CssClass="btn-action btn-submit"
                        OnClick="Button1_Click" />

                    <asp:Label ID="Label5" runat="server" CssClass="text-success mt-2"></asp:Label>
                </asp:Panel>

                <!-- Panel2: Payment Details -->
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <h5 class="section-title">Payment Details</h5>

                    <label for="TextBox3" class="form-label">Payment Amount</label>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ControlToValidate="TextBox3" CssClass="aspNetValidator"
                        ErrorMessage="Please enter the amount"></asp:RequiredFieldValidator>

                    <label for="DropDownList2" class="form-label">Payment Mode</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">
                        <asp:ListItem>UPI Payment</asp:ListItem>
                        <asp:ListItem>Cash on delivery</asp:ListItem>
                        <asp:ListItem>Credit Card</asp:ListItem>
                        <asp:ListItem>Debit Card</asp:ListItem>
                    </asp:DropDownList>

                    <asp:Button ID="Button2" runat="server" Text="Make Payment" CssClass="btn-action btn-submit"
                        OnClick="Button2_Click" />

                    <asp:Label ID="Label10" runat="server" CssClass="text-success mt-2"></asp:Label>
                </asp:Panel>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
