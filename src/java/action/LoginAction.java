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
		boolean valid = true;

		if (email.trim().length() == 0) {
			addFieldError("email", "Email is required.");
			valid = false;
		}

		if (password != null && password.trim().length() == 0) {
			addFieldError("password", "Password is required.");
			valid = false;
		}

		if (valid && !AccountHelper.login(email, password)) {
			addFieldError("email", "Incorrect Email or Password.");
		}
	}

	@Override
	public String execute() throws Exception {

		return SUCCESS;
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
}
