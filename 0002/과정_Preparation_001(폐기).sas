%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";

proc sql;
create table J002 as
select *, v1/v3 as v4, v1/w3 as w4, v2/v3 as v5, v2/w3 as w5 from
(
select distinct FSCL_YY
, OFFC_CD
, OFFC_NM
, FSCL_CD
, FSCL_NM
, FLD_CD
, FLD_NM
, SECT_CD
, SECT_NM
, PGM_CD
, PGM_NM
, ACTV_CD
, ACTV_NM
, SUM(case when EXE_M=10 or EXE_M=11 or EXE_M=12 then EP_AMT else 0 end)/3 as v1
, SUM(case when EXE_M=1 or EXE_M=2 or EXE_M=3 then EP_AMT else 0 end)/3 as v2
, AVG(EP_AMT) as v3
, SUM(EP_AMT) as w3
from &lib..longdata_001
group by FSCL_YY
, OFFC_CD
, OFFC_NM
, FSCL_CD
, FSCL_NM
, FLD_CD
, FLD_NM
, SECT_CD
, SECT_NM
, PGM_CD
, PGM_NM
, ACTV_CD
, ACTV_NM
)
;
quit;
run;

proc sql;
  create table med_001 as
  select *
  , median(v1) as m1
  , median(v2) as m2
  from J002
  group by FSCL_YY;
quit;
run;

proc sql;
  create table med_002 as
  select *
  , median(v1) as q11
  from med_001
  where v1>m1
  group by FSCL_YY;
quit;
run;

proc sql;
  create table med_003 as
  select *
  , median(v1) as q13
  from med_001
  where v1<m1
  group by FSCL_YY;
quit;
run;

proc sql;
  create table med_004 as
  select *
  , median(v2) as q21
  from med_001
  where v2>m2
  group by FSCL_YY;
quit;
run;

proc sql;
  create table med_005 as
  select *
  , median(v2) as q23
  from med_001
  where v2<m2
  group by FSCL_YY;
quit;
run;

data med_total;
  merge med_001-med_005 J002;
  by FSCL_YY
  OFFC_CD
  OFFC_NM
  FSCL_CD
  FSCL_NM
  FLD_CD
  FLD_NM
  SECT_CD
  SECT_NM
  PGM_CD
  PGM_NM
  ACTV_CD
  ACTV_NM;
run;

proc sql;
  create table &lib..var001 as
  select *
  , case when m1^=. and v1>m1 then 1 else 0 end as x10
  , case when q11^=. and v1>q11 then 1 else 0 end as x11
  , case when q13^=. and v1<q13 then 1 else 0 end as x12
  , case when m2^=. and v2>m2 then 1 else 0 end as x13
  , case when q21^=. and v2>q21 then 1 else 0 end as x14
  , case when q23^=. and v2<q23 then 1 else 0 end as x15
  from med_total
  where FSCL_YY<2018;
quit;
run;

proc sql;
create table &lib..var002 as
select *, v6/Y_YY_DFN_MEDI_KCUR_AMT as v7 from
(
select distinct FSCL_YY
, OFFC_NM
, FSCL_NM
, FLD_NM
, SECT_NM
, PGM_NM
, ACTV_NM
, Y_YY_DFN_MEDI_KCUR_AMT
, Y_YY_DFN_MEDI_KCUR_AMT-Y_YY_MEDI_KCUR_AMT as v6
from &lib..Longdata_002
)
;
quit;
run;

