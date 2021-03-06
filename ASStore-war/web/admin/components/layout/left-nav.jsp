<%-- 
    Document   : left-nav
    Created on : May 2, 2018, 3:35:29 PM
    Author     : zerox
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="left-nav col-2" style="padding: 20px; height: 100vh; background: white; box-shadow: 2px 0px 5px 0px rgba(0,0,0,0.20);">
    <%-- Global Url --%>
    <input type="hidden" id="urlProject" value="<c:url value="/" />"/>

    <a href="index" class="m-b-20" style="margin-left: 10px; display: block">
        <img src="<c:url value='/assets/img/asstore-logo.png'/>" alt="IMG-LOGO">
    </a>
    <div class="nav p-l-10">
        <ul>
            <li class="m-b-5">
                <a href="<c:url value="/admin/products/list"></c:url>" style="font-size: 1.1rem">Product list</a>
                </li>
                <li class="m-b-5">
                    <a href="<c:url value="/admin/products/approving-list"></c:url>" style="font-size: 1.1rem">Product approving list</a>
                </li>
                <li class="m-b-5">
                    <a href="<c:url value="/admin/anime/list"></c:url>" style="font-size: 1.1rem">Anime list</a>
                </li>
                <li class="m-b-5">
                    <a href="<c:url value="/admin/category/list"></c:url>" style="font-size: 1.1rem">Category list</a>
                </li>
                <li class="m-b-5">
                    <a href="<c:url value="/admin/orders/list"></c:url>" style="font-size: 1.1rem">Orders list</a>
                </li>
            <c:if test="${sessionScope.role.id == 1}">
                <li class="m-b-5">
                    <a href="<c:url value="/admin/user/list"></c:url>" style="font-size: 1.1rem">User list</a>
                    </li>
                    <li class="m-b-5">
                        <a href="<c:url value="/admin/permissionServlet/list"></c:url>" style="font-size: 1.1rem">Permission</a>
                    </li>
            </c:if>
            <!-- Button -->
            <a href="<c:url value='/admin/user/logoutadmin'/>" class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
                Log Out
            </a>
        </ul>
    </div>
</div>
