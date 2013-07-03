/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import model.Person;
import model.Post;

/**
 *
 * @author DELL
 */
public class PostAction {

	private Post post;
	private Person user;

	public PostAction() {
	}

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
}
