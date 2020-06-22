%TDA Archivo
%[Nombre, Contenido]
%[String, String]
%
%
%TDA Zona
%[Work Space, Index, Local Repository, Remote Repository]
%[TDA Objeto, TDA Objeto, TDA Objeto, TDA Objeto]
%
%
%TDA Objeto
%[Nombre Repo, Autor, Commit, Lista de Archivos]
%[String, String, String, Lista de TDA Archivo]

tiempo(Y):- get_time(X), convert_time(X,Y).


gitInit(NombreRepo, Autor, RepoOutput).

gitAdd(RepoInput, Archivos, RepoOutput).

gitCommit(RepoInput, Mensaje, RepoOutput).

gitPush(RepoInput, RepoOutput).

git2String(RepoInput, RepoAsString).

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
##### FIN DE REPRESENTACIÓN COMO STRING DEL REPOSITORIO #####

