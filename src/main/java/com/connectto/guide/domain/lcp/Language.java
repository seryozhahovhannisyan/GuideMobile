package com.connectto.guide.domain.lcp;

import java.util.Locale;

/**
 * Created by Seryozha on 4/28/2016.
 */
public enum Language {

	ENGLISH (1, "en", "label.lang.en"),
	GERMAN	(2, "de", "label.lang.de");

	Language(final int value, final String language, final String labelKey) {
		this.value = value;
		this.language = language;
		this.labelKey = labelKey;
	}

	public static Language valueOf(int value) {
		for (Language e : Language.values()) {
			if (e.getValue() == value) {
				return e;
			}
		}
		return null;
	}

	public int getValue() {
		return value;
	}

	public String getLanguage() {
		return language;
	}

	public String getLabelKey() {
		return labelKey;
	}

	public Locale getLocale() {
		if (locale == null) {
			locale = new Locale(language);
		}
		return locale;
	}

	private final int value;
	private final String language;
	private final String labelKey;
	private Locale locale;
}
