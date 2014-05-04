program loanapproval(input, output);

{	
        chapter 4 assignment
        alberto villalobos
        february 12
        program to determine the eligibility of a loan applicant ofr a loan.
 
        top down design
        ---------------
        input: salary(integer); credit rating(integer);
                cost(integer); loan(integer)
        output: approved/notapproved message; maximum loan possible
 
 
main
        getdata
        findmax
        printapproval
        printmax
       
getdata
        write on the screen'enter salary in dollars: '
        readln(salary)
        write on the screen 'enter credit rating(0-4):'
        readln(crating)
        write on the screen 'enter cost of boat in dollars: '
        readln(cost)
        write on the screen 'enter loan amount in dollars: '
        readln(loan)
       
findmax
        if rating is 3 or 4 then max = 0.85 * cost
        if rating is 2 then max = (0.7 * cost)
        if rating is 1 then max = (0.5 * cost)
        if rating is 0 then max = (0.25 * cost)
        if max > (salary * 0.5 )then max = salary * 0.5
       
printapproval
        if max > loan
                then loan approved
                else loan not approved
               
printmax
        write on the screen maximum loan possible is, round(max)
       
}
       
        

const   rate4 = 0.85;
rate3 = 0.85;
rate2 = 0.75;
rate1 = 0.50;
rate0 = 0.25;

var             loan, salary, cost, crating : integer;
max : real;

begin
	(* input *)
	write('Enter salary in dollars: ');
	readln(salary);
	write('Enter credit score(0-5): ');
	readln(crating);
	write('Enter cost of boat in dollars: ');
	readln(cost);
	write('Enter loan amount in dollars: ');
	readln(loan);
	(* end input *)
	
	(* begin case (find max boat credit) *)
	case crating of
	0 : begin
	max := rate0 * cost;
	end;
	1 : begin
	max := rate1 * cost;
	end;
	2 : begin
	max := rate2 * cost;
	end;
	3 : begin
	max := rate3 * cost;
	end;
	4 : begin
	max := rate4 * cost;
	end;
	
	end;
	(* end case *)
	
	(* get the smaller of cost credit and salary credit  *)
	if max > (salary * 0.5)
	then max := (salary * 0.5);
	(* output *)
	if max > loan
	then
		writeln('Loan approved!')
	else
		writeln ('Loan not approved :(');
	
	writeln('Maximum loan possible is: ', round(max));
	
	end.
