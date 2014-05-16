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

{main program vars}
var
	out6, data6: text;
	balance, interest, total: real;



	{exponentiate function}
	function exponentiate(number, exponent: Real): Real;
	var
		exponentiateTotal: Real;
	begin

		exponentiateTotal := exp(exponent*ln( number));
		exponentiate := exponentiateTotal;
		
	end;


	{calculate compound interest function}
	function calculateCompoundInterest(initialAmount, annualRate, yearNumber: real): Real;
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
		
		compoundTotal:= (1 + (annualRate/100));
		compoundTotal:= exponentiate(compoundTotal, yearNumber);
		compoundTotal:= initialAmount * compoundTotal;
		calculateCompoundInterest := compoundTotal;
		
	end;



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
			
			write(out6,balance:5:0);
			write(out6,interest:6:0);
			write(out6,'':2);

			for j := 1 to 10 do
			begin
				{write(j:4);}
				write(out6,calculateCompoundInterest(balance, interest, j):6:0);
			end;
			balance := balance + 100;
			writeln(out6,'');
		end;
		
	end;





{main program}

begin

	reset(data6, 'datafiles/data6.dat');
	rewrite(out6, 'outputfiles/out6.dat');


	while not eof(data6) do
	begin
		writeln(out6,'year':35);
		writeln(out6,'Balance':7,'Rate%':6,'1':6,'2':6,'3':6,'4':6,'5':6,'6':6,'7':6,'8':6,'9':6,'10':6);		
		read(data6, balance);
		read(data6, interest);
		{writeln('Balance: ', balance:5:2,' Interest ', interest:5:2);		}
		printChart(balance, interest);
		if eoln(data6) then readln(data6);
	end;

end.