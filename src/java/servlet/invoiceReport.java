/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author DELL
 */
@WebServlet(name = "invoiceReport", urlPatterns = {"/invoiceReport"})
public class invoiceReport extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("a");
            System.out.println(id);
            InputStream in = invoiceReport.class.getResourceAsStream("/jasper/invoice.jrxml");
            JasperReport report = JasperCompileManager.compileReport(in);

            java.util.Map<String, Object> parameters = new HashMap<>();

//        List<InvoiceItem> invoiceitem=cr1.list();
            parameters.put("parameter3", id);
            parameters.put("parameter1", id);
            parameters.put("parameter2", "2500");
            ServletOutputStream out = resp.getOutputStream();

            byte data[] = JasperRunManager.runReportToPdf(report, parameters, new JREmptyDataSource());
            out.write(data);
        //    byte data[] =JasperRunManager.runReportToPdf(report, parameters,new JREmptyDataSource());

            resp.setContentType("application/pdf");
            resp.setHeader("Content-Disposition", "inline");

            out.flush();
            out.close();
            System.out.println("finish");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
