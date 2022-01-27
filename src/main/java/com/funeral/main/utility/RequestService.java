package com.funeral.main.utility;

import javax.servlet.http.HttpServletRequest;

public interface RequestService {

	public String getClientIp(HttpServletRequest request);
}
