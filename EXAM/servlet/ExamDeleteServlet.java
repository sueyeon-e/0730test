package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ExamMemberDao;

@WebServlet("/ExamDeleteServlet")
public class ExamDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		ExamMemberDao mDao = new ExamMemberDao();
		try {
            mDao.deleteMember(id); 
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ExamAdmin.jsp"); 
            return;
        }

        response.sendRedirect("ExamAdmin.jsp"); 
	}

}
