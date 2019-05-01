%let dir=D:\OneDrive\Github\SAS-Projects\0009\sas7bdat\;
%let lib=A0009;

libname &lib "&dir";

proc sql;
  create table &lib..var004 as
  select *
  , DUSEAMT/ANEXP_BDG_CAMT as v1
  , m5-m4 as v2
  , (m5-m4)/m4 as v3
  , case when m5-m4>0 then 1 else 0 end as v4
  , case when m5-m4<0 then 1 else 0 end as v5
  , case when m3-m1>0 then m3-m1 else 0 end as v6
  , case when m3-m1>0 then (m3-m1)/m1 else 0 end as v7
  , case when m3-m1>0 then 1 else 0 end as v8
  , case when FSCL_YY>2007 and FSCL_YY<2013 then 1 else 0 end as x1
  , case when FSCL_YY>2012 and FSCL_YY<2017 then 1 else 0 end as x2
  , case when FSCL_YY>2016 then 1 else 0 end as x3
  , case when FSCL_YY=2008 or FSCL_YY=2013 or FSCL_YY=2017 then 1 else 0 end as x4
  , case when FSCL_YY=2009 or FSCL_YY=2014 then 1 else 0 end as x5
  , case when FSCL_YY=2008 or FSCL_YY=2009 or FSCL_YY=2013 or FSCL_YY=2014 then 1 else 0 end as x6
  , case when FSCL_YY=2008 or FSCL_YY=2013 or FSCL_YY=2017 then 1
  when FSCL_YY=2009 or FSCL_YY=2014 or FSCL_YY=2018 then 2
  when FSCL_YY=2010 or FSCL_YY=2015 then 3
  when FSCL_YY=2011 or FSCL_YY=2016 then 4
  when FSCL_YY=2007 or FSCL_YY=2012 then 5 else . end as x7
  from &lib..var123;
quit;
run;

proc sql;
  create table &lib..var005 as
  select a.*, a.ANEXP_BDG_CAMT/b.ANEXP_BDG_CAMT_OFFC as c4 from &lib..var004 as a
  left join
  (
  select distinct FSCL_YY
  , OFFC_NM
  , SUM(ANEXP_BDG_CAMT) as ANEXP_BDG_CAMT_OFFC
  from &lib..var004
  group by FSCL_YY
  , OFFC_NM
  ) as b
  on a.FSCL_YY=b.FSCL_YY
  and a.OFFC_NM=b.OFFC_NM;
quit;
run;

proc sql;
  create table &lib..var006 as
  select a.*, b.v1 as c5, a.ANEXP_BDG_CAMT-b.ANEXP_BDG_CAMT as c6, (a.ANEXP_BDG_CAMT-b.ANEXP_BDG_CAMT)/b.ANEXP_BDG_CAMT as c7 from &lib..var005 as a
  left join
  (
  select FSCL_YY+1 as FSCL_YY
  , OFFC_NM
  , FSCL_NM
  , ACCT_NM
  , FLD_NM
  , SECT_NM
  , PGM_NM
  , ACTV_NM
  , v1
  , ANEXP_BDG_CAMT
  from &lib..var005
  ) as b
  on a.FSCL_YY=b.FSCL_YY
  and a.OFFC_NM=b.OFFC_NM
  and a.FSCL_NM=b.FSCL_NM
  and a.ACCT_NM=b.ACCT_NM
  and a.FLD_NM=b.FLD_NM
  and a.SECT_NM=b.SECT_NM
  and a.PGM_NM=b.PGM_NM
  and a.ACTV_NM=b.ACTV_NM;
quit;
run;
