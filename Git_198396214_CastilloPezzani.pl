%TDA Zona
% [Nombre Repo, Autor, [Work Space, Index, Local Repository, Remote
% Repository]]
% [String, String, TDA Objeto, TDA Objeto, TDA Objeto, TDA
% Objeto]
%
%
%TDA Objeto
% [Commit, Lista de Archivos]
% [String, Lista de TDA Archivo]
%
%
% TDA Archivo
% [Nombre, Contenido]
% [String, String]


repo(["Prueba 1", "Juanin Juan Harry",
      [
      ["Commit", [[["Archivo1.txt"],["print(Hola Mundo)"]], [["Archivo2.txt"],["print(Hallo Welt)"]]]],
      [],
      ["Entrada 1", [[["Archivo1.txt"],["print(Hola Mundo)"]], [["Archivo2.txt"],["print(Hallo Welt)"]]]],
      []
      ]
     ]).

repo(["Prueba 2", "Juan Carlos Bodoque",
      [
      ["Commit", [[["Espa�ol.txt"],["print(Hola Mundo)"]], [["Ingles.txt"],["print(Hello World)"]]]],
      [],
      [],
      ["Entrada 1", [[["Archivo1.txt"],["print(Hola Mundo)"]], [["Archivo2.txt"],["print(Hallo Welt)"]]]]
      ]
     ]).

repo(["P", "J",
      [
      ["Commit", [[["Espa�ol.txt"],["print(Hola Mundo)"]],[["Ingles.txt"],["print(Hello World)"]]]],
      [],
      [],
      ["Entrada 1", [[["Archivo1.txt"],["print(Hola Mundo)"]], [["Archivo2.txt"],["print(Hallo Welt)"]]]]
      ]
     ]).


repo(["V","B",
      [
      ["Commit", [ ["Espa�ol.txt"],["print(Hola Mundo)"] ]],
      [],
      [],
      []
      ]
     ]).


%##############################################################
%Getters TDA Archivo
get_Nombre(Archivo, ELEM):-
    nth0(0, Archivo, ELEM).

get_Contenido(Archivo, ELEM):-
    nth0(1, Archivo, ELEM).

%Setters TDA Archivo
set_Nombre(Archivo, Nombre, ELEM):-
    replace(Archivo, 0, Nombre, ELEM).

set_Contenido(Archivo, Contenido, ELEM):-
    replace(Archivo, 1, Contenido, ELEM).

%##############################################################


%##############################################################
%Getters TDA Zona
get_NombreRepo(Zona, ELEM):-
    nth0(0, Zona, ELEM).

get_Autor(Zona, ELEM):-
    nth0(1, Zona, ELEM).

get_Zonas(Zona, ELEM):-
    nth0(2,Zona, ELEM).

get_Work_Space(Zona, ELEM):-
    get_Zonas(Zona, Zonas),
    nth0(0, Zonas, ELEM).

get_Index(Zona, ELEM):-
    get_Zonas(Zona, Zonas),
    nth0(1, Zonas, ELEM).

get_Local_Repository(Zona, ELEM):-
    get_Zonas(Zona, Zonas),
    nth0(2, Zonas, ELEM).

get_Remote_Repository(Zona, ELEM):-
    get_Zonas(Zona, Zonas),
    nth0(3, Zonas, ELEM).

%Setters TDA Zona
set_NombreRepo(Zona, NombreRepo, ELEM):-
    replace(Zona, 0, NombreRepo, ELEM).

set_Autor(Zona, Autor, ELEM):-
    replace(Zona, 1, Autor, ELEM).

set_Work_Space(Zona, WorkSpace, ELEM):-
    get_Zonas(Zona, Zonas),
    replace(Zonas, 0, WorkSpace, NEWZONE),
    replace(Zona, 2, NEWZONE, ELEM).

set_Index(Zona, Index, ELEM):-
    get_Zonas(Zona, Zonas),
    replace(Zonas, 1, Index, NEWZONE),
    replace(Zona, 2, NEWZONE, ELEM).

set_Local_Repository(Zona, LocalRepository, ELEM):-
    get_Zonas(Zona, Zonas),
    replace(Zonas, 2, LocalRepository, NEWZONE),
    replace(Zona, 2, NEWZONE, ELEM).

set_Remote_Repository(Zona, RemoteRepository, ELEM):-
    get_Zonas(Zona, Zonas),
    replace(Zonas, 3, RemoteRepository, NEWZONE),
    replace(Zona, 2, NEWZONE, ELEM).

%##############################################################


%##############################################################
%Getters TDA Objeto
get_Commit(Objeto, ELEM):-
    nth0(0, Objeto, ELEM).

get_Lista_Archivos(Objeto, ELEM):-
    nth0(1, Objeto, ELEM).

%Setters TDA Objeto
set_Commit(Objeto, Commit, ELEM):-
    nth0(Objeto, Commit, ELEM).

set_Lista_Archivos(Objeto, ListaArchivos, ELEM):-
    nth0(Objeto, ListaArchivos, ELEM).

