%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";

proc sql;
create table &lib..var001 as
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
select *, v14/v10 as v21, v8/v10 as v12, v9/v11 as v13 from
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
, sum(case when CITM_CD='410' or CITM_CD='420' or CITM_CD='430' or CITM_CD='440' or CITM_CD='450' or CITM_CD='460' or CITM_CD='470' or CITM_CD='480' then ANEXP_BDG_CAMT else 0 end) as v8
, sum(case when CITM_CD='410' or CITM_CD='420' or CITM_CD='430' or CITM_CD='440' or CITM_CD='450' or CITM_CD='460' or CITM_CD='470' or CITM_CD='480' then EP_AMT else 0 end) as v9
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
select a.*, b.w10, b.w11, b.w14, (a.v10-b.w10)/a.v10 as v15, (a.v11-b.w11)/a.v11 as v16, a.v10-b.w10 as v17, a.v11-b.w11 as v18, b.w14/b.w10 as v19, a.v14-b.w14 as v20, case
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
