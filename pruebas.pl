prueba(UNO, DOS):- TRES = [UNO, DOS], write(TRES).

vacio(UNO,DOS):- UNO = [], write(DOS).

vacio(UNO,DOS):- DOS = [], write(UNO).

unir(UNO,DOS):-  append(UNO, DOS, SALIDA), write(SALIDA).

test(["V","B",[[],["Commit",[["Español.txt"],["print(Hola Mundo)"]]],[],[]]]).

test(["V","B",[[],[],["Se agrego Español.txt",[["Español.txt"],["print(Hola Mundo)"]]],[]]]).

%gitAdd(["V", "B", [["Commit", [["Español.txt"], ["print(Hola Mundo)"]]], [], [], []]], _ , OUT).

%gitCommit(["V","B",[[],["Commit",[["Español.txt"],["print(Hola Mundo)"]]],[],[]]], "Se agrego Español.txt", OUT).

%gitPush(["V","B",[[],[],["Se agrego Español.txt",[["Español.txt"],["print(Hola Mundo)"]]],[]]], OUT).

%gitInit("Lab","Aldo",OUT).

%git2String(["V","B", "Tue Jun 23 14:47:31 2020.",[[],[],["Se agrego Español.txt",[["Español.txt"],["print(Hola Mundo)"]]],[]]],OUT).


a([["a","b"],["c","d"],["e","f"]]).

nombres_To_List([], Nombres, Nombres).

nombres_To_List([X|Xs], Nombres, OUT):-
    get_Nombre(X, Nombre),
    Aux = [Nombre|Nombres],
    append(Aux, [], Aux2),
    nombres_To_List(Xs, Aux2, OUT).

