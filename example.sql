SELECT 
    pr.title AS 'title',
    u.id AS 'user_id',
    u.full_name AS 'full_name',
    u.email AS 'email',
    rp.default_amount AS 'default_amount',
    rp.status AS 'status'
FROM `customer-db`.payment_requests pr
INNER JOIN `customer-db`.request_payees rp ON (pr.id = rp.request_id)
INNER JOIN `customer-db`.users u ON (u.id = rp.user_id)
INNER JOIN `customer-db`.users u2 ON (pr.user_id = u2.id)
INNER JOIN `customer-db`.account a ON (u2.account_id = a.id
	AND a.cognito_user_id = '63be12cb-13be-441f-a23c-f204bfee67fc')
WHERE pr.id = 59