proc sql;
create table &lib..var003 as
select *, v14/v10 as v21, v80/v10 as v100, v90/v11 as v110, v81/v10 as v101, v91/v11 as v111, v82/v10 as v102, v92/v11 as v112, v83/v10 as v103, v93/v11 as v113, v84/v10 as v104, v94/v11 as v114, v85/v10 as v105, v95/v11 as v115, v86/v10 as v106, v96/v11 as v116, v70/v10 as v120, v71/v10 as v121, v72/v10 as v122, v73/v10 as v123, v74/v10 as v124, v75/v10 as v125, v76/v10 as v126, v70/v14 as v130, v71/v14 as v131, v72/v14 as v132, v73/v14 as v133, v74/v14 as v134, v75/v14 as v135, v76/v14 as v136 from
(
select distinct FSCL_YY
, OFFC_CD
, OFFC_NM
, FSCL_CD
, FSCL_NM
, FLD_CD
, FLD_NM
, SECT_CD
, SECT_NM
, PGM_CD
, PGM_NM
, ACTV_CD
, ACTV_NM
, sum(DUSEAMT) as v14
, sum(case when CITM_CD='110' then DUSEAMT else 0 end) as v70
, sum(case when CITM_CD='110' then ANEXP_BDG_CAMT else 0 end) as v80
, sum(case when CITM_CD='110' then EP_AMT else 0 end) as v90
, sum(case when CITM_CD='210' or CITM_CD='220' or CITM_CD='230' or CITM_CD='240' or CITM_CD='250' or CITM_CD='260' then DUSEAMT else 0 end) as v71
, sum(case when CITM_CD='210' or CITM_CD='220' or CITM_CD='230' or CITM_CD='240' or CITM_CD='250' or CITM_CD='260' then ANEXP_BDG_CAMT else 0 end) as v81
, sum(case when CITM_CD='210' or CITM_CD='220' or CITM_CD='230' or CITM_CD='240' or CITM_CD='250' or CITM_CD='260' then EP_AMT else 0 end) as v91
, sum(case when CITM_CD='310' or CITM_CD='320' or CITM_CD='330' or CITM_CD='340' or CITM_CD='350' or CITM_CD='360' then DUSEAMT else 0 end) as v72
, sum(case when CITM_CD='310' or CITM_CD='320' or CITM_CD='330' or CITM_CD='340' or CITM_CD='350' or CITM_CD='360' then ANEXP_BDG_CAMT else 0 end) as v82
, sum(case when CITM_CD='310' or CITM_CD='320' or CITM_CD='330' or CITM_CD='340' or CITM_CD='350' or CITM_CD='360' then EP_AMT else 0 end) as v92
, sum(case when CITM_CD='410' or CITM_CD='420' or CITM_CD='430' or CITM_CD='440' or CITM_CD='450' or CITM_CD='460' or CITM_CD='470' or CITM_CD='480' then DUSEAMT else 0 end) as v73
, sum(case when CITM_CD='410' or CITM_CD='420' or CITM_CD='430' or CITM_CD='440' or CITM_CD='450' or CITM_CD='460' or CITM_CD='470' or CITM_CD='480' then ANEXP_BDG_CAMT else 0 end) as v83
, sum(case when CITM_CD='410' or CITM_CD='420' or CITM_CD='430' or CITM_CD='440' or CITM_CD='450' or CITM_CD='460' or CITM_CD='470' or CITM_CD='480' then EP_AMT else 0 end) as v93
, sum(case when CITM_CD='510' then DUSEAMT else 0 end) as v74
, sum(case when CITM_CD='510' then ANEXP_BDG_CAMT else 0 end) as v84
, sum(case when CITM_CD='510' then EP_AMT else 0 end) as v94
, sum(case when CITM_CD='610' then DUSEAMT else 0 end) as v75
, sum(case when CITM_CD='610' then ANEXP_BDG_CAMT else 0 end) as v85
, sum(case when CITM_CD='610' then EP_AMT else 0 end) as v95
, sum(case when CITM_CD='710' then DUSEAMT else 0 end) as v76
, sum(case when CITM_CD='710' then ANEXP_BDG_CAMT else 0 end) as v86
, sum(case when CITM_CD='710' then EP_AMT else 0 end) as v96
, sum(ANEXP_BDG_CAMT) as v10
, sum(EP_AMT) as v11
from &lib..longdata_004
group by FSCL_YY
, OFFC_CD
, OFFC_NM
, FSCL_CD
, FSCL_NM
, FLD_CD
, FLD_NM
, SECT_CD
, SECT_NM
, PGM_CD
, PGM_NM
, ACTV_CD
, ACTV_NM
)
;
quit;
run;

