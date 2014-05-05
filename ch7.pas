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


{
	Print ChartLine
		Prints an interst line for a given balance and interest 
	@ param 
		balance
		interest
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

begin
	for i := 0 to 4 do
	begin
		write(balance:5:2, ' ');
		write(interest:5:2, ' ');
		balance := balance + 100;

		for j := 0 to 10 do
		begin
			write(j,' ');
		end;
		writeln('');
	end;
	
end;




var
	out6, data6: text;
	balance, interest, total: real;
begin

	reset(data6);

	while not eof(data6) do
	begin
		writeln('year');
		writeln('Balance Rate% 1 2 3 4 5 6 7 8 9 10');		
		read(data6, balance);
		read(data6, interest);
		{writeln('Balance: ', balance:5:2,' Interest ', interest:5:2);		}
		printChart(balance, interest);
		writeln('');
		if eoln(data6) then readln(data6);
	end;

end.