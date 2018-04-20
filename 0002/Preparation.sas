%let dir=D:\OneDrive\Github\SAS-Projects\0002\;
%let lib=A0002;

libname &lib "&dir";

proc sql;
create table &lib..pre002 as
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
create table &lib..stat001 as
select coalesce(a.FSCL_YY, b.FSCL_YY) as FSCL_YY
, coalesce(a.OFFC_NM, b.OFFC_NM) as OFFC_NM
, coalesce(a.FSCL_NM, b.FSCL_NM) as FSCL_NM
, coalesce(a.ACCT_NM, b.ACCT_NM) as ACCT_NM
, coalesce(a.FLD_NM, b.FLD_NM) as FLD_NM
, coalesce(a.SECT_NM, b.SECT_NM) as SECT_NM
, coalesce(a.PGM_NM, b.PGM_NM) as PGM_NM
, coalesce(a.ACTV_NM, b.ACTV_NM) as ACTV_NM
, input(a.Y_YY_MEDI_KCUR_AMT, 32.)*1000 as Y_YY_MEDI_KCUR_AMT
, input(a.Y_YY_DFN_MEDI_KCUR_AMT, 32.)*1000 as Y_YY_DFN_MEDI_KCUR_AMT
, b.*
from &lib..longdata_002 as a full join &lib..pre004 as b
on a.FSCL_YY=b.FSCL_YY
and a.OFFC_NM=b.OFFC_NM
and a.FSCL_NM=b.FSCL_NM
and a.ACCT_NM=b.ACCT_NM
and a.FLD_NM=b.FLD_NM
and a.SECT_NM=b.SECT_NM
and a.PGM_NM=b.PGM_NM
and a.ACTV_NM=b.ACTV_NM
where input(a.FSCL_YY, 32.)<2017;
quit;
run;

proc sql;
create table &lib..stat001_offc as
select coalesce(a.FSCL_YY, b.FSCL_YY) as FSCL_YY
, coalesce(a.OFFC_NM, b.OFFC_NM) as OFFC_NM
, coalesce(a.FSCL_NM, b.FSCL_NM) as FSCL_NM
, coalesce(a.ACCT_NM, b.ACCT_NM) as ACCT_NM
, coalesce(a.FLD_NM, b.FLD_NM) as FLD_NM
, coalesce(a.SECT_NM, b.SECT_NM) as SECT_NM
, coalesce(a.PGM_NM, b.PGM_NM) as PGM_NM
, coalesce(a.ACTV_NM, b.ACTV_NM) as ACTV_NM
, input(a.Y_YY_MEDI_KCUR_AMT, 32.)*1000 as Y_YY_MEDI_KCUR_AMT
, input(a.Y_YY_DFN_MEDI_KCUR_AMT, 32.)*1000 as Y_YY_DFN_MEDI_KCUR_AMT
, b.*
from &lib..longdata_002 as a full join &lib..pre004 as b
on a.FSCL_YY=b.FSCL_YY

and a.FSCL_NM=b.FSCL_NM
and a.ACCT_NM=b.ACCT_NM
and a.FLD_NM=b.FLD_NM
and a.SECT_NM=b.SECT_NM
and a.PGM_NM=b.PGM_NM
and a.ACTV_NM=b.ACTV_NM
where input(a.FSCL_YY, 32.)<2017;
quit;
run;

data &lib..stat001_test;
set &lib..stat001;
if Y_YY_MEDI_KCUR_AMT=. or DUSEAMT=.;
run;

data &lib..stat001_offc_test;
set &lib..stat001_offc;
if Y_YY_MEDI_KCUR_AMT=. or DUSEAMT=.;
run;

proc sql;
create table test as
select *
from &lib..stat001_test
except
select *
from &lib..stat001_offc_test
quit;
run;

proc sql;
create table test as
select *
from &lib..stat001_test
except
select *
from &lib..stat001_offc_test
quit;
run;

proc compare data=&lib..stat001_test compare=&lib..stat001_offc_test out=test;
var FSCL_NM
 ACCT_NM
 FLD_NM
 SECT_NM
 PGM_NM
 ACTV_NM;
with FSCL_NM
 ACCT_NM
 FLD_NM
 SECT_NM
 PGM_NM
 ACTV_NM;
run;
