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
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private Date birthday;
	private boolean gender;
	private ArrayList<Post> posts;

	public Person() {
		this.id = 0;
		this.firstName = "";
		this.lastName = "";
		this.email = "";
		this.password = "";
		this.birthday = new Date(1992, 9, 11);
		this.gender = false;
		this.posts = new ArrayList<Post>();
	}

	public Person(int id) {
		this.id = id;
		this.firstName = "";
		this.lastName = "";
		this.email = "";
		this.password = "";
		this.birthday = new Date(1992, 11, 9);
		this.gender = false;
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
				this.firstName = rs.getString("first_name");
				this.lastName = rs.getString("last_name");
				this.email = rs.getString("email");
				this.password = rs.getString("password");
				this.birthday = rs.getDate("birthday");
				this.gender = rs.getBoolean("gender");

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

	public Person(int id, String firstName, String lastName, String email, String password, Date birthday, boolean gender) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.birthday = birthday;
		this.gender = gender;
	}	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
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

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public ArrayList<Post> getPosts() {
		return posts;
	}

	public void setPosts(ArrayList<Post> posts) {
		this.posts = posts;
	}	
}
