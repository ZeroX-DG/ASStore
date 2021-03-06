<%-- 
    Document   : header
    Created on : Apr 25, 2018, 9:49:10 AM
    Author     : zerox
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header -->
<header class="header1">
  <input type="hidden" id="urlProject" value="<c:url value="/" />"/>
  <!-- Header desktop -->
  <div class="container-menu-header">
    <div class="wrap_header">
      <!-- Logo -->
      <a href="<c:url value="/index"/>" class="logo">
        <img src="<c:url value='/assets/img/asstore-logo.png'/>" alt="IMG-LOGO">
      </a>

      <!-- Menu -->
      <div class="wrap_menu">
        <nav class="menu">
          <ul class="main_menu">
            <li>
              <a href="<c:url value="/products/list"/>">Products</a>
            </li>

            <li>
              <a href="<c:url value="/category/list"/>">Categories</a>
            </li>

            <li>
              <a href="<c:url value="/anime/list"/>">Anime</a>
            </li>
            <c:if test="${sessionScope.userid != null}">
            <li>
              <a href="<c:url value="/coupon/list"/>">Coupons</a>
            </li>
            </c:if>
            <c:if test="${sessionScope.userid != null}">
            <li>
              <a href="<c:url value="/orders/list"/>">Orders</a>
            </li>
            </c:if>
            <li>
              <a href="<c:url value="/feedbacks/list"/>">Feedback</a>
            </li>
            <c:if test="${sessionScope.userid != null}">
            <li>
                <a href="<c:url value="/statisticals/listcate"/>">Statistical</a>
            </li>
            </c:if>
            <li>
                <a href="<c:url value="/user/Statistical_user"/>">User Rating</a>
            </li>
          </ul>
        </nav>
      </div>
      <!-- Header Icon -->

      <div class="header-icons">
        <c:choose>
          <c:when test="${sessionScope.userid == null}">
              <a href="<c:url value="/products/new-product"/>" style="margin-right: 20px;" onmouseover="this.style.color = 'red'">
              <button>NEW POST</button>   
            </a>
            <a href="<c:url value="/User/login"/>"  style="margin-right: 20px;" onmouseover="this.style.color = 'red'">
              <button>LOG IN</button>
            </a>
          </c:when>
          <c:otherwise>
            <a href="<c:url value="/products/new-product"/>" style="margin-right: 20px;" onmouseover="this.style.color = 'red'">
              <button>NEW POST</button>   
            </a>
            <a href="<c:url value="/User/detail"/>" class="header-wrapicon1 dis-block">
              <img src="<c:url value='/assets/img/icons/icon-header-01.png'/>" class="header-icon1" alt="ICON">
            </a>
              <input type="hidden" id="hiddenuserid" value="${sessionScope.userid}"/>
              <p class="numberNotification" style="color: red"></p>
          </c:otherwise>
        </c:choose>


        <span class="linedivide1"></span>

        <div class="header-wrapicon2">
          <a href="<c:url value="/cart/list" />">
            <img src="<c:url value='/assets/img/icons/icon-header-02.png'/>" class="header-icon1 js-show-header-dropdown" alt="ICON">
          </a>
        </div>
      </div>
    </div>
  </div>

  <!-- Header Mobile -->
  <div class="wrap_header_mobile">
    <!-- Logo moblie -->
    <a href="<c:url value="/index"/>" class="logo-mobile">
      <img src="<c:url value='/assets/img/asstore-logo.png'/>" alt="IMG-LOGO">
    </a>

    <!-- Button show menu -->
    <div class="btn-show-menu">
      <!-- Header Icon mobile -->
      <div class="header-icons-mobile">
        <c:choose>
          <c:when test="${sessionScope.userid == null}">
            <a href="<c:url value="/products/new-product"/>" style="margin-right: 20px;" onmouseover="this.style.color = 'red'">
              <button>NEW POST</button>   
            </a>
            |
            <a href="<c:url value="/User/login"/>" style="margin-right: 20px;" onmouseover="this.style.color = 'red'">
              <button>LOG IN</button>   
            </a>
          </c:when>
          <c:otherwise>
            <a href="<c:url value="/products/new-product"/>" style="margin-right: 20px;" onmouseover="this.style.color = 'red'">
              <button>NEW POST</button>   
            </a>
            <a href="<c:url value="/User/detail"/>" class="header-wrapicon1 dis-block">
              <img src="<c:url value='/assets/img/icons/icon-header-01.png'/>" class="header-icon1" alt="ICON">
            </a>
          </c:otherwise>
        </c:choose>

        <span class="linedivide2"></span>

        <div class="header-wrapicon2">
          <a href="<c:url value="/cart/list" />">
            <img src="<c:url value='/assets/img/icons/icon-header-02.png'/>" class="header-icon1 js-show-header-dropdown" alt="ICON">
          </a>
        </div>
      </div>

      <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
        <span class="hamburger-box">
          <span class="hamburger-inner"></span>
        </span>
      </div>
    </div>
  </div>

  <!-- Menu Mobile -->
  <div class="wrap-side-menu" >
    <nav class="side-menu">
      <ul class="main-menu">

        <li class="item-menu-mobile">
          <a href="<c:url value="/index"/>">Home</a>
        </li>

        <li class="item-menu-mobile">
          <a href="<c:url value="/products/list"/>">Products</a>
        </li>

        <li class="item-menu-mobile">
          <a href="<c:url value="/category/list"/>">Categories</a>
        </li>

        <li class="item-menu-mobile">
          <a href="<c:url value="/anime/list"/>">Anime</a>
        </li>
        
        <li class="item-menu-mobile">
          <a href="<c:url value="/coupon/list"/>">Coupons</a>
        </li>

        <li class="item-menu-mobile">
          <a href="<c:url value="/feedbacks/list"/>">Feedback</a>
        </li>
        <li class="item-menu-mobile">
          <a href="<c:url value="/statisticals/listcate"/>">Statistical</a>
        </li>
      </ul>
    </nav>
  </div>
</header>