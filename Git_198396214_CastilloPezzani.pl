%TDA Zona
% [Nombre Repo, Autor, Fecha, [Work Space, Index, Local Repository,
% Remote Repository]] [String, String, [TDA Objeto, TDA Objeto, TDA
% Objeto, TDA Objeto]]
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


repo(["Prueba 1", "Juanin Juan Harry", "Tue Jun 23 14:47:31 2020.",
      [
      ["Commit", [[["Archivo1.txt"],["print(Hola Mundo)"]], [["Archivo2.txt"],["print(Hallo Welt)"]]]],
      [],
      ["Entrada 1", [[["Archivo1.txt"],["print(Hola Mundo)"]], [["Archivo2.txt"],["print(Hallo Welt)"]]]],
      []
      ]
     ]).

repo(["Prueba 2", "Juan Carlos Bodoque", "Tue Jun 23 14:47:31 2020.",
      [
      ["Commit", [[["Espa�ol.txt"],["print(Hola Mundo)"]], [["Ingles.txt"],["print(Hello World)"]]]],
      [],
      [],
      ["Entrada 1", [[["Archivo1.txt"],["print(Hola Mundo)"]], [["Archivo2.txt"],["print(Hallo Welt)"]]]]
      ]
     ]).

repo(["P", "J", "Tue Jun 23 14:47:31 2020.",
      [
      ["Commit", [[["Espa�ol.txt"],["print(Hola Mundo)"]],[["Ingles.txt"],["print(Hello World)"]]]],
      [],
      [],
      ["Entrada 1", [[["Archivo1.txt"],["print(Hola Mundo)"]], [["Archivo2.txt"],["print(Hallo Welt)"]]]]
      ]
     ]).


