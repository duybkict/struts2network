/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
public class DBHelper {

	private static Connection con = null;

	// Private constructor prevents instantiation from other classes
	private DBHelper() {
	}

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if (con == null) {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/struts2project", "root", "");
		}
		
		return con;
	}
}
