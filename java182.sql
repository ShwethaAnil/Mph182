set serveroutput on;
DECLARE
		v_test varchar2(35); 
BEGIN
		v_test := 'Java182 Training';
		DBMS_OUTPUT.PUT_LINE(v_test);
END;
/

DECLARE
		v_grade char(1);
		v_rank varchar2(20);
BEGIN
		v_grade := '&v_grade'; 
		CASE v_grade
		WHEN 'A' THEN
			v_rank := 'excellent';
		WHEN 'B' THEN
			v_rank := 'very good';
		WHEN 'C' THEN
			v_rank := 'good';
		WHEN 'D' THEN
			v_rank := 'Average';
		WHEN 'E' THEN
			v_rank := 'Poor';
		WHEN 'F' THEN
			v_rank := 'very poor';	
		ELSE
			v_rank := 'No such Grade';
		END CASE;
	DBMS_OUTPUT.PUT_LINE(v_rank);	
END;
/	  
--Simple Case		
DECLARE
		v_grade char(1);
		c_rank varchar2(20);
BEGIN
		v_grade = &v_grade; 
		CASE v_grade
		WHEN 'A' THEN
			v_rank := 'excellent';
		WHEN 'B' THEN
			v_rank := 'very good';
		WHEN 'C' THEN
			v_rank := 'good';
		WHEN 'D' THEN
			v_rank := 'Average';
		WHEN 'E' THEN
			v_rank := 'Poor';
		WHEN 'F' THEN
			v_rank := 'very poor';	
		ELSE
			v_rank := 'No such Grade';
		END CASE;
	DBMS_OUTPUT.PUT_LINE(v_rank);	
END;
/	  

--searched case
DECLARE
	n_sales number;
	n_com number;
BEGIN
	n_sales := 150000;
	CASE
	WHEN n_sales > 200000 THEN	
		n_com := 0.2; 
	WHEN n_sales >= 100000 AND  n_sales < 200000 THEN
	   n_com := 0.15;
	 WHEN n_sales >= 50000 AND n_sales <  100000 THEN
		n_com := 0.1;
	WHEN n_sales > 30000 THEN
		n_com :=0.5;
	ELSE
		n_com :=0;
	END CASE;
  DBMS_OUTPUT.PUT_LINE('Commission is '|| n_com * 100 || '%');	
END; 

--go to example
BEGIN
  GOTO amulya;
  <<nandhini>>
 DBMS_OUTPUT.PUT_LINE(' HI ');
 GOTO chandana;
 <<amulya>>
 DBMS_OUTPUT.PUT_LINE('PL/ SQL GOTO');
 GOTO nandhini;
 <<chandana>>
 DBMS_OUTPUT.PUT_LINE(' Bye Bye');
END; 


--Day 2


SET SERVEROUTPUT ON;
DECLARE
	v_pi CONSTANT NUMBER(7,5) := 3.141592 ;
	v_radius number;
	v_area number(10,2);
BEGIN
   v_area := 0;
   v_radius := &v_radius;
   v_area  := v_pi * v_radius *v_radius;
   DBMS_OUTPUT.PUT_LINE('The area of circle is ' ||v_area);
 END;  
 
 --next one
 
 DECLARE
	v_pi CONSTANT NUMBER(7,5) DEFAULT 3.141592 ;
	v_radius number;
	v_area number(10,2);
BEGIN
   v_area := 0;
   v_radius := &v_radius;
   v_area  := v_pi * POWER(v_radius, 2);
   DBMS_OUTPUT.PUT_LINE('The area of circle is ' ||v_area);
 END;  
 
--Bind Varaible
VARIABLE v_bind1 varchar2(10);
--Inititalise 
EXEC  :v_bind1 :='Shwetha';
--initalize in block
BEGIN
    :v_bind1 :='Anusha';
     DBMS_OUTPUT.PUT_LINE(:v_bind1);
END; 

PRINT  :v_bind1;

--AUtoPrint

SET AUTOPRINT ON;
VARIABLE v_bind2 varchar2(10);
EXEC :v_bind2 :='Nandhini';

--Anchor Type
DECLARE
    v_salary  employee.salary%TYPE;
    v_bonus employee.bonus%TYPE;
