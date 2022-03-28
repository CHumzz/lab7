package ca.sait.lab7.servlets;

import ca.sait.lab7.models.User;
import ca.sait.lab7.models.Role;
import ca.sait.lab7.dataaccess.UserDB;
import ca.sait.lab7.services.UserService;
import ca.sait.lab7.services.RoleService;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 *
 * @author Cole
 */
public class UserServlet extends HttpServlet {
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserService service = new UserService();
        RoleService r_service = new RoleService();
   
        String action = request.getParameter("action");  
        
        if (action != null && action.equals("delete")) {
            try {
                String email = request.getParameter("email");
                boolean deleted = service.delete(email);
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        try{
            List<User> users = service.getAll();
            request.setAttribute("users", users);
            this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        //this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // HttpSession session = request.getSession();

        RoleService r_service = new RoleService();
        UserService u_service = new UserService();
        // action must be one of: create, update, delete
        String action = request.getParameter("action");
      
  
        if (action != null && action.equals("edit")) {
            try {
                String email = request.getParameter("email");

                String first = request.getParameter("first");
                String last = request.getParameter("last");
                String password = request.getParameter("password");
                String roleName = request.getParameter("role");
                
                
                int roleID = 0;
                if(roleName.equals("system admin")){
                    roleID=1;
                }else if(roleName.equals("regular user")){
                    roleID=2;
                }else if(roleName.equals("company admin")){
                    roleID=3;
                }
                
                Role newRole = new Role(roleID, roleName);
                
                boolean status = true;
                
                String isActive = request.getParameter("isActiveEdit");
                if(isActive.equals("1")){
                    status=false;
                }
                
                u_service.update(email, status, first, last, password, newRole);
                
                
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } else if (action != null && action.equals("add")) {
            try {
                String email = request.getParameter("a_email"); 
                String first = request.getParameter("a_first");
                String last = request.getParameter("a_last");
                String password = request.getParameter("a_password");
                String roleName = request.getParameter("a_role");
                
                int roleID = 0;
                if(roleName.equals("system admin")){
                    roleID=1;
                }else if(roleName.equals("regular user")){
                    roleID=2;
                }else if(roleName.equals("company admin")){
                    roleID=3;
                }
                
                Role newRole = new Role(roleID, roleName);
                
                boolean status = true;
                
                String isActive = request.getParameter("isActiveAdd");
                if(isActive.equals("1")){
                    status=false;
                }
  
                
                u_service.insert(email, status, first, last, password, newRole );
                
                
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        //UserService userService = new UserService();
        
        try {
            List<User> users = u_service.getAll();
            
            request.setAttribute("users", users); 
            this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
     
        this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }
}
