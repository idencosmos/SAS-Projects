%let dir=D:\Kwonhee\OneDrive\Github\SAS-Projects\0008\sas7bdat\;
%let lib=A0008;
%let String01=ESJRV1000133420181212043443CMJUY;/*apiKey*/

libname &lib "&dir";

proc sql;
  create table &lib..var001 as
  select * from &lib..table001 as a full join &lib..table002 as b
  on a.accnut_year=b.accnut_year
  and a.wdr_sfrnd_code=b.wdr_sfrnd_code
  and a.wdr_sfrnd_code_nm=b.wdr_sfrnd_code_nm
  and a.sfrnd_code=b.sfrnd_code
  and a.sfrnd_nm_korean=b.sfrnd_nm_korean
  ;
quit;
run;

proc sql;
  create table &lib..var002 as
  select * from &lib..table003
  where level_no=1;
quit;
run;

proc sql;
  create table &lib..var003 as
  select * from &lib..var002 as a full join &lib..var001 as b
  on a.accnut_year=b.accnut_year
  and a.wdr_sfrnd_code=b.wdr_sfrnd_code
  and a.wdr_sfrnd_code_nm=b.wdr_sfrnd_code_nm
  and a.sfrnd_code=b.sfrnd_code
  and a.sfrnd_nm_korean=b.sfrnd_nm_korean
  ;
quit;
run;
