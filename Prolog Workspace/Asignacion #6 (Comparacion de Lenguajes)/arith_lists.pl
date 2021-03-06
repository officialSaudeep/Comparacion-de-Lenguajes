/*
 * arith_lists.pl
 * By Saulo Almeda Nieves
 * 841-13-0170
 * 12/13/15
 */
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 fibo(Number, Nth) :-
              Number > 1,
              NumMinus1 is Number - 1,
              NumMinus2 is Number - 2,
              fibo(NumMinus1, Fibo1),
              fibo(NumMinus2, Fibo2),
              Nth is Fibo1 + Fibo2.
         
 fibo(1, 1).
 fibo(0, 0).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 fibo_v2(Num, Nth) :-
              helper(Num, 1, Nth).
              
 helper(Num, Acc, Nth) :-
             Num > 1,
             NewAcc is Acc - Num,
             NumMinus is Num - 1,
             NumMinus2 is Num - 2,
             helper(NumMinus, NewAcc, Nth1),
             helper(NumMinus2, NewAcc, Nth2),
             Nth is Nth1 + Nth2.

 helper(0, 0, 0).
 helper(1, Acc, Acc).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 scalar_mult(Num, List, MultList) :-
                  List = [Head|Tail],
                  NewNum is Num * Head,
                  scalar_mult(Num, Tail, TailMultList),
                  append([NewNum], TailMultList, MultList).
 scalar_mult(1, [], []).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 list_min([Head|Tail], Min) :-
                       list_min(Tail, NewMin),
                       Head < NewMin,
                       Min is Head.
 list_min([Head|_], Head).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 list_insert(Elem, [Head|Tail], List2) :-
                   Elem < Head,
                   append([Elem], [Head|Tail], List2);
                   Elem > Head,
                   list_insert(Elem, Tail, List2).