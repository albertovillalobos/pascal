program ProgramName(input, output, acct11, out11);
{
	Chapter 11 Assignment
	Alberto Villalobos
	April 2, 2014

	Description: This program simulates an online
	credit system, in which accounts are stored in



	Input: A file with account information.
	Interactive input from the user, account number
	and amount. Negative account numbers signal
	end of input.

	Output: First output an account report with all
	the accounts and balances that were input into 
	the program. Also output a new balance sheet every
	time. 

	level 0:
		Reset & Rewrite files
		Initialize variables
		Read accounts into program
		Output loaded accounts report
		Start interactivity
			Get account
			Get balance
			If negative account, save & exit
			Output possible warnings
			Process transaction
}


{main program vars & types}


Type 
	account = record
		name : packed array[1..20] of char;
		acctno: Integer;
		balance : Real;
		climit : Real;
		
	end;

	acctary = array[1..100] of account;
	acctfile = file of account;

var
	out11, acct11: acctfile;
	numcust: Integer;
	list: acctary;


procedure loadarray( var list:acctary; var numcust:Integer; var acct11:acctfile);
begin
	numcust := 0;
	Reset(acct11, 'datafiles/acct11.dat');
	while not eof(acct11) do
	begin
		numcust := numcust +1;
		Read(acct11, list[numcust]);
	end;

	
end;



{ main program}
begin
	loadarray(list, numcust, acct11);
	writeln(list[6].name);

end.
