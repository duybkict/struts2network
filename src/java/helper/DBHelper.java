/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import com.mysql.jdbc.Connection;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

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

			Properties prop = new Properties();

			try {
				prop.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("/custom-config.properties"));

				con = (Connection) DriverManager.getConnection(
					prop.getProperty("database"),
					prop.getProperty("user"),
					prop.getProperty("password"));

			} catch (FileNotFoundException ex) {
				// Catch exception
				System.out.println();
			} catch (IOException ex) {
				// Catch exception
				System.out.println();
			}
		}
		return con;
	}

	public static String getProfileImageRoot() {
		try {
			Properties prop = new Properties();
			prop.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("/custom-config.properties"));

			return prop.getProperty("profile_image_root");
		} catch (IOException ex) {
			// Catch exception
			System.out.println();
		}

		return "/";
	}
}
