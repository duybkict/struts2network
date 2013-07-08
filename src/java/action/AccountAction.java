/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import helper.AccountHelper;
import helper.DBHelper;
import helper.util.SubmitAction;
import java.io.File;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import model.Person;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author DELL
 */
public class AccountAction extends ActionSupport {

	private Person user;
	private File profileImage;
	private String profileImageContentType;
	private String profileImageFileName;
	private HttpServletRequest servletRequest;
	private SubmitAction submitAction;

	{
		this.user = AccountHelper.getLoggedInUser();
		this.submitAction = SubmitAction.NONE;
	}

	@Override
	public String execute() throws Exception {
		if (this.profileImage != null) {
			try {
				ServletContext servletContext = ServletActionContext.getServletContext();
				String path = "profile_images/";
				String filePath = servletContext.getRealPath(path);
				//String extension = FilenameUtils.getExtension(profileImageFileName);

				File uploadDir = new File(filePath);
				//if the folder does not exits, creating it
				if (!uploadDir.exists()) {
					uploadDir.mkdirs();
				}

				FileUtils.copyFile(profileImage, new File(uploadDir, this.user.getId() + ".tmp"));
				return SUCCESS;
			} catch (Exception e) {
				// Catch exception
			}
		}

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

	public File getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(File profileImage) {
		this.profileImage = profileImage;
	}

	public String getProfileImageContentType() {
		return profileImageContentType;
	}

	public void setProfileImageContentType(String profileImageContentType) {
		this.profileImageContentType = profileImageContentType;
	}

	public String getProfileImageFileName() {
		return profileImageFileName;
	}

	public void setProfileImageFileName(String profileImageFileName) {
		this.profileImageFileName = profileImageFileName;
	}

	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}
}