BEGIN
    select salary, bonus into v_salary, v_bonus from employee
    where empid = &empid;
    DBMS_OUTPUT.PUT_LINE(v_bonus ||'The employee salary details are ' ||v_salary );    
END;

--iterations
Set serveroutput on;
DECLARE
    v_counter number :=0;
    v_result number;
BEGIN
    LOOP
        v_counter := v_counter+1;
        v_result := 19 * v_counter;
        DBMS_OUTPUT.PUT_LINE('19' || ' X ' || v_counter || '=' || v_result);
   --Exit condition
         IF v_counter >=10 THEN
             EXIT;
         END IF;
    END LOOP;
END;    


--while --
Set serveroutput on;
DECLARE
    v_counter number :=0;
    v_result number;
BEGIN
  WHILE v_counter<10   LOOP
        v_counter := v_counter+1;
        v_result := 19 * v_counter;
        DBMS_OUTPUT.PUT_LINE('19' || ' X ' || v_counter || '=' || v_result);
    END LOOP;
END;  

--Numeric For Loop
Set SERVEROUTPUT ON;
BEGIN
 FOR v_counter IN 1 .. 10 LOOP
    DBMS_OUTPUT.PUT_LINE(v_counter);
 END LOOP;
END; 

--
BEGIN
 FOR v_counter IN  REVERSE 1 .. 10 LOOP
    DBMS_OUTPUT.PUT_LINE(v_counter);
 END LOOP;
END;

--palindrome
DECLARE
   n number;
   m number;
   temp number:=0;
   rem number;
BEGIN
   n :=12321;
   m :=n;
   while n>0
   loop
      rem := mod(n,10);
      temp := (temp*10)+rem;
      n := trunc(n/10);
   end loop;
   if m = temp
   then
      dbms_output.put_line('Palindrome');
   else
      dbms_output.put_line('Not Palindrome');
   end if;
END;

--
Set serveroutput on;
DECLARE
    v_result number;
BEGIN
   FOR v_counter IN 1 .. 10  LOOP
        v_result := 19 * v_counter;
        DBMS_OUTPUT.PUT_LINE('19' || ' X ' || v_counter || '=' || v_result);
    END LOOP;
END; 

--
 
DECLARE
   v_name employee.ename%TYPE;
   --Declare the cursor
   CURSOR cur_emp IS select ename from employee;
BEGIN
        OPEN cur_emp;
        LOOP
            FETCH cur_emp into v_name;
            EXIT WHEN cur_emp%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('The employee name is' ||v_name );
        END LOOP;
        CLOSE cur_emp;
END;


BEGIN
	UPDATE employee set deptno=10 where empid=198;
    IF SQL%NOTFOUND THEN
        INSERT into employee
        VALUES(198,'EVE', 76000,TO_DATE('24-01-2019', 'DD-MM-YYYY'),7500,'J4',10,12);
     END IF;   
END;

--
DECLARE
    v_sal employee.salary%type;
    v_eid employee.empid%type;
   cursor c_emp IS select empid,salary from 
   employee where salary >35000;
BEGIN
    IF NOT c_emp%ISOPEN THEN
        OPEN c_emp;
    END IF;
    LOOP
       FETCH c_emp into v_eid, v_sal;
       EXIT WHEN c_emp%NOTFOUND;
       UPDATE employee SET salary=1.5*v_sal where empid=v_eid;
    END LOOP;
   CLOSE c_emp;
    COMMIT;
 END;
 /
  
--Cursor with Parameter
SET SERVEROUTPUT ON;
DECLARE
    v_name employee.ename%TYPE;
    CURSOR c_name(var_eid number :=20) IS
    select ename from employee where empid<var_eid;
BEGIN
    open c_name;
    LOOP
        FETCH c_name INTO v_name;
        EXIT WHEN c_name%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_name);
     END LOOP;
     CLOSE c_name;
END;
/


--cursor for loop

SET SERVEROUTPUT ON;
DECLARE
    --v_name employee.ename%TYPE;
    CURSOR c_name(var_eid number :=20) IS
    select ename from employee where empid<var_eid;
BEGIN
    FOR L_COUNTER IN c_name
    LOOP
        DBMS_OUTPUT.PUT_LINE(L_COUNTER.ename);
     END LOOP;
END;
/--Table Based Rowtype
DECLARE
   r_emp employee%ROWTYPE;
