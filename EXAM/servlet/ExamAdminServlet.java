package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ExamAdminServlet")
public class ExamAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId"); // 로그인한 사용자 ID 가져오기

        if (userId == null || !"admin".equals(userId)) {
            response.sendRedirect("ExamMain.jsp");
            return;
        }

        request.getRequestDispatcher("ExamAdmin.jsp").forward(request, response);
    }
}
