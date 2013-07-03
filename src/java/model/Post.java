/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author DELL
 */
public class Post {
	private int id;
	private int userId;
	private String content;
	private Person person;
	
	public Post() {
		this.id = 0;
		this.userId = 0;
		this.content = "";
	}
	
	public Post(int id, int userId, String content) {
		this.id = id;
		this.userId = userId;
		this.content = content;
	}
	
	public int getId() {
		return this.id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getUserId() {
		return this.userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public String getContent() {
		return this.content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}	
}
