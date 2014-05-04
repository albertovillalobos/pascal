program ch10 (data9cust, data9apts, output);
{
	Alberto Villalobos
	April 20, 2014
	Chapter 10 assignment

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
		read customer file into array
		foreach line put into array
			compare arrays
			ouput 		 
	

	level 1
		initialize variables
		readcustomer
		foreach customer
			compare against each answer
			add to the total
			divide over total amount
			ouput percentage
			if over 80%, output possible
			print like: 
				address noOfMatches Possibility
			
	level 2
		
			
}

{variables}
type
	myArray = Array[1..30] of char;
var
	data9cust, data9apts: text;
	i, matches: integer;
	customer, apartments, address, decision : char;
	customerArray, apartmentsArray:myArray;
	


{match stuff}

{begin program}
begin

	matches := 0;
	
	reset (data9cust);
	reset (data9apts);
	
	
	{load customer data}
	for i:= 1 to 30 do
	begin
		{read file}
		read(data9cust, customer);
		{put customer data into the array}
		customerArray [i]:=customer;
		{writeln(customerArray[i]);}
	end;
	
	{compare to others}
	{loop over each line}
	while not eof (data9apts) do
	begin
		{loop through each apartment}
		for i:=1 to 30 do
		begin
			{read file}
			read(data9apts, apartments);
			{load apartments to array}
			if apartments = customerArray[i] then
				matches := matches + 1;
				
		end;		
		while not eoln(data9apts) do
		begin
			read(data9apts, address);
			write (address);			
		end;
		
		if eoln (data9apts) then
		begin
			readln(data9apts);
			if matches >= 24 then
				writeln(matches, '    Possible')
			else 
				writeln(matches, '    no');
				
				

			matches := 0;
		end;		

	end;

end.
