%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";

proc sql;
create table &lib..var001 as
select *, v1/v3 as v4, v2/v3 as v5 from
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
select FSCL_YY
, OFFC_NM
, FSCL_NM
, ACCT_NM
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
select *, v8/v10 as v12, v9/v11 as v13 from
(
select distinct FSCL_YY
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
)
;
quit;
run;

proc sql;
create table &lib..var004 as
select a.*, b.w10, b.w11, a.v10/b.w10 as v15, a.v11/b.w11 as v16, a.v10-b.w10 as v17, a.v11-b.w11 as v18 from
(
select distinct FSCL_YY
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
, sum(ANEXP_BDG_CAMT) as v10
, sum(EP_AMT) as v11
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
, ACTV_NM
) as a
left join
(
select distinct FSCL_YY+1 as FSCL_YY
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
, sum(ANEXP_BDG_CAMT) as w10
, sum(EP_AMT) as w11
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
, ACTV_NM
) as b
on a.FSCL_YY=b.FSCL_YY
and a.OFFC_CD=b.OFFC_CD
and a.OFFC_NM=b.OFFC_NM
and a.FSCL_CD=b.FSCL_CD
and a.FSCL_NM=b.FSCL_NM
and a.ACCT_CD=b.ACCT_CD
and a.ACCT_NM=b.ACCT_NM
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
