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

/**
 *
 * @author DELL
 */
public class AccountHelper {

	private static Person loggedInUser;

	private AccountHelper() {
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
	
	public static void updateSettings() {		
		Connection connection = null;
		PreparedStatement pst = null;

		try {
			connection = DBHelper.getConnection();
			pst = connection.prepareStatement("UPDATE people SET name = ?, email = ? WHERE id = ?");
			pst.setString(1, loggedInUser.getName());
			pst.setString(2, loggedInUser.getEmail());
			pst.setInt(3, loggedInUser.getId());

			pst.executeUpdate();
		} catch (ClassNotFoundException ex) {
			// Catch exception
			System.out.println();
		} catch (SQLException ex) {
			// Catch exception
			System.out.println();
		} finally {
			try {
				if (pst != null) {
					pst.close();
				}

			} catch (SQLException ex) {
				// Catch exception
				System.out.println();
			}
		}
	}
	
	public static void updatePassword() {		
		Connection connection = null;
		PreparedStatement pst = null;

		try {
			connection = DBHelper.getConnection();
			pst = connection.prepareStatement("UPDATE people SET password = ? WHERE id = ?");
			pst.setString(1, loggedInUser.getPassword());
			pst.setInt(2, loggedInUser.getId());

			pst.executeUpdate();
		} catch (ClassNotFoundException ex) {
			// Catch exception
			System.out.println();
		} catch (SQLException ex) {
			// Catch exception
			System.out.println();
		} finally {
			try {
				if (pst != null) {
					pst.close();
				}

			} catch (SQLException ex) {
				// Catch exception
				System.out.println();
			}
		}
	}
}
