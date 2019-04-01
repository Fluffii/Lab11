<%@ page import="java.util.*"%>

<%!
	class Record {
		Date date;
		String message;
		Record(Date data, String message){
			this.data = data;
			this.message = message;
		}
	};
	ArrayList<Record> records = new ArrayList<Record>();
%>

<%
	if (records.size() == 0) {
		records.add(new Record(new Date(2013 - 1901, 12, 02, 8, 10), "Проснулся!"));
		records.add(new Record(new Date(2013 - 1901, 12, 02, 8, 30), "Умылся."));
		records.add(new Record(new Date(2013 - 1901, 12, 02, 8, 45), "Варю кофе..."));
	}

	String message = request.getParameter("message");
	if (message != null && message.trim().length() != 0) {
		records.add(new Record(new Date(), message));
	}
%>

<%
	out.println("[");
	for (Record r : records) {
		out.println("{data: \"" + r.data + "\", message: \"" + r.message + "\"},");
	}
	out.println("]");
%>
