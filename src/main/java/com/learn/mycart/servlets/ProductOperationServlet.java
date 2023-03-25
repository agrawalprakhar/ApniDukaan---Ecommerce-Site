/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.mycart.servlets;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
//            Fetching Database
            String op=request.getParameter("operation");
            if(op.trim().equals("addcategory"))
            {
            String title=request.getParameter("catTitle");
            String description=request.getParameter("catDescription");
                Category category=new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);
                
                //category database save
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId=categoryDao.saveCategory(category);
                
                HttpSession httpsession=request.getSession();
                httpsession.setAttribute("message", "Category added Successfully : "+catId);
                response.sendRedirect("admin.jsp");
                return;
            }
            else if(op.trim().equals("addproduct"))
            {
                String pName=request.getParameter("pName");
                String pDesc=request.getParameter("pDesc");
                int pPrice=Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
                int catId=Integer.parseInt(request.getParameter("catId"));
                Part part=request.getPart("pPic");
                
                Product p=new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());
                
                //get Category By Id
                CategoryDao cdoa=new CategoryDao(FactoryProvider.getFactory());
                Category category=cdoa.getCategoryById(catId);
                
                p.setCategory(category);
                
                ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
                pDao.saveProduct(p);
          
                //pic upload
                 String path=request.getRealPath("img")+File.separator+"Product"+File.separator+part.getSubmittedFileName();
                 System.out.println(path);
                 //uploading code
                 try{
                     
                 
                 FileOutputStream fos = new FileOutputStream(path);
                 InputStream is =part.getInputStream();
                 
                 //reading data
                 byte[] data=new byte[is.available()];
                 is.read(data);
                 
                 //Writing the data
                 
                 fos.write(data);
                 fos.close();
                 }
                 catch (Exception e)
                 {
                     e.printStackTrace();
                 }
                 
                 
                
                
                HttpSession httpsession=request.getSession();
                httpsession.setAttribute("message", "Product added Successfully ");
                response.sendRedirect("admin.jsp");
                return;
                
            }
        }
    }

   
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
