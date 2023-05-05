Create table Employee (
  rolee    varchar2(15),
  fname    varchar2(15),
  lname    varchar2(15),
  E_id     char(10),
  bdate    date,
  address  varchar2(50),
  primary key (E_id)
  );
  
Create table Payroll (
  period_no number(5),
  pay_date date,
  total number(5),
  primary key (period_no)
  );
  
Create table Clients (
  C_id char(10),
  C_name varchar2(15),
  C_description varchar2(50),
  account_no char(9),
  primary key (C_id)
  );
  
Create table Package (
  P_id char(5),
  P_name varchar2(15),
  price number(5),
  P_description varchar2(50),
  primary key (P_id)
  );
  
Create table Paycheck (
  earnings  char(5),
  check_no  char(5),
  E_id   char(10),
  period_no number(5),
  primary key (check_no),
  foreign key (E_id) references employee(E_id),
  foreign key (period_no) references payroll(period_no)
  );
  
Create table Event (
  E_package number(2),
  E_cost number(5),
  E_client char(10),
  payroll_period number(5),
  Event_no number(5),
  Staff_pay number(5),
  staff number(3),
  Event_date date,
  primary key (Event_no),
  foreign key (payroll_period) references payroll(period_no),
  foreign key (E_client) references Clients(C_id)
  );
  
Create table Event_Packages (
  E_Package char(5),
  Event_no number(5),
  no_packages number(5),
  primary key (E_Package),
  foreign key (E_Package) references package(P_id),
  foreign key (Event_no) references Event(Event_no)
  );
  
  Create table Event_Staff (
  E_id char(10),
  Event_no number(5),
  percent_worked varchar2(3),
  total_pay number(5),
  primary key (E_id),
  foreign key (E_id) references employee(E_id),
  foreign key (Event_no) references event(Event_no)
  );
  
----------------------------------------------------------------------

  insert into employee values
  ('Manager', 'Smith', 'Dan', '1234567890', '10-DEC-1977', '117 Spring Ave');
  
  select * from employee;
  
  
  