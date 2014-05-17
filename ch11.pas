program ProgramName(input, output, acct11, out11);
{
	Chapter 11 Assignment
	Alberto Villalobos
	May 15, 2014

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
	read account
	read balance
	If negative account, save & exit
	else search for account index in array by account number
	if non-existant, throw error
	do an estimate of transaction, if over limit, throw error
	else add to the balance
	if negative account, write new file and exit
	
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
	numcust, actInput: Integer;
	purchase: real;
	list: acctary;



procedure loadarray( var list:acctary; var numcust:Integer; var acct11:acctfile);
begin
	numcust := 0;
	Reset(acct11);
	
	writeln('NAME':10,'ACCOUNT':10,'BALANCE':10,'LIMIT':10);
	while not eof(acct11) do
	begin
	numcust := numcust +1;
	Read(acct11, list[numcust]);
	writeln(list[numcust].name:10, list[numcust].acctno:10, list[numcust].balance:10:2, list[numcust].climit:10:2);
	end;
end;


{return index of account found, return 0 if none found}
function findAccount(var accountToFind: integer; var tryList:acctary) : integer;
var
	searchIterator, found, indexFound : integer;
	
begin
	found:=0;
	indexFound := 0;
	for searchIterator := 1 to 11 do
	begin
		if (tryList[searchIterator].acctno =  accountToFind) and (found=0) then
		begin
			indexFound:= searchIterator;
			found := 1;
		end;
	end;
	findAccount := indexFound;
end;




procedure tryPurchase(var tryAccountNo: integer; var tryPurchaseAmount: real; var tryList:acctary);
var 
	accountIndex : integer;
	overdraft: real;
begin

	accountIndex:= findAccount(tryAccountNo, tryList);
	if accountIndex > 0 then
		begin
			if (tryList[accountIndex].balance + tryPurchaseAmount) > tryList[accountIndex].climit then
			begin
				overdraft := tryList[accountIndex].balance + tryPurchaseAmount - tryList[accountIndex].climit;
				writeln('We cannot authorize this purchase at this time as it would put you $', overdraft:6:2, ' over your credit limit');
			end
			else 
			begin
				tryList[accountIndex].balance := tryList[accountIndex].balance + purchase;
				writeln('Thank you for your business');
			end;
			
		end
	else
		begin
			writeln('Invalid account number - re-enter data!');
		end;
	
	if purchase < 0 then writeln('Do not entercredits at this terminal - re-enter data');
end;


procedure writeToFile(var tryList:acctary);
var writeIterator: integer;
begin
	rewrite(out11);

	for writeIterator:=1 to 11 do
	begin
		write(out11, list[numcust]);
	end;
end;


 



{ main program}
begin
	loadarray(list, numcust, acct11);
	actInput := 1;
	
	while actInput > 0 do
	begin
		writeln('Enter account number:' );
		read(actInput);
		writeln('Enter amount of purchase:');
		read(purchase);	
		
		if actInput > 0 then tryPurchase(actInput, purchase, list);
	end; 
	
	
	writeToFile(list);
end.
