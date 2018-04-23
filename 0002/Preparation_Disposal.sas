%let dir=D:\OneDrive\Github\SAS-Projects\0002\sas7bdat\;
%let lib=A0002;

libname &lib "&dir";

/*ongdata_001-longdata_004를 full join한 테이블을 만드는 코드, 비효율적이고 필요없는 작업으로 폐기*/

proc sql;
create table &lib..pre004 as
select distinct *
, sum(input(ANEXP_BDGAMT_F, 32.)) as ANEXP_BDGAMT_F_S
, sum(input(ANEXP_BDGAMT_M, 32.)) as ANEXP_BDGAMT_M_S
, sum(input(PREY_BFWAMT, 32.)) as PREY_BFWAMT_S
, sum(input(OVR_EP_AMT, 32.)) as OVR_EP_AMT_S
, sum(input(RSVF_EP_DCS_IAMT, 32.)) as RSVF_EP_DCS_IAMT_S
, sum(input(RSVF_EP_DCS_MAMT, 32.)) as RSVF_EP_DCS_MAMT_S
, sum(input(BDTR_IAMT, 32.)) as BDTR_IAMT_S
, sum(input(BDTR_MAMT, 32.)) as BDTR_MAMT_S
, sum(input(AVDV_IAMT, 32.)) as AVDV_IAMT_S
, sum(input(AVDV_MAMT, 32.)) as AVDV_MAMT_S
, sum(input(FNT_IAMT, 32.)) as FNT_IAMT_S
, sum(input(FNT_MAMT, 32.)) as FNT_MAMT_S
, sum(input(ANEXP_BDG_CAMT, 32.)) as ANEXP_BDG_CAMT_S
, sum(input(EP_AMT, 32.)) as EP_AMT_S
, sum(input(EP_NAMT, 32.)) as EP_NAMT_S
, sum(input(NEXT_YY_BFWAMT, 32.)) as NEXT_YY_BFWAMT_S
, sum(input(DUSEAMT, 32.)) as DUSEAMT_S
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
create table &lib..Pre0104 as
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
create table &lib..Pre010402 as
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
, a.*
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

proc sql;
create table &lib..Pre01040203 as
select coalesce(a.FSCL_YY, b.FSCL_YY) as FSCL_YY
, coalesce(a.OFFC_NM, b.OFFC_NM) as OFFC_NM
, b.REVN_BDG_CAMT
, b.RC_AMT
, b.REVN_RC_AMT
, b.ANEXP_BDG_CAMT as ANEXP_BDG_CAMT_T
, b.EP_AMT as EP_AMT_T
, b.ANEXP_EP_AMT
, b.ELUC_BFWAMT
, b.DUSEAMT as DUSEAMT_T
, a.*
from &lib..pre010402 as a full join &lib..longdata_003 as b
on a.FSCL_YY=b.FSCL_YY
and a.OFFC_NM=b.OFFC_NM;
quit;
run;

proc sql;
create table &lib..Prefinal as
select FSCL_YY label="회계연도"
, EXE_M label="집행월"
, OFFC_CD label="소관"
, OFFC_NM label="소관명"
, FSCL_CD label="회계"
, FSCL_NM label="회계명"
, ACCT_CD label="계정"
, ACCT_NM label="계정명"
, FLD_CD label="분야코드"
, FLD_NM label="분야명"
, SECT_CD label="부문코드"
, SECT_NM label="부문명"
, PGM_CD label="프로그램코드"
, PGM_NM label="프로그램명"
, ACTV_CD label="단위사업"
, ACTV_NM label="단위사업명"
, CITM_CD label="지출목"
, CITM_NM label="지출목명"
, input(ANEXP_BDGAMT_F, 32.) label="세출예산액/당초지출계획액(원)"
, ANEXP_BDGAMT_F_S label="당초지출계획액(원)/단위사업별"
, input(ANEXP_BDGAMT_M, 32.) label="세출예산액/수정지출계획액(원)"
, ANEXP_BDGAMT_M_S label="수정지출계획액(원)/단위사업별"
, input(PREY_BFWAMT, 32.) label="전년도이월액(원)"
, PREY_BFWAMT_S label="전년도이월액(원)/단위사업별"
, input(OVR_EP_AMT, 32.) label="초과지출승인액(원)"
, OVR_EP_AMT_S label="초과지출승인액(원)/단위사업별"
, input(RSVF_EP_DCS_IAMT, 32.) label="예비비지출결정증액(원)"
, RSVF_EP_DCS_IAMT_S label="예비비지출결정증액(원)/단위사업별"
, input(RSVF_EP_DCS_MAMT, 32.) label="예비비지출결정감액(원)"
, RSVF_EP_DCS_MAMT_S label="예비비지출결정감액(원)/단위사업별"
, input(BDTR_IAMT, 32.) label="전용증액(원)"
, BDTR_IAMT_S label="전용증액(원)/단위사업별"
, input(BDTR_MAMT, 32.) label="전용감액(원)"
, BDTR_MAMT_S label="전용감액(원)/단위사업별"
, input(FNT_IAMT, 32.) label="이체증액(원)"
, FNT_IAMT_S label="이체증액(원)/단위사업별"
, input(FNT_MAMT, 32.) label="이체감액(원)"
, FNT_MAMT_S label="이체감액(원)/단위사업별"
, input(AVDV_IAMT, 32.) label="이용증액(원)"
, AVDV_IAMT_S label="이용증액(원)/단위사업별"
, input(AVDV_MAMT, 32.) label="이용감액(원)"
, AVDV_MAMT_S label="이용감액(원)/단위사업별"
, ANEXP_BDG_CAMT label="세출예산현액/지출계획현액(원)"
, ANEXP_BDG_CAMT_S label="세출예산현액(원)/단위사업별"
, EP_AMT label="당월집행액(원)"
, THISM_AGGR_EP_AMT label="누계집행액(원)"
, EP_AMT_S label="지출액(원)/단위사업별"
, input(EP_NAMT, 32.) label="지출순액(원)"
, EP_NAMT_S label="지출순액(원)/단위사업별"
, input(NEXT_YY_BFWAMT, 32.) label="다음년도이월액(원)"
, NEXT_YY_BFWAMT_S label="다음년도이월액(원)/단위사업별"
, input(DUSEAMT, 32.) label="불용액(원)"
, DUSEAMT_S label="불용액(원)/단위사업별"
, input(REVN_BDG_CAMT, 32.) label="(세입)예산현액"
, input(RC_AMT, 32.) label="(세입)수납액(원)"
, input(REVN_RC_AMT, 32.) label="(세입)증감액(원)"
, input(ANEXP_BDG_CAMT_T, 32.) label="세출예산현액(원)/소관별"
, input(EP_AMT_T, 32.) label="지출액(원)/소관별"
, input(ANEXP_EP_AMT, 32.) label="(세출)증감액(원)"
, input(ELUC_BFWAMT, 32.) label="다음년도이월액(원)"
, input(DUSEAMT_T, 32.) label="불용액(원)/소관별"
, Y_YY_DFN_MEDI_KCUR_AMT label="금년도국회확정(천원)"
, Y_YY_MEDI_KCUR_AMT label="금년도정부안(천원)"
from &lib..Pre01040203;
quit;
run;
