/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import helper.AccountHelper;
import helper.DBHelper;
import helper.util.SubmitAction;
import model.Person;

/**
 *
 * @author DELL
 */
public class AccountAction extends ActionSupport {

	private Person user;
	private SubmitAction submitAction;
	
	{
		this.user = AccountHelper.getLoggedInUser();
		this.submitAction = SubmitAction.NONE;
	}

	@Override
	public String execute() throws Exception {
		if (this.submitAction != SubmitAction.NONE) {
			switch (this.submitAction) {
				case UPDATE:
					AccountHelper.updateSettings();
					return SUCCESS;
				case SECURITY:
					AccountHelper.updatePassword();
					return SUCCESS;
				default: // Incorrect submit action
					this.submitAction = SubmitAction.NONE;
			}			
		}		
		
		return INPUT;		
	}
	
	public Person getUser() {
		return this.user;
	}

	public void setUser(Person user) {
		this.user = user;
	}

	public SubmitAction getSubmitAction() {
		return submitAction;
	}

	public void setSubmitAction(SubmitAction submitAction) {
		this.submitAction = submitAction;
	}
}
