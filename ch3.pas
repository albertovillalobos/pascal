program ch3(input, output);
{
	Chapter 3 Assignment
	Alberto Villalobos
	February 12, 2014

	Description: A user enters parameters of an area to be mowerd
	and the program outputs the square footage to be mowed
	and the estimated time required.

	Input: lengh and width of house and lawn

	Output: Area to be mowed and time required
}

const
	ftperhour = 50;

var
	area, time, housewidth, houselength, lawnwidth, lawnlength: Integer;

begin
	writeln('Enter lawn width: ');
	read(lawnwidth);
	writeln('Enter lawn length: ');
	read(lawnlength);
	writeln('Enter house width: ');
	read(housewidth);
	writeln('Enter house length: ');
	read(houselength);

	area := lawnwidth * lawnlength - housewidth * houselength;
	time := area div ftperhour;
	writeln('Area to be mowed ', area, ' time required ', time);
end.