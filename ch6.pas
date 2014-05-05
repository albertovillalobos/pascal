program chapter6assignment(INPUT,OUTPUT);
{
	Alberto Villalobos
	February 19, 2014
	Chapter 6 assignment

	Description: A use enters space separated values in pairs
	and the program must read those pairs, one being class id
	and the other being class size. Then, the program identifies
	the smallest sized class and the biggest sized classed.
	Then in the end, the program outputs the id and size of
	the largest and smallest class, as well as an everage size 
	per	class.



	Input
		pairs of classids and classids

	Output
		smallest class id and size
		largest class id and size
		average class size

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
	writeln('Please enter calls ids and class size in pairs, eg: 001 15');
	writeln('Press ctrl+D when you are done');
	count := 0;
	total := 0;
	largeid := 0;
	largesize := 0;
	smallsize := 200000;
	smallid := 0;

	while not eof do
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
		
		{sums}
		total := total + classsize;
		count := count + 1;		
		
		if eoln then readln
	end;

	writeln('The smallest class is: ',smallid, ' with ', smallsize, ' students');
	writeln('The largest class is: ',largeid, ' with ', largesize, ' students');
	writeln('The average size per class is: ', (total/count):5:2);
	

end.