/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import helper.AuthHelper;
import helper.DBHelper;
import helper.util.SubmitAction;
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
	private SubmitAction submitAction;
	
	{
		offset = 0;
		limit = 5;
		submitAction = SubmitAction.NONE;
	}

	@Override
	public String execute() throws Exception {
		if (this.submitAction != SubmitAction.NONE) {
			switch (this.submitAction) {
				case INSERT:
					Post.insertPost(this.post);
					return SUCCESS;
				case UPDATE:
					Post.updatePost(this.post);
					return SUCCESS;
				case DELETE:
					Post.deletePost(Math.abs(this.post.getId()));
					return SUCCESS;
				default: // Incorrect submit action
					this.submitAction = SubmitAction.NONE;
			}			
		}

		this.user = AuthHelper.getLoggedInUser();
		this.posts = Post.getPosts(this.offset, this.limit);

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
		return (Post.getCountPosts() - 1) / limit;
	}

	public SubmitAction getSubmitAction() {
		return submitAction;
	}

	public void setSubmitAction(SubmitAction submitAction) {
		this.submitAction = submitAction;
	}
}
