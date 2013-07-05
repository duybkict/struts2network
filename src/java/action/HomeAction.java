/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import helper.DBHelper;
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
	private int offset;
	private int limit;
	
	{
		offset = 0;
		limit = 5;
	}

	@Override
	public String execute() throws Exception {
		if (this.post != null) {
			if (this.post.getId() == 0) {
				DBHelper.insertPost(this.post);
				return SUCCESS;				
			} else if (this.post.getId() > 0) {
				DBHelper.updatePost(this.post);
				return SUCCESS;
			} else if (this.post.getId() < 0) {
				DBHelper.deletePost(Math.abs(this.post.getId()));
				return SUCCESS;
			} 
		}

		this.user = new Person(1);
		this.posts = DBHelper.getPosts(this.offset, this.limit);

		return INPUT;
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

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}
	
	public int getCountPages() {
		return (DBHelper.getCountPosts() - 1) / limit;
	}
}
