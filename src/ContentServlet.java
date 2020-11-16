import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ContentServlet")
public class ContentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String val = request.getParameter("ProvinceId");
        List computer = new ArrayList();
        if(val.equals("1")){
            computer.add("泉州市");
            computer.add("福州市");
            computer.add("厦门市");
        }else if(val.equals("2")){
            computer.add("温州市");
            computer.add("宁波市");
            computer.add("杭州市");
        }else if(val.equals("3")){
            computer.add("芜湖市");
            computer.add("合肥市");
            computer.add("池州市");
        }
        String json = JSON.toJSONString(computer);
        System.out.println(json);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println(json);
    }
}
