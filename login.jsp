<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <h1>Bejelentkezés</h1>
    <div class="loginbox">
        <div class="inner">
            <form action="" method="post">
                <div class="label">
                    Felhasználónév
                </div>
                <div class="input">
                    <input type="text" name="username" id="username">
                </div>
                <div class="label">
                    Jelszó:
                </div>
                <div class="input">
                    <input type="password" name="password" id="password">
                </div>
                <div class="button">
                    <input type="submit" value="Bejelentkezés" name="login">
                </div>
                <div class="label bigger">
                    Még nem regisztrált?
                </div>
                <div class="button bigger">
                    <a href="register.jsp">Kattintson ide</a>
                </div>
            </form>
        </div>
    </div>
</body>

</html>