CREATE VIEW hiten_order_summary AS
SELECT
    O.order_id,
    O.order_date,
    P.product_name,
    C.full_name,
    (P.unit_price * O.quantity) - ((P.unit_price * O.quantity) * O.discount_percent / 100) AS final_cost
FROM customer_master C
JOIN sales_orders O
    ON O.customer_id = C.customer_id
JOIN product_catalog P
    ON P.product_id = O.product_id;

SELECT * FROM hiten_order_summary;

CREATE ROLE hiten_client_user
LOGIN
PASSWORD 'client_password';

GRANT SELECT ON hiten_order_summary TO hiten_client_user;

REVOKE SELECT ON hiten_order_summary FROM hiten_client_user;
