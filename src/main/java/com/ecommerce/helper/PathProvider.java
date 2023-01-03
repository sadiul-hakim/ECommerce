package com.ecommerce.helper;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

public class PathProvider {
	public static String getPath(HttpServletRequest request,String picName) {
		return request.getRealPath("img")+File.separator+"products"+File.separator+picName;
	}
}
