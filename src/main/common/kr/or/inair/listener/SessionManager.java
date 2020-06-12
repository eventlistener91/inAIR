package kr.or.inair.listener;

import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.stereotype.Component;

@Component
public class SessionManager implements HttpSessionAttributeListener, HttpSessionListener{

	public static Hashtable<String, Object> connectCount;
	
	public SessionManager() {
		if(connectCount == null) {
			connectCount = new Hashtable<String, Object>();
		}
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession newSession = event.getSession();
		
		synchronized (connectCount) {
			connectCount.put(newSession.getId(), newSession);
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession removeSession = event.getSession();
		
		synchronized (connectCount) {
			connectCount.remove(removeSession.getId());
		}
	} 

	@Override
	public void attributeAdded(HttpSessionBindingEvent arg0) {
		
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		
	}
	
	public static int getConnectCount() {
		return connectCount.size();
	}
	
}
