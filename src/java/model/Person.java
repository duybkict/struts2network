/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import helper.DBHelper;
import java.io.File;
import javax.servlet.ServletContext;
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

	// <editor-fold defaultstate="collapsed" desc="constructors">
	public Person() {
	}

	public Person(int id, String name, String email, String password) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
	}
	// </editor-fold>

	// <editor-fold defaultstate="collapsed" desc="getters and setters">
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
		String profileImageRoot = DBHelper.getProfileImageRoot();
		String path = profileImageRoot;
		String filePath = servletContext.getRealPath(path);

		File imagePath = new File(filePath, this.id + ".tmp");
		if (imagePath.exists()) {
			return profileImageRoot + this.id + ".tmp";
		}

		return profileImageRoot + "default.jpg";
	}
	// </editor-fold>
}
