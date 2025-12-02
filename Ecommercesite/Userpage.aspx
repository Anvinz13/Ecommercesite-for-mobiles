<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Userpage.aspx.cs" Inherits="Ecommercesite.userpage" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Categories | Maxtho Mobiles</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet" />

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        :root {
            --accent: #ffea00;
            --dark: #000000;
            --text: #1e2a44;
            --bg-light: #f7f7f7;
        }

        body {
            font-family: 'Manrope', sans-serif;
            background: linear-gradient(180deg, #ffffff, #f4f4f4);
            color: var(--text);
            padding: 40px 20px;
            margin: 0;
            overflow-x: hidden;
        }

        h2.page-title {
            text-align: center;
            font-family: 'Bebas Neue', sans-serif;
            font-size: 2.8rem;
            color: var(--dark);
            margin-bottom: 40px;
            letter-spacing: 1px;
            animation: glow 3s ease-in-out infinite;
        }

        @keyframes glow {
            0%, 100% { text-shadow: 0 0 6px var(--accent), 0 0 15px var(--accent); }
            50% { text-shadow: 0 0 15px var(--dark), 0 0 25px var(--accent); }
        }

        /* Scrollable container */
        .category-wrapper {
            display: flex;
            gap: 24px;
            overflow-x: auto;
            scroll-behavior: smooth;
            padding-bottom: 16px;
        }

        .category-wrapper::-webkit-scrollbar {
            height: 8px;
        }

        .category-wrapper::-webkit-scrollbar-thumb {
            background: var(--accent);
            border-radius: 4px;
        }

        /* Equal-sized category cards */
        .category-card {
            flex: 0 0 280px; /* same width for all */
            height: 320px;   /* fixed height for equal box size */
            background: #fff;
            border-radius: 16px;
            padding: 18px;
            text-align: center;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.05);
            transition: all 0.35s ease;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .category-card:hover {
            transform: translateY(-8px) scale(1.03);
            box-shadow: 0 0 25px rgba(255, 234, 0, 0.5);
            border-color: var(--accent);
        }

        .category-card img {
            width: 100%;
            height: 160px;
            object-fit: contain;
            border-radius: 10px;
            transition: transform 0.3s ease;
            background: #f9f9f9;
        }

        .category-card:hover img {
            transform: scale(1.08);
        }

        .category-title {
            font-weight: 700;
            font-size: 1.1rem;
            color: var(--dark);
            margin-top: 10px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .category-desc {
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 5px;
            min-height: 35px;
        }

        /* Neon glow rings (optional) */
        .neon-ring {
            position: absolute;
            width: 150px;
            height: 150px;
            border: 3px solid var(--accent);
            border-radius: 50%;
            filter: blur(5px);
            opacity: 0.1;
            animation: rotate 10s linear infinite;
            z-index: -1;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .neon-ring.r1 { top: -60px; left: -60px; }
        .neon-ring.r2 { bottom: -60px; right: -60px; }

        @media (max-width: 768px) {
            .category-card { flex: 0 0 220px; height: 300px; }
            h2.page-title { font-size: 2.2rem; }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container-fluid position-relative">
            <div class="neon-ring r1"></div>
            <div class="neon-ring r2"></div>

            <h2 class="page-title">Explore Categories</h2>

            <div class="category-wrapper">
                <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="0">
                    <ItemTemplate>
                        <div class="category-card">
                            <asp:ImageButton ID="ImageButton2" runat="server"
                                CommandArgument='<%# Eval("Category_id") %>'
                                ImageUrl='<%# Eval("Category_image") %>'
                                OnCommand="ImageButton2_Command"
                                CssClass="img-fluid" />
                            <div>
                                <div class="category-title">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Category_name") %>'></asp:Label>
                                </div>
                                <div class="category-desc">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Category_description") %>'></asp:Label>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
