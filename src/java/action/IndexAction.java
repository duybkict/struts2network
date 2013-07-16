/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class IndexAction extends ActionSupport {

	@Override
	public String execute() throws Exception {

		return SUCCESS;
	}

	// <editor-fold defaultstate="collapsed" desc="getters and setters">	
	@Override
	public ArrayList<String> getErrorMessages() {
		return MessageHelper.getErrors();
	}

	public ArrayList<String> getWarningMessages() {
		return MessageHelper.getWarnings();
	}

	public ArrayList<String> getInfoMessages() {
		return MessageHelper.getInfos();
	}
	// </editor-fold>
}
