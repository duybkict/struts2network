/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import helper.AccountHelper;
import helper.DBHelper;
import helper.PostHelper;
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
					PostHelper.insertPost(this.post);
					return SUCCESS;
				case UPDATE:
					PostHelper.updatePost(this.post);
					return SUCCESS;
				case DELETE:
					PostHelper.deletePost(Math.abs(this.post.getId()));
					return SUCCESS;
				default: // Incorrect submit action
					this.submitAction = SubmitAction.NONE;
			}
		}

		this.user = AccountHelper.getLoggedInUser();
		this.posts = PostHelper.getPosts(this.offset, this.limit);

		return INPUT;
	}

	// <editor-fold defaultstate="collapsed" desc="getters and setters">
	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public Person getUser() {
		return user;
	}

	public ArrayList<Post> getPosts() {
		return posts;
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
		return (PostHelper.getCountPosts() - 1) / limit;
	}

	public SubmitAction getSubmitAction() {
		return submitAction;
	}

	public void setSubmitAction(SubmitAction submitAction) {
		this.submitAction = submitAction;
	}
	// </editor-fold>
}
