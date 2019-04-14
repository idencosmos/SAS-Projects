%let dir=D:\OneDrive\Github\SAS-Projects\0009\sas7bdat\;
%let lib=A0009;

libname &lib "&dir";

proc sql;
  create table &lib..var001 as select distinct FSCL_YY
  , OFFC_NM
  , FSCL_NM
  , ACCT_NM
  , FLD_NM
  , SECT_NM
  , PGM_NM
  , ACTV_NM
  , sum(Y_YY_DFN_KCUR_AMT)*1000 as Y_YY_DFN_KCUR_AMT label="금년도예산"
  , sum(Y_YY_MEDI_KCUR_AMT)*1000 as Y_YY_MEDI_KCUR_AMT label="추경정부안"
  , sum(Y_YY_DFN_MEDI_KCUR_AMT)*1000 as Y_YY_DFN_MEDI_KCUR_AMT label="추경국회확정"
  from &lib..longdata_001
  group by FSCL_YY
  , OFFC_NM
  , FSCL_NM
  , ACCT_NM
  , FLD_NM
  , SECT_NM
  , PGM_NM
  , ACTV_NM;
quit;
run;

proc sql;
  create table &lib..var002 as select distinct FSCL_YY
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
  , sum(ANEXP_BDGAMT_F) as ANEXP_BDGAMT_F label="세출예산액/당초지출계획액(원)"
  , sum(ANEXP_BDGAMT_M) as ANEXP_BDGAMT_M label="세출예산액/수정지출계획액(원)"
  , sum(PREY_BFWAMT) as PREY_BFWAMT label="전년도이월액(원)"
  , sum(OVR_EP_AMT) as OVR_EP_AMT label="초과지출승인액(원)"
  , sum(RSVF_EP_DCS_IAMT) as RSVF_EP_DCS_IAMT label="예비비지출결정증액(원)"
  , sum(RSVF_EP_DCS_MAMT) as RSVF_EP_DCS_MAMT label="예비비지출결정감액(원)"
  , sum(BDTR_IAMT) as BDTR_IAMT label="전용증액(원)"
  , sum(BDTR_MAMT) as BDTR_MAMT label="전용감액(원)"
  , sum(AVDV_IAMT) as AVDV_IAMT label="이용증액(원)"
  , sum(AVDV_MAMT) as AVDV_MAMT label="이용감액(원)"
  , sum(FNT_IAMT) as FNT_IAMT label="이체증액(원)"
  , sum(FNT_MAMT) as FNT_MAMT label="이체감액(원)"
  , sum(ANEXP_BDG_CAMT) as ANEXP_BDG_CAMT label="세출예산현액/지출계획현액(원)"
  , sum(EP_AMT) as EP_AMT label="지출액(원)"
  , sum(EP_NAMT) as EP_NAMT label="지출순액(원)"
  , sum(NEXT_YY_BFWAMT) as NEXT_YY_BFWAMT label="다음년도이월액(원)"
  , sum(DUSEAMT) as DUSEAMT label="불용액(원)"
  from &lib..longdata_002
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
  create table &lib..var003 as select distinct FSCL_YY
  , OFFC_NM
  , FSCL_NM
  , ACCT_NM
  , FLD_NM
  , SECT_NM
  , PGM_NM
  , ACTV_NM
  , sum(Y_YY_MEDI_KCUR_AMT) as Y_YY_MEDI_KCUR_AMT label="금년도조정원화금액"
  , sum(Y_YY_DFN_MEDI_KCUR_AMT) as Y_YY_DFN_MEDI_KCUR_AMT label="금년도확정조정원화금액"
  from &lib..longdata_003
  group by FSCL_YY
  , OFFC_NM
  , FSCL_NM
  , ACCT_NM
  , FLD_NM
  , SECT_NM
  , PGM_NM
  , ACTV_NM;
quit;
run;
