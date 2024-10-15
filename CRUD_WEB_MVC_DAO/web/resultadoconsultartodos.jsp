<%-- 
    Document   : consultartodos
    Created on : 2 de out. de 2024, 22:37:02
    Author     : Cassiano
--%>

<%@page import="model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Consulta de Todos os Produtos</title>
        <style>
            body {
            font-family: 'Roboto', sans-serif;
            background-color: #cc9900;
            color: #f0f0f0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #a66f00;
        }
        tr:nth-child(even) {
            background-color: #a66f00;
        }
        .btn {
            padding: 8px 16px;
            background-color: #555;
            color: white;
            border: none;
            text-decoration: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <h1>Resultado da Consulta de Todos os Produtos</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Descrição</th>
                <th>Preço</th>
                <th>Categoria</th>
                <th>Tamanho</th>
                <th>Data de Validade</th>
                <th>Ingredientes</th>
                <th>Valor Energético(kcal)</th>
                <th>Tempo de Preparo</th>
                <th>Funcionalidade</th>
                <th>Ações</th> <!-- Adicionando coluna para ações -->
            </tr>
        </thead>
        <tbody>
            <%
                List<Produto> listaProdutos = (List<Produto>) request.getAttribute("listaProdutos");
                if (listaProdutos != null && !listaProdutos.isEmpty()) {
                    for (Produto prod : listaProdutos) {
            %>
            <tr>
                <td><%= prod.getId() %></td>
                <td><%= prod.getDescricao() %></td>
                <td><%= prod.getPreco() %></td>
                <td><%= prod.getCategoria() %></td>
                <td><%= prod.getTamanho() %></td>
                <td><%= prod.getDataDeValidade() %></td>
                <td><%= prod.getIngredientes() %></td>
                <td><%= prod.getValorEnergetico() %></td>
                <td><%= prod.getTempoPreparo() %></td>
                <td><%= prod.getFuncionalidade() %></td>
                <td>
                    <!-- Botão Editar redirecionando ao servlet com o ID do produto -->
                    <!--<a href="ManterProduto?op=EDITAR&txtid= codg abaixo" class="btn">Editar</a> -->
                    <a href=" ManterProduto?txtid=<%= prod.getId() %>&txtdescricao=&txtpreco=&categoria=Bebidas+geladas&tamanho=Unico&txtdataDeValidade=&txtingredientes=&txtcalorias=&txttempopreparo=&funcionalidade=Proteico&btnop=EDITAR" class="btn">Editar</a>
                    <a href=" ManterProduto?txtid=<%= prod.getId() %>&txtdescricao=&txtpreco=&categoria=Bebidas+geladas&tamanho=Unico&txtdataDeValidade=&txtingredientes=&txtcalorias=&txttempopreparo=&funcionalidade=Proteico&btnop=DELETAR" class="btn">Excluir</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="11">Nenhum produto encontrado.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <a href="index.html" class="btn">Voltar</a>
</body>
</html>