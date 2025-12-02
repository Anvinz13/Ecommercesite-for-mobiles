<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productadd.aspx.cs" Inherits="Ecommercesite.Productadd" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Maxtho Mobiles | Add Product</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        :root {
            --accent: #ffd400;
            --accent-hover: #ffbf00;
            --text-dark: #1f2933;
        }

        body {
            font-family: 'Manrope', sans-serif;
            background: #ffffff; /* White background */
            margin: 0;
            padding: 0;
        }

        .container {
            padding-top: 50px;
            padding-bottom: 50px;
        }

        .card {
            border-radius: 14px;
            background: #f9f9f9; /* Light card on white */
            color: #1f2933;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
            animation: fadeUp 0.7s ease-out forwards;
        }

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .card-header {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 28px;
            color: var(--accent);
            text-align: center;
            text-shadow: 0 0 8px rgba(255,212,0,0.5);
            background: #ffffff;
            border-radius: 14px 14px 0 0;
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }

        .form-label {
            font-weight: 600;
            color: var(--text-dark);
        }

        .form-control, .form-select {
            border-radius: 8px;
            background: #fff;
            color: var(--text-dark);
            border: 1px solid #ccc;
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border: 1px solid var(--accent);
            box-shadow: 0 0 8px rgba(255,212,0,0.4);
            outline: none;
        }

        .btn-success {
            background: var(--accent);
            color: #000;
            border: 2px solid var(--accent);
            border-radius: 28px;
            font-weight: 700;
            padding: 10px 25px;
            transition: all 0.3s ease;
        }

        .btn-success:hover {
            background: var(--accent-hover);
            border-color: var(--accent-hover);
            color: #000;
            box-shadow: 0 6px 18px rgba(255,212,0,0.4);
            transform: translateY(-2px);
        }

        .img-thumbnail {
            background: #f5f5f5;
            border: 1px solid #ccc;
            opacity: 0;
            transform: scale(0.8);
            transition: all 0.5s ease;
        }

        .img-thumbnail.show {
            opacity: 1;
            transform: scale(1);
        }

        a {
            color: var(--accent);
            text-decoration: none;
            font-weight: 500;
        }

        a:hover {
            color: #ffbf00;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-7">
                    <div class="card shadow-lg border-0">
                        <div class="card-header">
                            <i class="fas fa-box-open me-2"></i> Add New Product
                        </div>
                        <div class="card-body p-4">

                            <!-- Category Dropdown -->
                            <div class="mb-3">
                                <label class="form-label" for="ddlCategory">Select Category</label>
                                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="-- Select Category --" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <!-- Product Name -->
                            <div class="mb-3">
                                <label class="form-label" for="txtProductName">Product Name</label>
                                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" placeholder="Enter product name"></asp:TextBox>
                            </div>

                            <!-- Product Description -->
                            <div class="mb-3">
                                <label class="form-label" for="txtProductDescription">Product Description</label>
                                <asp:TextBox ID="txtProductDescription" runat="server" CssClass="form-control"
                                             TextMode="MultiLine" Rows="4" placeholder="Enter product description"></asp:TextBox>
                            </div>

                            <!-- Product Price -->
                            <div class="mb-3">
                                <label class="form-label" for="txtProductPrice">Product Price</label>
                                <asp:TextBox ID="txtProductPrice" runat="server" CssClass="form-control" placeholder="Enter price"></asp:TextBox>
                            </div>

                            <!-- Product Stock -->
                            <div class="mb-3">
                                <label class="form-label" for="txtProductStock">Stock</label>
                                <asp:TextBox ID="txtProductStock" runat="server" CssClass="form-control" placeholder="Enter stock quantity"></asp:TextBox>
                            </div>

                            <!-- Product Image -->
                            <div class="mb-3">
                                <label class="form-label" for="fileProductImage">Upload Image</label>
                                <asp:FileUpload ID="fileProductImage" runat="server" CssClass="form-control" onchange="previewImage(this)" />
                                <asp:Image ID="imgPreview" runat="server" CssClass="img-thumbnail mt-2" Width="150px" />
                            </div>

                            <!-- Product Status -->
                            <div class="mb-3">
                                <label class="form-label" for="ddlStatus">Status</label>
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                    <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <!-- Buttons -->
                            <div class="d-flex justify-content-between align-items-center">
                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success px-4" Text="Save Product" OnClick="btnSave_Click" />
                                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Adminhome.aspx">Go to Home Page</asp:LinkButton>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        function previewImage(input) {
            const file = input.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const img = document.getElementById('<%= imgPreview.ClientID %>');
                    img.src = e.target.result;
                    img.classList.add("show");
                };
                reader.readAsDataURL(file);
            }
        }
    </script>
</body>
</html>