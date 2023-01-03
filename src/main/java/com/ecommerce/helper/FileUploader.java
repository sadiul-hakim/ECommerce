package com.ecommerce.helper;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.Part;

public class FileUploader {
	public static boolean upload(Part part,String path) {
		boolean isUploaded=false;
		try(OutputStream os=new FileOutputStream(path)){
			InputStream is=part.getInputStream();
			byte[] picBytes=new byte[is.available()];
			
			is.read(picBytes);
			
			os.write(picBytes);
			os.flush();
			
			isUploaded=true;
		}catch(Exception e) {
			e.printStackTrace();
			return isUploaded;
		}
		
		return isUploaded;
	}
}
