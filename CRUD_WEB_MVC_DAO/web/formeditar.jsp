<%-- 
    Document   : formeditar
    Created on : 8 de out. de 2024, 20:27:56
    Author     : cassiano.shishido
--%>

<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Formulário Editar Produto</title>
        <style>
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #cc9900;
                color: #f0f0f0;
                margin: 0;
                padding: 0;
            }

            .container {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
            }

            form {
                background-color: #663300;
                padding: 20px;
                border-radius: 8px;
                justify-content: space-between;
                max-width: 600px;
                margin: 0 auto;
                text-align: center;
            }
                        
            h1 {
                text-align: center;
                font-size: 24px;
                color: #f0f0f0;
                margin: 10px 0;
            }

            .form-grid {
                display: flex;
                background-color: #663300;
                border-radius: 8px;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                padding: 20px;
                justify-content: space-between;
                margin: 0 auto;
                text-align: center;
                gap: 20px;
            }

            .form-grid div {
                flex: 1;
            }
            
            label {
                font-weight: bold;
                display: block;
                margin-bottom: 8px;
            }

            input[type="text"],
            input[type="number"],
            input[type="date"],
            select {
                width: 100%;
                padding: 25px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 16px;
            }

            button {
                background-color: #996600;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-size: 16px;
                margin-right: 10px;
            }

            button:hover {
                background-color: #0056b3;
            }

            .action-buttons {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
            }

            .action-buttons button {
                margin: 5px;
            }

            a:hover {
                background-color: #996600;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Editar Produto</h1>

            <%
                Produto prod = (Produto) request.getAttribute("prod");
                if (prod != null) {
            %>
            
            <div class="form-grid">
                <div>
                <form action="ManterProduto" method="GET">
                    <label for="txtid">ID:</label>
                    <input type="text" name="txtid" readonly value="<%= prod.getId() %>"><br>

                    <label for="txtdescricao">Descrição:</label>
                    <input type="text" name="txtdescricao" value="<%= prod.getDescricao() %>" placeholder="Digite a descrição do produto"><br>

                    <label for="txtpreco">Preço:</label>
                    <input type="text" name="txtpreco" value="<%= prod.getPreco() %>" placeholder="Digite o preço do produto"><br>

                    <label for="txtcategoria">Categoria:</label>
                    <select name="txtcategoria" id="txtcategoria">
                        <option value="Bebidas geladas" <%= prod.getCategoria().equals("Bebidas geladas") ? "selected" : "" %>>Bebidas geladas</option>
                        <option value="Bebidas quentes" <%= prod.getCategoria().equals("Bebidas quentes") ? "selected" : "" %>>Bebidas quentes</option>
                        <option value="Comidas frias" <%= prod.getCategoria().equals("Comidas frias") ? "selected" : "" %>>Comidas frias</option>
                        <option value="Comidas quentes" <%= prod.getCategoria().equals("Comidas quentes") ? "selected" : "" %>>Comidas quentes</option>
                    </select><br>

                    <label for="txttamanho">Tamanho:</label>
                    <select name="txttamanho" id="txttamanho">
                        <option value="Pequeno" <%= prod.getTamanho().equals("Pequeno") ? "selected" : "" %>>Pequeno</option>
                        <option value="Medio" <%= prod.getTamanho().equals("Medio") ? "selected" : "" %>>Médio</option>
                        <option value="Grande" <%= prod.getTamanho().equals("Grande") ? "selected" : "" %>>Grande</option>
                        <option value="Unico" <%= prod.getTamanho().equals("Unico") ? "selected" : "" %>>Único</option>
                    </select><br>
                    </div>
                    <div>
                    <label for="txtdataDeValidade">Data de Validade:</label>
                    <input type="date" name="txtdataDeValidade" value="<%= prod.getDataDeValidade() %>"><br>

                    <label for="txtingredientes">Ingredientes:</label>
                    <input type="text" name="txtingredientes" value="<%= prod.getIngredientes() %>" placeholder="Digite os ingredientes"><br>

                    <label for="txtcalorias">Valor Energético (kcal):</label>
                    <input type="number" name="txtcalorias" value="<%= prod.getValorEnergetico() %>" placeholder="Valor energético em calorias"><br>

                    <label for="txttempopreparo">Tempo de Preparo (minutos):</label>
                    <input type="number" name="txttempopreparo" value="<%= prod.getTempoPreparo() %>" placeholder="Tempo de preparo em minutos"><br>

                    <label for="txtfuncionalidade">Funcionalidade:</label>
                    <select name="txtfuncionalidade" id="txtfuncionalidade">
                        <option value="Proteico" <%= prod.getFuncionalidade().equals("Proteico") ? "selected" : "" %>>Proteico</option>
                        <option value="Diurético" <%= prod.getFuncionalidade().equals("Diurético") ? "selected" : "" %>>Diurético</option>
                        <option value="Digestivo" <%= prod.getFuncionalidade().equals("Digestivo") ? "selected" : "" %>>Digestivo</option>
                        <option value="Antioxidantes" <%= prod.getFuncionalidade().equals("Antioxidantes") ? "selected" : "" %>>Antioxidantes</option>
                        <option value="Energizantes" <%= prod.getFuncionalidade().equals("Energizantes") ? "selected" : "" %>>Energizantes</option>
                        <option value="Relaxante" <%= prod.getFuncionalidade().equals("Relaxante") ? "selected" : "" %>>Relaxante</option>
                    </select><br>

                    <div class="action-buttons">
                        <button type="submit" name="btnop" value="ATUALIZAR">Atualizar Produto</button>
                        <button type="submit" name="btnop" value="DELETAR">Excluir Produto</button>
                        <button type="button" onclick="window.location.href='index.html'">Voltar</button>
                    </div>
                </form>
            <%
                } else {
                    out.println("Produto não encontrado.");
                }
            %>
        </div>
    </body>
</html>