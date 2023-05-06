--By Jacob Johnston
insert into employee values
('Manager', 'Smith', 'Dan', '1234567890', '10-DEC-1977', '117 Spring Ave');
insert into employee values
('Staff', 'Johnston', 'Jacob', '6544874521', '02-FEB-2002', '800 E Lancaster Ave');
insert into employee values
('Staff', 'Diaz', 'Nate', '9876543210', '4-DEC-2002', '123 Fall Ave');
insert into employee values
('Staff', 'Aresco', 'Josh', '7410852963', '8-NOV-2002', '987 Summer St');

insert into clients values
(1, 'Residence Life', 'Office of Res Life', 1234);
insert into clients values
(2, 'Student Govt', 'The student body government', 4321);

insert into package values
(1, 'Speaker System', 150, 'A set of speakers for an event');
insert into package values
(2, 'Proj Screen', 70, 'Screen');
insert into package values
(3, 'Projector', 100, 'A projector');
insert into package values
(4, 'Wireless Mics', 25, 'A set of 5 wireless mics');

insert into payroll values
(1,'1-MAY-2023', null);

insert into event values
(null, null, (select c_id from clients where c_name = 'Residence Life'), 1, 1, null, null, '4-APR-2023');
insert into event values
(null, null, (select c_id from clients where c_name = 'Student Govt'), 1, 2, null, null, '12-APR-2023');

update event
set e_name = 'Movie Night'
where event_no = 1;
update event
set e_name = 'SG Debate'
where event_no = 2;

insert into event_packages values
((select p_id from package where p_name = 'Speaker System'), 1, 1);
insert into event_packages values
((select p_id from package where p_name = 'Proj Screen'), 1, 1);
insert into event_packages values
((select p_id from package where p_name = 'Projector'), 1, 1);
insert into event_packages values
((select p_id from package where p_name = 'Speaker System'), 2, 1);
insert into event_packages values
((select p_id from package where p_name = 'Wireless Mics'), 2, 2);

insert into event_staff values
((select e_id from employee where lname = 'Jacob'), 1, 1);
insert into event_staff values
((select e_id from employee where lname = 'Dan'), 1, 1);
insert into event_staff values
((select e_id from employee where lname = 'Josh'), 1, 1);
insert into event_staff values
((select e_id from employee where lname = 'Nate'), 1, 1);

insert into event_staff values
((select e_id from employee where lname = 'Jacob'), 2, 0.5);
insert into event_staff values
((select e_id from employee where lname = 'Dan'), 2, 0.5);
insert into event_staff values
((select e_id from employee where lname = 'Josh'), 2, 1);


