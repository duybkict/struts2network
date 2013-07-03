/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import model.Person;
import model.Post;

/**
 *
 * @author DELL
 */
public class HomeAction extends ActionSupport {
	private Post post;
	private Person user;
	private ArrayList<Post> posts;	

	@Override
	public String execute() throws Exception {
		this.user = new Person(1);
		return SUCCESS;
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

	public ArrayList<Post> getPosts() {
		return posts;
	}

	public void setPosts(ArrayList<Post> posts) {
		this.posts = posts;
	}	
}
