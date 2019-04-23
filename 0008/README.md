table001: 회계별 단체별 세출결산; http://lofin.mois.go.kr/portal/service/openInfPage.do?infId=2OWWFCZ8L0358A0LYDYD847736&srvCd=; 범위: 2010-2017, 관측값: 1949개, 변수: 9개
table002: 구조별 기능별 세출결산; http://lofin.mois.go.kr/portal/service/openInfPage.do?infId=OJS0J1DFCIUQBQU9RV1O866823&srvCd=#; 범위: 2010-2017, 관측값: 25398개, 변수 13개
table003: 재원별 회계별 세입결산; http://lofin.mois.go.kr/portal/service/openInfPage.do?infId=15SPGQV69B8KRTNR8YQH997326&srvCd=#; 범위: 2010-2017, 관측값: 29661개, 변수 17개
table004: 세입목별 세입결산; 범위: 2008-2017
table005: 시도지사선거; 범위: 1차-7차
table006: 시군구의장선거; 범위: 1차-7차
table007: 지역별 고령인구비율; 범위: 2010-2018
table008: 예산대비채무비율; http://lofin.mois.go.kr/portal/service/openInfPage.do?infId=AQ1PTH5E3I4CK89VE729438382&srvCd=#; 범위: 2010-2017
table009: 재정자립도(최종); http://lofin.mois.go.kr/portal/service/openInfPage.do?infId=G8HHJMAEPI2Z3DG5332Y457985&srvCd=; 범위: 2010-2017

---

var001: table003
var002: var002 left join table008, table009
var003: var002 left join var004
var004: table004
var005: var003
var006: table006 left join table005
var007: table007
var008: var005 left join var006


---

세입결산: 실제수납액
세출결산: 세출총계, 실제지출액
다음년도이월내역(세계잉여금)=명시이월+사고이월+계속비이월+보조금집행잔액+순세계잉여금
  순세계잉여금=잉여금
  보조금집행잔액=보조금사용잔액
  나머지=전년도이월사업비
순세계잉여금=초과세입금+자금없는이월액+집행잔액-차감항목(보조금사용잔액+현년도채무상환)

---

종속변수: 지방자치단체장의 예산집행률(ratio_remainder)

독립변수: 정부 여당과의 정당 일치 여부(comp1)
  정부 다수당과 정당 일치 여부(comp2)
  광역지방자치단체장과 정당 일치 여부(var102)
  기초지방자치단체장의 지방선거 득표율(var37)
  기초지방자치단체장의 재선 여부(var101)

통제변수: 광역지방자치단체(더미)(wdr_sfrnd_code_nm)
  정당(더미)(var25)
  연도(더미)(accnut_year)
  고령 인구비율(dt)
  지방채비율(rate1)
  재정자립도(rate2)

---

*주요변수*
a: 국고보조금사용잔액
b: 시ㆍ도비보조금사용잔액
c(carry): 전년도이월사업비
d(remainder): 순세계잉여금(법정잉여금 포함)
ratio_remainder: 순세계잉여금을 제외한 예산집행률
ratio_remain: 세계잉여금을 제외한 예산집행률
rate1: 예산대비채무비율
rate2: 재정자립도
comp1: 국회여당 정당일치여부
comp2: 국회다수당 정당일치여부
var102: 광역지방자치단체장과 정당일치여부
dt: 고령 인구비율
