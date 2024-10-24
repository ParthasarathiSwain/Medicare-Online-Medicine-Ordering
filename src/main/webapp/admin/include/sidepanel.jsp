<nav class="navbar navbar-default navbar-fixed-top ">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle Navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		
		<a href="index.jsp" class="navbar-brand">MEDICARE-Admin</a>	
	</div>
	<ul class="nav navbar-right top-nav">
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				 <b class="caret"></b>
			</a>
			<ul class="dropdown-menu"> 
				<li>
					<a href="index.jsp?profile">
					<i class="fa fa-fw fa-user"></i> Profile
					</a>
				</li>
				<li>
					<a href="index.jsp?editprofile">
					<i class="fa fa-fw fa-wrench"></i> Edit Profile
					</a>
				</li>
				<li class="divider"></li>
				<li>
					<a href="orderlist.jsp">
					<i class="fa fa-fw fa-shopping-basket"></i> Orders
					<span class="badge"></span>
					</a>
				</li>
				<li>
					<a href="index.jsp?viewproducts">
					<i class="fa fa-list-alt"></i> Products
					<span class="badge"></span>
					</a>
				</li>
				<li class="divider"></li>
				<li>
					<a href="logout.jsp">
					<i class="fa fa-sign-out"></i> Logout
					</a>
				</li>
			</ul>
		</li>
	</ul>
	
	<div class="collapse navbar-collapse navbar-ex1-collapse" style="background-color:#00251a;">
		<ul class="nav navbar-nav side-nav" style="background-color:#00251a;color:#FFFFFF">

<!--Menu Item Start-->
			<li>
				<a href="index.jsp">
					<i class="fa fa-dashboard"></i> Dashboard
				</a>
			</li>
<!--Menu Item End-->
			
<!--Menu Item Start-->
			<li>
				<a href="#" data-toggle="collapse" data-target="#productlist">
					<i class="fa fa-navicon"></i> Products <i class="fa fa-angle-double-down"></i> 
				</a>
<!--sub menu start-->
				<ul id="productlist" class="collapse">
					<li>
						<a href="../admin/addProduct.jsp" id="addProduct">Add Product</a>
					</li>
					<li>
						<a href="../admin/viewProducts.jsp" id="viewProduct">View Products</a>
					</li>
				</ul>
			</li>	
<!--Menu Item End-->
<!--Menu Item Start-->
			<li>
				<a href="../admin/orderlist.jsp" id="orderList" >
					<i class="fa fa-shopping-basket"></i> Orders
				</a>
			</li>	
<!--Menu Item End-->

<!--Menu Item Start-->
			<li>
				<a href="javascript:void(0);" id="payment">
					<i class="fa fa-dollar"></i> Payments
				</a>
			</li>	
<!--Menu Item End-->
	
<!--Menu Item Start-->
			<li>
				<a href="../admin/customers.jsp" id="customer">
					<i class="fa fa-users"></i> Customer
				</a>
			</li>	
<!--Menu Item End-->

<!--Menu Item Start-->
			<li>
				<a href="#" data-toggle="collapse" data-target="#categorylist">
					<i class="fa fa-plus-square"></i> Category <i class="fa fa-angle-double-down"></i> 
				</a>
<!--sub menu start-->
				<ul id="categorylist" class="collapse">
					<li>
						<a href="../admin/addCategory.jsp" id="addCategory"> Add Category</a>
					</li>
					<li>
						<a  href="../admin/viewCategory.jsp" id="viewcategory"> View Category</a>
					</li>
				</ul>
			</li>	
<!--Menu Item End-->

<!--Menu Item Start-->
			<li>
				<a href="#" data-toggle="collapse" data-target="#manufacturelist">
					<i class="fa fa-university"></i> Manufacture <i class="fa fa-angle-double-down"></i> 
				</a>
<!--sub menu start-->
				<ul id="manufacturelist" class="collapse">
					<li>
						<a  href="../admin/addManufacture.jsp" id="addmanufacture"> Add Manufacture</a>
					</li>
					<li>
						<a  href="../admin/viewManufacture.jsp" id="viewmanufacture"> View Manufacture</a>
					</li>
				</ul>
			</li>	
<!--Menu Item End-->

<!--Menu Item Start-->
			<li>
				<a href="#" data-toggle="collapse" data-target="#coupons">
					<i class="fa fa-diamond"></i> Coupons <i class="fa fa-angle-double-down"></i> 
				</a>
<!--sub menu start-->
				<ul id="coupons" class="collapse">
					<li>
						<a href="../admin/addCoupon.jsp" id="addcoupon"> Add Coupons</a>
					</li>
					<li>
						<a href="../admin/viewCoupons.jsp" id="viewcoupon"> View Coupons</a>
					</li>
				</ul>
			</li>	
<!--Menu Item End-->
	
<!--Menu Item Start-->
			
<!--Menu Item End-->

<!--Menu Item Start-->
			<li>
				<a href="#" data-toggle="collapse" data-target="#slideshowbox">
					<i class="fa fa-image"></i> SlideShow <i class="fa fa-angle-double-down"></i> 
				</a>
<!--sub menu start-->
				<ul id="slideshowbox" class="collapse">
					<li>
						<a href="../admin/addSlide.jsp" id="addslide"> Add SlideShow</a>
					</li>
					<li>
						<a href="../admin/viewSlide.jsp" id="viewslide"> View SlideShow</a>
					</li>
				</ul>
			</li>	
<!--Menu Item End-->
	
<!--Menu Item Start-->
			<li>
				<a href="#" data-toggle="collapse" data-target="#adminmgt">
					<i class="fa fa-fire"></i> Admin Manager <i class="fa fa-angle-double-down"></i> 
				</a>
<!--sub menu start-->
				<ul id="adminmgt" class="collapse">
					<li>
						<a href="../admin/addAdmin.jsp" id="addadminstrator"> Add Adminstrator</a>
					</li>
					<li>
						<a href="../admin/viewAdmin.jsp" id="viewadminstrator"> View Adminstrator</a>
					</li>
				</ul>
			</li>	
<!--Menu Item End-->

<!--Menu Item Start-->
			<li>
				<a href="logout.jsp">
					<i class="fa fa-sign-out"></i> Logout
				</a>
			</li>	
<!--Menu Item End-->
		</ul>
		
	</div>
</nav>
