%TDA Zona
% [Nombre Repo, Autor, [Work Space, Index, Local Repository, Remote
% Repository]]
% [String, String, [TDA Objeto, TDA Objeto, TDA Objeto, TDA
% Objeto]]
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
      ["Commit", [[["Español.txt"],["print(Hola Mundo)"]], [["Ingles.txt"],["print(Hello World)"]]]],
      [],
      [],
      ["Entrada 1", [[["Archivo1.txt"],["print(Hola Mundo)"]], [["Archivo2.txt"],["print(Hallo Welt)"]]]]
      ]
     ]).

repo(["P", "J",
      [
      ["Commit", [[["Español.txt"],["print(Hola Mundo)"]],[["Ingles.txt"],["print(Hello World)"]]]],
      [],
      [],
      ["Entrada 1", [[["Archivo1.txt"],["print(Hola Mundo)"]], [["Archivo2.txt"],["print(Hallo Welt)"]]]]
      ]
     ]).


repo(["V","B",
      [
      ["Commit", [ ["Español.txt"],["print(Hola Mundo)"] ]],
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
    replace(Objeto, 0,Commit, ELEM).

set_Lista_Archivos(Objeto, ListaArchivos, ELEM):-
    replace(Objeto, 1, ListaArchivos, ELEM).

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


% gitInit("Lab", "Pedro", OUT).
% gitInit("Marco teorico", "Nadie", OUT).
% gitInit("31 Minutos", "Tulio Triviño", OUT).
%##############################################################


%##############################################################
% Funcion que pasa el contenido de Work Space a Index
gitAdd(RepoInput, _, RepoOutput):- %Archivos
    get_Work_Space(RepoInput, WS),
    set_Work_Space(RepoInput, [], RepoOutputAux),
    get_Index(RepoInput, I),
    (I = []; WS = []),
    append(I, WS, NEWINDEX),
    set_Index(RepoOutputAux, NEWINDEX, RepoOutput).

gitAdd(RepoInput, _, RepoOutput):- %Archivos
    get_Work_Space(RepoInput, WS),
    set_Work_Space(RepoInput, [], RepoOutputAux),
    get_Index(RepoInput, I),
    I \= [],
    WS \= [],
    NEWINDEX = [I, WS],
    set_Index(RepoOutputAux, NEWINDEX, RepoOutput).


% gitAdd(["V", "B", [["Commit", [["Español.txt"], ["print(Hola
% Mundo)"]]], [], [], []]], _ , OUT).

% gitAdd(["Test", "Franco", [["Commit", [["Alemán.txt"], ["print(Hallo
% Welt)"]]], [], [], []]], _ , OUT).

% gitAdd(["Idiomas", "Teacher", [["Commit", [["Ingles.txt"],
% ["print(Hello World)"]]], [], [], []]], _ , OUT).

% ##############################################################

%##############################################################
% Funcion que agrega el Mensaje (Commit) al contenido de index y lo
% traspasa a Local Repository
gitCommit(RepoInput, Mensaje, RepoOutput):-
    get_Index(RepoInput, I),
    set_Commit(I, Mensaje, NEWINDEX),
    set_Index(RepoInput, [], RepoOutputAux),
    set_Local_Repository(RepoOutputAux, NEWINDEX, RepoOutput).

% gitCommit(["V","B",[[],["Commit",[["Español.txt"],["print(Hola
% Mundo)"]]],[],[]]], "Se agrego Español.txt", OUT).

% gitCommit(["Hola","Juan",[[],[" ",[["Alemán.txt"],["print(Hallo
% Welt)"]]],[],[]]], "Se agrego Alemán.txt", OUT).

% gitCommit(["Ingles","Profe",[[],["vacio",[["Ingles.txt"],["print(Hello
% world)"]]],[],[]]], "Se agrego Ingles.txt", OUT).

% ##############################################################


% ##############################################################
% Funcion que mueve el Local Repository a Remote Repository
gitPush(RepoInput, RepoOutput):-
    get_Local_Repository(RepoInput, LR),
    set_Local_Repository(RepoInput, [], RepoOutputAux),
    set_Remote_Repository(RepoOutputAux, LR, RepoOutput).

% gitPush(["V","B",[[],[],["Se agrego Español.txt",[["Español.txt"],["print(Hola Mundo)"]]],[]]], OUT).

% gitPush(["Tesis","Yo nunca",[[],[],["Pongame 7 porfavor.txt",[["Tesis.txt"],["print(La respuesta es D de
% Diosito)"]]],[]]], OUT).

% gitPush(["Alemán","Professor",[[],[],["Vocabulario basico",[["Vocab.txt"],["Ich bin Professor, und du?"]]],[]]], OUT).
%
% ##############################################################



%git2String(RepoInput, RepoAsString).

% ###### Repositorio 'lab3' ######
% Fecha de creación: 2020/05/20 15:40:10
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
% ##### FIN DE REPRESENTACIÓN COMO STRING DEL REPOSITORIO #####

