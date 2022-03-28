<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </head>
    <body>
        
        
        <div class="container">
            <div class="row">
                <div class="col">
                    <h1>Cole's User Management System</h1>
                    
                    <table class="table">
                        <thead>
                            <tr>
                                <th>E-mail</th>
                                <th>First name</th>
                                <th>Last name</th>
                                <th>Active</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.email}</td>
                                    <td>${user.firstName}</td>
                                    <td>${user.lastName}</td>
                                    <td>${user.active ? "Y" : "N"}</td>
                                    <td>
                                        <a href="user?action=edit">Edit</a>
                                        
                                        <a href="user?action=delete&email=${user.email.replace("+", "%2B")}">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        
                    
                    
                    
            <div class="float-right">
                    <form action="user" method="post">
                        <input type="hidden" name="action" value="edit">
                        
                        <h2 > Edit Users</h2>
                        <table>
                        &nbsp;
                        <label for="e_email">Email: &nbsp;</label>
                        <input type="text" name="e_email" id="e_email">
                        &nbsp;
                        <label for="e_first">First Name: &nbsp;</label>
                        <input type="text" name="e_first" id="e_first">
                        &nbsp;
                        <label for="e_last">Last Name: &nbsp;</label>
                        <input type="text" name="e_last" id="e_last"><br>
                        &nbsp;
                        <label for="e_password">Password: &nbsp;</label>
                        <input type="text" name="e_password" id="e_password">
                        &nbsp;
                        <label for="isActiveEdit">Active: &nbsp;</label>
                        <input type ="number" id="isActiveEdit" name ="isActiveEdit" placeholder="0=Active,1=Inactive" style="width: 8em" min ="0" max="1">
                        &nbsp;
                        <label for="e_role">Role: &nbsp;</label>
                        <select name="e_role" id="e_role">
                            <option value="system admin">System Admin</option>
                            <option value="regular user">Regular User</option>
                            <option value="company admin">Company Admin</option>   
                        </select>
                        &nbsp;&nbsp;
                        <button type="submit">Confirm User Edits</button>
                        
                        </table>
                    </form>
            </div>
            
            
            <div class="float-right">
                    <form action="user" method="post">
                        <input type="hidden" name="action" value="add">
                        
                        <h2 > Add Users</h2>
                        <table>
                        &nbsp;
                        <label for="a_email">Email: &nbsp;</label>
                        <input type="text" name="a_email" id="a_email">
                        &nbsp;
                        <label for="e_first">First Name: &nbsp; </label>
                        <input type="text" name="a_first" id="a_first">
                        &nbsp;
                        <label for="e_last">Last Name: &nbsp;</label>
                        <input type="text" name="a_last" id="a_last"><br>
                        &nbsp;
                        <label for="e_password">Password: &nbsp;</label>
                        <input type="text" name="a_password" id="a_password">
                        &nbsp;
                        <label for="isActiveEdit">Active: &nbsp;</label>
                        <input type ="number" id="isActiveAdd" name ="isActiveAdd" placeholder="0=Active,1=Inactive" style="width: 8em" min ="0" max="1">
                        &nbsp;
                        <label for="a_role">Role: &nbsp;</label>
                        <select name="a_role" id="a_role">
                            <option value="system admin">System Admin</option>
                            <option value="regular user">Regular User</option>
                            <option value="company admin">Company Admin</option>   
                        </select>
                        &nbsp;&nbsp;
                        <button type="submit">Add User</button>
                        
                        </table>
                    </form>
        </div>
            
            
        </div>
      
    </body>
</html>
