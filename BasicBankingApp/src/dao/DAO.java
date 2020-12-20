package dao;

import java.io.InputStream;
import java.sql.*;
import java.util.*;

public class DAO {
	private Connection con;

	public DAO() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingdb?allowPublicKeyRetrieval=true", "root",
				"Samar323@");

	}

	public ArrayList<HashMap> getAllCustomer() throws Exception {
		PreparedStatement p = con.prepareStatement("select * from customer_details");
		ResultSet rs = p.executeQuery();
		ArrayList<HashMap> allCustomers = new ArrayList();
		while (rs.next()) {
			HashMap customerDetails = new HashMap();
			customerDetails.put("email", rs.getString("email"));
			customerDetails.put("name", rs.getString("name"));
			customerDetails.put("ac_balance", rs.getInt("ac_balance"));
			allCustomers.add(customerDetails);
		}
		return allCustomers;
	}

	public int getBalance(String email) throws Exception {
		PreparedStatement p = con.prepareStatement("select * from customer_details where email=?");
		p.setString(1, email);
		ResultSet rs = p.executeQuery();
		if (rs.next()) {
			return rs.getInt("ac_balance");
		} else {
			return 0;
		}
	}

	public boolean changeBalance(String email, int balance) throws Exception {
		PreparedStatement p = con.prepareStatement("update customer_details set ac_balance=? where email=?");
		p.setInt(1, balance);
		p.setString(2, email);
		p.executeUpdate();
		return true;

	}

	public boolean insertTransaction(HashMap transactionDetails) throws Exception {
		try {
			PreparedStatement p = con.prepareStatement(
					"insert into transaction_details (sender_email,receiver_email,amount,date) values(?,?,?,CURRENT_DATE)");
			p.setString(1, (String) transactionDetails.get("semail"));
			p.setString(2, (String) transactionDetails.get("remail"));
			p.setInt(3, (int) transactionDetails.get("amount"));
			p.executeUpdate();
			return true;
		} catch (Exception ex) {
			return false;
		}
	}
	
	public ArrayList<HashMap> getAllTransaction() throws Exception {
		PreparedStatement p = con.prepareStatement("select * from transaction_details");
		ResultSet rs = p.executeQuery();
		ArrayList<HashMap> allTransaction = new ArrayList();
		while (rs.next()) {
			HashMap transactionDetails = new HashMap();
			transactionDetails.put("semail", rs.getString("sender_email"));
			transactionDetails.put("remail", rs.getString("receiver_email"));
			transactionDetails.put("amount", rs.getInt("amount"));
			transactionDetails.put("date", rs.getDate("date"));
			allTransaction.add(transactionDetails);
		}
		return allTransaction;
	}
}
