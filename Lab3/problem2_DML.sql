/* Question 1 */
SELECT
    name
from
    member
WHERE
    join_date >('2000-09-01');

/* Question 2 */
SELECT
    *
from
    member
WHERE
    join_date >('1995-10-01')
    AND join_date <('2019-10-01');

/* Question 3 */
SELECT
    book.book_id,
    book.title,
    book.price,
    book.pub_id,
    book.category_id
FROM
    book
    INNER JOIN publisher ON publisher.pub_id = book.pub_id
WHERE
    name = "Oxford"
    OR (
        price < 20
        AND price > 15
    );

/* Question 4 */
SELECT
    book.title
FROM
    book
    INNER JOIN borrowing_book ON borrowing_book.book_id = book.book_id
    INNER JOIN member ON member.member_id = borrowing_book.member_id
WHERE
    member.name = 'Scot Reinger';

/* Question 5 */
SELECT
    member.name
FROM
    member
    INNER JOIN borrowing_book ON member.member_id = borrowing_book.member_id
WHERE
    borrowing_book.borrow_date >= '2019-01-01'
    AND borrowing_book.borrow_date <= '2019-12-31';