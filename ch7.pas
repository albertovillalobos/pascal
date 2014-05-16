program ch7(input, output, out6, data6);

{
	Chapter 7 Assignment
	Alberto Villalobos
	March 12, 2014

	Description: Reads value pairs (balance, interest)
	from a file, then produces interest charts across
	10 years and 4 more in increments of 100.


	Input: A file with value pairs, balance and
	interest rate.

	Output:  A file showing interest charts as
	described above.

	Level 0:
		Initialize variables
		Read two values from file
		Call printing procedure
		Output to file


	for compunding use the following formula
	A = P(1+(r/n))^(nt)

	A = total amount of money after n years
	P = initial amount of money
	r = annual rate of interest
	t = number of years
	n = number of times the interest is compounded per year
}


procedure printChart(balance : real; interest : real);
{
	Print Chart
		Prints a 5 line interest chart given a balance and interest

	@param
		balance
		interest

	NOTE: First make this do the whole thing, then refactor to
	a different procedure.
}	
var
	i, j, k: integer;
	newBalance : real;
	numberToString: string(255);

begin
	for i := 0 to 4 do
	begin
		{str(balance:5:0, numberToString);}
		
		write(balance:5:0);
		write(interest:6:0);
		write('':2);
		balance := balance + 100;

		for j := 1 to 10 do
		begin
			write(j:4);
		end;
		writeln('');
	end;
	
end;


{calculate compound interest function}
function calculateCompoundInterest(initialAmount, annualRate, monthNumber: integer): Real;
var
	compoundTotal: real;
begin
{
	for compunding use the following formula
	A = P(1+(r/n))^(nt)

	A = total amount of money after n years
	P = initial amount of money
	r = annual rate of interest
	t = number of years
	n = number of times the interest is compounded per year
}

	calculateCompoundInterest := compoundTotal;


	
end;



{main program}
var
	out6, data6: text;
	balance, interest, total: real;
begin

	reset(data6, 'datafiles/data6.dat');


	while not eof(data6) do
	begin
		writeln('year':35);
		writeln('Balance':7,'Rate%':6,'1':4,'2':4,'3':4,'4':4,'5':4,'6':4,'7':4,'8':4,'9':4,'10':4);		
		read(data6, balance);
		read(data6, interest);
		{writeln('Balance: ', balance:5:2,' Interest ', interest:5:2);		}
		printChart(balance, interest);
		if eoln(data6) then readln(data6);
	end;

end.