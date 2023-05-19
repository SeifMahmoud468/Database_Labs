/* Question 1 */
SELECT
    customer_name
FROM
    customer
where
    customer_name LIKE 'Ma%';

/*Question 2*/
SELECT
    order_id,
    COUNT(DISTINCT order_item.item_id) AS TotalItems,
    SUM(order_item.quantity * item.unit_price) AS TotalDollarAmount
FROM
    order_item
    INNER JOIN item ON item.item_id = order_item.item_id
GROUP BY
    order_id;

/* Question 3 */
SELECT
    order_id
FROM
    shipment
    INNER JOIN warehouse ON warehouse.warehouse_id = shipment.warehouse_id
WHERE
    warehouse.warehouse_city = 'Arica';

/* Question 4 */
SELECT
    SUM(
        order_item.quantity * item.unit_price
    ) AS TotalDollarAmount
FROM
    order_item
    INNER JOIN item ON item.item_id = order_item.item_id
    INNER JOIN shipment ON shipment.order_id = order_item.order_id
WHERE
    shipment.warehouse_id = 8
GROUP BY
    order_item.order_id;

/* Question 5 */
SELECT
    warehouse.warehouse_id,
    warehouse.warehouse_city,
    COUNT(DISTINCT order_item.order_id) AS `No. Orders`
FROM
    warehouse
    LEFT JOIN shipment ON shipment.warehouse_id = warehouse.warehouse_id
    LEFT JOIN order_item ON shipment.order_id = order_item.order_id
GROUP BY
    warehouse.warehouse_id;

/* Question 6 */
SELECT
    customer.customer_name,
    COUNT(DISTINCT `order`.order_id) AS `No. Of Orders`
FROM
    `order`
    RIGHT JOIN customer ON `order`.customer_id = customer.customer_id
GROUP BY
    `order`.customer_id;

/* Question 7 */
SELECT
    item_id,
    unit_price
FROM
    item
WHERE
    item_id NOT IN(
        SELECT
            item.item_id
        FROM
            item
            INNER JOIN order_item ON order_item.item_id = item.item_id
    );