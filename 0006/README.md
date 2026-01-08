# 0006: 공공 API 활용 (인구자료)

[← 메인으로 돌아가기](../README.md)

## 개요

통계청 **KOSIS API**를 활용하여 시군구 인구자료를 수집하고, **시도 단위로 집계**하는 SAS 과제 프로젝트입니다.

### 학습 목표

1. KOSIS Open API 활용 (HTTP 통신)
2. JSON 응답 파싱
3. 시군구 → 시도 단위 집계
4. 집계 결과 검증 (공식 시도 데이터와 비교)

---

## 데이터

### 데이터 소스

| 데이터 | 출처 | API | 기간 |
|-------|------|-----|------|
| 시군구별 인구 | 통계청 KOSIS | `DT_1B040M1` | 1993-2017 |
| 시도별 인구 | 통계청 KOSIS | `DT_1B040M1` | 1993-2017 |

### 수집 변수

| 변수 | 설명 |
|-----|------|
| `PRD_DE` | 연도 |
| `C1` | 지역 코드 |
| `C1_NM` | 지역명 |
| `C3_NM` | 연령 |
| `DT` | 인구 수 |

---

## 코드 구조

### 실행 순서

```
1. 데이터 수집
   └── homework03_자료 불러오기.sas
       ├── data_city  (시군구별 인구)
       └── data_state (시도별 인구 - 검증용)

2. 데이터 집계 및 검증
   └── homework03_자료 합치기.sas
       ├── compare    (시군구 집계 vs 시도 공식)
       └── final      (최종 비교 결과)
```

### 파일 설명

| 파일명 | 역할 |
|-------|------|
| `homework03_자료 불러오기.sas` | KOSIS API 호출 및 JSON 파싱 |
| `homework03_자료 합치기.sas` | 시군구 → 시도 집계, 검증 |
| `homework03.docx` | 과제 보고서 |

---

## API 호출 방식

### 매크로 구조

```sas
%macro json(data_final, String02, String03, ...);
  %do date_want=&date_s %to &date_e;
    /* API URL 구성 */
    %let url=http://kosis.kr/openapi/Param/statisticsParameterData.do
      ?method=getList
      &apiKey=&String01
      &orgId=&String02
      &tblId=&String03
      &format=json
      &startPrdDe=&date_want
      &endPrdDe=&date_want;

    /* HTTP 호출 */
    proc http url="&url" method="get" out=out;
    run;

    /* JSON 파싱 */
    libname raw json fileref=out;
  %end;
%mend;
```

### 호출 예시

```sas
/* 시도별 인구 */
%json(data_final=data_state,
      String02=101,           /* orgId: 통계청 */
      String03=DT_1B040M1,    /* tblId: 인구총조사 */
      date_s=1993,
      date_e=2017);

/* 시군구별 인구 */
%json(data_final=data_city, ...);
```

---

## 집계 및 검증 로직

### 1. 시군구 → 시도 집계

```sas
/* 시군구 코드에서 시도 코드 추출 (앞 2자리) */
proc sql;
  create table w1_01 as
  select *,
         substr(div_num, 1, 2) as div_state,
         sum(num) as sum
  from w1
  where substr(div_num, 5, 1)="0"  /* 시군구 단위만 */
  group by div_state, old;
quit;
```

### 2. 공식 데이터와 비교

```sas
/* 집계 결과 vs 공식 시도 데이터 */
proc sql;
  create table compare as
  select a.sum,           /* 시군구 합계 */
         b.num as sum_original  /* 공식 시도 값 */
  from w1_02 as a
  left join w2 as b
  on a.div_state=b.div_num
  and a.old=b.old
  and a.year=b.year;
quit;
```

### 3. 일치 여부 확인

```sas
data compare_all;
  set compare_all;
  if sum=sum_original then compare=0;  /* 일치 */
  else compare=1;                       /* 불일치 */
run;

proc means data=final;
  var compare;  /* 불일치 비율 확인 */
run;
```

---

## 연령 구간 처리

연도별로 연령 구간이 다르게 제공되어 조정 필요:

| 연도 | 최고 연령 구간 |
|-----|---------------|
| 초기 | 80세 이상 |
| 중기 | 85세 이상 |
| 최근 | 100세 이상 |

```sas
/* 중복 구간 제거 */
data adjust_02;
  set adjust_01;
  if up85>0 and old="80세 이상" then delete;
  if up100>0 and old="80세 이상" then delete;
  if up100>0 and old="85세 이상" then delete;
run;
```

---

## 실행 방법

### 1. 환경 설정

```sas
/* 경로를 본인 환경에 맞게 수정 */
%let lib=C:\Users\사용자\SAS-Projects\0006\;
libname json "&lib";
```

### 2. API 키 설정

```sas
/* KOSIS API 키 (Base64 인코딩) */
%let String01=YOUR_KOSIS_API_KEY;
```

### 3. 실행 순서

1. `homework03_자료 불러오기.sas` 실행 (데이터 수집)
2. `homework03_자료 합치기.sas` 실행 (집계 및 검증)

### 4. 주의사항

- **API 키 필요**: KOSIS Open API 키 발급 필요
- **실행 시간**: 1993-2017년 (25년) 데이터 수집에 시간 소요
- **네트워크**: 인터넷 연결 필요

---

## 참고

- KOSIS Open API: https://kosis.kr/openapi
- API 신청: KOSIS 회원가입 후 Open API 신청
- 테이블 ID 조회: KOSIS 통계표 상세 페이지에서 확인
