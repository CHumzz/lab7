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
                                        <a href="">Edit</a>
                                        
                                        <a href="user?action=delete&email=${user.email.replace("+", "%2B")}">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <h2> Edit Users</h2>
                    <form action="user" method="post">
                        <input type="hidden" name="action" value="edit">
                        <table>
                        
                        <label for="e_email">Email</label>
                        <input type="text" name="e_email" id="e_email">
                        
                        <label for="e_first">First Name</label>
                        <input type="text" name="e_first" id="e_first">
                        
                        <label for="e_last">Last Name</label>
                        <input type="text" name="e_last" id="e_last">
                        
                        <label for="e_password">Password</label>
                        <input type="text" name="e_password" id="e_password">
                        
                        <label for="isActiveEdit">Active</label>
                        <input type ="number" id="isActiveEdit" name ="isActiveEdit" min ="0" max="1">
                        
                        <label for="role">Role</label>
                        <select name="e_role" id="e_role">
                            <option value="1">System Admin</option>
                            <option value="2">Regular User</option>
                            <option value="3">Company Admin</option>
                        </select>
                        
                        <button type="submit">Edit User</button>
                        
                        </table>
                    </form>
                    
                    
                    
                    
                </div>
            </div>
        </div>
        
    </body>
</html>
