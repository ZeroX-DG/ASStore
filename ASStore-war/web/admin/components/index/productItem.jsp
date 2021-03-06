<%-- 
    Document   : productItem
    Created on : Apr 25, 2018, 2:37:28 PM
    Author     : zerox
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<div class="post-item p-t-35 fade show active">
  <div class="row">
    <div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
      <!-- Block2 -->
      <div class="block2">
        <div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelnew">
          <img src="assets/img/products/${param.image}" alt="IMG-PRODUCT">

          <div class="block2-overlay trans-0-4">
            <div class="block2-btn-addcart w-size1 trans-0-4">
              <!-- Button -->
              <button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
                Add to Cart
              </button>
            </div>
          </div>
        </div>

        <div class="block2-txt p-t-20">
          <a href="product-detail.html" class="block2-name dis-block s-text3 p-b-5">
            ${param.name}
          </a>

          <span class="block2-price m-text6 p-r-5">
            $${param.price}
          </span>
        </div>
      </div>
    </div>
  </div>
</div>