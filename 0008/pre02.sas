%let dir=D:\OneDrive\Github\SAS-Projects\0008\sas7bdat\;
%let lib=A0008;
%let String01=ESJRV1000133420181212043443CMJUY;/*apiKey*/

libname &lib "&dir";

proc sql;
  create table &lib..var_up as
  select case when var1=5 then 2010 when var1=6 then 2014 when var1=7 then 2018 else 2000 end as accnut_year
  , var1
  , var2
  , var4
  , var3
  , _TEMA001
  , var7
  , var10
  , var14
  , var15
  , case when test1=. then 0 else 1 end as var100 label="재선"
  from
  (
    select a.*, b.test1, b.var2 as test2, b.var4 as test3, b._TEMA001 as test4, b.var7 as test5
    from &lib..table005 as a left join
    (
      select var1-1 as test1, *
      from &lib..table005
    )
    as b
    on a.var1=b.test1
    and a.var2=b.var2
    and a.var4=b.var4
    and a._TEMA001=b._TEMA001
    and a.var7=b.var7
  )
  where var1=5 or var1=6;
quit;
run;

proc sql;
  create table &lib..var_down as
  select case when var1=5 then 2010 when var1=6 then 2014 when var1=7 then 2018 else 2000 end as accnut_year
  , var1
  , var2
  , var24
  , var26
  , var25
  , var28
  , var29
  , var32
  , var36
  , var37
  , case when test1=. then 0 else 1 end as var101 label="재선(자치)"
  from
  (
    select a.*, b.test1, b.var2 as test2, b.var26 as test3, b.var28 as test4, b.var29 as test5
    from &lib..table006 as a left join
    (
      select var1-1 as test1, *
      from &lib..table006
    )
    as b
    on a.var1=b.test1
    and a.var2=b.var2
    and a.var26=b.var26
    and a.var28=b.var28
    and a.var29=b.var29
  )
  where var1=5 or var1=6;
quit;
run;

data accnut_year;
  input accnut_year year;
  cards;
  2010 2010
  2011 2010
  2012 2010
  2013 2010
  2014 2014
  2015 2014
  2016 2014
  2017 2014
  ;
run;

proc sql;
  create table &lib..var006 as
  select a.accnut_year, b.*
  from accnut_year as a right join
  (
    select a.accnut_year as year
    , a.var1 label="회차"
    , a.var2 label="지역명"
    , a.var4 label="성명"
    , a.var3 label="정당"
    , a._TEMA001 as var6 label="성별(남)"
    , a.var7 label="생년"
    , a.var10 label="연령"
    , a.var14 label="득표수"
    , a.var15 label="득표율"
    , a.var100 label="재선"
    , b.var24 label="자치단체명"
    , b.var26 label="성명(자치)"
    , b.var25 label="정당(자치)"
    , b.var28 label="성별(남)(자치)"
    , b.var29 label="생년(자치)"
    , b.var32 label="연령(자치)"
    , b.var36 label="득표수(자치)"
    , b.var37 label="득표율(자치)"
    , b.var101 label="재선(자치)"
    , case when a.var3=b.var25 then 1 else 0 end as var102 label="광역자치정당일치여부"
    from &lib..var_up as a right join &lib..var_down as b
    on a.var1=b.var1
    and a.var2=b.var2
  ) as b
  on a.year=b.year
  ;
quit;
run;
