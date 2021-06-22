package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.carDAO;
import com.model.carinfoDTO;

@WebServlet("/getModel")
public class getModel extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      String brand = request.getParameter("brand");
      String model = request.getParameter("model");
      String d_model = request.getParameter("d_model");
      String grade = request.getParameter("grade");
      String year = request.getParameter("year");
      carinfoDTO dto = new carinfoDTO(brand, model, d_model, grade, year);
      
      System.out.println(brand+"/"+model+"/"+d_model+"/"+grade+"/"+year);
      //System.out.println("1" + select_id);

      response.getWriter().write(getJSON(dto));

   }

   
      public String getJSON(carinfoDTO dto) { 
         
         StringBuffer result = new StringBuffer();
         carDAO dao = new carDAO();
         ArrayList<String> list = new ArrayList<String>();
         String key = "";
         if (dto.getModel().equals("") && dto.getD_model().equals("") && dto.getGrade().equals("") && dto.getYear().equals("")) {
            list = dao.selectModel(dto.getBrand());
            key = "brand";
            
         }else if (dto.getD_model().equals("") && dto.getGrade().equals("") && dto.getYear().equals("")) {
            list = dao.select_dmodel(dto.getBrand(),dto.getModel());
            key = "model";
            
         }else if (dto.getGrade().equals("") && dto.getYear().equals("")) {
            list = dao.select_grade(dto.getBrand(),dto.getModel(),dto.getD_model());
            key = "d_model";
            
         }else if (dto.getYear().equals("")) {
            list = dao.select_year(dto.getBrand(),dto.getModel(),dto.getD_model(), dto.getGrade());
            key = "grade";
            
         }else {
            System.out.println("¿À·ù");
         }
            
         result.append("{\""+key+"\":["); 
         System.out.println("2"+list); 
         for (int i = 0; i <list.size();i++) {
            if(i==list.size()-1) { 
               result.append("{"+"\"value\" : \""+list.get(i)+"\"}");
            }else { 
               result.append("{"+"\"value\" : \""+list.get(i)+"\"},"); 
            }
         }
         result.append("]}"); System.out.println("3"+result); 
         return result.toString();
               
     }
    

}