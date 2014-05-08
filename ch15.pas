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

var
	data11: text;
	lineCount: integer;
begin
	reset(data11);
	while not eof(data11) do
	begin		
		
	end;
end.