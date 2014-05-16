program ch9(input, output, data8, out8);

{
	Chapter 8 Assignment
	Alberto Villalobos
	March 28, 2014

	Description: Read lines from a file, in which
	each line contains first a code letter, followed
	by four numbers. The codes are S, C and A, meaning
	Sum of Squares, Sum of Cubes and Average of Squares.
	The values domain is [10,20], otherwise output an error.



	Input: A file with lines representing a code and group
	of values each.

	Output: Show data data found and specify what function
	was done, eg: 
	Data Line: C 10 10 10 20
		11000 Sum of Squares


	Level 0:
		Initialize variables
		Reset input file
		Read each line
		Execute in range function
		Execute code function
		Print output

	Level 1:
		Initialize variables
		Reset input file
		While not EOF loop
			Read whole line
			Send to code function, pass values as args
			Execute inRange function
			Print Outpue


}

{main program vars}
var
	data8,out8: Text;
	letterCode: Char;
	a, b, c, d: Integer;



function avSqrSum(a,b,c,d : integer): Real;
var
	sum: Real;	
begin
	sum:= sum + (a*a) + (b*b) + (c*c) + (d*d);
	sum:= sum/4;
	avSqrSum:=sum;
end;

function sqrSum(a,b,c,d : integer): Integer;
var
	sum: Integer;
begin
	sum:=0;
	sum:= sum + (a*a) + (b*b) + (c*c) + (d*d);
	sqrSum:= sum;
end;

function cubeSum(a,b,c,d : integer): Integer;
var
	sum: Integer;	
begin
	sum:= sum + (a*a*a) + (b*b*b) + (c*c*c) + (d*d*d);	
	cubeSum:=sum;
end;

function inRange(a,b,c,d : integer): Integer;
var errorIndex, valid: integer;
begin
	errorIndex:=0;
	if (a<10) OR (a>20) OR 
		(b<10) OR (b>20) OR
		(c<10) OR (c>20) OR
		(d<10) OR (d>20)
	then
	begin
		{errorIndex:=errorIndex+1;}
		valid:= 0;
	end
	else 
	begin
		valid:= 1;
	end;

	inRange := valid;
end;


procedure printOutput(letterCode: Char; a,b,c,d : Integer);
var
 	valid: Integer; 
begin
	valid := inRange(a,b,c,d);
	writeln(out8, 'Data Line':9, letterCode:4, a:4, b:4, c:4, d:4);

	if valid = 1 then
	begin
		case letterCode of
			'S': writeln(out8,sqrSum(a,b,c,d):6,'Sum of squares':15);
			'C': writeln(out8,cubeSum(a,b,c,d):6,'Sum of cubes':15);
			'A': writeln(out8,avSqrSum(a,b,c,d):6:0,'Average of squares':20);
			else 
				writeln('not found');
		end							
	end
	else
	begin
		writeln(out8,'Invalid Data');
	end;

	writeln(out8,' ');
end;



{main program}	
begin
	reset(data8, 'datafiles/data8.dat');
	rewrite(out8, 'outputfiles/out8.dat');

	while not eof(data8) do
	begin
		Read(data8, letterCode);
		Read(data8, a);
		Read(data8, b);
		Read(data8, c);
		Read(data8, d);		

		printOutput(letterCode, a,b,c,d);
		if eoln(data8) then readln(data8);
	end;
end.
