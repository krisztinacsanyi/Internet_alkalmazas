<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="header">
        <div class="userbox">
            Üdvözöljük, <span><!--Ide lehet írni a nevét--></span>
        </div>
        <div class="button">
            <a href="logout.jsp">Kijelentkezés</a>
        </div>
    </div>
    <h1>Recept szerkesztése</h1>


    <div class="recipebox">
        <div class="recipe">
            <div class="inner">
                <div class="input">
                    <input type="text" name="title" id="title" value="Cím">
                </div>
                <h3>Szöveg:</h3>
                <textarea name="description" id="description" rows="10">
                    At, facere quasi obcaecati autem dignissimos eligendi et commodi repudiandae ad voluptatum assumenda voluptas eveniet ducimus debitis incidunt cumque! Reprehenderit voluptate a, temporibus praesentium, autem architecto numquam beatae distinctio culpa, doloribus totam? Explicabo ex tenetur quas excepturi, quos nisi cumque reiciendis repellendus quod placeat repellat eum rem quisquam soluta incidunt doloribus dolor.
                </textarea>
                <div class="button bigger">
                    <a href="">Mentés</a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>