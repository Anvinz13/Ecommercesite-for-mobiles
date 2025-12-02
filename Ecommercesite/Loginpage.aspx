<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loginpage.aspx.cs" Inherits="Ecommercesite.Loginpage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Maxtho Mobiles | Login</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet" />

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        :root {
            --accent: #ffea00; /* Neon yellow */
            --dark: #000000; /* Black accent */
            --text-dark: #1f2933;
            --muted: #6b7280;
            --bg-light: #f8f8f8;
        }

        body {
            font-family: 'Manrope', sans-serif;
            background: linear-gradient(180deg, #ffffff, #f0f0f0);
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: var(--text-dark);
            overflow: hidden;
        }

        /* Neon Glow Animation */
        @keyframes glow {
            0%, 100% { text-shadow: 0 0 8px var(--accent), 0 0 16px var(--accent); }
            50% { text-shadow: 0 0 15px var(--dark), 0 0 25px var(--accent); }
        }

        /* Container */
        .login-card {
            width: 100%;
            max-width: 400px;
            background: #ffffff;
            border-radius: 18px;
            box-shadow: 0 6px 24px rgba(0, 0, 0, 0.1);
            padding: 40px 30px;
            text-align: center;
            animation: fadeUp 0.7s ease-out;
            position: relative;
        }

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(25px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Branding */
        .login-card h1 {
            font-family: 'Bebas Neue', sans-serif;
            font-size: 40px;
            color: var(--accent);
            margin-bottom: 8px;
            letter-spacing: 1px;
            animation: glow 3s ease-in-out infinite;
        }

        .login-card p {
            color: var(--muted);
            font-size: 15px;
            margin-bottom: 30px;
        }

        /* Form Fields */
        .form-group {
            text-align: left;
            margin-bottom: 20px;
            position: relative;
        }

        label {
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 6px;
            display: block;
        }

        .form-control {
            width: 100%;
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--accent);
            box-shadow: 0 0 10px rgba(255, 234, 0, 0.5);
        }

        /* Password Toggle */
        .toggle-password {
            position: absolute;
            right: 12px;
            top: 37px;
            cursor: pointer;
            color: var(--muted);
            font-size: 15px;
            transition: color 0.2s ease;
        }

        .toggle-password:hover {
            color: var(--accent);
        }

        /* Buttons */
        .btn {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            font-weight: 700;
            border-radius: 28px;
            border: 2px solid var(--accent);
            background: #ffffff;
            color: var(--text-dark);
            transition: all 0.3s ease;
        }

        .btn:hover {
            background: var(--accent);
            color: #000;
            box-shadow: 0 0 15px rgba(255, 234, 0, 0.4);
            transform: translateY(-2px);
        }

        /* Message */
        .message {
            font-size: 14px;
            margin-top: 10px;
        }

        .message.error { color: red; }
        .message.success { color: green; }

        /* Extra Links */
        .extra-link {
            margin-top: 18px;
            font-size: 14px;
        }

        .extra-link a {
            color: var(--accent);
            font-weight: 600;
            text-decoration: none;
        }

        .extra-link a:hover {
            color: var(--dark);
            text-decoration: underline;
        }

        /* Glow Accent Rings */
        .neon-ring {
            position: absolute;
            width: 160px;
            height: 160px;
            border: 3px solid var(--accent);
            border-radius: 50%;
            filter: blur(4px);
            opacity: 0.15;
            animation: rotate 9s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .neon-ring.r1 { top: -50px; left: -50px; border-color: var(--accent); }
        .neon-ring.r2 { bottom: -50px; right: -50px; border-color: var(--dark); }

        @media (max-width: 480px) {
            .login-card { padding: 30px 20px; }
            .login-card h1 { font-size: 34px; }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="login-card">
            <div class="neon-ring r1"></div>
            <div class="neon-ring r2"></div>

            <h1>Maxtho Mobiles</h1>
            <p>Login to your account</p>

            <!-- Username -->
            <div class="form-group">
                <label for="txtUsername">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                <span class="toggle-password" onclick="togglePassword()">👁</span>
            </div>

            <!-- Buttons -->
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Go Back to Home" CssClass="btn"
                OnClientClick="window.location.href='Userhome.aspx'; return false;" />

            <!-- Message -->
            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <!-- Register Link -->
            <div class="extra-link">
                Don’t have an account? <a href="Userregisteration.aspx">Register here</a>
            </div>
        </div>
    </form>

    <script>
        function togglePassword() {
            const pwd = document.getElementById('<%= txtPassword.ClientID %>');
            pwd.type = pwd.type === 'password' ? 'text' : 'password';
        }
    </script>
</body>
</html>
