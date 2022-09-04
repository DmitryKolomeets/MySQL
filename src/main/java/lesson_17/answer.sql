EXPLAIN EXTENDED
SELECT p.product_id,
       p.product_name,
       p.product_desc,
       ph.photo_path
FROM Products p
         LEFT JOIN Product_photos ph
                   ON ph.product_id_ref = p.product_id AND ph.is_main = 1