BEGIN
    select * into r_emp from employee where empid=11;
    DBMS_OUTPUT.PUT_LINE(r_emp.ename||'   '||r_emp.salary||' '||r_emp.doj);    
END;


--Cursor based row type
DECLARE
    cursor c_emp IS
    select ename,doj from employee where empid=11;
    var_emp c_emp%ROWTYPE;
BEGIN
    OPEN c_emp;
    FETCH c_emp into var_emp;
    DBMS_OUTPUT.PUT_LINE(var_emp.ename||'   '||var_emp.doj);
    CLOSE c_emp;
END;    

--User Defined Record datatype

DECLARE
    TYPE t_emp IS RECORD(
        e_name  employee.ename%type,
        d_name  department.dname%type
    );
   r_emp  t_emp;
BEGIN
    select ename, dname  
    into  r_emp.e_name, r_emp.d_name
    from employee e, department d
    where e.deptno=d.deptno and empid=12;
    DBMS_OUTPUT.PUT_LINE( r_emp.e_name||'  '|| r_emp.d_name);
END;
/

--Function
--calaculate area of a circle
CREATE OR REPLACE FUNCTION are_circle (ra number)
RETURN NUMBER  IS

PI CONSTANT NUMBER(7,3) := 3.14;
area NUMBER(8,2);
BEGIN
    area :=  PI * POWER(ra,2);
    RETURN area;
END;
/

--execute function;
BEGIN
    DBMS_OUTPUT.PUT_LINE(are_circle(78));
END;    

--procedure
    
    CREATE OR REPLACE PROCEDURE pr_example IS
       v_name varchar2(10) :='Shwetha';
       v_lname varchar2(10) := 'Guptha';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Name is' ||v_name ||' '||v_lname);
    END pr_example;
    /

--execute
EXECUTE pr_example;
--
EXEC pr_example;
--
BEGIN
    pr_example;
END;    

--
create or replace function area_traingle(base number,height number)
		RETURN NUMBER  IS
				--declartion section
				area number(10,2);
				--Execution Section
		BEGIN
			--Area of a traingle 
			area := 0.5 * base * height;
			return area;
		END;
		/
		
		--execut Functions
		BEGIN
			DBMS_OUTPUT.PUT_LINE('Area of triangle is 'area_traingle(12,34));
		END;
		/

--Procedure
create or replace PROCEDURE p1_traingle	
    (base IN number, 
    height IN number)
IS
 area number;
BEGIN
  area := 0.5 * base * height;
  DBMS_OUTPUT.PUT_LINE('Area of a traingle is '||area);
END;
/		

-- Execute the procedure
EXECUTE  p1_traingle(12,34);

--In OUT Parameter
create or replace PROCEDURE p_traingle	
    (base IN number, 
    height IN number,
    area OUT number)
IS
BEGIN
  area := 0.5 * base * height;
  DBMS_OUTPUT.PUT_LINE('Area of a traingle is '||area);
END;

--Execute
DECLARE
 area number;
BEGIN
    p_traingle(12,87,area);
END;   

--Procedure
create or replace PROCEDURE GET_EMP_NAME1
(emp_no IN employee.empid%TYPE,
o_ename OUT employee.ename%TYPE)
IS
    CURSOR c_ename(p_empno employee.empid%TYPE)
    IS
    select ename from employee where empid= p_empno;
BEGIN   
    OPEN c_ename(emp_no);
    FETCH c_ename into o_ename;
    CLOSE c_ename;
END GET_EMP_NAME1;    


--EXecute
DECLARE
    v_name employee.ename%type;
BEGIN
    GET_EMP_NAME(12,v_name);
    DBMS_OUTPUT.PUT_LINE(v_name);
END;

--
DECLARE
  did department.deptno%TYPE :=10;
  e_name employee.ename%TYPE;
  sal employee.salary%TYPE;
BEGIN
    select ename, salary into e_name,sal
    from employee
    where DEPTNO = did;
   DBMS_OUTPUT.PUT_LINE(e_name||' ' ||sal);
EXCEPTION
    WHEN no_data_found THEN
         DBMS_OUTPUT.PUT_LINE('NO EMPLOYEE for requested id');
    WHEN TOO_MANY_ROWS THEN
         DBMS_OUTPUT.PUT_LINE('Expecting Single ROw');
    WHEN others THEN
         DBMS_OUTPUT.PUT_LINE('SOME Error');
