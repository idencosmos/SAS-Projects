# 0005: 데이터 시각화

[← 메인으로 돌아가기](../README.md)

> ⚠️ **아카이브 코드 (2018년 작성)**
>
> 이 코드는 참고용으로만 보존되어 있습니다.
> - SAS 버전에 따라 일부 문법이 호환되지 않을 수 있습니다
> - 유지보수 계획 없음

---

## 개요

[0004](../0004/)의 Wide → Long 변환에 **기초 통계 및 시각화**를 추가한 SAS 과제 프로젝트입니다.

### 학습 목표

1. Wide → Long 데이터 변환 (0004 복습)
2. PROC SGPLOT을 활용한 시계열 그래프
3. 데이터 필터링 및 비율 계산
4. 지역별 비교 분석

---

## 데이터

### 입력 데이터

- `01.xlsx`: 원본 데이터 (621KB, 대용량)
- 구조: 지역별, 항목별 월간 데이터

### 생성되는 데이터셋

| 데이터셋 | 설명 | 크기 |
|---------|------|------|
| `tp1` | 원본 데이터 | 590KB |
| `tp2` | 포맷/라벨 적용 | 1.9MB |
| `longdata` | Long 형식 변환 | 15MB |
| `final` | 요약 테이블 | 16MB |
| `H1` | 인구 데이터 필터 | 262KB |
| `h2` | 전국 대비 비교 | 131KB |
| `h3` | 비율 계산 | 131KB |

---

## 코드 구조

### 실행 순서

```
1. 데이터 변환 (0004와 동일)
   └── Homework02_longdata.sas  → longdata, final

2. 시각화 및 분석
   └── Homework02_stat.sas      → H1, h2, h3, 그래프
```

### 파일 설명

| 파일명 | 역할 |
|-------|------|
| `Homework02_longdata.sas` | Wide → Long 변환 (0004와 유사) |
| `Homework02_stat.sas` | 기초 통계 및 시각화 |
| `gencode1.sas` | 자동 생성 - 포맷 변환 |
| `gencode2.sas` | 자동 생성 - 라벨 적용 |
| `분석결과(간략).docx` | 분석 결과 보고서 |

---

## 분석 내용

### 1. 지역별 인구 추이

인구(명) 데이터를 추출하여 시계열 그래프 생성:

```sas
proc sgplot data=work02.H1
  (where=(var1='전국' or var1='서울특별시' or var1='경기도'));
  series x=label y=value / group=var1;
run;
```

### 2. 전국 대비 비율 계산

서울/경기의 인구가 전국에서 차지하는 비율:

```sas
data work02.h3;
  set work02.h2;
  value_ratio = value / value_all;
run;
```

### 3. 비율 추이 시각화

```sas
proc sgplot data=work02.H3;
  series x=label y=value_ratio / group=var1;
run;
```

---

## 생성되는 그래프

1. **지역별 인구 추이**
   - X축: 월
   - Y축: 인구(명)
   - 그룹: 전국, 서울특별시, 경기도

2. **전국 대비 인구 비율 추이**
   - X축: 월
   - Y축: 비율 (지역/전국)
   - 그룹: 서울특별시, 경기도

---

## 실행 방법

### 1. 환경 설정

```sas
/* 경로를 본인 환경에 맞게 수정 */
%LET lib=C:\Users\사용자\SAS-Projects\0005\;
libname work02 "&lib";
```

### 2. 실행 순서

1. `Homework02_longdata.sas` 실행 (데이터 변환)
2. `Homework02_stat.sas` 실행 (시각화)

### 3. 주의사항

- **대용량 데이터**: 원본 Excel 621KB, 변환 후 15MB
- **0004와의 관계**: 기본 로직은 동일, 시각화 추가

---

## 0004 vs 0005 비교

| 항목 | 0004 | 0005 |
|-----|------|------|
| 데이터 변환 | O | O |
| Gencode 생성 | O | O |
| PROC TABULATE | O | O |
| PROC SGPLOT | X | O |
| 비율 계산 | X | O |
| 데이터 크기 | 18KB | 621KB |

---

## 참고

- PROC SGPLOT: SAS의 고급 그래프 프로시저
- SERIES 문: 시계열 선 그래프
- GROUP 옵션: 그룹별 색상 구분
