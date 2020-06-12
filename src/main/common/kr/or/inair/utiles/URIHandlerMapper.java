package kr.or.inair.utiles;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

public class URIHandlerMapper {
	private static Map<String, String> contentTitleMap = new HashMap<String, String>();
	   
	   static{
	      ResourceBundle bundle = ResourceBundle.getBundle("kr.or.inair.info.contentTitleMap");
	      Enumeration<String> servletPaths = bundle.getKeys();
	      while(servletPaths.hasMoreElements()){
	         String key = servletPaths.nextElement();
	         String value = bundle.getString(key);
	         
	         contentTitleMap.put(key, value);
	      }
	   }
	   
   public static Map<String, String> getContentTitleMap(){
      return contentTitleMap;
   }
}
