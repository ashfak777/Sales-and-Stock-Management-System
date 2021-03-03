/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "B", urlPatterns = {"/B"})
public class B extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
           InputStream in = B.class.getResourceAsStream("/jasper/user_report.jrxml");
             //JasperReport report = JasperCompileManager.compileReport(in);
             
            Map<String,Object> parameters=new HashMap<>();
            parameters.put("parameter1", "nic");
            parameters.put("parameter2", "name");
            parameters.put("parameter3", "email");
            parameters.put("parameter4", "country");
            
           // JasperPrint print = JasperFillManager.fillReport(report,parameters,new JREmptyDataSource());
           // JasperViewer.viewReport(print);
            //byte data[] =JasperRunManager.runReportToPdf(report, parameters,new JREmptyDataSource());
            ServletOutputStream out= resp.getOutputStream();
            //out.write(data);
            
            resp.setContentType("application/pdf");
            resp.setHeader("Content-Disposition", "inline");
            
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
}
