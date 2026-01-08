# 0004: Wide → Long 데이터 변환

[← 메인으로 돌아가기](../README.md)

> ⚠️ **아카이브 코드 (2018년 작성)**
>
> 이 코드는 참고용으로만 보존되어 있습니다.
> - SAS 버전에 따라 일부 문법이 호환되지 않을 수 있습니다
> - 유지보수 계획 없음

---

## 개요

가로형(Wide) 데이터를 세로형(Long) 데이터로 변환하고, **Gencode를 자동 생성**하는 SAS 과제 프로젝트입니다.

### 학습 목표

1. Wide 형식 → Long 형식 데이터 변환
2. 동적 코드 생성 (Gencode)
3. 변수 라벨 자동 적용
4. PROC TABULATE를 활용한 요약 테이블 생성

---

## 데이터 구조

### 입력 데이터 (Wide 형식)

Excel 파일에서 가로로 펼쳐진 월별 데이터:

```
| 지역 | 산업분류 | 2017.02 | 2017.03 | ... | 2018.02 |
|------|---------|---------|---------|-----|---------|
| 서울 | 제조업   | 100     | 105     | ... | 120     |
| 부산 | 서비스업 | 80      | 82      | ... | 90      |
```

### 출력 데이터 (Long 형식)

세로로 변환된 데이터:

```
| 지역 | 산업분류 | 월      | 항목        | 값   |
|------|---------|---------|------------|------|
| 서울 | 제조업   | 2017.02 | 피용자수   | 100  |
| 서울 | 제조업   | 2017.03 | 피용자수   | 105  |
| ...  | ...     | ...     | ...        | ...  |
```

---

## 코드 구조

### 파일 설명

| 파일명 | 역할 |
|-------|------|
| `Homework01.sas` | 메인 코드 - 전체 변환 프로세스 |
| `01.xlsx` | 원본 데이터 (data 시트 + label 시트) |
| `gencode1.sas` | 자동 생성된 코드 - 변수 포맷 변환 |
| `gencode2.sas` | 자동 생성된 코드 - 변수 라벨 적용 |

### 생성되는 데이터셋

| 데이터셋 | 설명 |
|---------|------|
| `tp1` | 원본 데이터 (Excel에서 읽어옴) |
| `label` | 라벨 정보 (Excel에서 읽어옴) |
| `label1` | 라벨 전처리 (label1^label2 형식) |
| `tp2` | 포맷 및 라벨 적용된 데이터 |
| `longdata` | Wide → Long 변환된 데이터 |
| `final` | 최종 요약 테이블 |

---

## 코드 흐름

```
┌─────────────────────────────────┐
│ 1. Excel 데이터 읽기            │
│    - data 시트 → tp1            │
│    - label 시트 → label         │
└────────────┬────────────────────┘
             ▼
┌─────────────────────────────────┐
│ 2. 라벨 전처리                  │
│    - label1^label2 형식으로 결합 │
│    → label1                     │
└────────────┬────────────────────┘
             ▼
┌─────────────────────────────────┐
│ 3. Gencode 자동 생성            │
│    - gencode1.sas: 포맷 변환    │
│    - gencode2.sas: 라벨 적용    │
└────────────┬────────────────────┘
             ▼
┌─────────────────────────────────┐
│ 4. Wide → Long 변환             │
│    - ARRAY + DO 루프 활용       │
│    → longdata                   │
└────────────┬────────────────────┘
             ▼
┌─────────────────────────────────┐
│ 5. 요약 테이블 생성             │
│    - PROC TABULATE              │
│    → final                      │
└─────────────────────────────────┘
```

---

## 주요 파라미터

```sas
%LET lib=C:\Work01\;        /* 작업 디렉토리 */
%LET filename=01.xlsx;       /* 입력 파일명 */
%LET NofTotalVar=16;         /* 총 변수 개수 */
%LET NofFixVar=2;            /* 고정 변수 개수 (지역, 산업분류 등) */
%LET StartVar=3;             /* 변환 시작 변수 번호 */
```

---

## 핵심 기법

### 1. Gencode 자동 생성

```sas
/* gencode1.sas 생성 - 포맷 변환 */
FILENAME GENCODE1 "&lib.gencode1.sas";
DATA _NULL_;
  SET C.label1 END=eof;
  FILE gencode1;
  IF _n_ = 1 THEN PUT "Data c.tp2;set c.tp1;format v&StartVar-v&NofTotalVar;";
  PUT var "=PUT(" v ", 30.3);";
  IF eof THEN PUT "keep var1-var&NofTotalVar;run;";
RUN;
%include gencode1;
```

### 2. Wide → Long 변환

```sas
/* ARRAY를 활용한 변환 */
DATA raw;
  SET c.tp2;
  ARRAY all var&StartVar-var&NofTotalVar;
  DO i = 1 TO DIM(all);
    value1 = all[i];
    label = VLABEL(all(i));  /* 변수 라벨 추출 */
    OUTPUT;
  END;
  KEEP var1-var&NofFixVar i value1 label;
RUN;
```

### 3. 라벨 분리

```sas
/* ^ 구분자로 라벨 분리 */
DATA c.longdata;
  SET raw;
  label1 = SCAN(label, 1, '^');  /* 첫 번째 부분 (날짜) */
  label2 = SCAN(label, 2, '^');  /* 두 번째 부분 (항목) */
  value = INPUT(value1, 30.);
  KEEP var1-var&NofFixVar label1 label2 value;
RUN;
```

---

## 실행 방법

### 1. 환경 설정

```sas
/* 경로를 본인 환경에 맞게 수정 */
%LET lib=C:\Users\사용자\SAS-Projects\0004\;
```

### 2. Excel 파일 준비

`01.xlsx` 파일 구조:
- **data 시트**: 원본 데이터 (첫 행은 변수명)
- **label 시트**: 변수별 라벨 정보 (label1, label2 열)

### 3. 실행

`Homework01.sas` 파일 전체 실행

### 4. 결과 확인

- `longdata`: 변환된 Long 형식 데이터
- `final`: 요약 테이블

---

## 참고

- VLABEL 함수: 변수의 라벨을 반환
- FILENAME + DATA _NULL_ + FILE: 동적 코드 생성
- %INCLUDE: 생성된 코드 실행
