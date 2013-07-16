/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import com.mysql.jdbc.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import model.Person;
import model.Post;

/**
 *
 * @author DELL
 */
public class PostHelper {
	private static int countPosts = -1;

	public static void insertPost(Post post) {
		Connection connection = null;
		PreparedStatement pst = null;
		try {
			connection = DBHelper.getConnection();
			pst = connection.prepareStatement("INSERT INTO posts(person_id, content, created) VALUES (?, ?, ?)");
			pst.setInt(1, post.getPersonId());
			pst.setString(2, post.getContent());
			pst.setTimestamp(3, new Timestamp(new Date().getTime()));
			pst.executeUpdate();
			countPosts++;
		} catch (ClassNotFoundException ex) {
			// Catch exception
			System.out.println();
		} catch (SQLException ex) {
			// Catch exception
			System.out.println();
		} finally {
			try {
				if (pst != null) {
					pst.close();
				}
			} catch (SQLException ex) {
				// Catch exception
				System.out.println();
			}
		}
	}

	public static void deletePost(int id) {
		Connection connection = null;
		PreparedStatement pst = null;
		try {
			connection = DBHelper.getConnection();
			pst = connection.prepareStatement("DELETE FROM posts WHERE id = ?");
			pst.setInt(1, id);
			pst.execute();
			countPosts--;
		} catch (ClassNotFoundException ex) {
			// Catch exception
			System.out.println();
		} catch (SQLException ex) {
			// Catch exception
			System.out.println();
		} finally {
			try {
				if (pst != null) {
					pst.close();
				}
			} catch (SQLException ex) {
				// Catch exception
				System.out.println();
			}
		}
	}

	public static ArrayList<Post> getPosts() {
		ArrayList<Post> posts = new ArrayList<Post>();
		Connection connection = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		try {
			connection = DBHelper.getConnection();
			pst = connection.prepareStatement("SELECT * FROM posts ORDER BY created DESC");
			rs = pst.executeQuery();
			while (rs.next()) {
				Post post = new Post(rs.getInt("id"), rs.getInt("person_id"), rs.getString("content"), rs.getTimestamp("created"));
				pst = connection.prepareStatement("SELECT * FROM people WHERE id = ?");
				pst.setInt(1, rs.getInt("person_id"));
				rs1 = pst.executeQuery();
				if (rs1.next()) {
					post.setPerson(new Person(rs1.getInt("id"), rs1.getString("name"), rs1.getString("email"), rs1.getString("password")));
				}
				posts.add(post);
			}
		} catch (ClassNotFoundException ex) {
			// Catch exception
			System.out.println();
		} catch (SQLException ex) {
			// Catch exception
			System.out.println();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (rs1 != null) {
					rs1.close();
				}
				if (pst != null) {
					pst.close();
				}
			} catch (SQLException ex) {
				// Catch exception
				System.out.println();
			}
		}
		return posts;
	}

	public static ArrayList<Post> getPosts(int offset, int limit) {
		ArrayList<Post> posts = new ArrayList<Post>();
		Connection connection = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		try {
			connection = DBHelper.getConnection();
			pst = connection.prepareStatement("SELECT * FROM posts ORDER BY created DESC LIMIT ?, ?");
			pst.setInt(1, offset);
			pst.setInt(2, limit);
			rs = pst.executeQuery();
			while (rs.next()) {
				Post post = new Post(rs.getInt("id"), rs.getInt("person_id"), rs.getString("content"), rs.getTimestamp("created"));
				pst = connection.prepareStatement("SELECT * FROM people WHERE id = ?");
				pst.setInt(1, rs.getInt("person_id"));
				rs1 = pst.executeQuery();
				if (rs1.next()) {
					post.setPerson(new Person(rs1.getInt("id"), rs1.getString("name"), rs1.getString("email"), rs1.getString("password")));
				}
				posts.add(post);
			}
		} catch (ClassNotFoundException ex) {
			// Catch exception
			System.out.println();
		} catch (SQLException ex) {
			// Catch exception
			System.out.println();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (rs1 != null) {
					rs1.close();
				}
				if (pst != null) {
					pst.close();
				}
			} catch (SQLException ex) {
				// Catch exception
				System.out.println();
			}
		}
		return posts;
	}

	public static void updatePost(Post post) {
		Connection connection = null;
		PreparedStatement pst = null;
		try {
			connection = DBHelper.getConnection();
			pst = connection.prepareStatement("UPDATE posts SET content = ?, modified = ? WHERE id = ?");
			pst.setString(1, post.getContent());
			pst.setTimestamp(2, new Timestamp(new Date().getTime()));
			pst.setInt(3, post.getId());
			pst.executeUpdate();
		} catch (ClassNotFoundException ex) {
			// Catch exception
			System.out.println();
		} catch (SQLException ex) {
			// Catch exception
			System.out.println();
		} finally {
			try {
				if (pst != null) {
					pst.close();
				}
			} catch (SQLException ex) {
				// Catch exception
				System.out.println();
			}
		}
	}

	public static int getCountPosts() {
		if (countPosts < 0) {
			Connection connection = null;
			PreparedStatement pst = null;
			ResultSet rs = null;
			try {
				connection = DBHelper.getConnection();
				pst = connection.prepareStatement("SELECT COUNT(id) FROM posts");
				rs = pst.executeQuery();
				if (rs.next()) {
					countPosts = rs.getInt(1);
				}
			} catch (ClassNotFoundException ex) {
				// Catch exception
				System.out.println();
			} catch (SQLException ex) {
				// Catch exception
				System.out.println();
			} finally {
				try {
					if (rs != null) {
						rs.close();
					}
					if (pst != null) {
						pst.close();
					}
				} catch (SQLException ex) {
					// Catch exception
					System.out.println();
				}
			}
		}
		return countPosts;
	}
}
