%let dir=D:\OneDrive\Github\SAS-Projects\0008\xlsx\;
%let lib_dir=D:\OneDrive\Github\SAS-Projects\0008\sas7bdat\;
%let lib=A0008;
%let String01=ESJRV1000133420181212043443CMJUY;/*apiKey*/

libname &lib "&lib_dir";

proc import out=up datafile="&dir.\시도지사선거\전체 시도지사선거.xlsx" dbms=xlsx replace;datarow=2;getnames=yes;run;

proc import out=down datafile="&dir.\시군구의장선거\전체 시군구의장선거.xlsx" dbms=xlsx replace;datarow=2;getnames=yes;run;

proc sql;
  create table &lib..table005 as
  select a.var1 label="회차"
  , a.var2 label="지역명"
  , a.var4 label="성명"
  , a.var3 label="정당"
  , case when a.var6="남" then 1 else 0 end label="성별(남)"
  , a.var7 label="생년"
  , a.var10 label="연령"
  , a.var14 label="득표수"
  , a.var15 label="득표율"
  from up as a;
quit;
run;

proc sql;
  create table &lib..table006 as
  select b.var1 label="회차"
  , b.var2 label="지역명"
  , b.var4 as var24 label="자치단체명"
  , b.var6 as var26 label="성명(자치)"
  , b.var5 as var25 label="정당(자치)"
  , case when b.var8="남" then 1 else 0 end as var28 label="성별(남)(자치)"
  , b.var9 as var29 label="생년(자치)"
  , b.var12 as var32 label="연령(자치)"
  , b.var16 as var36 label="득표수(자치)"
  , b.var17 as var37 label="득표율(자치)"
  from down as b;
quit;
run;
