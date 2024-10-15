/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProdutoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Produto;

/**
 *
 * @author ptoledo
 */
@WebServlet(name = "ManterProduto", urlPatterns = {"/ManterProduto"})
public class ManterProduto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String msg = "";

            String op = request.getParameter("btnop");
            ProdutoDAO pdao = new ProdutoDAO();
            Produto p = new Produto();
            
            if (op.equals("CADASTRAR")) {
                try {
                    String descricao = request.getParameter("txtdescricao");
                    double preco = Double.parseDouble(request.getParameter("txtpreco"));
                    String categoria = request.getParameter("categoria");
                    String tamanho = request.getParameter("tamanho");
                    String dataDeValidade = request.getParameter("txtdataDeValidade");
                    String ingredientes = request.getParameter("txtingredientes");
                    String valorEnergetico = request.getParameter("txtcalorias");
                    String tempoPreparo = request.getParameter("txttempopreparo");
                    String funcionalidade = request.getParameter("funcionalidade");
                    p.setDescricao(descricao);
                    p.setPreco(preco);
                    p.setCategoria(categoria);
                    p.setTamanho(tamanho);
                    p.setDataDeValidade(dataDeValidade);
                    p.setIngredientes(ingredientes);
                    p.setValorEnergetico(Integer.parseInt(valorEnergetico));
                    p.setTempoPreparo(Integer.parseInt(tempoPreparo));
                    p.setFuncionalidade(funcionalidade);
                    pdao.cadastrar(p);
                    msg = "Item adicionado ao iCoffee!";
                    System.out.println("Item adicionado ao iCoffee!");
                } catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
                    msg = "O iCoffee não registrou o cadastro do produto.";
                    System.out.println("ERRO: " + ex.getMessage());
                }
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("resultado.jsp").forward(request, response);

            } else if (op.equals("DELETAR")) {
                try {
                    int id = Integer.parseInt(request.getParameter("txtid"));
                    p.setId(id);
                    pdao.deletar(p);
                    msg = "Item deletado do iCoffee.";
                    System.out.println("Item deletado do iCoffee.");
                } catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
                    msg = "Não foi possível deletar o item do iCoffee desta vez. <br>"
                            + "Para deletar, insira o ID do produto.";
                    System.out.println("ERRO: " + ex.getMessage());
                }
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("resultado.jsp").forward(request, response);
                
            }  else if (op.equals("EDITAR")) {
                try {
                    int id = Integer.parseInt(request.getParameter("txtid"));
                    p.setId(id);
                    Produto prod = pdao.consultarById(p);
                    request.setAttribute("prod", prod);
                    request.getRequestDispatcher("formeditar.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
                    msg = "Erro na edição do produto. Para editar, insira o ID do produto.";
                    System.out.println("ERRO: " + ex.getMessage());
                }
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("resultado.jsp").forward(request, response);
            
            } else if (op.equals("ATUALIZAR")) {
                try {
                    int id = Integer.parseInt(request.getParameter("txtid"));
                    String descricao = request.getParameter("txtdescricao");
                    double preco = Double.parseDouble(request.getParameter("txtpreco"));
                    String categoria = request.getParameter("txtcategoria");
                    String tamanho = request.getParameter("txttamanho");
                    String dataDeValidade = request.getParameter("txtdataDeValidade");
                    String ingredientes = request.getParameter("txtingredientes");
                    int valorEnergetico = Integer.parseInt(request.getParameter("txtcalorias"));
                    int tempoPreparo = Integer.parseInt(request.getParameter("txttempopreparo"));
                    String funcionalidade = request.getParameter("txtfuncionalidade");
                    p.setId(id);
                    p.setDescricao(descricao);
                    p.setPreco(preco);
                    p.setCategoria(categoria);
                    p.setTamanho(tamanho);
                    p.setDataDeValidade(dataDeValidade);
                    p.setIngredientes(ingredientes);
                    p.setValorEnergetico(valorEnergetico);
                    p.setTempoPreparo(tempoPreparo);
                    p.setFuncionalidade(funcionalidade);
                    pdao.atualizar(p);
                    msg = "Atualizado com sucesso.";
                    System.out.println("Atualizado com sucesso.");
                } catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
                    msg = "Erro ao Atualizar.";
                    System.out.println("ERRO: " + ex.getMessage());
                }
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("resultado.jsp").forward(request, response);
            } else if (op.equals("CONSULTARBYID")) {
                try {
                    int id = Integer.parseInt(request.getParameter("txtid"));
                    p.setId(id);
                    Produto prod = pdao.consultarById(p);
                    request.setAttribute("prod", prod);
                    request.getRequestDispatcher("resultadoconsultarbyid.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
                    msg = "Não encontramos nenhum produto, confirme o código inserido.";
                    System.out.println("ERRO: " + ex.getMessage());
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("resultado.jsp").forward(request, response);
                    
                }
            
            } else if (op.equals("CONSULTAR_TODOS")) {
                try {
                    List<Produto> listaProdutos = pdao.consultarTodos();
                    request.setAttribute("listaProdutos", listaProdutos);
                    request.getRequestDispatcher("resultadoconsultartodos.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException ex) {
                    msg = "Erro ao consultar todos os produtos.";
                    System.out.println("ERRO: " + ex.getMessage());
                    request.setAttribute("msg", msg);
                    request.getRequestDispatcher("resultado.jsp").forward(request, response);
                }
            }
            

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
