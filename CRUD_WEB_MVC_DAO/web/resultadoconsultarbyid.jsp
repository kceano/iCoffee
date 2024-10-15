<%-- 
    Document   : resultadoconsultarbyid
    Created on : 19 de set. de 2024, 21:13:57
    Author     : ptoledo
--%>

<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #cc9900;
            color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }
        
        h1 {
            text-align: center;
            color: #fff;
        }

        h2 {
            background-color: #a66f00;
            padding: 20px;
            border-radius: 8px;
            line-height: 1.6;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #333;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }

        a:hover {
            background-color: #555;
        }

    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta por código</title>
    </head>
    <body>
        <h1>Resultado da consulta por código do produto</h1>
        <h2>
            <%Produto prod = (Produto) request.getAttribute("prod");%>

            <%
                if (prod.getDescricao() != null) {
            %>
            <strong>ID</strong>: <%out.println(prod.getId());%><br>
            <strong>Descrição</strong>: <%out.println(prod.getDescricao());%><br>
            <strong>Preço</strong>: <%out.println(prod.getPreco());%><br>
            <strong>Categoria</strong>: <%out.println(prod.getCategoria());%><br>
            <strong>Tamanho</strong>: <%out.println(prod.getTamanho());%><br>
            <strong>Data de Validade</strong>: <%out.println(prod.getDataDeValidade());%><br>
            <strong>Ingredientes</strong>: <%out.println(prod.getIngredientes());%><br>
            <strong>Valor Energético (kcal)</strong>: <%out.println(prod.getValorEnergetico());%><br>
            <strong>Tempo de Preparo</strong>: <%out.println(prod.getTempoPreparo());%><br>
            <strong>Funcionalidade</strong>: <%out.println(prod.getFuncionalidade());%><br>
            <%} else {%>
            ID NÃO ENCONTRADO
            <%}%>
                <a href="index.html">Voltar</a>
        </h2>
    </body>
</html>
