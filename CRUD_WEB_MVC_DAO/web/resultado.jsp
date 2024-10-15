<%-- 
    Document   : resultado
    Created on : 17 de set. de 2024, 21:18:33
    Author     : ptoledo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #cc9900;
            color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            display: flex;
            align-items: center;
            position: relative;
        }

        /* Estilo do balão de fala */
        .speech-bubble {
            background-color: #663300;
            color: white;
            padding: 15px;
            border-radius: 10px;
            max-width: 300px;
            position: relative;
            font-size: 18px;
            margin-left: 20px;
        }

        .speech-bubble::after {
            content: '';
            position: absolute;
            top: 50%;
            left: -20px;
            transform: translateY(-50%);
            border-width: 10px;
            border-style: solid;
            border-color: transparent #663300 transparent transparent;
        }

        /* Estilo da imagem do barista */
        .barista {
            width: 100px;
        }

        h1 {
            margin: 0;
            font-size: 20px;
        }

        a {
            display: block;
            margin-top: 20px;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            background-color: #996600;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
        }

        a:hover {
            background-color: #cc6600;
        }
    </style>
</head>
<body>

    <div class="container">
        <!-- Imagem do barista -->
        <img src="barista.png" alt="Barista" class="barista">

        <!-- Balão de fala -->
        <div class="speech-bubble">
            <h1>iCoffee: <%= (String) request.getAttribute("msg") %></h1>
            <a href="index.html">Voltar</a>
        </div>
    </div>

</body>
</html>