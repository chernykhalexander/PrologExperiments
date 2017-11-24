/*Can be executed in tuProlog*/
/*remove element from a list*/
remove_el_from_list(X,[],[]).
remove_el_from_list(X,[X|Tail],Z):-remove_el_from_list(X,Tail,Z).
remove_el_from_list(X,[Head|Tail],[Head|Z]):-remove_el_from_list(X,Tail,Z).

/*find element after a given element*/
find_elem_after(X,[],[]).
find_elem_after(X,[X,Y|Z],Y).
find_elem_after(X,[Y|Tail],Z):-find_elem_after(X,Tail,Z).

/*split a list into two lists at a given element*/
split_list(Elem,[],X,Y):-X=[],Y=[].
split_list(Elem,[X|List],[X|Outlist1],Outlist2):-X<Elem,split_list(Elem,List,Outlist1,Outlist2).
split_list(Elem,[X|List],Outlist1,[X|Outlist2]):-X>=Elem,split_list(Elem,List,Outlist1,Outlist2).

/*get the last element of the list*/
get_last_elem_in_list(X,[]):-fail.
get_last_elem_in_list(X,[Head|Tail]):-Tail=[],X=Head,!;get_last_elem_in_list(X,Tail).

/*Count elements in a list*/
size_of_list(0,[]).
size_of_list(X,[Head|Tail]):-size_of_list(Y,Tail),X is Y+1.


/*reverse_list reverse_list([1,2,3,4],L).*/
reverse_list([X],[X]).
reverse_list([Head|Tail],M):-reverse_list(Tail,L),concat_list(L,[Head],M).


/*concat list*/
concat_list([],Y,Y).
concat_list([Head|Tail],Y,[Head|Z]):-concat_list(Tail,Y,Z).
