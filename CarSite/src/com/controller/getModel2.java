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
import com.model.carinfoDTO2;

@WebServlet("/getModel2")
public class getModel2 extends HttpServlet {
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
      carinfoDTO2 dto = new carinfoDTO2(brand, model, d_model, grade, year);
      
      System.out.println(brand+"/"+model+"/"+d_model+"/"+grade+"/"+year);
      System.out.println(getJSON(dto));

      response.getWriter().write(getJSON(dto));

   }

   
      public String getJSON(carinfoDTO2 dto) { 
//    	 ArrayList<String> list = new ArrayList<String>();
         StringBuffer result = new StringBuffer();
         carDAO dao = new carDAO();
         
         carinfoDTO2 dto2 = dao.select_all2(dto);

         result.append("{");
         
         result.append("\"color\":[");
         result.append("{\"value\" : \""+dto2.getColor()+"\"}],");
         result.append("\"car_type\":[");
         result.append("{\"value\" : \""+dto2.getCar_type()+"\"}],");
         result.append("\"gear\":[");
         result.append("{\"value\" : \""+dto2.getGear()+"\"}],");
         result.append("\"fuel\":[");
         result.append("{\"value\" : \""+dto2.getFuel()+"\"}],");
         
         result.append("\"fe\":[");
         result.append("{\"value\" : \""+dto2.getFe()+"\"}],");
         result.append("\"cc\":[");
         result.append("{\"value\" : \""+dto2.getCc()+"\"}],");
         result.append("\"output\":[");
         result.append("{\"value\" : \""+dto2.getMaxoutput()+"\"}],");
         result.append("\"torque\":[");
         result.append("{\"value\" : \""+dto2.getMaxtorque()+"\"}],");
         result.append("\"people\":[");
         result.append("{\"value\" : \""+dto2.getPeople()+"\"}],");
         result.append("\"wheel\":[");
         result.append("{\"value\" : \""+dto2.getWheel()+"\"}],");
         result.append("\"tire\":[");
         result.append("{\"value\" : \""+dto2.getTire()+"\"}],");
         result.append("\"drivesys\":[");
         result.append("{\"value\" : \""+dto2.getDrivesystem()+"\"}]");
         
         result.append("}");
         return result.toString();


         
               
     }


}