END;


--userdefined exception

DECLARE
		v_dividend number :=25;
		v_divisor number :=10;
		v_result number;
		ex_DivZero EXCEPTION;
BEGIN
		IF v_divisor = 0 THEN
			RAISE ex_DivZero;
		END IF;
	    v_result := v_dividend/v_divisor;
		DBMS_OUTPUT.PUT_LINE('RESULT is '|| v_result);
EXCEPTION
		WHEN ex_DivZero THEN
			DBMS_OUTPUT.PUT_LINE('Number cannot divide by zero');
END;	

--RAISE APplication ERROR
ACCEPT var_age NUMBER PROMPT 'What is your age?';
DECLARE
    age NUMBER := &var_age;
BEGIN
    IF age <18 THEN
        RAISE_APPLICATION_ERROR(-20008, 'You shold be 18 or above for Vote');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('You are eligible for voting..proceed ');
EXCEPTION 
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

--PRAGMA
ACCEPT var_age NUMBER PROMPT 'What is your age?';
DECLARE
    invalid_age EXCEPTION;
    age NUMBER := &var_age;
    PRAGMA EXCEPTION_INIT(invalid_age, -20008);
BEGIN
    IF age <23 AND age >18 THEN
        RAISE_APPLICATION_ERROR(-20008, 'You are not eligible for this type of voting');
    ELSIF age < 23 THEN
        RAISE_APPLICATION_ERROR(-20007, 'You are not eligible for this voting');
    END IF;  
    DBMS_OUTPUT.PUT_LINE('You are eligible for voting..proceed ');
EXCEPTION 
    WHEN  invalid_age THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
      WHEN others THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;


-------package
--pkg specfication
CREATE OR REPLACE PACKAGE pkg_mphasis IS
    FUNCTION prnt_string RETURN VARCHAR2;
    PROCEDURE proc_emp (e_name OUT employee.ename%type);
END pkg_mphasis;    

--pkg body

CREATE OR REPLACE PACKAGE BODY pkg_mphasis IS
    --function implementation
    FUNCTION prnt_string RETURN VARCHAR2 IS
        BEGIN
            RETURN 'MPHASIS LIMITED';
         END prnt_string;
         
       --Procedure Implementation  
        PROCEDURE proc_emp (e_name OUT employee.ename%type) IS
          BEGIN
             select ename into e_name from employee where empid=11;
             DBMS_OUTPUT.PUT_LINE(e_name);
           EXCEPTION
             WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Requested employee is not available');
           END proc_emp;
END pkg_mphasis;

--execution of function inside package
BEGIN
    DBMS_OUTPUT.PUT_LINE(PKG_MPHASIS.PRNT_STRING);
END;    

DECLARE
    v_name employee.ename%type;
BEGIN
    PKG_MPHASIS.PROC_EMP(v_name);
END; 


----Trigger -DML
--Triggers
CREATE or REPLACE TRIGGER ti_loc
			BEFORE INSERT ON Locations
			FOR EACH ROW
			ENABLE
			DECLARE
				v_user varchar2(20);
			BEGIN
				Select user INTO v_user from dual;
				DBMS_OUTPUT.PUT_LINE('THE user is '||user);
			END;
			/
--
    insert into LOCATIONS
  (LCODE,LNAME)
  values
  (969,'RRNagar');

update locations set lname='RJNagar' where lcode=988;

--
CREATE or REPLACE TRIGGER ti_loc1
			BEFORE INSERT OR DELETE OR UPDATE ON Locations
			FOR EACH ROW
			ENABLE
			DECLARE
				v_user varchar2(20);
			BEGIN
				Select user INTO v_user from dual;
                IF INSERTING THEN
                    DBMS_OUTPUT.PUT_LINE('Data inserted by '||user);
                ELSIF DELETING THEN
                    DBMS_OUTPUT.PUT_LINE('Data DELETED by'||user);
                ELSIF UPDATING THEN
                    DBMS_OUTPUT.PUT_LINE('Data UPDATED by'||user);
                END IF;
			END;
			/

Drop table locations_audit;
create table locations_audit
( newlcode number,
  oldlcode number,
  newlname varchar2(30),
  oldlname varchar2(30),
  entry_date varchar2(45),
  operation varchar2(10),
  user_name varchar2(30)
);

