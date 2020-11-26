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
            <a href="">Kijelentkezés</a>
        </div>
    </div>
    <h1>Recept szerkesztése</h1>


    <div class="recipebox">
        <div class="recipe">
            <div class="inner">
                <div class="input">
                    <input type="text" name="title" id="title" placeholder="Cím">
                </div>
                <h3>Összetevők:</h3>
                <textarea name="description" id="description" rows="5" placeholder="Írja ide az összetevőket enterrel elválasztva">

                </textarea>
                <h3>Leírás</h3>
                <textarea name="description" id="description" rows="10" placeholder="Írja ide a leírást">

                </textarea>
                <div class="button bigger">
                    <a href="">Mentés</a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>