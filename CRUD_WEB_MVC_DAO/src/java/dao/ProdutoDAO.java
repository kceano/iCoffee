/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Produto;
import util.FabricaConexao;


/**
 *
 * @author PTOLEDO
 */
public class ProdutoDAO {
    
    
    
    
    public static Connection getConexao() throws ClassNotFoundException, SQLException{
        return FabricaConexao.getConexaoMySQL();
    }
    
    public void cadastrar(Produto prod) throws ClassNotFoundException, SQLException {
        Connection con = getConexao();
        PreparedStatement comando = con.prepareStatement("insert into produto (descricao, preco, categoria, tamanho, dataDeValidade, ingredientes, valorEnergetico, tempoPreparo, funcionalidade) values (?,?,?,?,?,?,?,?,?)");
        comando.setString(1, prod.getDescricao());
        comando.setDouble(2, prod.getPreco());
        comando.setString(3, prod.getCategoria()); 
        comando.setString(4, prod.getTamanho());
        comando.setString(5, prod.getDataDeValidade());
        comando.setString(6, prod.getIngredientes());
        comando.setInt(7, prod.getValorEnergetico());
        comando.setInt(8, prod.getTempoPreparo());
        comando.setString(9, prod.getFuncionalidade());
        comando.execute();
        con.close();
    }
    
    public void deletar(Produto prod) throws ClassNotFoundException, SQLException {
        Connection con = getConexao();
        PreparedStatement comando = con.prepareStatement("delete from produto where id = ?");
        comando.setInt(1, prod.getId());
        comando.execute();
        con.close();
    }
    
    public void atualizar(Produto prod) throws ClassNotFoundException, SQLException {
        Connection con = getConexao();
        PreparedStatement comando = con.prepareStatement("update produto set descricao = ?, preco = ?, categoria = ?, tamanho = ?, dataDeValidade = ?, ingredientes = ?, valorEnergetico = ?, tempoPreparo = ?, funcionalidade = ? where id = ?");
        comando.setString(1, prod.getDescricao());
        comando.setDouble(2, prod.getPreco());
        comando.setString(3, prod.getCategoria()); 
        comando.setString(4, prod.getTamanho());
        comando.setString(5, prod.getDataDeValidade());
        comando.setString(6, prod.getIngredientes());
        comando.setInt(7, prod.getValorEnergetico());
        comando.setInt(8, prod.getTempoPreparo());
        comando.setString(9, prod.getFuncionalidade());
        comando.setInt(10, prod.getId());
        comando.execute();
        con.close();
    }    
    
    public Produto consultarById(Produto prod) throws ClassNotFoundException, SQLException {
        Connection con = getConexao();
        PreparedStatement comando = con.prepareStatement("select * from produto where id = ?");
        comando.setInt(1, prod.getId());
        ResultSet rs = comando.executeQuery();
        Produto p = new Produto();
        if (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setDescricao(rs.getString("descricao"));
            p.setPreco(rs.getDouble("preco")); 
            p.setCategoria(rs.getString("categoria"));
            p.setTamanho(rs.getString("tamanho"));
            p.setDataDeValidade(rs.getString("dataDeValidade"));
            p.setIngredientes(rs.getString("ingredientes"));
            p.setValorEnergetico(rs.getInt("valorEnergetico"));
            p.setTempoPreparo(rs.getInt("tempoPreparo"));
            p.setFuncionalidade(rs.getString("funcionalidade"));
        }       
        con.close();
        return p;
    }
    
    public List<Produto> consultarTodos() throws ClassNotFoundException, SQLException {
        Connection con = getConexao();
        PreparedStatement comando = con.prepareStatement("SELECT * FROM produto");        
        ResultSet rs = comando.executeQuery();        
        List<Produto> listaProdutos = new ArrayList<>();

        while(rs.next()){
            Produto prod = new Produto();
            prod.setId(rs.getInt("id"));
            prod.setDescricao(rs.getString("descricao"));
            prod.setPreco(rs.getDouble("preco")); 
            prod.setCategoria(rs.getString("categoria"));
            prod.setTamanho(rs.getString("tamanho")); 
            prod.setDataDeValidade(rs.getString("dataDeValidade"));
            prod.setIngredientes(rs.getString("ingredientes"));
            prod.setValorEnergetico(rs.getInt("valorEnergetico"));
            prod.setTempoPreparo(rs.getInt("tempoPreparo"));
            prod.setFuncionalidade(rs.getString("funcionalidade"));
            listaProdutos.add(prod);
        }
        con.close();
        return listaProdutos;
    }
}
