--By Jacob Johnston
select * from employee;

select * from event_packages;

select * from event

--retreive the cost of all events event
SELECT e.event_no, e.e_name, SUM(ep.no_packages * p.price) AS Event_Cost
FROM event e, package p, event_packages ep
WHERE ep.event_no = e.event_no AND ep.e_package = p.p_id
GROUP BY e.event_no, e.e_name;

--retreive the cost of an event
SELECT e.event_no, e.e_name, SUM(ep.no_packages * p.price) AS Event_Cost
FROM event e, package p, event_packages ep
WHERE e.event_no = 2 and ep.event_no = e.event_no AND ep.e_package = p.p_id
GROUP BY e.event_no, e.e_name;

--Retrive the total percent worked
select e.event_no, e.e_name, SUM(es.percent_worked) AS total_percent_worked
FROM event e, event_staff es
WHERE es.event_no = e.event_no
GROUP BY e.event_no, e.e_name;

--pay per 1 unit
SELECT e.event_no, e.e_name, ec.event_cost/ew.total_percent_worked as pay_per_unit
FROM event e, (
    SELECT e.event_no, e.e_name, SUM(ep.no_packages * p.price) AS event_cost
    FROM event e, package p, event_packages ep
    WHERE ep.event_no = e.event_no AND ep.e_package = p.p_id
    GROUP BY e.event_no, e.e_name
) ec, (
    SELECT e.event_no, e.e_name, SUM(es.percent_worked) AS total_percent_worked
    FROM event e, event_staff es
    WHERE es.event_no = e.event_no
    GROUP BY e.event_no, e.e_name
) ew
WHERE e.event_no = ec.event_no AND e.event_no = ew.event_no



--Retreive the staff pay of a particular event
select e.e_id, e.lname, e.fname, 0.85*es.percent_worked*ppu.pay_per_unit as staff_pay
from employee e, event_staff es, (
    SELECT e.event_no, e.e_name, ec.event_cost/ew.total_percent_worked as pay_per_unit
    FROM event e, (
        SELECT e.event_no, e.e_name, SUM(ep.no_packages * p.price) AS event_cost
        FROM event e, package p, event_packages ep
        WHERE ep.event_no = e.event_no AND ep.e_package = p.p_id
        GROUP BY e.event_no, e.e_name
    ) ec, (
        SELECT e.event_no, e.e_name, SUM(es.percent_worked) AS total_percent_worked
        FROM event e, event_staff es
        WHERE es.event_no = e.event_no
        GROUP BY e.event_no, e.e_name
    ) ew
    WHERE e.event_no = ec.event_no AND e.event_no = ew.event_no
) ppu
where es.event_no=2 and es.event_no=ppu.event_no and es.e_id = e.e_id

--retrieve the staff pay for all events
select ev.e_name, ev.payroll_period, e.e_id, e.lname, e.fname, 0.85*es.percent_worked*ppu.pay_per_unit as staff_pay
from employee e, event_staff es, event ev, (
    SELECT e.event_no, e.e_name, ec.event_cost/ew.total_percent_worked as pay_per_unit
    FROM event e, (
        SELECT e.event_no, e.e_name, SUM(ep.no_packages * p.price) AS event_cost
        FROM event e, package p, event_packages ep
        WHERE ep.event_no = e.event_no AND ep.e_package = p.p_id
        GROUP BY e.event_no, e.e_name
    ) ec, (
        SELECT e.event_no, e.e_name, SUM(es.percent_worked) AS total_percent_worked
        FROM event e, event_staff es
        WHERE es.event_no = e.event_no
        GROUP BY e.event_no, e.e_name
    ) ew
    WHERE e.event_no = ec.event_no AND e.event_no = ew.event_no
) ppu
where ev.event_no=es.event_no and es.event_no=ppu.event_no and es.e_id = e.e_id

--inserting a paycheck
insert into paycheck values
((
    select sum(sp.staff_pay) from (
        select ev.e_name, ev.payroll_period, e.e_id, e.lname, e.fname, 0.85*es.percent_worked*ppu.pay_per_unit as staff_pay
        from employee e, event_staff es, event ev, (
            SELECT e.event_no, e.e_name, ec.event_cost/ew.total_percent_worked as pay_per_unit
            FROM event e, (
                SELECT e.event_no, e.e_name, SUM(ep.no_packages * p.price) AS event_cost
                FROM event e, package p, event_packages ep
                WHERE ep.event_no = e.event_no AND ep.e_package = p.p_id
                GROUP BY e.event_no, e.e_name
            ) ec, (
                SELECT e.event_no, e.e_name, SUM(es.percent_worked) AS total_percent_worked
                FROM event e, event_staff es
                WHERE es.event_no = e.event_no
                GROUP BY e.event_no, e.e_name
            ) ew
            WHERE e.event_no = ec.event_no AND e.event_no = ew.event_no
        ) ppu
        where ev.event_no=es.event_no and es.event_no=ppu.event_no and es.e_id = e.e_id
    ) sp
    where sp.payroll_period = 1 and sp.e_id=6544874521
), 1, 6544874521, 1);

--payroll totals
select pr.period_no, sum(pc.earnings) as payroll_total
from payroll pr, paycheck pc
where pc.period_no=pr.period_no
group by pr.period_no;
