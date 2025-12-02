<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewcart.aspx.cs" Inherits="Ecommercesite.viewcart" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Cart | Maxtho Mobiles</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        :root {
            --accent: #ffd400;
            --text-dark: #1f2933;
            --muted: #6b7280;
            --bg-light: #fafafa;
        }

        body {
            font-family: 'Manrope', sans-serif;
            background: linear-gradient(180deg, #ffffff, var(--bg-light));
            color: var(--text-dark);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            padding-top: 70px;
        }

        /* Navbar */
        .navbar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(8px);
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
        }
        .navbar-brand {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 32px;
            color: var(--accent);
            text-shadow: 0 0 6px rgba(255,212,0,0.4);
        }

        .nav-link {
            color: var(--text-dark) !important;
            font-weight: 500;
        }
        .nav-link:hover {
            color: var(--accent) !important;
        }

        /* Container */
        .cart-container {
            margin-top: 80px;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.08);
            padding: 30px;
            max-width: 1000px;
        }

        h2.cart-title {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 42px;
            text-align: center;
            margin-bottom: 25px;
            color: var(--accent);
            letter-spacing: 1px;
        }

        /* GridView Styling */
        .gridview {
            width: 100%;
        }
        .gridview th {
            background-color: var(--accent);
            color: #000;
            text-align: center;
            padding: 12px;
            font-weight: 600;
        }
        .gridview td {
            text-align: center;
            vertical-align: middle;
            padding: 12px;
        }
        .gridview tr:nth-child(even) {
            background: #f9fafb;
        }
        .gridview img {
            max-width: 80px;
            border-radius: 10px;
        }

        /* Buttons */
        .btn-custom {
            font-weight: 600;
            padding: 10px 22px;
            background: var(--accent);
            border: none;
            border-radius: 8px;
            color: #000;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(255, 212, 0, 0.4);
        }
        .btn-custom:hover {
            background: #e6c200;
            transform: translateY(-2px);
        }

        /* Total */
        .total-box {
            padding: 15px;
            border-radius: 12px;
            background: #fef9e7;
            border: 1px solid #ffe066;
        }
        .total-labels {
            font-weight: 700;
            font-size: 18px;
            color: var(--accent);
        }

        /* Footer */
        .footer {
            margin-top: auto;
            text-align: center;
            padding: 20px;
            background: #fff;
            border-top: 1px solid #eee;
            color: var(--muted);
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-fluid px-4">
            <a class="navbar-brand" href="UserHome.aspx"><i class="bi bi-phone"></i> Maxtho Mobiles</a>
        </div>
    </nav>

    <!-- CART SECTION -->
    <div class="container cart-container">
        <h2 class="cart-title"><i class="bi bi-cart3"></i> My Shopping Cart</h2>

        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover gridview"
            AutoGenerateColumns="False" DataKeyNames="Cart_id"
            OnRowDeleting="GridView1_RowDeleting"
            OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowEditing="GridView1_RowEditing"
            OnRowUpdating="GridView1_RowUpdating">

            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                <asp:BoundField DataField="Product_name" HeaderText="Product Name" />
                <asp:ImageField DataImageUrlField="Product_image" HeaderText="Image"
                    ControlStyle-Width="80px" ControlStyle-Height="80px" />
                <asp:BoundField DataField="Product_price" HeaderText="Price (₹)" />

                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <%# Eval("Quantity") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("Quantity") %>' CssClass="form-control form-control-sm"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="Subtotal" HeaderText="Subtotal (₹)" />
            </Columns>
        </asp:GridView>

        <!-- Total & Confirm -->
        <div class="d-flex justify-content-between align-items-center mt-4 total-box">
            <div>
                <asp:Label ID="Label1" runat="server" Text="Grand Total:" CssClass="total-labels"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="₹" CssClass="total-labels"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="" CssClass="fw-bold fs-5"></asp:Label>
            </div>
            <div>
                <asp:Button ID="Button1" runat="server" Text="Confirm Booking" CssClass="btn btn-custom" OnClick="Button1_Click" />
            </div>
        </div>

        <asp:Label ID="Label4" runat="server" Text="" CssClass="text-success fw-bold mt-3 d-block"></asp:Label>
    </div>

</form>

<footer class="footer">
    <p>© 2025 Maxtho Mobiles. All Rights Reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
