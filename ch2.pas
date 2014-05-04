program ch2(input, output);
{
	Chapter 2 Assignment
	Alberto Villalobos
	February 6, 2014

	Description: Calculates mowing time
}

const
	housewidth = 40;
	houselength = 40;
	lawnwidth = 100;
	lawnlength = 150;
	ftperhour = 50;

var
	area, time: Integer;

begin
	area := lawnlength * lawnwidth - houselength * housewidth;
	time := area div ftperhour;
	writeln('Area to be mowed ', area, ' time required ', time);
end.