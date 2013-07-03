/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author DELL
 */
public class Post {

	private int id;
	private int personId;
	private String content;
	private Date created;
	private Person person;

	public Post() {
		this.id = 0;
		this.personId = 0;
		this.content = "";
		this.created = new Date(1992, 11, 9);
	}

	public Post(int id, int personId, String content, Date created) {
		this.id = id;
		this.personId = personId;
		this.content = content;
		this.created = created;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPersonId() {
		return personId;
	}

	public void setPersonId(int personId) {
		this.personId = personId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}
}
