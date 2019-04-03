%let dir=D:\OneDrive\Github\SAS-Projects\0008\xlsx\;
%let lib_dir=D:\OneDrive\Github\SAS-Projects\0008\sas7bdat\;
%let lib=A0008;
%let String01=ESJRV1000133420181212043443CMJUY;/*apiKey*/

libname &lib "&lib_dir";

%macro xlsx(year);
  proc import out=xlsx&year. datafile="&dir.세입목별 &year..xlsx" dbms=xlsx replace;datarow=6;getnames=no;run;
%mend;
%xlsx(2008);
%xlsx(2009);
%xlsx(2010);
%xlsx(2011);
%xlsx(2012);
%xlsx(2013);
%xlsx(2014);
%xlsx(2015);
%xlsx(2016);
%xlsx(2017);

%macro year(year);
  proc sql;
    create table xlsx&year. as
    select &year. as year, *
    from xlsx&year.;
  quit;
  run;
%mend;
%year(2008);
%year(2009);
%year(2010);
%year(2011);
%year(2012);
%year(2013);
%year(2014);
%year(2015);
%year(2016);
%year(2017);

proc sql;
  create table carry2008 as
  select year, A as sfrnd_nm_korean label="자치단체명", BB as x, 0 as y, BC as a, BD as b, BE as c
  from xlsx2008
  where B^=0;
quit;
run;

proc sql;
  create table carry2009 as
  select year, A as sfrnd_nm_korean label="자치단체명", BB as x, BC as y, BD as a, BE as b, BF as c
  from xlsx2009
  where B^=0;
quit;
run;

proc sql;
  create table carry2010 as
  select year, A as sfrnd_nm_korean label="자치단체명", BA as x, BB as y, BC as a, BD as b, BE as c
  from xlsx2010
  where B^=0;
quit;
run;

proc sql;
  create table carry2011 as
  select year, A as sfrnd_nm_korean label="자치단체명", AX as x, AY as y, AZ as a, BA as b, BB as c
  from xlsx2011
  where B^=0;
quit;
run;

proc sql;
  create table carry2012 as
  select year, A as sfrnd_nm_korean label="자치단체명", AY as x, AZ as y, BA as a, BB as b, BC as c
  from xlsx2012
  where B^=0;
quit;
run;

proc sql;
  create table carry2013 as
  select year, A as sfrnd_nm_korean label="자치단체명", AY as x, AZ as y, BA as a, BB as b, BC as c
  from xlsx2013
  where B^=0;
quit;
run;

proc sql;
  create table carry2014 as
  select year, A as sfrnd_nm_korean label="자치단체명", CA as x, CB as y, CC as a, CD as b, CE as c
  from xlsx2014
  where B^=0;
quit;
run;

proc sql;
  create table carry2015 as
  select year, A as sfrnd_nm_korean label="자치단체명", CE as x, CF as y, CG as a, CH as b, CI as c
  from xlsx2015
  where B^=0;
quit;
run;

proc sql;
  create table carry2016 as
  select year, A as sfrnd_nm_korean label="자치단체명", CD as x, CE as y, CF as a, CG as b, CH as c
  from xlsx2016
  where B^=0;
quit;
run;

proc sql;
  create table carry2017 as
  select year, A as sfrnd_nm_korean label="자치단체명", CJ as x, CK as y, CL as a, CM as b, CN as c
  from xlsx2017
  where B^=0;
quit;
run;

data &lib..table004;
  set carry2010-carry2017;
  by year;
run;
