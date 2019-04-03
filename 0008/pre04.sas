%let dir=D:\OneDrive\Github\SAS-Projects\0008\sas7bdat\;
%let lib=A0008;
%let String01=ESJRV1000133420181212043443CMJUY;/*apiKey*/

libname &lib "&dir";

proc sql;
  create table &lib..var009 as
  select a.*, b.*
  from &lib..var005 as a left join &lib..var006 as b
  on a.accnut_year=b.accnut_year
  and a.sfrnd_nm_korean=b.var24;
quit;
run;

proc sql;
  create table &lib..var010 as
  select *, accnut_year-var29+1 as var110 label="나이(연도, 자치)", case when accnut_year=2010 or accnut_year=2014 then 1 else 0 end as var103 label="지방선거"
  from &lib..var009;
quit;
run;
