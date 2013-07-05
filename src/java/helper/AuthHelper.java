/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import com.mysql.jdbc.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Person;
import model.Post;

/**
 *
 * @author DELL
 */
public class AuthHelper {

	private static Person loggedInUser;

	private AuthHelper() {
	}
	
	public static Person getLoggedInUser() {
		return loggedInUser;
	}

	public static boolean login(String email, String password) {
		Connection connection = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			connection = DBHelper.getConnection();
			pst = connection.prepareStatement("SELECT * FROM people WHERE email = ? AND password = ?");
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();

			if (rs.next()) {
				loggedInUser = new Person(
					rs.getInt("id"),
					rs.getString("name"),
					rs.getString("email"),
					rs.getString("password"));
				
				return true;
			}
		} catch (ClassNotFoundException ex) {
			// Catch exception
		} catch (SQLException ex) {
			// Catch exception
		} catch (Exception ex) {
		
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pst != null) {
					pst.close();
				}

			} catch (SQLException ex) {
				// Catch exception
			}
		}

		return false;
	}
}
