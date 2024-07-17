SELECT DISTINCT p.product_id, p.product_name
FROM Product p
INNER JOIN Sales s USING(product_id)
WHERE s.sale_date BETWEEN "2019-01-01" AND "2019-03-31" AND p.product_id NOT IN(
    SELECT product_id
    FROM Product p2
    INNER JOIN Sales s2 USING(product_id)
    WHERE s2.sale_date > "2019-03-31" OR s2.sale_date < "2019-01-01"
)