/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import SB.CategoryFacadeLocal;
import static com.sun.xml.ws.spi.db.BindingContextFactory.LOGGER;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author zerox
 */
@WebServlet(name = "categoryEdit_uploadFile", urlPatterns = {"/categoryEdit_uploadFile"})
@MultipartConfig
public class categoryEdit_uploadFile extends HttpServlet {

    @EJB
    private CategoryFacadeLocal categoryFacade;

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
        // Create path components to save the file
        final String path = getServletContext().getRealPath("assets/img/categories/");
        final Part filePart = request.getPart("image");
        final String fileName = getFileName(filePart);

        OutputStream out = null;
        InputStream filecontent = null;

        try {
            out = new FileOutputStream(new File(path + File.separator
                    + fileName));
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            LOGGER.log(Level.INFO, "File{0}being uploaded to {1}",
                    new Object[]{fileName, path});
        } catch (FileNotFoundException fne) {
            LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}",
                    new Object[]{fne.getMessage()});
        } finally {
            if (out != null) {
                out.close();
            }
            if (filecontent != null) {
                filecontent.close();
            }
        }
        //post edit category
        String image = fileName;
        String name = request.getParameter("name");
        int id = Integer.parseInt(request.getParameter("id"));
        Models.Category category = categoryFacade.find(id);
        
        Models.Category cateByName = categoryFacade.getCateByName(name);
        boolean error = false;
        String errorMess = "";
        if (name.trim().isEmpty()) {
            errorMess = errorMess.equals("") ? "Name cannot be blank" : errorMess;
                error = true;
        }
        if (cateByName != null) {
            if (!category.getName().equalsIgnoreCase(name)) {
                errorMess = errorMess.equals("") ? "Name Category exist" : errorMess;
                error = true;
            }
        }
        if (image == null) {
            category.setPicture(categoryFacade.find(id).getPicture());
        } else {
            category.setPicture(image);
        }

        if (error) {
            request.setAttribute("cateId", id);
        request.setAttribute("cateName", category.getName());
        request.setAttribute("cateImage", category.getPicture());
        request.setAttribute("cate", category.getEnabled());
            request.setAttribute("error", errorMess);
            request.getRequestDispatcher("/admin/category-edit.jsp").forward(request, response);
            return;
        }
        try {
            category.setName(name);
            categoryFacade.edit(category);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        response.sendRedirect(request.getContextPath() + "/admin/category/list");
    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                String fileName = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
                if (fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0) {
                    String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
                    String rFileName = "n_" + (new Date()).getTime() + "." + extension;
                    return rFileName;
                } else {
                    return null;
                }
            }
        }
        return null;
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
