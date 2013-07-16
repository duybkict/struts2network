/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class MessageHelper {
	private static ArrayList<String> infos = new ArrayList<String>();
	private static ArrayList<String> warnings = new ArrayList<String>();
	private static ArrayList<String> errors = new ArrayList<String>();
	
	public static boolean hasErrors() {
		return !errors.isEmpty();
	}

	public static ArrayList<String> getErrors() {
		return errors;
	}

	public static void addError(String message) {
		errors.add(message);
	}

	public static boolean hasWarnings() {
		return !warnings.isEmpty();
	}

	public static ArrayList<String> getWarnings() {
		return warnings;
	}

	public static void addWarning(String message) {
		warnings.add(message);
	}

	public static boolean hasInfo() {
		return !infos.isEmpty();
	}

	public static ArrayList<String> getInfos() {
		return infos;
	}

	public static void addInfo(String message) {
		infos.add(message);
	}

	public static void clearMessages() {
		errors.clear();
		warnings.clear();
		infos.clear();
	}
}
