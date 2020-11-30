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



