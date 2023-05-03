--Event Leaderboard
SELECT e.lname, e.fname, COUNT(es.event_no) AS events_worked
FROM employee e, event_staff es
WHERE e.e_id = es.e_id
GROUP BY e.e_id, e.lname, e.fname
order by events_worked desc
