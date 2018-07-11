%let dir=D:\OneDrive\Github\SAS-Projects\0007\;
%let lib=A0007;

libname &lib "&dir";

proc import out=&lib..D001 datafile="&dir.\Tables\박원순 트윗 목록_SAS용.csv" dbms=csv replace;run;
proc import out=&lib..D002 datafile="&dir.\Tables\이재명 트윗 목록_SAS용.csv" dbms=csv replace;run;

data &lib..D003;
set &lib..D002 &lib..D001;
run;

proc import out=&lib..D004 datafile="&dir.\Tables\박원순 리트윗 팔로워.csv" dbms=csv replace;guessingrows=32767;run;
proc import out=&lib..D005 datafile="&dir.\Tables\이재명 리트윗 팔로워.csv" dbms=csv replace;guessingrows=32767;run;
proc import out=&lib..D006 datafile="&dir.\Tables\박원순 리트윗 목록.csv" dbms=csv replace;guessingrows=32767;run;
proc import out=&lib..D007 datafile="&dir.\Tables\이재명 리트윗 목록.csv" dbms=csv replace;guessingrows=32767;run;

proc sql;create table &lib..D008 as select a.No label="리트윗수", a.Id, a.Time, b.followers, b.BC, b.FO, b.UF from &lib..D006 as a left join &lib..D004 as b on a.id=b.id; quit;run;
  proc sql;create table &lib..D009 as select *, (select SUM(b.followers) from &lib..D008 as b where b.no <= a.no and no^=1)/1000 as F_acc label="팔로워수(누적, 천)", case when BC=1 then Id end as BC_id, case when FO=1 then Id end as FO_id, case when UF=1 then id end as UF_id from &lib..D008 as a order by a.no; quit;run;
  proc sql;create table &lib..D009 as select *, case when UF=1 then F_acc end as UF_acc from &lib..D009;quit;run;


proc sql;create table &lib..D010 as select a.No label="리트윗수", a.Id, a.Time, b.followers, b.BC, b.FO, b.UF from &lib..D007 as a left join &lib..D005 as b on a.id=b.id; quit;run;
  proc sql;create table &lib..D011 as select *, (select SUM(b.followers) from &lib..D010 as b where b.no <= a.no and no^=1)/1000 as F_acc label="팔로워수(누적, 천)", case when BC=1 then Id end as BC_id, case when FO=1 then Id end as FO_id, case when UF=1 then id end as UF_id from &lib..D010 as a order by a.no; quit;run;
  proc sql;create table &lib..D011 as select *, case when UF=1 then F_acc end as UF_acc from &lib..D011;quit;run;
