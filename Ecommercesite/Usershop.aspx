<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usershop.aspx.cs" Inherits="Ecommercesite.Usershop" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Mobile Store</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .category-list {
            background: #fff;
            padding: 15px;
            border-radius: 8px;
        }
        .product-card {
            transition: transform 0.2s ease;
        }
        .product-card:hover {
            transform: scale(1.03);
        }
        .product-img {
            height: 220px;
            object-fit: contain;
            background: #fdfdfd;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid mt-4">
            <div class="row">
                <!-- Sidebar Categories -->
                <div class="col-md-3">
                    <h4>Categories</h4>
                    <ul class="list-group category-list">
                        <asp:Repeater ID="rptCategories" runat="server">
                            <ItemTemplate>
                                <li class="list-group-item">
                                    <a href="Default.aspx?catid=<%# Eval("CategoryID") %>" style="text-decoration:none;">
                                        <%# Eval("CategoryName") %>
                                    </a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>

                <!-- Products Section -->
                <div class="col-md-9">
                    <div class="row" id="productList">
                        <asp:Repeater ID="rptProducts" runat="server">
                            <ItemTemplate>
                                <div class="col-md-4 mb-4">
                                    <div class="card product-card shadow-sm">
                                        <img src='<%# Eval("ImagePath") %>' class="card-img-top product-img" alt="Product Image" />
                                        <div class="card-body text-center">
                                            <h5 class="card-title"><%# Eval("ProductName") %></h5>
                                            <p class="card-text text-muted"><%# Eval("Description") %></p>
                                            <p class="fw-bold text-success">₹ <%# Eval("Price") %></p>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
