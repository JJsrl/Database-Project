--By Jacob Johnston
alter table event_packages
drop primary key;
alter table event_packages
add primary key (E_package, Event_no);

alter table event_staff
drop primary key;
alter table event_packages
add primary key (e_id, event_no);


alter table event
drop column e_package;
alter table event
drop column staff_pay;
alter table event
drop column e_cost;
alter table event
drop column staff;

alter table payroll
drop column total;

alter table event_staff
drop column total_pay;

alter table event
add e_name varchar2(50)
