SELECT
	 o.id AS activity_id

	 , o.created_at AS ts

	 , NULL     AS source
	 , NULL     AS source_id

	 , o.email  AS customer

	 , 'completed_order' AS activity

	 , d.code   AS feature_1 -- discount code
	 , NULL     AS feature_2
	 , NULL     AS feature_3

	 , (o.total_price - o.total_discounts) AS revenue_impact

	 , NULL  AS link

FROM shopify.order AS o
LEFT JOIN shopify.order_discount_code d
    ON (d.order_id = o.id)

WHERE
    o.cancelled_at is NULL
    and o.email is not NULL
