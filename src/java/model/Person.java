/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import com.mysql.jdbc.Connection;
import helper.DBHelper;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class Person {

	private int id;
	private String name;
	private String email;
	private String password;
	private ArrayList<Post> posts;

	public Person() {
		this.id = 0;
		this.name = "";
		this.email = "";
		this.password = "";
		this.posts = new ArrayList<Post>();
	}

	public Person(int id) {
		this.id = id;
		this.name = "";
		this.email = "";
		this.password = "";
		this.posts = new ArrayList<Post>();

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

				pst = con.prepareStatement("SELECT * FROM posts WHERE person_id = ?");
				pst.setInt(1, id);
				rs = pst.executeQuery();

				while (rs.next()) {
					this.posts.add(new Post(
						rs.getInt("id"),
						rs.getInt("person_id"),
						rs.getString("content"),
						rs.getTimestamp("created")));
				}
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

	public String getFirstName() {
		return name;
	}

	public void setFirstName(String firstName) {
		this.name = firstName;
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

	public ArrayList<Post> getPosts() {
		return posts;
	}

	public void setPosts(ArrayList<Post> posts) {
		this.posts = posts;
	}	
}