select TO_CHAR(sysdate,'DD/MON/YYYY HH24:MI:SS') from dual;
  
--Audit Trigger for location

CREATE or REPLACE TRIGGER tr_loc_audit
BEFORE INSERT OR DELETE OR UPDATE ON Locations
FOR EACH ROW
ENABLE
DECLARE
        v_user varchar2(20);
        v_date varchar2(45);
BEGIN
    select user, TO_CHAR(sysdate,'DD/MON/YYYY HH24:MI:SS') INTO v_user,v_date from dual;
      IF INSERTING THEN
        INSERT into locations_audit values(:NEW.lcode,null,:NEW.lname,null,v_date,
        'inserting',v_user);
      ELSIF DELETING THEN
        INSERT into locations_audit values(null,:OLD.lcode,null,:OLD.lname,v_date,
        'deleting',v_user);
      ELSIF UPDATING THEN
        INSERT into locations_audit values(:NEW.lcode,:OLD.lcode,:NEW.lname,:OLD.lname,
        v_date,'updating',v_user);
      END IF;
END;
                
--DDL Trigger--Schema Audit
CREATE table schema_audit
(ddl_date date,
ddl_user varchar2(30),
object_created varchar2(50),
object_name varchar2(100),
ddl_operation varchar2(30)
);
--create alter drop truncate
CREATE OR REPLACE TRIGGER java182_audit_tr
AFTER DDL ON SCHEMA
BEGIN
    insert into schema_audit values(
    sysdate,
    sys_context('USERENV','CURRENT_USER'),
    ora_dict_obj_type,
    ora_dict_obj_name,
    ora_sysevent
    );
END;
/

create table customer
(cid number primary key,
cname varchar(10));

TRuncate table customer;

alter table customer add  ph_no number;
drop table customer;

--Database event trigger
-- database log on or log off or startup or shutdown

create table java18_event_audit
(event_type varchar2(20),
logon_date date,
logontime varchar2(20),
logof_date date,
logoftime varchar2(20));

CREATE OR REPLACE TRIGGER java182_event_audit_tr
AFTER LOGON ON SCHEMA
BEGIN
    insert into java18_event_audit values(
    ora_sysevent,
    sysdate,
    TO_CHAR(sysdate,'hh24:mi:ss'),
    null,
    null
    );
    COMMIT;
END;

--logfoff

CREATE OR REPLACE TRIGGER java182_event_audit_tr1
BEFORE LOGOFF ON SCHEMA
BEGIN
    insert into java18_event_audit values(
    ora_sysevent,
    null,
    null,
    sysdate,
    TO_CHAR(sysdate,'hh24:mi:ss')
    );
    COMMIT;
END;


--Instead of trigger

--view
create view vw_emp as
select empid,ename from employee;

create view vw_emp_dep1 AS
select l.lcode,lname, deptno,dname from locations l,department d where
l.lcode=d.lcode;


create or replace trigger tr_emp_insert
instead of insert on vw_emp_dep1
FOR EACH ROW
BEGIN
    insert into locations values(:new.lcode,:new.lname);
    insert into department values(:new.deptno,:new.dname,:new.lcode);
END;
/
insert into vw_emp_dep1 values(765,'GHJ',345,'HJT');

--insert into vw_emp_dep values('DFG','ASF');

create table trainer 
(tname varchar(10));
create table subject
(sname varchar(10));
create view vw_tr_sub AS
select tname, sname from trainer, subject;

create or replace trigger tr_io_insert1
instead of insert on vw_tr_sub
FOR EACH ROW
BEGIN
    insert into trainer(tname) values(:new.tname);
    insert into subject(sname) values(:new.sname);
END;
/

insert into vw_tr_sub values('DFG','ASF');

--COMPOUND TRIGGER
CREATE OR REPLACE TRIGGER EMP_TRIG
FOR INSERT ON employee
COMPOUND TRIGGER
BEFORE EACH ROW IS
BEGIN
 :new.salary := 50000;
END BEFORE EACH ROW;
END EMP_TRIG;

INSERT INTO EMPLOYEE VALUES(929,'RANI',70000,SYSDATE,3000,'J2',10,11);

alter trigger emp_trig enable;
alter trigger emp_trig disable;

alter table locations disable all triggers;
alter table locations enable all triggers;













