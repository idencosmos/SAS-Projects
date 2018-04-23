%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";

proc sql;
create table &lib..pre004 as
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
, sum(input(ANEXP_BDGAMT_F, 32.)) as ANEXP_BDGAMT_F
, sum(input(ANEXP_BDGAMT_M, 32.)) as ANEXP_BDGAMT_M
, sum(input(PREY_BFWAMT, 32.)) as PREY_BFWAMT
, sum(input(OVR_EP_AMT, 32.)) as OVR_EP_AMT
, sum(input(RSVF_EP_DCS_IAMT, 32.)) as RSVF_EP_DCS_IAMT
, sum(input(RSVF_EP_DCS_MAMT, 32.)) as RSVF_EP_DCS_MAMT
, sum(input(BDTR_IAMT, 32.)) as BDTR_IAMT
, sum(input(BDTR_MAMT, 32.)) as BDTR_MAMT
, sum(input(AVDV_IAMT, 32.)) as AVDV_IAMT
, sum(input(AVDV_MAMT, 32.)) as AVDV_MAMT
, sum(input(FNT_IAMT, 32.)) as FNT_IAMT
, sum(input(FNT_MAMT, 32.)) as FNT_MAMT
, sum(input(ANEXP_BDG_CAMT, 32.)) as ANEXP_BDG_CAMT
, sum(input(EP_AMT, 32.)) as EP_AMT
, sum(input(EP_NAMT, 32.)) as EP_NAMT
, sum(input(NEXT_YY_BFWAMT, 32.)) as NEXT_YY_BFWAMT
, sum(input(DUSEAMT, 32.)) as DUSEAMT
from &lib..Longdata_004
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
create table &lib..pre0104 as
select coalesce(a.FSCL_YY, b.FSCL_YY) as FSCL_YY
, input(a.EXE_M, 32.) as EXE_M
, coalesce(a.OFFC_CD, b.OFFC_CD) as OFFC_CD
, coalesce(a.FSCL_CD, b.FSCL_CD) as FSCL_CD
, b.ACCT_CD
, b.ACCT_NM
, coalesce(a.FLD_CD, b.FLD_CD) as FLD_CD
, coalesce(a.SECT_CD, b.SECT_CD) as SECT_CD
, coalesce(a.PGM_CD, b.PGM_CD) as PGM_CD
, coalesce(a.ACTV_CD, b.ACTV_CD) as ACTV_CD
, input(a.ANEXP_BDG_CAMT, 32.) as ANEXP_BDG_CAMT
, input(a.EP_AMT, 32.) as EP_AMT
, input(a.THISM_AGGR_EP_AMT, 32.) as THISM_AGGR_EP_AMT
, b.*
from &lib..longdata_001 as a full join &lib..pre004 as b
on a.FSCL_YY=b.FSCL_YY
and a.OFFC_CD=b.OFFC_CD
and a.FSCL_CD=b.FSCL_CD
and a.FLD_CD=b.FLD_CD
and a.SECT_CD=b.SECT_CD
and a.PGM_CD=b.PGM_CD
and a.ACTV_CD=b.ACTV_CD;
quit;
run;

proc sql;
create table &lib..pre010402 as
select coalesce(a.FSCL_YY, b.FSCL_YY) as FSCL_YY
, coalesce(a.OFFC_NM, b.OFFC_NM) as OFFC_NM
, coalesce(a.FSCL_NM, b.FSCL_NM) as FSCL_NM
, coalesce(a.ACCT_NM, b.ACCT_NM) as ACCT_NM
, coalesce(a.FLD_NM, b.FLD_NM) as FLD_NM
, coalesce(a.SECT_NM, b.SECT_NM) as SECT_NM
, coalesce(a.PGM_NM, b.PGM_NM) as PGM_NM
, coalesce(a.ACTV_NM, b.ACTV_NM) as ACTV_NM
, input(b.Y_YY_MEDI_KCUR_AMT, 32.)*1000 as Y_YY_MEDI_KCUR_AMT
, input(b.Y_YY_DFN_MEDI_KCUR_AMT, 32.)*1000 as Y_YY_DFN_MEDI_KCUR_AMT
, b.*
from &lib..pre0104 as a full join &lib..longdata_002 as b
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
