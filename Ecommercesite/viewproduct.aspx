<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewproduct.aspx.cs" Inherits="Ecommercesite.viewproduct" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Products | Maxtho Mobiles</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        :root {
            --accent: #ffd400;
            --text-dark: #1f2933;
            --muted: #6b7280;
            --bg-light: #f4f4f6;
        }

        body {
            margin: 0;
            font-family: 'Manrope', sans-serif;
            background: linear-gradient(180deg, #ffffff, var(--bg-light));
            color: var(--text-dark);
            padding-top: 80px;
        }

        .product-card {
            background: #fff;
            border-radius: 16px;
            padding: 16px;
            margin-bottom: 16px;
            text-align: center;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
            box-shadow: 0 6px 16px rgba(0,0,0,0.08);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
        }

        .product-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 28px rgba(0,0,0,0.15);
        }

        .product-card img {
            border-radius: 12px;
            width: 100%;
            height: 200px;
            object-fit: cover;
            margin-bottom: 12px;
        }

        .product-title {
            font-size: 1.1rem;
            font-weight: 700;
            color: var(--accent);
            margin-bottom: 6px;
        }

        .product-price {
            font-size: 1rem;
            font-weight: 700;
            color: #16a34a;
            margin-bottom: 6px;
        }

        .product-desc {
            font-size: 0.9rem;
            color: var(--muted);
            margin-bottom: 8px;
        }

        .btn-buy {
            background-color: var(--accent);
            border: none;
            color: #000;
            font-weight: bold;
            padding: 8px 16px;
            border-radius: 8px;
            text-decoration: none;
            display: inline-block;
            transition: background 0.3s ease;
        }

        .btn-buy:hover {
            background-color: #000;
            color: #fff;
        }

        /* DataList Columns */
        .datalist-row {
            display: flex;
            flex-wrap: wrap;
            gap: 16px;
        }

        .datalist-col {
            flex: 1 1 calc(25% - 16px);
            display: flex;
        }

        @media(max-width: 1200px) { .datalist-col { flex: 1 1 calc(33.333% - 16px); } }
        @media(max-width: 992px)  { .datalist-col { flex: 1 1 calc(50% - 16px); } }
        @media(max-width: 576px)  { .datalist-col { flex: 1 1 100%; } }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="container">
            <h2 class="text-center mb-4" style="font-family:'Bebas Neue', sans-serif; color:var(--text-dark);">
                Our Products
            </h2>

            <div class="datalist-row">
                <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" CssClass="w-100">
                    <ItemTemplate>
                        <div class="datalist-col">
                            <div class="product-card">

                                <!-- Product Image -->
                                <asp:ImageButton ID="ImageButton2" runat="server"
                                    CommandArgument='<%# Eval("Product_id") %>'
                                    ImageUrl='<%# Eval("Product_image") %>'
                                    OnCommand="ImageButton2_Command"
                                    CssClass="img-fluid" />

                                <!-- Product Name -->
                                <div class="product-title">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Product_name") %>'></asp:Label>
                                </div>

                                <!-- Product Price -->
                                <div class="product-price">
                                    ₹ <asp:Label ID="Label2" runat="server" Text='<%# Eval("Product_price") %>'></asp:Label>
                                </div>

                                <!-- Description -->
                                <div class="product-desc">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Product_description") %>'></asp:Label>
                                </div>

                                <!-- Buy Now Button (Correct Link) -->
                                <a href='singleprd.aspx?pid=<%# Eval("Product_id") %>' class="btn-buy">Buy Now</a>

                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>

        <footer class="text-center mt-5">
            <p class="text-muted">© 2025 Maxtho Mobiles. All Rights Reserved.</p>
        </footer>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