repo(["V","B", "Tue Jun 23 14:47:31 2020.",
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

get_Fecha(Zona, ELEM):-
    nth0(2, Zona, ELEM).

get_Zonas(Zona, ELEM):-
    nth0(3,Zona, ELEM).

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

set_Fecha(Zona, Fecha, ELEM):-
    replace(Zona, 2, Fecha, ELEM).

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
    tiempo(T),
    RepoOutput = [NombreRepo, Autor, T, [[], [], [], []] ].


% gitInit("Lab", "Pedro", OUT).
% gitInit("Marco teorico", "Nadie", OUT).
% gitInit("31 Minutos", "Tulio Trivi�o", OUT).
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


% gitAdd(["V", "B", "Tue Jun 23 14:47:31 2020.", [["Commit",
% [["Espa�ol.txt"], ["print(Hola Mundo)"]]], [], [], []]], _ , OUT).

% gitAdd(["Test", "Franco", "Tue Jun 23 14:47:31 2020.", [["Commit",
% [["Alem�n.txt"], ["print(Hallo Welt)"]]], [], [], []]], _ , OUT).

% gitAdd(["Idiomas", "Teacher", "Tue Jun 23 14:47:31 2020.", [["Commit",
% [["Ingles.txt"], ["print(Hello World)"]]], [], [], []]], _ , OUT).

% ##############################################################

%##############################################################
% Funcion que agrega el Mensaje (Commit) al contenido de index y lo
% traspasa a Local Repository
gitCommit(RepoInput, Mensaje, RepoOutput):-
    get_Index(RepoInput, I),
    set_Commit(I, Mensaje, NEWINDEX),
    set_Index(RepoInput, [], RepoOutputAux),
    set_Local_Repository(RepoOutputAux, NEWINDEX, RepoOutput).

% gitCommit(["V","B", "Tue Jun 23 14:47:31
% 2020.", [[],["Commit",[["Espa�ol.txt"],["print(Hola
% Mundo)"]]],[],[]]], "Se agrego Espa�ol.txt", OUT).

% gitCommit(["Hola","Juan", "Tue Jun 23 14:47:31 2020.", [[],["
% ",[["Alem�n.txt"],["print(Hallo Welt)"]]],[],[]]], "Se agrego
% Alem�n.txt", OUT).

% gitCommit(["Ingles","Profe",
% "Tue Jun 23 14:47:31 2020.",
% [[],["vacio",[["Ingles.txt"],["print(Hello world)"]]],[],[]]], "Se
% agrego Ingles.txt", OUT).

% ##############################################################


% ##############################################################
% Funcion que mueve el Local Repository a Remote Repository
gitPush(RepoInput, RepoOutput):-
    get_Local_Repository(RepoInput, LR),
    set_Local_Repository(RepoInput, [], RepoOutputAux),
    set_Remote_Repository(RepoOutputAux, LR, RepoOutput).

% gitPush(["V","B", "Tue Jun 23 14:47:31 2020.",[[],[],["Se agrego
% Espa�ol.txt",[["Espa�ol.txt"],["print(Hola Mundo)"]]],[]]], OUT).

% gitPush(["Tesis","Yo nunca", "Tue Jun 23 14:47:31
% 2020.", [[],[],["Pongame 7 porfavor.txt",[["Tesis.txt"],["print(La
% respuesta es D de Diosito)"]]],[]]], OUT).

% gitPush(["Alem�n","Professor", "Tue Jun 23 14:47:31
% 2020.", [[],[],["Vocabulario basico",[["Vocab.txt"],["Ich bin
% Professor, und du?"]]],[]]], OUT).
%
% ##############################################################


% ##############################################################
% Funciones auxiliares para git2String
nombres_To_List([], Nombres, Nombres).

nombres_To_List([X|Xs], Nombres, OUT):-
    get_Nombre(X, Nombre),
    Aux = [Nombre|Nombres],
    append(Aux, [], Aux2),
    nombres_To_List(Xs, Aux2, OUT).

obtener_Nombres_Archivo(Zona, _, _):-
    Zona = [],
    nombres_To_List([], [], []).

obtener_Nombres_Archivo(Zona, Nombres, OUT):-
    get_Lista_Archivos(Zona, Lista),
    nombres_To_List(Lista, Nombres, Aux),
    reverse(Aux,OUT).

agregar_NombresArchivos(String, [], String).

agregar_NombresArchivos(String, [X|Xs], OUT):-
    string_concat(String, "\n\t", S2),
    string_concat(S2, X, S3),
    agregar_NombresArchivos(S3, Xs, OUT).

convert_To_String(RepoInput, String, RepoAsString):-
    string_concat(String, "###### Repositorio '", S),
    get_NombreRepo(RepoInput, Nombre),
    string_concat(S, Nombre, S2),
    string_concat(S2, "' ######\n", S3),
    get_Fecha(RepoInput, T),
    string_concat(S3, "Fecha de creaci�n: ", S4),
    string_concat(S4, T, S5),
    string_concat(S5, "\nAutor: ", S6),
    get_Autor(RepoInput, Autor),
    string_concat(S6, Autor, S7),
    string_concat(S7, "\nRama actual: Master\nArchivos en WorkSpace:", S8),
    get_Work_Space(RepoInput, WS),
    obtener_Nombres_Archivo(WS, [], ArchivosWS),
    agregar_NombresArchivos(S8, ArchivosWS, S9),
    string_concat(S9, "\n\nArchivos en Index:", S10),
    get_Index(RepoInput, I),
    obtener_Nombres_Archivo(I, [], ArchivosI),
    agregar_NombresArchivos(S10, ArchivosI, S11),
    string_concat(S11, "\n\nCommits en Local Repository:\n\t", S12),
    get_Local_Repository(RepoInput, LR),
    LR = [],
    string_concat(S12, "\n\nCommits en Remote Repository\n\t", S17),
    get_Remote_Repository(RepoInput, RR),
    RR = [],
    string_concat(S17, "\n##### FIN DE REPRESANTACION DEL REPOSITORIO COMO STRING #####", RepoAsString).

convert_To_String(RepoInput, String, RepoAsString):-
    string_concat(String, "###### Repositorio '", S),
    get_NombreRepo(RepoInput, Nombre),
    string_concat(S, Nombre, S2),
    string_concat(S2, "' ######\n", S3),
    get_Fecha(RepoInput, T),
    string_concat(S3, "Fecha de creaci�n: ", S4),
    string_concat(S4, T, S5),
    string_concat(S5, "\nAutor: ", S6),
    get_Autor(RepoInput, Autor),
    string_concat(S6, Autor, S7),
    string_concat(S7, "\nRama actual: Master\nArchivos en WorkSpace:", S8),
    get_Work_Space(RepoInput, WS),
    obtener_Nombres_Archivo(WS, [], ArchivosWS),
    agregar_NombresArchivos(S8, ArchivosWS, S9),
    string_concat(S9, "\n\nArchivos en Index:", S10),
    get_Index(RepoInput, I),
    obtener_Nombres_Archivo(I, [], ArchivosI),
    agregar_NombresArchivos(S10, ArchivosI, S11),
    string_concat(S11, "\n\nCommits en Local Repository:\n\t", S12),
    get_Local_Repository(RepoInput, LR),
    LR = [],
    string_concat(S12, "\n\nCommits en Remote Repository\n\t", S17),
    get_Remote_Repository(RepoInput, RR),
    get_Commit(RR, CommitR),
    string_concat(S17, "'", S18),
    string_concat(S18, CommitR, S19),
    string_concat(S19, "'", S20),
    obtener_Nombres_Archivo(RR, [], ArchivosRR),
    agregar_NombresArchivos(S20, ArchivosRR, S21),
    string_concat(S21, "\n##### FIN DE REPRESANTACION DEL REPOSITORIO COMO STRING #####", RepoAsString).


convert_To_String(RepoInput, String, RepoAsString):-
    string_concat(String, "###### Repositorio '", S),
    get_NombreRepo(RepoInput, Nombre),
    string_concat(S, Nombre, S2),
    string_concat(S2, "' ######\n", S3),
    get_Fecha(RepoInput, T),
    string_concat(S3, "Fecha de creaci�n: ", S4),
    string_concat(S4, T, S5),
    string_concat(S5, "\nAutor: ", S6),
    get_Autor(RepoInput, Autor),
    string_concat(S6, Autor, S7),
    string_concat(S7, "\nRama actual: Master\nArchivos en WorkSpace:", S8),
    get_Work_Space(RepoInput, WS),
    obtener_Nombres_Archivo(WS, [], ArchivosWS),
    agregar_NombresArchivos(S8, ArchivosWS, S9),
    string_concat(S9, "\n\nArchivos en Index:", S10),
    get_Index(RepoInput, I),
    obtener_Nombres_Archivo(I, [], ArchivosI),
    agregar_NombresArchivos(S10, ArchivosI, S11),
    string_concat(S11, "\n\nCommits en Local Repository:\n\t", S12),
    get_Local_Repository(RepoInput, LR),
    get_Commit(LR, CommitL),
    string_concat(S12, "'", S13),
    string_concat(S13, CommitL, S14),
    string_concat(S14, "'", S15),
    obtener_Nombres_Archivo(LR, [], ArchivosLR),
    agregar_NombresArchivos(S15, ArchivosLR, S16),
    string_concat(S16, "\n\nCommits en Remote Repository\n\t", S17),
    get_Remote_Repository(RepoInput, RR),
    RR = [],
    string_concat(S17, "\n##### FIN DE REPRESANTACION DEL REPOSITORIO COMO STRING #####", RepoAsString).

convert_To_String(RepoInput, String, RepoAsString):-
    string_concat(String, "###### Repositorio '", S),
    get_NombreRepo(RepoInput, Nombre),
    string_concat(S, Nombre, S2),
    string_concat(S2, "' ######\n", S3),
    get_Fecha(RepoInput, T),
    string_concat(S3, "Fecha de creaci�n: ", S4),
    string_concat(S4, T, S5),
    string_concat(S5, "\nAutor: ", S6),
    get_Autor(RepoInput, Autor),
    string_concat(S6, Autor, S7),
    string_concat(S7, "\nRama actual: Master\nArchivos en WorkSpace:", S8),
    get_Work_Space(RepoInput, WS),
    obtener_Nombres_Archivo(WS, [], ArchivosWS),
    agregar_NombresArchivos(S8, ArchivosWS, S9),
    string_concat(S9, "\n\nArchivos en Index:", S10),
    get_Index(RepoInput, I),
    obtener_Nombres_Archivo(I, [], ArchivosI),
    agregar_NombresArchivos(S10, ArchivosI, S11),
    string_concat(S11, "\n\nCommits en Local Repository:\n\t", S12),
    get_Local_Repository(RepoInput, LR),
    get_Commit(LR, CommitL),
    string_concat(S12, "'", S13),
    string_concat(S13, CommitL, S14),
    string_concat(S14, "'", S15),
    obtener_Nombres_Archivo(LR, [], ArchivosLR),
    agregar_NombresArchivos(S15, ArchivosLR, S16),
    string_concat(S16, "\n\nCommits en Remote Repository\n\t", S17),
    get_Remote_Repository(RepoInput, RR),
    get_Commit(RR, CommitR),
    string_concat(S17, "'", S18),
    string_concat(S18, CommitR, S19),
    string_concat(S19, "'", S20),
    obtener_Nombres_Archivo(RR, [], ArchivosRR),
    agregar_NombresArchivos(S20, ArchivosRR, S21),
    string_concat(S21, "\n##### FIN DE REPRESANTACION DEL REPOSITORIO COMO STRING #####", RepoAsString).

% ##############################################################


% ##############################################################
%  Funcion que representa un repositorio como String
git2String(RepoInput, RepoAsString):-
    convert_To_String(RepoInput, "", RepoAsString).


%git2String(["V","B", "Tue Jun 23 14:47:31 2020.",[["Commit ws",[["a.txt","contenido"]]],["Commit I",[["b.txt","contenido"]]],["Commit Local",[["c.txt","contenido"]]],["Commit Remote",[["d.txt","contenido"]]]]],OUT).

%git2String(["Lab","Juan", "Mon Jun 23 14:47:31 2020.",[["No Commit",[["WorkSpace.txt","contenido"]]],["No Commit",[["Index.txt","contenido"]]],["Commit Local",[["LocalRepo.txt","contenido"]]],["Commit Remote",[["RemoteRepo.txt","contenido"]]]]],OUT).

%git2String(["V","B", "Tue Jun 23 14:47:31 2020.",[["Commit ws",[["a.txt","contenido"]]],["Commit I",[["b.txt","contenido"]]],[],[]]],OUT).

% ##############################################################




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