proc sql;
create table &lib..var004 as
select a.*, b.w10, b.w11, b.w14, (a.v10-b.w10)/b.w10 as v15, (a.v11-b.w11)/a.v11 as v16, a.v10-b.w10 as v17, a.v11-b.w11 as v18, b.w14/b.w10 as v19, a.v14-b.w14 as v20, case
when input(a.FSCL_CD, best32.)>200 and input(a.FSCL_CD, best32.)<400 then '특별회계'
when input(a.FSCL_CD, best32.)>500 then '기금'
when input(a.FSCL_CD, best32.)=110 then '일반회계'
else '기타' end as v22 from
(
select distinct FSCL_YY
, OFFC_CD
, OFFC_NM
, FSCL_CD
, FSCL_NM
, FLD_CD
, FLD_NM
, SECT_CD
, SECT_NM
, PGM_CD
, PGM_NM
, ACTV_CD
, ACTV_NM
, sum(DUSEAMT) as v14
, sum(ANEXP_BDG_CAMT) as v10
, sum(EP_AMT) as v11
from &lib..longdata_004
group by FSCL_YY
, OFFC_CD
, OFFC_NM
, FSCL_CD
, FSCL_NM
, FLD_CD
, FLD_NM
, SECT_CD
, SECT_NM
, PGM_CD
, PGM_NM
, ACTV_CD
, ACTV_NM
) as a
left join
(
select distinct FSCL_YY+1 as FSCL_YY
, OFFC_CD
, OFFC_NM
, FSCL_CD
, FSCL_NM
, FLD_CD
, FLD_NM
, SECT_CD
, SECT_NM
, PGM_CD
, PGM_NM
, ACTV_CD
, ACTV_NM
, sum(DUSEAMT) as w14
, sum(ANEXP_BDG_CAMT) as w10
, sum(EP_AMT) as w11
from &lib..longdata_004
group by FSCL_YY
, OFFC_CD
, OFFC_NM
, FSCL_CD
, FSCL_NM
, FLD_CD
, FLD_NM
, SECT_CD
, SECT_NM
, PGM_CD
, PGM_NM
, ACTV_CD
, ACTV_NM
) as b
on a.FSCL_YY=b.FSCL_YY
and a.OFFC_CD=b.OFFC_CD
and a.OFFC_NM=b.OFFC_NM
and a.FSCL_CD=b.FSCL_CD
and a.FSCL_NM=b.FSCL_NM
and a.FLD_CD=b.FLD_CD
and a.FLD_NM=b.FLD_NM
and a.SECT_CD=b.SECT_CD
and a.SECT_NM=b.SECT_NM
and a.PGM_CD=b.PGM_CD
and a.PGM_NM=b.PGM_NM
and a.ACTV_CD=b.ACTV_CD
and a.ACTV_NM=b.ACTV_NM;
quit;
run;

proc sql;
create table &lib..var005 as
select a.*, b.v23, a.v10/b.v23 as v24 from
(
select distinct FSCL_YY
, OFFC_CD
, OFFC_NM
, FSCL_CD
, FSCL_NM
, FLD_CD
, FLD_NM
, SECT_CD
, SECT_NM
, PGM_CD
, PGM_NM
, ACTV_CD
, ACTV_NM
, SUM(ANEXP_BDG_CAMT) as v10
from &lib..longdata_004
group by FSCL_YY
, OFFC_CD
, OFFC_NM
, FSCL_CD
, FSCL_NM
, FLD_CD
, FLD_NM
, SECT_CD
, SECT_NM
, PGM_CD
, PGM_NM
, ACTV_CD
, ACTV_NM
) as a
left join
(
select distinct FSCL_YY
, OFFC_CD
, OFFC_NM
, SUM(ANEXP_BDG_CAMT) as v23
from &lib..longdata_004
group by FSCL_YY
, OFFC_CD
, OFFC_NM
) as b
on a.FSCL_YY=b.FSCL_YY
and a.OFFC_CD=b.OFFC_CD
and a.OFFC_NM=b.OFFC_NM
;
quit;
run;

