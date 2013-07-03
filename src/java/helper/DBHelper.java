/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Person;
import model.Post;

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

	public static ArrayList<Post> getAllPosts() {
		ArrayList<Post> posts = new ArrayList<Post>();

		Connection connection = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		ResultSet rs1 = null;

		try {
			connection = DBHelper.getConnection();
			pst = connection.prepareStatement("SELECT * FROM posts ORDER BY created DESC");
			rs = pst.executeQuery();

			while (rs.next()) {
				Post post = new Post(
					rs.getInt("id"),
					rs.getInt("person_id"),
					rs.getString("content"),
					rs.getDate("created"));				
				
				pst = con.prepareStatement("SELECT * FROM people WHERE id = ?");
				pst.setInt(1, rs.getInt("person_id"));
				rs1 = pst.executeQuery();

				if (rs1.next()) {
					post.setPerson(new Person(
						rs1.getInt("id"), 
						rs1.getString("first_name"),
						rs1.getString("last_name"),
						rs1.getString("email"),
						rs1.getString("password"),
						rs1.getDate("birthday"),
						rs1.getBoolean("gender")));
				}
				
				posts.add(post);
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
				if (rs1 != null) {
					rs1.close();
				}
				if (pst != null) {
					pst.close();
				}

			} catch (SQLException ex) {
				// Catch exception
			}
		}
		
		return posts;
	}
}
