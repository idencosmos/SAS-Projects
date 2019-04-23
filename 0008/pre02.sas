%let dir=D:\OneDrive\Github\SAS-Projects\0008\sas7bdat\;
%let lib=A0008;
%let String01=ESJRV1000133420181212043443CMJUY;/*apiKey*/

libname &lib "&dir";

/*
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
*/

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
  , var15/100 as var15 label="득표율"
  , case when var4=test2 and _TEMA001=test3 and test4=var7 then 1 else 0 end as var100 label="재선"
  , test1 label="전 광역자치단체장 정당"
  from
  (
    select a.*, b.var3 as test1, b.var4 as test2, b._TEMA001 as test3, b.var7 as test4
    from &lib..table005 as a left join
    (
      select var1+1 as test1, *
      from &lib..table005
    )
    as b
    on a.var1=b.test1
    and a.var2=b.var2
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
  , var37/100 as var37 label="득표율(자치)"
  , case when var26=test1 and test3=var28 and var29=test4 then 1 else 0 end as var101 label="재선(자치)"
  , test2 label="전 기초자치단체장 정당"
  from
  (
    select a.*, b.var26 as test1, b.var25 as test2, b.var28 as test3, b.var29 as test4
    from &lib..table006 as a left join
    (
      select var1+1 as test1, *
      from &lib..table006
    )
    as b
    on a.var1=b.test1
    and a.var2=b.var2
    and a.var24=b.var24
  )
  where var1=5 or var1=6;
quit;
run;

data accnut_year;
  length com1 $100 com2 $100 com3 $100 com4 $100;
  input accnut_year year com1$ com2$ com3$ com4$;
  cards;
  2010 2010 한나라당 한나라당 한나라당 한나라당
  2011 2010 한나라당 한나라당 . .
  2012 2010 한나라당 한나라당 . .
  2013 2010 한나라당 한나라당 . .
  2014 2014 새누리당 새누리당 한나라당 한나라당
  2015 2014 새누리당 새누리당 . .
  2016 2014 새누리당 새정치민주연합 . .
  2017 2014 새정치민주연합 새정치민주연합 . .
  ;
run;

proc sql;
  create table &lib..var006 as
  select a.accnut_year, a.com1, a.com2, a.com3, a.com4, b.*
  , case when b.var25=a.com1 then 1 else 0 end as comp1 label="여당정당일치여부"
  , case when b.var25=a.com2 then 1 else 0 end as comp2 label="다수당정당일치여부"
  , case when a.accnut_year^=2010 and a.accnut_year^=2014 then (case when b.var25=a.com1 then 1 else 0 end) else (case when b.var25=a.com1 and b.test2=a.com3 then 1 when b.var25^=a.com1 and b.test2^=a.com3 then 0 else 0.5 end) end as comp3 label="여당정당일치여부(0.5)"
  , case when a.accnut_year^=2010 and a.accnut_year^=2014 then (case when b.var25=a.com2 then 1 else 0 end) else (case when b.var25=a.com2 and b.test2=a.com4 then 1 when b.var25^=a.com2 and b.test2^=a.com4 then 0 else 0.5 end) end as comp4 label="다수당정당일치여부(0.5)"
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
    , a.test1
    , b.test2
    from &lib..var_up as a right join &lib..var_down as b
    on a.var1=b.var1
    and a.var2=b.var2
  ) as b
  on a.year=b.year
  ;
quit;
run;
