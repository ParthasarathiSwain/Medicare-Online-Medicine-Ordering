<center>
	<h3 style="text-transform: uppercase; font-weight: 700;">My Orders</h3>
	<p class="text-info">Want to cancel your order or need any help? Please feel free to contact us</p>
	<hr>
	
	<div class="table-responsive">
		<table class="table table-bordered">
			<thead>
				 <tr>
				 	<th>No</th>
				 	<th>Order NO</th>
				 	<th>Order Date</th>
				 	<th>Product</th>
				 	<th>QTY</th>
					 <th>Unit Price</th>
				 	<th>Amount</th>
				 	<th>Status</th>
				 
				 </tr>
			</thead>
			<tbody>
				<?php
					$cusEmail = $_SESSION['cusEmail'];
					$getCustomerSql = "SELECT * FROM customer WHERE cusEmail='$cusEmail'";
					$getCustomer = mysqli_query($conn,$getCustomerSql);
					$rowGetCustomer = mysqli_fetch_array($getCustomer);

					$customerId = $rowGetCustomer['cusId'];
					$no = 1;
					$getOrdersSql = "SELECT c.order_id,c.order_date,c.order_status,a.productName,b.unit_price,b.qty,b.total_price from product a inner join tbl_order_details b on a.productId = b.product_id inner join tbl_order c on b.fk_order_id = c.id where c.cust_id='$customerId'";
					$getOrders = mysqli_query($conn,$getOrdersSql);
					
					while($getOrdersRow = mysqli_fetch_array($getOrders)){
						$orderNo = $getOrdersRow['order_id'];
						$orderDate = $getOrdersRow['order_date'];
						$productName = $getOrdersRow['productName'];
						$orderQty = $getOrdersRow['qty'];
						$unitPrice = $getOrdersRow['unit_price'];
						$orderStatus= $getOrdersRow['order_status'];
						$orderAmount = $getOrdersRow['total_price'];
						echo "
						<tr>
							<th>$no</th>
							<td>$orderNo</td>
							<td>$orderDate</td>
							<td>$productName</td>
							<td>$orderQty</td>
							<td>$unitPrice</td>
						    <td>$orderAmount</td>
							<td>".($orderStatus==1?"<span class='text-success'>Confirmed<span>":"<span class='text-dganger'>Failed<span>")."</td>";
						
							
						echo "
						</tr>
							
						";
						$no = $no + 1;
					}
				?>
			</tbody>
		</table>
	</div>
</center>
	