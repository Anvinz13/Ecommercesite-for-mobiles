<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Billview.aspx.cs" Inherits="Ecommercesite.Billview" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bill Details | Maxtho Mobiles</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        :root {
            --accent: #ffd400;
            --text-dark: #1f2933;
            --muted: #6b7280;
            --bg-light: #f9fafb;
        }

        body {
            font-family: 'Manrope', sans-serif;
            background: linear-gradient(180deg, #ffffff, var(--bg-light));
            color: var(--text-dark);
            padding-top: 60px;
        }

        h2.page-title {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 42px;
            text-align: center;
            margin-bottom: 30px;
            color: var(--accent);
            letter-spacing: 1px;
            text-shadow: 0 0 6px rgba(255, 212, 0, 0.4);
        }

        .card {
            border-radius: 16px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            border: none;
            margin-bottom: 30px;
        }
        .card-header {
            background: var(--accent);
            color: #000;
            font-weight: 700;
            border-radius: 16px 16px 0 0;
            font-size: 18px;
        }

        .table th {
            background: var(--bg-light);
            font-weight: 600;
            text-align: center;
        }
        .table td {
            text-align: center;
            vertical-align: middle;
        }

        .grand-total-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #fff9db;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
        .grand-total {
            font-size: 22px;
            font-weight: 700;
            color: var(--accent);
        }

        .btn-print {
            background: var(--accent);
            border: none;
            padding: 10px 20px;
            font-weight: 600;
            border-radius: 8px;
            color: #000;
            transition: 0.3s;
            box-shadow: 0 4px 12px rgba(255,212,0,0.5);
        }
        .btn-print:hover {
            background: #e6c200;
            transform: translateY(-2px);
        }

        footer {
            background: #fff;
            color: var(--muted);
            text-align: center;
            padding: 20px 0;
            border-top: 1px solid rgba(0,0,0,0.06);
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <h2 class="page-title"><i class="bi bi-receipt"></i> Bill Summary</h2>

            <!-- CUSTOMER DETAILS -->
            <div class="card">
                <div class="card-header">
                    <i class="bi bi-person-badge"></i> Customer Details
                </div>
                <div class="card-body">
                    <div class="row mb-2">
                        <div class="col-md-3 fw-bold">Name:</div>
                        <div class="col-md-9"><asp:Label ID="Label6" runat="server"></asp:Label></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3 fw-bold">Email:</div>
                        <div class="col-md-9"><asp:Label ID="Label7" runat="server"></asp:Label></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3 fw-bold">Address:</div>
                        <div class="col-md-9"><asp:Label ID="Label8" runat="server"></asp:Label></div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 fw-bold">Phone:</div>
                        <div class="col-md-9"><asp:Label ID="Label9" runat="server"></asp:Label></div>
                    </div>
                </div>
            </div>

            <!-- ORDER DETAILS -->
            <div class="card">
                <div class="card-header">
                    <i class="bi bi-box-seam"></i> Order Details
                </div>
                <div class="card-body">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover"
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Product_name" HeaderText="Product Name" />
                            <asp:BoundField DataField="Product_price" HeaderText="Price (₹)" />
                            <asp:BoundField DataField="Quantity" HeaderText="Qty" />
                            <asp:BoundField DataField="Subtotal" HeaderText="Subtotal (₹)" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-- GRAND TOTAL -->
            <div class="grand-total-box">
                <asp:Button ID="Button1" runat="server" Text="🖨 Print Bill" CssClass="btn-print" PostBackUrl="~/OrginalAccounts.aspx"/>
                <div class="grand-total">
                    Grand Total: ₹ <asp:Label ID="Label12" runat="server"></asp:Label>
                </div>
            </div>
        </div>

        <!-- FOOTER -->
        <footer>
            <p>© 2025 Maxtho Mobiles. All Rights Reserved.</p>
        </footer>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
