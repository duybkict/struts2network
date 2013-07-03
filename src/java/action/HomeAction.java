/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import model.Person;
import model.Post;

/**
 *
 * @author DELL
 */
public class HomeAction extends ActionSupport {
	private Post post;
	private Person user;
	
	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public Person getUser() {
		return user;
	}

	public void setUser(Person user) {
		this.user = user;
	}

	@Override
	public String execute() throws Exception {
		this.user = new Person(1);
		return SUCCESS;
	}
}