proc sql;
create table J001 as
select coalesce(a.FSCL_YY, b.FSCL_YY) as FSCL_YY
, coalesce(a.OFFC_CD, b.OFFC_CD) as OFFC_CD
, coalesce(a.OFFC_NM, b.OFFC_NM) as OFFC_NM
, coalesce(a.FSCL_CD, b.FSCL_CD) as FSCL_CD
, coalesce(a.FSCL_NM, b.FSCL_NM) as FSCL_NM
, coalesce(a.FLD_CD, b.FLD_CD) as FLD_CD
, coalesce(a.FLD_NM, b.FLD_NM) as FLD_NM
, coalesce(a.SECT_CD, b.SECT_CD) as SECT_CD
, coalesce(a.SECT_NM, b.SECT_NM) as SECT_NM
, coalesce(a.PGM_CD, b.PGM_CD) as PGM_CD
, coalesce(a.PGM_NM, b.PGM_NM) as PGM_NM
, coalesce(a.ACTV_CD, b.ACTV_CD) as ACTV_CD
, coalesce(a.ACTV_NM, b.ACTV_NM) as ACTV_NM
, a.v80
, a.v90
, a.v81
, a.v91
, a.v82
, a.v92
, a.v83
, a.v93
, a.v84
, a.v94
, a.v85
, a.v95
, a.v86
, a.v96
, a.v10
, a.v11
, a.v100
, a.v110
, a.v101
, a.v111
, a.v102
, a.v112
, a.v103
, a.v113
, a.v104
, a.v114
, a.v105
, a.v115
, a.v106
, a.v116
, a.v14
, a.v21
, a.v70
, a.v71
, a.v72
, a.v73
, a.v74
, a.v75
, a.v76
, a.v120
, a.v121
, a.v122
, a.v123
, a.v124
, a.v125
, a.v126
, a.v130
, a.v131
, a.v132
, a.v133
, a.v134
, a.v135
, a.v136
, b.w10
, b.w11
, b.w14
, b.v15
, b.v16
, b.v17
, b.v18
, b.v19
, b.v20
, b.v22
from
&lib..var003 as a
full join
&lib..var004 as b on a.FSCL_YY=b.FSCL_YY
and a.OFFC_CD=b.OFFC_CD
and a.OFFC_NM=b.OFFC_NM
and a.FSCL_CD=b.FSCL_CD
and a.FSCL_NM=b.FSCL_NM
and a.FLD_CD=b.FLD_CD
and a.FLD_NM=b.FLD_NM
and a.SECT_CD=b.SECT_CD
and a.SECT_NM=b.SECT_NM
and a.PGM_CD=b.PGM_CD
and a.PGM_NM=b.PGM_NM
and a.ACTV_CD=b.ACTV_CD
and a.ACTV_NM=b.ACTV_NM;
quit;
run;

proc sql;
create table &lib..Var345 as
select coalesce(a.FSCL_YY, b.FSCL_YY) as FSCL_YY
, coalesce(a.OFFC_CD, b.OFFC_CD) as OFFC_CD
, coalesce(a.OFFC_NM, b.OFFC_NM) as OFFC_NM
, coalesce(a.FSCL_CD, b.FSCL_CD) as FSCL_CD
, coalesce(a.FSCL_NM, b.FSCL_NM) as FSCL_NM
, coalesce(a.FLD_CD, b.FLD_CD) as FLD_CD
, coalesce(a.FLD_NM, b.FLD_NM) as FLD_NM
, coalesce(a.SECT_CD, b.SECT_CD) as SECT_CD
, coalesce(a.SECT_NM, b.SECT_NM) as SECT_NM
, coalesce(a.PGM_CD, b.PGM_CD) as PGM_CD
, coalesce(a.PGM_NM, b.PGM_NM) as PGM_NM
, coalesce(a.ACTV_CD, b.ACTV_CD) as ACTV_CD
, coalesce(a.ACTV_NM, b.ACTV_NM) as ACTV_NM
, a.v80
, a.v90
, a.v81
, a.v91
, a.v82
, a.v92
, a.v83
, a.v93
, a.v84
, a.v94
, a.v85
, a.v95
, a.v86
, a.v96
, a.v10
, a.v11
, a.v100
, a.v110
, a.v101
, a.v111
, a.v102
, a.v112
, a.v103
, a.v113
, a.v104
, a.v114
, a.v105
, a.v115
, a.v106
, a.v116
, a.v14
, a.v21
, a.w10
, a.w11
, a.w14
, a.v15
, a.v16
, a.v17
, a.v18
, a.v19
, a.v20
, a.v22
, a.v70
, a.v71
, a.v72
, a.v73
, a.v74
, a.v75
, a.v76
, a.v120
, a.v121
, a.v122
, a.v123
, a.v124
, a.v125
, a.v126
, a.v130
, a.v131
, a.v132
, a.v133
, a.v134
, a.v135
, a.v136
, b.v23
, b.v24
from
J001 as a
full join
&lib..var005 as b on a.FSCL_YY=b.FSCL_YY
and a.OFFC_CD=b.OFFC_CD
and a.OFFC_NM=b.OFFC_NM
and a.FSCL_CD=b.FSCL_CD
and a.FSCL_NM=b.FSCL_NM
and a.FLD_CD=b.FLD_CD
and a.FLD_NM=b.FLD_NM
and a.SECT_CD=b.SECT_CD
and a.SECT_NM=b.SECT_NM
and a.PGM_CD=b.PGM_CD
and a.PGM_NM=b.PGM_NM
and a.ACTV_CD=b.ACTV_CD
and a.ACTV_NM=b.ACTV_NM;
quit;
run;

