--By Jacob Johnston
--Retreive the staff on an event
SELECT e.e_id, e.lname, e.fname
FROM employee e
JOIN event_staff es ON e.e_id = es.e_id
WHERE es.event_no = 2
GROUP BY e.e_id, e.lname, e.fname;

--Retreive the packages on an event
SELECT p.p_id, p.p_name, p.price
FROM package p
JOIN event_packages ep ON p.p_id = ep.e_package
WHERE ep.event_no = 1
GROUP BY p.p_id, p.p_name, p.price;
