/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import com.mysql.jdbc.Connection;
import helper.DBHelper;
import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author DELL
 */
public class Person {

	private int id;
	private String name;
	private String email;
	private String password;

	{
		this.id = 0;
		this.name = "";
		this.email = "";
		this.password = "";
	}

	public Person(int id) {
		this.id = id;

		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			con = DBHelper.getConnection();
			pst = con.prepareStatement("SELECT * FROM people WHERE id = ?");
			pst.setInt(1, id);
			rs = pst.executeQuery();

			if (rs.next()) {
				this.name = rs.getString("name");
				this.email = rs.getString("email");
				this.password = rs.getString("password");
			}
		} catch (ClassNotFoundException ex) {
			// Catch exception
		} catch (SQLException ex) {
			// Catch exception
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
	}

	public Person(int id, String name, String email, String password) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getProfileImagePath() {
		ServletContext servletContext = ServletActionContext.getServletContext();
		String path = "profile_images/";
		String filePath = servletContext.getRealPath(path);

		File imagePath = new File(filePath, this.id + ".tmp");
		if (imagePath.exists()) {
			return "profile_images/" + this.id + ".tmp";
		}
		
		return "profile_images/default.jpg";
	}
}
