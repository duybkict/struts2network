/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author DELL
 */
public class Post {

	private int id;
	private int personId;
	private String content;
	private Timestamp created;
	private Timestamp modified;
	private Person person;

	public Post() {
		this.id = 0;
		this.personId = 0;
		this.content = "";
		this.created = new Timestamp(1992, 11, 9, 0, 0, 0, 0);
	}

	public Post(int id, int personId, String content, Timestamp created) {
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

	public Timestamp getCreated() {
		return created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public Timestamp getModified() {
		return modified;
	}

	public void setModified(Timestamp modified) {
		this.modified = modified;
	}
}
