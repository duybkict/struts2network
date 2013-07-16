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
public class LoginAction extends ActionSupport {

	private String email;
	private String password;

	{
		email = "";
		password = "";
	}

	@Override
	public void validate() {
		if (!AccountHelper.login(email, password)) {
			addFieldError("email", "Incorrect Email or Password.");
		}
	}

	@Override
	public String execute() throws Exception {
		MessageHelper.clearMessages();

		return SUCCESS;
	}

	// <editor-fold defaultstate="collapsed" desc="getters and setters">
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
