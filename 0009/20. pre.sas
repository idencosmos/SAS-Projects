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
create table &lib..var002 as
select *
, c01/ANEXP_BDGAMT_F as cr01
, c02/ANEXP_BDGAMT_F as cr02
, c03/ANEXP_BDGAMT_F as cr03
, c04/ANEXP_BDGAMT_F as cr04
, c05/ANEXP_BDGAMT_F as cr05
, c06/ANEXP_BDGAMT_F as cr06
, c07/ANEXP_BDGAMT_F as cr07
, c11/ANEXP_BDG_CAMT as cr11
, c12/ANEXP_BDG_CAMT as cr12
, c13/ANEXP_BDG_CAMT as cr13
, c14/ANEXP_BDG_CAMT as cr14
, c15/ANEXP_BDG_CAMT as cr15
, c16/ANEXP_BDG_CAMT as cr16
, c17/ANEXP_BDG_CAMT as cr17
, c21/EP_AMT as cr21
, c22/EP_AMT as cr22
, c23/EP_AMT as cr23
, c24/EP_AMT as cr24
, c25/EP_AMT as cr25
, c26/EP_AMT as cr26
, c27/EP_AMT as cr27
, c31/DUSEAMT as cr31
, c32/DUSEAMT as cr32
, c33/DUSEAMT as cr33
, c34/DUSEAMT as cr34
, c35/DUSEAMT as cr35
, c36/DUSEAMT as cr36
, c37/DUSEAMT as cr37
, case when input(FSCL_CD, best32.)>200 and input(FSCL_CD, best32.)<500 then '특별회계'
when input(FSCL_CD, best32.)>500 then '기금'
when input(FSCL_CD, best32.)=110 then '일반회계'
else '기타' end as fscl
from
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

, sum(case when CITM_CD='110' then ANEXP_BDGAMT_F else 0 end) as c01
, sum(case when CITM_CD='210' or CITM_CD='220' or CITM_CD='230' or CITM_CD='240' or CITM_CD='250' or CITM_CD='260' then ANEXP_BDGAMT_F else 0 end) as c02
, sum(case when CITM_CD='310' or CITM_CD='320' or CITM_CD='330' or CITM_CD='340' or CITM_CD='350' or CITM_CD='360' then ANEXP_BDGAMT_F else 0 end) as c03
, sum(case when CITM_CD='410' or CITM_CD='420' or CITM_CD='430' or CITM_CD='440' or CITM_CD='450' or CITM_CD='460' or CITM_CD='470' or CITM_CD='480' then ANEXP_BDGAMT_F else 0 end) as c04
, sum(case when CITM_CD='510' then ANEXP_BDGAMT_F else 0 end) as c05
, sum(case when CITM_CD='610' then ANEXP_BDGAMT_F else 0 end) as c06
, sum(case when CITM_CD='710' then ANEXP_BDGAMT_F else 0 end) as c07

, sum(case when CITM_CD='110' then ANEXP_BDG_CAMT else 0 end) as c11
, sum(case when CITM_CD='210' or CITM_CD='220' or CITM_CD='230' or CITM_CD='240' or CITM_CD='250' or CITM_CD='260' then ANEXP_BDG_CAMT else 0 end) as c12
, sum(case when CITM_CD='310' or CITM_CD='320' or CITM_CD='330' or CITM_CD='340' or CITM_CD='350' or CITM_CD='360' then ANEXP_BDG_CAMT else 0 end) as c13
, sum(case when CITM_CD='410' or CITM_CD='420' or CITM_CD='430' or CITM_CD='440' or CITM_CD='450' or CITM_CD='460' or CITM_CD='470' or CITM_CD='480' then ANEXP_BDG_CAMT else 0 end) as c14
, sum(case when CITM_CD='510' then ANEXP_BDG_CAMT else 0 end) as c15
, sum(case when CITM_CD='610' then ANEXP_BDG_CAMT else 0 end) as c16
, sum(case when CITM_CD='710' then ANEXP_BDG_CAMT else 0 end) as c17

, sum(case when CITM_CD='110' then EP_AMT else 0 end) as c21
, sum(case when CITM_CD='210' or CITM_CD='220' or CITM_CD='230' or CITM_CD='240' or CITM_CD='250' or CITM_CD='260' then EP_AMT else 0 end) as c22
, sum(case when CITM_CD='310' or CITM_CD='320' or CITM_CD='330' or CITM_CD='340' or CITM_CD='350' or CITM_CD='360' then EP_AMT else 0 end) as c23
, sum(case when CITM_CD='410' or CITM_CD='420' or CITM_CD='430' or CITM_CD='440' or CITM_CD='450' or CITM_CD='460' or CITM_CD='470' or CITM_CD='480' then EP_AMT else 0 end) as c24
, sum(case when CITM_CD='510' then EP_AMT else 0 end) as c25
, sum(case when CITM_CD='610' then EP_AMT else 0 end) as c26
, sum(case when CITM_CD='710' then EP_AMT else 0 end) as c27

, sum(case when CITM_CD='110' then DUSEAMT else 0 end) as c31
, sum(case when CITM_CD='210' or CITM_CD='220' or CITM_CD='230' or CITM_CD='240' or CITM_CD='250' or CITM_CD='260' then DUSEAMT else 0 end) as c32
, sum(case when CITM_CD='310' or CITM_CD='320' or CITM_CD='330' or CITM_CD='340' or CITM_CD='350' or CITM_CD='360' then DUSEAMT else 0 end) as c33
, sum(case when CITM_CD='410' or CITM_CD='420' or CITM_CD='430' or CITM_CD='440' or CITM_CD='450' or CITM_CD='460' or CITM_CD='470' or CITM_CD='480' then DUSEAMT else 0 end) as c34
, sum(case when CITM_CD='510' then DUSEAMT else 0 end) as c35
, sum(case when CITM_CD='610' then DUSEAMT else 0 end) as c36
, sum(case when CITM_CD='710' then DUSEAMT else 0 end) as c37

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
, ACTV_NM
)
;
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
