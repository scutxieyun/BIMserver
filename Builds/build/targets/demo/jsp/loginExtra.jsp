<%@page import="org.bimserver.interfaces.objects.SVersion"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.bimserver.shared.exceptions.ServiceException"%>
<%@page import="java.util.Date"%>
<jsp:useBean id="loginManager" scope="session" class="org.bimserver.web.LoginManager" />
<%
	SVersion version = loginManager.getService().getVersion();
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm");
	Date lastReset = null;
	try {
		lastReset = loginManager.getSystemService().getLastDatabaseReset();
	} catch (UserException e) {
		// Ignore		
	}
%>

<div class="info">Last database reset: <%=lastReset == null ? "Unknown" : dateFormat.format(lastReset) %><br/>
Version: <%=checkVersion.getLocalVersion().getVersion() + " (" + dateFormat.format(checkVersion.getLocalVersion().getDate()) + ")"%></div>