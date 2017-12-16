domains
	district=symbol
	rentprice=real
	zkhprice=real
	id=symbol
	flat=flat(district,rentprice,zkhprice,id)
database
	flat(district,rentprice,zkhprice,id)
predicates
     repeat 
     do_mbase
     assert_database
     menu
     process(integer)
     error
     save_database
     processflat(district)

clauses
	do_mbase:-
		assert_database,
		makewindow(1,7,7,"Prague flat database",0,0,25,80),
		menu,
		save_database.
		
	assert_database:-
		consult("flat.dba").
	
	save_database:-
		save("flat.dba").
	
	menu:-
		repeat,
		clearwindow,
		write("* * * * * * * * * * * * * * *"),nl,
		write("* * * * * * * * * * * * * * *"),nl,
		write("* 1. Add a flat to db       *"),nl,
		write("* 2. Delete a flat from db  *"),nl,
		write("* 3. View a flat from db    *"),nl,
		write("* 4. List all flats         *"),nl,
		write("* 5. Quit                   *"),nl,
		write("* * * * * * * * * * * * * * *"),nl, 
		write("Please enter your choice 1,2,3,4,5:"),
		readint(Choice),nl,
		process(Choice),
		Choice = 5,!.
		
	repeat.
	repeat:-repeat.
	
	/* Add information about the flat to DB*/
	process(1):-
		makewindow(2,7,7," Add flat to DB ",2,20,8,58),
		shiftwindow(2),
		write("Enter district: "),
		readln(District),
		write("Enter rent price: "),
		readreal(Rentprice),
		write("Enter zkhprice: "),
		readreal(Zkhprice),
		write("Enter id: "),
		readln(Id),
		assertz(flat(District,Rentprice,Zkhprice,Id)),
		write("Flat has been added to the db"),
		nl,!,
		write("Press space bar. "),
		readchar(_),
		removewindow.	
	
	/* Delete flat by id */
	process(2):-
		makewindow(3,7,7,"Delete flat from DB",10,30,7,40),
		shiftwindow(3),
		write("Enter flat id to delete: "),
		readln(Id),
		retract(flat(_,_,_,Id)),
		write("Flat with id ",Id," was removed from the db."),
		nl,!,
		write("Press space bar."),
		readchar(_),
		removewindow.
	
	/* find flat by region */
	process(3):-
		makewindow(4,7,7," View window ",7,30,16,47),
		shiftwindow(4),
		write("Enter district to view: "),
		readln(District),
		flat(District,Rentprice,Zkhprice,Id),
		nl,write(" Flat "),
		nl,write(" District: ",District),
		nl,write(" Rent price: ",Rentprice),
		nl,write(" Zkh price: ",Zkhprice),
		nl,write(" Id: ",Id),
		flat(District,Rentprice,Zkhprice,Id),
		nl,!,
		write("Press space bar"),
		readchar(_),
		removewindow.
			
	process(3):-
		makewindow(5,7,7,"Not found",14,7,5,60),
		shiftwindow(5),
		write("No flat found in db."),nl,
		write("Sorry, bye!"),
		nl,!,
		write("Press space bar."),
		readchar(_),
		removewindow,
		shiftwindow(1).
	
	/* find all flats by query */
	process(4):-
	makewindow(5,7,7," View window ",7,30,16,47),
		shiftwindow(5),
		write("Enter district to view: "),
		readln(District),
		processflat(District),
		nl,!,
		write("Press space bar"),
		readchar(_),
		removewindow.
	
	/* Quit */	
	process(5):-
		write("Are you sure you want to quit (y/n)"),
		readln(Answer),
		frontchar(Answer,'y',_),!.
	
	process(Choice):-
		Choice<1,error.
	process(Choice):-
		Choice>5,error.
		
	processflat(District):-
		flat(District,Rentprice,Zkhprice,Id),
		nl,write(" Flat "),
		nl,write(" District: ",District),
		nl,write(" Rent price: ",Rentprice),
		nl,write(" Zkh price: ",Zkhprice),
		nl,write(" Id: ",Id),
	    fail.
	processflat(_):-!.	
	
		
	error:-
		write("Please enter a number from 1 to 5."),
		write("Press the space bar to continue"),
		readchar(_).
		

goal
	do_mbase.
