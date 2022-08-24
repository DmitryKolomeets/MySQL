SELECT
    products.id,
    products.name,
    price.link,
    price.discount,
    price.click_count,
    price.currency,
    price_currency.name,

    -- default currency is ruble
    (@ori_price:=price.price) AS price,

    -- convertation in dollars
    ROUND(price.price / {$course}, 2) AS dol_price,

    -- select minimal price for product
    (@min_price:=(
                SELECT MIN(price)
                FROM price
                WHERE product_id = products.id
                   && id != price.id
            )
        ) AS min_val,

    -- compare price
    -- " + 1 - 1"
    -- mysql трактует извлекаемую инфу как строку
    -- привести к типу иначе вроде нельзя
    (@diff:= ROUND(
                    (
                        @max:=GREATEST(@ori_price + 1 - 1, @min_price + 1 - 1)
                        -
                        @min:=LEAST(@ori_price + 1 - 1, @min_price + 1 - 1)
                    ) / @min * 100, 1
                )
        ) AS diff,

    -- если цена товара, меньше это хорошо, больше хуже
    (IF(@ori_price + 1 - 1 <= @min_price + 1 - 1, @diff, -@diff)) AS diff

FROM products
         LEFT JOIN price          ON price.product_id = products.id
         LEFT JOIN price_currency ON price_currency.id = price.currency

WHERE products.archive = 0
ORDER BY products.date_add DESC