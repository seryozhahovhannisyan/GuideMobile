package com.connectto.guide.service.util;

import com.connectto.guide.entity.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * Created by Seryozha on 5/8/16.
 */
public class ServiceHelper {

	public static User getAuthenticatedUser() {
		User user = null;
		SecurityContext context = SecurityContextHolder.getContext();
		if (context != null) {
			Authentication authentication = context.getAuthentication();
			if (authentication != null &&
				authentication.getPrincipal() != null &&
				authentication.getPrincipal() instanceof User) {

				user = (User) authentication.getPrincipal();
			}
		}
		return user;
	}
}
