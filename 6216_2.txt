SELECT adm_AT
FROM admin
WHERE adm_diploma='Economics';

SELECT drv_AT
FROM driver
WHERE drv_route='ABROAD' 
ORDER BY drv_experience DESC;

SELECT reservation.res_name,reservation.res_lname,trip.tr_cost,trip.tr_departure
FROM trip
INNER JOIN reservation ON reservation.res_tr_id=trip.tr_id
ORDER BY trip.tr_cost ASC,reservation.res_lname ASC;

SELECT worker.wrk_name,worker.wrk_lname,worker.wrk_AT,COUNT(trip.tr_drv_AT)
FROM worker
INNER JOIN driver ON driver.drv_AT=worker.wrk_AT
INNER JOIN trip ON trip.tr_drv_AT=driver.drv_AT
GROUP BY worker.wrk_lname; 
 
SELECT worker.wrk_name,worker.wrk_lname,branch.br_code,branch.br_city,admin.adm_type
FROM branch
LEFT JOIN worker ON worker.wrk_br_code=branch.br_code
LEFT JOIN manages ON manages.mng_br_code=branch.br_code 
LEFT JOIN admin ON admin.adm_AT=worker.wrk_AT;

