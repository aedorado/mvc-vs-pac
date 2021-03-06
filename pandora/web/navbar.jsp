<%@page import="dao.UserDaoImp"%>
<%@page import="dao.FollowersDaoImp"%>
<%
FollowersDaoImp fdi = new FollowersDaoImp();
UserDaoImp udip = new UserDaoImp();
long sessionUserId = ((Long)session.getAttribute("user_id")).longValue();
String requestUrl = request.getRequestURL().toString();
boolean indexPage = requestUrl.contains("index") ? true : false;
boolean uploadPage = requestUrl.contains("addImage") ? true : false;
boolean profilePage = requestUrl.contains("profile") ? true : false;

%>

<%
long getParamUserId = 0;
String username = "";
boolean viewedIsFollowedByViewer = false;
if (request.getParameter("user_id") != null) {
getParamUserId = Long.parseLong(request.getParameter("user_id"));
username = udip.getUsernameFromId(getParamUserId);
viewedIsFollowedByViewer = fdi.isfollowing(sessionUserId, getParamUserId);
}
%>


<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">Andorra</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class='<% if (indexPage) out.print("active"); %>'><a href="index.jsp">Home<span class="sr-only">(current)</span></a></li>
                <li class='<% if (uploadPage) out.print("active"); %>'><a href="addImage.jsp">Upload</a></li>
                <!--        <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                          <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">One more separated link</a></li>
                          </ul>
                        </li>-->
            </ul>
            <!--      <form class="navbar-form navbar-left">
                    <div class="form-group">
                      <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                  </form>-->
            <ul class="nav navbar-nav navbar-right">
                <% if (profilePage && viewedIsFollowedByViewer) 
                    out.print("<li><a href='FollowServlet?follow=" + getParamUserId + "'>Unfollow " + username + "</a></li>");
                %> 
                <% if (profilePage && !viewedIsFollowedByViewer) 
                    out.print("<li><a href='FollowServlet?follow=" + getParamUserId + "'>Follow " + username + "</a></li>");
                %> 
                <li class='<% if (profilePage) out.print("active"); %>'><a href='profile.jsp?user_id=<% out.print(session.getAttribute("user_id")); %>'><%out.print(session.getAttribute("username"));%></a></li>
                <li><a href="logout.jsp">Logout</a></li>
                <!--                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="#">Separated link</a></li>
                                    </ul>
                                </li>-->
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
