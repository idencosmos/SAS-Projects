%let dir=D:\OneDrive\Github\SAS-Projects\0009\sas7bdat\;
%let lib=A0009;

libname &lib "&dir";

proc sql;
create table &lib..var031 as
select coalesce(a.FSCL_YY, b.FSCL_YY) as FSCL_YY
, coalesce(a.OFFC_NM, b.OFFC_NM) as OFFC_NM
, coalesce(a.FSCL_NM, b.FSCL_NM) as FSCL_NM
, coalesce(a.ACCT_NM, b.ACCT_NM) as ACCT_NM
, coalesce(a.FLD_NM, b.FLD_NM) as FLD_NM
, coalesce(a.SECT_NM, b.SECT_NM) as SECT_NM
, coalesce(a.PGM_NM, b.PGM_NM) as PGM_NM
, coalesce(a.ACTV_NM, b.ACTV_NM) as ACTV_NM
, a.Y_YY_DFN_KCUR_AMT as m1
, a.Y_YY_MEDI_KCUR_AMT as m2
, a.Y_YY_DFN_MEDI_KCUR_AMT as m3
, b.Y_YY_MEDI_KCUR_AMT as m4
, b.Y_YY_DFN_MEDI_KCUR_AMT as m5
from
&lib..var001 as a
left join
&lib..var003 as b on a.FSCL_YY=b.FSCL_YY
and a.OFFC_NM=b.OFFC_NM
and a.FSCL_NM=b.FSCL_NM
and a.ACCT_NM=b.ACCT_NM
and a.FLD_NM=b.FLD_NM
and a.SECT_NM=b.SECT_NM
and a.PGM_NM=b.PGM_NM
and a.ACTV_NM=b.ACTV_NM;
quit;
run;

proc sql;
create table &lib..var123 as
select coalesce(a.FSCL_YY, b.FSCL_YY) as FSCL_YY
, a.OFFC_CD
, coalesce(a.OFFC_NM, b.OFFC_NM) as OFFC_NM
, a.FSCL_CD
, coalesce(a.FSCL_NM, b.FSCL_NM) as FSCL_NM
, a.ACCT_CD
, coalesce(a.ACCT_NM, b.ACCT_NM) as ACCT_NM
, a.FLD_CD
, coalesce(a.FLD_NM, b.FLD_NM) as FLD_NM
, a.SECT_CD
, coalesce(a.SECT_NM, b.SECT_NM) as SECT_NM
, a.PGM_CD
, coalesce(a.PGM_NM, b.PGM_NM) as PGM_NM
, a.ACTV_CD
, coalesce(a.ACTV_NM, b.ACTV_NM) as ACTV_NM
, a.ANEXP_BDGAMT_F
, a.ANEXP_BDGAMT_M
, a.ANEXP_BDG_CAMT
, a.AVDV_IAMT
, a.AVDV_MAMT
, a.BDTR_IAMT
, a.BDTR_MAMT
, a.DUSEAMT
, a.EP_AMT
, a.EP_NAMT
, a.FNT_IAMT
, a.FNT_MAMT
, a.NEXT_YY_BFWAMT
, a.OVR_EP_AMT
, a.PREY_BFWAMT
, a.RSVF_EP_DCS_IAMT
, a.RSVF_EP_DCS_MAMT
, a.c01
, a.c02
, a.c03
, a.c04
, a.c05
, a.c06
, a.c07
, a.c11
, a.c12
, a.c13
, a.c14
, a.c15
, a.c16
, a.c17
, a.c21
, a.c22
, a.c23
, a.c24
, a.c25
, a.c26
, a.c27
, a.c31
, a.c32
, a.c33
, a.c34
, a.c35
, a.c36
, a.c37
, a.cr01
, a.cr02
, a.cr03
, a.cr04
, a.cr05
, a.cr06
, a.cr07
, a.cr11
, a.cr12
, a.cr13
, a.cr14
, a.cr15
, a.cr16
, a.cr17
, a.cr21
, a.cr22
, a.cr23
, a.cr24
, a.cr25
, a.cr26
, a.cr27
, a.cr31
, a.cr32
, a.cr33
, a.cr34
, a.cr35
, a.cr36
, a.cr37
, a.fscl
, b.m1
, b.m2
, b.m3
, b.m4
, b.m5
from
&lib..var031 as b
left join
&lib..var002 as a on a.FSCL_YY=b.FSCL_YY
and a.OFFC_NM=b.OFFC_NM
and a.FSCL_NM=b.FSCL_NM
and a.ACCT_NM=b.ACCT_NM
and a.FLD_NM=b.FLD_NM
and a.SECT_NM=b.SECT_NM
and a.PGM_NM=b.PGM_NM
and a.ACTV_NM=b.ACTV_NM;
quit;
run;
