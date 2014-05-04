
program chapter6assignment(input, output);
{
	Alberto Villalobos
	February 19, 2014
	Chapter 6 assignment

	Description: A users fills out a string of 30 characters, y or n, 
	representing a feature they desire, then there is a 20 character
	long address. Compare it to other entries and type possible if the
	matches are at least 80%, and NO if they're not.



	Input
		Customer file
		Apartments file

	Output
		Table of entries with a "possible" or "no" next to them
	

	level 0
		initialize variables
		while more classes
			get classid & size
			see if largest or smallest
			compute totals
		print results

	level 1
		initialize variables
			set count to 0
			set total to 0
			set smallsize to maxint
			set largesize to 0
		see if largest or smallest
			if classsize > largesize
				set largesize to classsize
				set largeid to classid
			if classize < smallsize
				set smallsize to classize
				set smallid to classid

		computer totals
			add classize to total
			add 1 to count
		
		print results
			print smallid & smallsize
			print largeid and largesize
			print total/count			
}
var count, total, classid, classsize, smallsize, smallid, largesize, largeid : integer;
	

begin
	count := 0;
	total := 0;
	largeid := 0;
	largesize := 0;
	smallsize := 200000;
	smallid := 0;

	writeln('Please enter pairs of values as classid classsize');
	writeln('Do a new line every three pairs, and after the las value');
	writeln('Press <ctrl>+D to finalize your input');
	while (not eof) do
	begin
		{read two vars}
		read(classid);
		read(classsize);

		{check if largest}
		if (classsize > largesize)  then
		begin
			largesize := classsize;
			largeid := classid;			
		end;

		if (classsize < smallsize) then
		begin						
			smallsize := classsize;
			smallid := classid;
		end;
		
		if eoln then readln;
		
		{sums}
		total := total + classsize;
		count := count + 1;		
	end;

	writeln('The smallest class is: ',smallid, ' with ', smallsize, ' students');
	writeln('The largest class is: ',largeid, ' with ', largesize, ' students');
	writeln('The average size per class is: ', (total/count):5:2);
	

end.
