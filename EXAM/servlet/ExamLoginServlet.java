package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.ExamMemberDao;

@WebServlet("/ExamLoginServlet")
public class ExamLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        ExamMemberDao mDao = new ExamMemberDao();
        boolean result = false;

        try {
            result = mDao.loginCheck(id, pw);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ExamLoginMain.jsp");
            return;
        }

        if (result) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", id); // 로그인한 사용자 ID를 세션에 저장
            
            if ("admin".equals(id)) {
                response.sendRedirect("ExamAdminServlet"); // 관리자 페이지를 위한 서블릿 호출
            } else {
                response.sendRedirect("ExamMain.jsp");
            }
        } else {
            request.setAttribute("loginFailed", "true"); // 로그인 실패 속성 설정
            request.getRequestDispatcher("ExamLoginMain.jsp").forward(request, response);
        }
    }
}
