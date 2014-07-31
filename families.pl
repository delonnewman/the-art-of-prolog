% vim: set ft=prolog:
father(terach,abraham).
father(terach,nachor).
father(terach,haran).
father(abraham,isaac).
father(abraham,ishmael).
father(haran,lot).
father(haran,milcah).
father(haran,yiscah).
father(isaac,jacob).
father(isaac,esau).
father(laban,rachel).
father(laban,leah).
father(jacob,ruben).
father(jacob,simeon).
father(jacob,levi).
father(jacob,judah).
father(jacob,dan).
father(jacob,naphtali).
father(jacob,gad).
father(jacob,asher).
father(jacob,issachar).
father(jacob,zebulun).
father(jacob,dina).
father(jacob,joseph).
father(jacob,benjamin).

mother(sarah,isaac).
mother(hagar,ishmael).
mother(rebekah,jacob).
mother(rebekah,esau).
mother(leah,ruben).
mother(leah,simeon).
mother(leah,levi).
mother(leah,judah).
mother(bilhah,dan).
mother(bilhah,naphtali).
mother(zilpah,gad).
mother(zilpah,asher).
mother(leah,issachar).
mother(leah,zebulun).
mother(leah,dina).
mother(rachel,joseph).
mother(rachel,benjamin).

female(sarah).
female(hagar).
female(milcah).
female(yiscah).
female(rebekah).
female(rachel).
female(leah).
female(bilhah).
female(zilpah).
female(dina).

male(terach).
male(abraham).
male(nachor).
male(haran).
male(isaac).
male(ishmael).
male(lot).
male(jacob).
male(esau).
male(laban).
male(ruben).
male(simeon).
male(levi).
male(judah).
male(dan).
male(naphtali).
male(benjamin).
male(joseph).

mother(Woman)         :- mother(Woman,Child).
father(Man)           :- father(Man,Child).
procreated(Man,Woman) :- father(Man,Child),mother(Woman,Child).

parent(Parent,Child)      :- father(Parent,Child);mother(Parent,Child).
grandparent(Grand,Person) :- parent(Grand,Parent),parent(Parent,Person).
grandfather(Grand,Person) :- grandparent(Grand,Person),male(Grand).
grandmother(Grand,Person) :- grandparent(Grand,Person),female(Grand).

child(Child,Parent)       :- parent(Parent,Child).
son(Man,Parent)           :- child(Man,Parent),male(Man).
daughter(Woman,Parent)    :- child(Woman,Parent),female(Woman).
grandchild(Child,Grand)   :- grandparent(Grand,Child).
grandson(Man,Grand)       :- grandchild(Man,Grand),male(Man).
granddaugter(Woman,Grand) :- grandchild(Woman,Grand),female(Woman).

sibling(Sib1,Sib2) :- parent(Parent,Sib1),parent(Parent,Sib2),\=(Sib1,Sib2).
brother(Bro,Sib)   :- sibling(Bro,Sib),male(Bro).
sister(Sis,Sib)    :- sibling(Sis,Sib),female(Sis).

uncle(Uncle,Person)     :- brother(Uncle,Parent),parent(Parent,Person).
aunt(Aunt,Person)       :- sister(Aunt,Parent),parent(Parent,Person).
cousin(Cousin1,Cousin2) :-
  parent(Parent1,Cousin1),
  parent(Parent2,Cousin2),
  sibling(Parent1,Parent2).
