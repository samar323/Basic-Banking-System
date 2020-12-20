package servlets;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

@WebServlet("/TransferMoney")
public class TransferMoney extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String semail=request.getParameter("semail");
			String remail=request.getParameter("remail");
			int amount=Integer.parseInt(request.getParameter("amount"));
			if(!semail.equalsIgnoreCase(remail) && amount>0) {
			DAO dao=new DAO();
			int sbalance=dao.getBalance(semail);
			int rbalance=dao.getBalance(remail);
			
			if(sbalance>amount) {
			int senderRemainingBalance=sbalance-amount;
			int receiverRemainingBalance=sbalance+amount;
			
			boolean senderResult=dao.changeBalance(semail, senderRemainingBalance);
			boolean receiverResult=dao.changeBalance(remail, receiverRemainingBalance);
			if(senderResult==true && receiverResult==true) {
				HashMap transactionDetails=new HashMap();
				transactionDetails.put("semail", semail);
				transactionDetails.put("remail", remail);
				transactionDetails.put("amount", amount);
				boolean result=dao.insertTransaction(transactionDetails);
				if(result==true) {
					HttpSession session=request.getSession();
					session.setAttribute("message", "Transaction Successfull!");
					response.sendRedirect("Customer.jsp");
				}else {
					response.sendRedirect("index.jsp");
				}
				
			}else {
				response.sendRedirect("index.jsp");
			}
			}else {
				HttpSession session=request.getSession();
				session.setAttribute("message", "Sender has not sufficient balance!");
				response.sendRedirect("Customer.jsp");
			}
			}else {
				HttpSession session=request.getSession();
				session.setAttribute("message", "Sender & Receiver cannot be same & amount should be>0");
				response.sendRedirect("Customer.jsp");
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
