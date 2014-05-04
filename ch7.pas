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

var
	balance, interest, total: Integer;
begin

{	writeln('Please enter initial balances (five)');
	// writeln('B')
	writeln('Balance', 'Rate(%)', );
	
	while not eof do
	begin
		read(tempBalance);

	end;}
end.