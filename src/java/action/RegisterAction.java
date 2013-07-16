/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import helper.AccountHelper;

/**
 *
 * @author DELL
 */
public class RegisterAction extends ActionSupport {
	private String firstname;
	private String lastname;
	private String email;
	private String password;

	@Override
	public String execute() throws Exception {
		AccountHelper.register(email, password, firstname + " " + lastname);
		if (!AccountHelper.isLoggedIn()) {
			return INPUT;
		}

		return SUCCESS;
	}

	// <editor-fold defaultstate="collapsed" desc="getters and setters">
	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
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
	// </editor-fold>
}
