package com.connectto.guide.common.util;

import java.util.List;

/**
 * Created by Seryozha on 4/30/16.
 */
public class CollectionHelper {

	public static boolean isEmpty(List<?> list) {
		return list == null || list.size() == 0;
	}

	public static boolean isNotEmpty(List<?> list) {
		return !isEmpty(list);
	}

	public static String getContentAsString(Object[] array, String delimiter, boolean trimContents) {
		if (array == null || array.length == 0)
			return "";
		if (delimiter == null || delimiter.length() == 0)
			delimiter = ",";

		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < array.length - 1; i++) {
			if (trimContents) {
				sb.append(String.valueOf(array[i]).trim());
			} else {
				sb.append(array[i]);
			}
			sb.append(delimiter);
		}
		sb.append(array[array.length - 1]);

		return sb.toString();
	}
}
