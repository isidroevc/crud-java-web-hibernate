package com.isidroevc.artifacts;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public interface IAuthenticator {
  public void grantAccess(HttpServletResponse response);
  public void removeAccess(HttpServletResponse response);
  public boolean hasAccess(HttpServletRequest request);
}