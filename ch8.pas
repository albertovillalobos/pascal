program ch8(data7, out7);
{
	Chapter 8 Assignment
	Alberto Villalobos
	April 2, 2014

	Description: This programs simulates a refinery's
	pressure monitoring system.


	Input: A file that contains

	Output: On screen success or error message	

	level 0:
		Initialize variables
		Reset File
		Read number of intervals
		Read five pressure values
		Keep sum of values 
		Keep lowest of values
		Keep highest of values	
		Print Warnings
		Print Highest and lowest
		Print average (sum/amount of values)
}

type
	ary = array[1..6] of integer;


{print separator}
procedure printSeparator();
begin
	writeln('------------------------------------');
	
end;

procedure printProcess(var pressures:ary);
var
	highest, lowest, sum, count : Integer;
	average: Real;
begin
	highest :=0;
	lowest := 99999;
	sum:= 0;

	{get lowest and highest, also print everything}
	for count := 1 to 6 do
	begin
		sum:= sum + pressures[count];
		writeln('Process':7, count:4, 'pressure:':12,pressures[count]:8);
		if pressures[count] > highest then
		begin
			highest := pressures[count];
		end;

		if pressures[count] < lowest then
		begin
			lowest := pressures[count];
		end;
		
	end;

	{get average}
	average := sum / 6;

	{print summary}
	if highest > 5000 then
	begin
		writeln('Danger! Overpressure of: ', highest);
	end;

	if lowest < 14 then
	begin
		writeln('Danger! Vacumum of: ', lowest);
		
	end;

	writeln('Low pressure is: ',lowest);
	writeln('High pressure is: ',highest);
	writeln('average pressure is: ', average:6:0);

end;


{main program}
var
	data7, out7: Text;
	intervalCount, i, intervals, a, b, c, d, e, f: Integer;
	pressures : ary;

begin
	intervalCount:=0;
	Reset(data7,'datafiles/data7.dat');
	read(data7, intervals);
	writeln('Number of Intervals to monitor:',intervals:4);
	printSeparator();
	readln(data7);
	while (not eof(data7)) and (intervalCount < intervals) do
	begin
		{read all pressures}
		for i := 1 to 6 do
		begin
			read(data7, pressures[i]);
		end;

		printProcess(pressures);
		printSeparator();



		{read new line}
		readln(data7);
		intervalCount:=intervalCount+1;
	end;
end.
