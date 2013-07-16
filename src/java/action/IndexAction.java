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
public class IndexAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		if (AccountHelper.isLoggedIn()) {
			AccountHelper.logout();
		}

		return SUCCESS;
	}
}
