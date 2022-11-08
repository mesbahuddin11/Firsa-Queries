Select  ls.wh_id, 
        ls.load_id, 
        ls.stop_id, 
        (Select top 1 customer_id  from t_order o 
		where o.load_id = ls.load_id and o.load_seq = ls.stop_id) as 'cust_id' ,
        ls.shipping_label_number as 'num_ship_items', 
        ls.bol_id,
                
                t_order.route,
                t_order.order_number,
                t_order.cust_po_number,
                t_order.customer_id,
                t_order.carrier,
                t_order.ship_to_code,
                t_order.ship_to_name,
                t_order.ship_to_addr1,
                t_order.ship_to_addr2,
                t_order.ship_to_city,
                t_order.ship_to_state,
                t_order.ship_to_zip,
                t_order.date_picked
From t_load_stop ls (NOLOCK)

Cross apply 
(
   Select top 1  t_order.route,
                t_order.order_number,
                t_order.cust_po_number,
                t_order.customer_id,
                t_order.carrier,
                t_order.ship_to_code,
                t_order.ship_to_name,
                t_order.ship_to_addr1,
                t_order.ship_to_addr2,
                t_order.ship_to_city,
                t_order.ship_to_state,
                t_order.ship_to_zip,
                t_order.date_picked
				from t_order
   Where t_order.load_seq= ls.stop_id and t_order.load_id = ls.load_id
   )  t_order
where ls.load_id = '3M112150635';



