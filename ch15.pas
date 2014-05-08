program ch15(input, output, data11);
{
	Chapter 15 Assignment
	Alberto Villalobos
	May 1, 2014

	Description: Given a mileage chart matrix, detect
	if there are symmetry or diagonal errors, in other
	words, make sure that the distance from A to B is 
	the same as B to A. And that the distance from A
	to A is always 0.

	Input: a file that contains several matrixes separated
	but a single random number

	Output: On screen success or error message	

	level 0:
		Initialize variables
		Reset buffer
		Read first line as height of matrix
		Loop through the matrix height times
		Put those values into a multidimensional array
		Pass by reference to check function, return success or fail
		After height times, get next matrix.
}



type 
	theMatrix = array[1..26, 1..26] of integer;





{sub-programs here}
procedure printTableHeader(elements : integer);
var
	letter: char;
	i : integer;
begin
				writeln('');
				writeln('');
				writeln('');	
	write('City':5);
	for i := 1 to elements do
	begin
		letter := char(i+64);
		write(letter:5);
	end;
	writeln(' ');
	for i := 0 to elements do
	begin
		write('-------':5);
	end;
	
end;

procedure printTableRow(rowNumber : integer);
var
	letter :char;
begin
	letter := char(rowNumber+65);
	writeln('');
	write(letter,' |':5);
end;


function checkError(var suspiciousArray : theMatrix; arrayLength : integer): string;
var
	errorOn: Boolean;
	i, j : integer;
	errorMessage: string;
	xLetter, yLetter : char;

begin
	errorOn := false;
	errorMessage:='Mileage Chart OK!';
	

	{ check diagonals}
	for i := 1 to arrayLength do
	begin
		if ((suspiciousArray[i,i] <> 0) AND (errorOn = false)) then
		begin
			{writeln("Error!");}
			xLetter := char(i+64);
			yLetter := char(i+64);
			errorMessage := concat('Mileage Chart in Error. First error found in row ', xLetter, ' column ', yLetter);
			errorOn := true;
		end;
	end;

	{ check symmetry }
	for i := 1 to arrayLength do
	begin

		for j := 1 to arrayLength do
		begin
			if (suspiciousArray[i,j] <> suspiciousArray[j,i]) and (errorOn = false) then
			begin
				xLetter := char(i+64);
				yLetter := char(j+64);
				errorMessage := concat('Mileage Chart in Error. First error found in row ', yLetter, ' column ', xLetter);
				errorOn := true;				
			end;
		end;
		
	end;



	checkError := errorMessage;

	
end;

{
	main program stuff
}

var
	data11: text;
	lineCount, matrixHeight, currentToken, x, y: integer;
	currentMatrix : theMatrix;
begin
	lineCount := 0;
	y := 1;
	x := 1;
	matrixHeight := 0;

	reset(data11);
	while not eof(data11) do
	begin

		if lineCount = 0 then 
			begin
				read(data11, matrixHeight);
				printTableHeader(matrixHeight);
			end
			else 
			begin
				read(data11, currentToken);
				currentMatrix[x,y] := currentToken;
				write(currentMatrix[x,y]:5);
				x := x+1;		
			end;

		if eoln(data11) then
		begin
			lineCount := lineCount + 1;
			y := lineCount;
			x := 1;
			readln(data11);

			if lineCount > matrixHeight then
			begin

				writeln('');
				writeln(checkError(currentMatrix, lineCount));
				lineCount := 0;
				y := lineCount;
				matrixHeight := currentToken;
			end
			else
			begin
				printTableRow(y-1);
			end;
		end;
	end;
end.