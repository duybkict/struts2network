/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import java.util.Comparator;
import model.Post;

/**
 *
 * @author DELL
 */
public class PostDateComparator implements Comparator<Post> {

	@Override
	public int compare(Post o1, Post o2) {
		return o1.getCreated().compareTo(o2.getCreated());
	}
}