%##############################################################




tiempo(Y):- get_time(X), convert_time(X,Y).

%##############################################################
%Dado el nombre de una repo se obtiene su autor
get_Autor_By_Nombre(NOMBRE, ELEM):-
    repo([NOMBRE, AUTOR, CONTENIDO]),
    REPO = [NOMBRE, AUTOR, CONTENIDO],
    nth0(0, REPO, ELEM).

%Dado el nombre de una repo se obtiene su Contenido
get_Contenido_By_Nombre(NOMBRE, ELEM):-
    repo([NOMBRE, AUTOR, CONTENIDO]),
    REPO = [NOMBRE, AUTOR, CONTENIDO],
    nth0(2, REPO, ELEM).

%##############################################################


%##############################################################
%Dado el autor de una repo se obtiene su nombre
get_Nombre_By_Autor(AUTOR, ELEM):-
    repo([NOMBRE, AUTOR, CONTENIDO]),
    REPO = [NOMBRE, AUTOR, CONTENIDO],
    nth0(0, REPO, ELEM).

%Dado el autor de una repo se obtiene su Contenido
get_Contenido_By_Autor(AUTOR, ELEM):-
    repo([NOMBRE, AUTOR, CONTENIDO]),
    REPO = [NOMBRE, AUTOR, CONTENIDO],
    nth0(2, REPO, ELEM).

%##############################################################

%##############################################################
% Dado nombre y autor se obtiene su contenido y se devuelve el
% repositorio completo.
get_Repo_By_Nombre_y_Autor(NOMBRE, AUTOR, REPO):-
    repo([NOMBRE, AUTOR, CONTENIDO]),
    REPO = [NOMBRE, AUTOR, CONTENIDO].

%##############################################################


%##############################################################
% Funcion que reemplaza un elemento de una lista
replace([_|Xs], 0, NEW, [NEW|Xs]).

replace([X|XS], COORD, NEW, [X|YS]):-
    COORD > -1,
    NI is COORD - 1,
    replace(XS, NI, NEW, YS), !.

replace(L, _, _, L).

%##############################################################


%##############################################################
% Funcion que inicializa un repositorio con autor y nombre dados
gitInit(NombreRepo, Autor, RepoOutput):-
    RepoOutput = [NombreRepo, Autor, [[], [], [], []] ].

%##############################################################


%##############################################################
% Funcion que pasa el contenido de Work Space a Index
gitAdd(RepoInput, _, RepoOutput):- %Archivos
    write("input: "),
    write(RepoInput),
    nl,
    get_Work_Space(RepoInput, WS),
    write("ws: "),
    write(WS),
    nl,
    set_Work_Space(RepoInput, [], RepoOutputAux),
    write("output: "),
    write(RepoOutputAux),
    nl,
    get_Index(RepoInput, I),
    write("index: "),
    write(I),
    nl,
    (I = []; WS = []),
    write("Uno vacio"),
    nl,
    append(I, WS, NEWINDEX),
    write("newindex: "),
    write(NEWINDEX),
    nl,
    set_Index(RepoOutputAux, NEWINDEX, RepoOutput),
    write("output final: "),
    write(RepoOutput),
    nl.

gitAdd(RepoInput, _, RepoOutput):- %Archivos
    write("input: "),
    write(RepoInput),
    nl,
    get_Work_Space(RepoInput, WS),
    write("ws: "),
    write(WS),
    nl,
    set_Work_Space(RepoInput, [], RepoOutputAux),
    write("output: "),
    write(RepoOutputAux),
    nl,
    get_Index(RepoInput, I),
    write("index: "),
    write(I),
    nl,
    I \= [],
    WS \= [],
    write("ninguno vacio"),
    nl,
    NEWINDEX = [I, WS],
    write("newindex: "),
    write(NEWINDEX),
    nl,
    set_Index(RepoOutputAux, NEWINDEX, RepoOutput),
    write("output final: "),
    write(RepoOutput),
    nl.


%##############################################################


%gitCommit(RepoInput, Mensaje, RepoOutput).

%gitPush(RepoInput, RepoOutput).

%git2String(RepoInput, RepoAsString).

% ###### Repositorio 'lab3' ######
% Fecha de creaci�n: 2020/05/20 15:40:10
% Autor: Juanito Perez
% rama actual: master
% Archivos en workspace:
%     a1.txt
%     asd.dat
%     blablabla.jpg
% Archivos en Index:

% Commits en local repository:
%    [12AB1EFF] 'mensaje de ejemplo del primer commit'
%        a1.txt
%    [AAA8B1CCF] 'otro mensaje para segundo commit, se agrega archivo
%    asd.dat y blablabla.jpg'
%        asd.dat
%        blablabla.jpg
% Commits en remote repository:
%    [12AB1EFF] 'mensaje de ejemplo del primer commit'
%        a1.txt
% ##### FIN DE REPRESENTACI�N COMO STRING DEL REPOSITORIO #####