proc sql;
create table &lib..var007 as
select *, DUSEAMT/ANEXP_BDG_CAMT as DUSEAMT_Per, case
when CITM_CD='110' then '인건비'
when CITM_CD='210' or CITM_CD='220' or CITM_CD='230' or CITM_CD='240' or CITM_CD='250' or CITM_CD='260' then '물건비'
when CITM_CD='310' or CITM_CD='320' or CITM_CD='330' or CITM_CD='340' or CITM_CD='350' or CITM_CD='360' then '이전지출'
when CITM_CD='410' or CITM_CD='420' or CITM_CD='430' or CITM_CD='440' or CITM_CD='450' or CITM_CD='460' or CITM_CD='470' or CITM_CD='480' then '자산취득'
when CITM_CD='510' then '상환지출'
when CITM_CD='610' then '전출금등'
when CITM_CD='710' then '예비비및기타'
end as CITM_CD_Cate
from &lib..longdata_004;
quit;
run;


/*변수 테스트*/

proc sql;
create table test as select FSCL_YY
, OFFC_CD
, OFFC_NM
, FSCL_CD
, FSCL_NM
, ACCT_CD
, ACCT_NM
, FLD_CD
, FLD_NM
, SECT_CD
, SECT_NM
, PGM_CD
, PGM_NM
, ACTV_CD
, ACTV_NM
, sum(ANEXP_BDGAMT_F) as ANEXP_BDGAMT_F
, sum(ANEXP_BDGAMT_M) as ANEXP_BDGAMT_M
, sum(PREY_BFWAMT) as PREY_BFWAMT
, sum(OVR_EP_AMT) as OVR_EP_AMT
, sum(RSVF_EP_DCS_IAMT) as RSVF_EP_DCS_IAMT
, sum(RSVF_EP_DCS_MAMT) as RSVF_EP_DCS_MAMT
, sum(BDTR_IAMT) as BDTR_IAMT
, sum(BDTR_MAMT) as BDTR_MAMT
, sum(AVDV_IAMT) as AVDV_IAMT
, sum(AVDV_MAMT) as AVDV_MAMT
, sum(FNT_IAMT) as FNT_IAMT
, sum(FNT_MAMT) as FNT_MAMT
, sum(ANEXP_BDG_CAMT) as ANEXP_BDG_CAMT
, sum(EP_AMT) as EP_AMT
, sum(EP_NAMT) as EP_NAMT
, sum(NEXT_YY_BFWAMT) as NEXT_YY_BFWAMT
, sum(DUSEAMT) as DUSEAMT
from &lib..longdata_004
group by FSCL_YY
, OFFC_CD
, OFFC_NM
, FSCL_CD
, FSCL_NM
, ACCT_CD
, ACCT_NM
, FLD_CD
, FLD_NM
, SECT_CD
, SECT_NM
, PGM_CD
, PGM_NM
, ACTV_CD
, ACTV_NM;
quit;
run;

proc sql;
create table test02 as select distinct FSCL_YY
, OFFC_CD
, OFFC_NM
, FSCL_CD
, FSCL_NM
, FLD_CD
, FLD_NM
, SECT_CD
, SECT_NM
, PGM_CD
, PGM_NM
, ACTV_CD
, ACTV_NM
, ANEXP_BDGAMT_F
, ANEXP_BDGAMT_M
, PREY_BFWAMT
, OVR_EP_AMT
, RSVF_EP_DCS_IAMT
, RSVF_EP_DCS_MAMT
, BDTR_IAMT
, BDTR_MAMT
, AVDV_IAMT
, AVDV_MAMT
, FNT_IAMT
, FNT_MAMT
, ANEXP_BDG_CAMT
, EP_AMT
, EP_NAMT
, NEXT_YY_BFWAMT
, DUSEAMT
from test;
quit;
run;
