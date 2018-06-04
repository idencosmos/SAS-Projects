/**********************************************************************
 *   PRODUCT:   SAS
 *   VERSION:   9.1
 *   CREATOR:   External File Interface
 *   DATE:      04OCT07
 *   DESC:      Generated SAS Datastep Code
 *   TEMPLATE SOURCE:  (None Specified.)
 *
 *
 *
 *
 **********************************************************************
 *	*주의 사항
 *  	현재 스크립트 파일은 파일명만 출력되어 있습니다.
 *		따라서, 저장된 추출 결과 파일의 경로를 'infile'에 추가하여야 합니다.
 *  	또한, 다년도 추출 결과 파일은 파일명 뒤에 해당년도가
 *		'_YYYY' 형태로 추가되므로 역시 'infile'에 추가 하여야 합니다.
 *
 *		SAS 스크립트는 SAS에서 파일 경로와 파일명만 수정하면 바로 실행가능하며,
 *		데이터셋 생성 후에 SAS의 여러 가지 분석 기능을 사용할 수 있습니다.
 *
 ***********************************************************************/
    data WORK.MDIS_0610                                    ;
    %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
    infile 'D:\OneDrive\Github\SAS-Projects\0003\테이블(직접 다운로드)\주거실태조사\extr_idencosmos_20180604_50558_2010.txt' delimiter = '09'x MISSOVER DSD lrecl=32767 encoding="euc-kr";
        informat C1 best12. ;
        informat C2 $10. ;
        informat C3 $2. ;
        informat C4 $6. ;
        informat C5 $3. ;
        informat C6 $1. ;
        informat C7 $1. ;
        informat C8 $1. ;
        informat C9 $4. ;
        informat C10 $2. ;
        informat C11 $2. ;
        informat C12 $1. ;
        informat C13 best12. ;
        informat C14 $4. ;
        informat C15 $1. ;
        informat C16 $2. ;
        informat C17 best12. ;
        informat C18 $2. ;
        informat C19 $2. ;
        informat C20 $1. ;
        informat C21 $1. ;
        informat C22 $1. ;
        informat C23 $1. ;
        informat C24 best12. ;
        informat C25 $1. ;
        informat C26 $1. ;
        informat C27 $1. ;
        informat C28 $1. ;
        informat C29 $1. ;
        informat C30 best12. ;
        informat C31 $2. ;
        informat C32 $2. ;
        informat C33 best12. ;
        informat C34 $2. ;
        informat C35 $1. ;
        informat C36 best12. ;
        informat C37 best12. ;
        informat C38 best12. ;
        informat C39 best12. ;
        informat C40 $1. ;
        informat C41 best12. ;
        informat C42 best12. ;
        informat C43 best12. ;
        informat C44 best12. ;
        informat C45 best12. ;
        informat C46 best12. ;
        informat C47 best12. ;
        informat C48 best12. ;
        informat C49 best12. ;
        informat C50 best12. ;
        informat C51 best12. ;
        informat C52 best12. ;
        informat C53 best12. ;
        informat C54 best12. ;
        informat C55 best12. ;
        informat C56 best12. ;
        informat C57 best12. ;
        informat C58 best12. ;
        informat C59 best12. ;
        informat C60 $1. ;
        informat C61 $1. ;
        informat C62 $1. ;
        informat C63 $1. ;
        informat C64 $1. ;
        informat C65 $1. ;
        informat C66 $1. ;
        informat C67 $1. ;
        informat C68 $1. ;
        informat C69 $1. ;
        informat C70 $1. ;
        informat C71 $1. ;
        informat C72 $2. ;
        informat C73 $1. ;
        informat C74 $1. ;
        informat C75 $1. ;
        informat C76 $1. ;
        informat C77 $1. ;
        informat C78 $1. ;
        informat C79 $1. ;
        informat C80 $1. ;
        informat C81 $1. ;
        informat C82 $1. ;
        informat C83 $1. ;
        informat C84 $1. ;
        informat C85 $1. ;
        informat C86 best12. ;
        informat C87 $1. ;
        informat C88 $1. ;
        informat C89 $1. ;
        informat C90 $1. ;
        informat C91 $1. ;
        informat C92 $1. ;
        informat C93 $1. ;
        informat C94 $1. ;
        informat C95 $1. ;
        informat C96 $1. ;
        informat C97 $1. ;
        informat C98 $1. ;
        informat C99 $1. ;
        informat C100 $1. ;
        informat C101 $1. ;
        informat C102 $1. ;
        informat C103 $1. ;
        informat C104 $1. ;
        informat C105 $1. ;
        informat C106 $1. ;
        informat C107 $1. ;
        informat C108 $1. ;
        informat C109 $1. ;
        informat C110 $1. ;
        informat C111 $1. ;
        informat C112 best12. ;
        informat C113 best12. ;
        informat C114 best12. ;
        informat C115 best12. ;
        informat C116 $2. ;
        informat C117 $2. ;
        informat C118 $2. ;
        informat C119 $2. ;
        informat C120 $2. ;
        informat C121 $2. ;
        informat C122 $1. ;
        informat C123 $2. ;
        informat C124 $1. ;
        informat C125 $1. ;
        informat C126 $2. ;
        informat C127 $5. ;
        informat C128 $1. ;
        informat C129 best12. ;
        informat C130 best12. ;
        informat C131 best12. ;
        informat C132 best12. ;
        informat C133 best12. ;
        informat C134 $1. ;
        informat C135 $1. ;
        informat C136 best12. ;
        informat C137 $1. ;
        informat C138 $1. ;
        informat C139 best12. ;
        informat C140 $2. ;
        informat C141 $1. ;
        informat C142 best12. ;
        informat C143 $2. ;
        informat C144 $1. ;
        informat C145 best12. ;
        informat C146 best12. ;
        informat C147 best12. ;
        informat C148 best12. ;
        informat C149 $1. ;
        informat C150 best12. ;
        informat C151 $2. ;
        informat C152 $1. ;
        informat C153 best12. ;
        informat C154 $2. ;
        informat C155 $2. ;
        informat C156 $2. ;
        informat C157 $2. ;
        informat C158 $2. ;
        informat C159 $2. ;
        informat C160 $2. ;
        informat C161 $2. ;
        informat C162 $1. ;
        informat C163 best12. ;
        informat C164 $1. ;
        informat C165 $1. ;
        informat C166 $1. ;
        informat C167 $1. ;
        informat C168 $1. ;
        informat C169 $1. ;
        informat C170 best12. ;
        informat C171 best12. ;
        informat C172 $1. ;
        informat C173 $1. ;
        informat C174 $1. ;
        informat C175 best12. ;
        informat C176 $1. ;
        informat C177 $1. ;
        informat C178 $2. ;
        informat C179 $1. ;
        informat C180 $1. ;
        informat C181 best12. ;
        informat C182 $1. ;
        informat C183 $1. ;
        informat C184 $2. ;
        informat C185 $1. ;
        informat C186 $1. ;
        informat C187 best12. ;
        informat C188 $1. ;
        informat C189 $1. ;
        informat C190 $2. ;
        informat C191 $1. ;
        informat C192 $1. ;
        informat C193 best12. ;
        informat C194 $1. ;
        informat C195 $1. ;
        informat C196 $2. ;
        informat C197 $1. ;
        informat C198 $1. ;
        informat C199 best12. ;
        informat C200 $1. ;
        informat C201 $1. ;
        informat C202 $2. ;
        informat C203 $1. ;
        informat C204 $1. ;
        informat C205 best12. ;
        informat C206 $1. ;
        informat C207 $1. ;
        informat C208 $2. ;
        informat C209 $1. ;
        informat C210 $1. ;
        informat C211 best12. ;
        informat C212 $1. ;
        informat C213 $1. ;
        informat C214 $2. ;
        informat C215 $1. ;
        informat C216 $1. ;
        informat C217 best12. ;
        informat C218 $1. ;
        informat C219 $1. ;
        informat C220 $2. ;
        informat C221 $1. ;
        informat C222 $1. ;
        informat C223 best12. ;
        informat C224 $1. ;
        informat C225 $1. ;
        informat C226 $2. ;
        informat C227 $1. ;
        informat C228 $1. ;
        informat C229 best12. ;
        informat C230 $1. ;
        informat C231 $1. ;
        informat C232 $4. ;
        informat C233 $1. ;
        informat C234 $1. ;
        informat C235 best12. ;
        informat C236 best12. ;
        informat C237 best12. ;
        informat C238 best12. ;
        informat C239 best12. ;
        informat C240 best12. ;
        informat C241 best12. ;
        informat C242 best12. ;
        informat C243 best12. ;
        informat C244 best12. ;
        informat C245 best12. ;
        informat C246 best12. ;
        informat C247 best12. ;
        informat C248 best12. ;
        informat C249 $1. ;
        informat C250 $1. ;
        informat C251 $1. ;
        informat C252 $1. ;
        informat C253 best12. ;
        informat C254 best12. ;
        informat C255 best12. ;
        informat C256 best12. ;
        informat C257 best12. ;
        informat C258 best12. ;
        informat C259 best12. ;
        informat C260 best12. ;
        informat C261 best12. ;
        informat C262 $1. ;
        informat C263 best12. ;
        informat C264 $2. ;
        informat C265 $2. ;
        informat C266 best12. ;
        informat C267 best12. ;
        informat C268 best12. ;
        informat C269 $1. ;
        informat C270 best12. ;
        informat C271 $1. ;
        informat C272 $1. ;
        informat C273 $1. ;
        informat C274 $1. ;
        informat C275 $2. ;
        informat C276 $1. ;
        informat C277 $1. ;
        informat C278 best12. ;
        informat C279 $1. ;
        informat C280 $1. ;
        informat C281 best12. ;

        format C1 best12. ;
        format C2 $10. ;
        format C3 $2. ;
        format C4 $6. ;
        format C5 $3. ;
        format C6 $1. ;
        format C7 $1. ;
        format C8 $1. ;
        format C9 $4. ;
        format C10 $2. ;
        format C11 $2. ;
        format C12 $1. ;
        format C13 best12. ;
        format C14 $4. ;
        format C15 $1. ;
        format C16 $2. ;
        format C17 best12. ;
        format C18 $2. ;
        format C19 $2. ;
        format C20 $1. ;
        format C21 $1. ;
        format C22 $1. ;
        format C23 $1. ;
        format C24 best12. ;
        format C25 $1. ;
        format C26 $1. ;
        format C27 $1. ;
        format C28 $1. ;
        format C29 $1. ;
        format C30 best12. ;
        format C31 $2. ;
        format C32 $2. ;
        format C33 best12. ;
        format C34 $2. ;
        format C35 $1. ;
        format C36 best12. ;
        format C37 best12. ;
        format C38 best12. ;
        format C39 best12. ;
        format C40 $1. ;
        format C41 best12. ;
        format C42 best12. ;
        format C43 best12. ;
        format C44 best12. ;
        format C45 best12. ;
        format C46 best12. ;
        format C47 best12. ;
        format C48 best12. ;
        format C49 best12. ;
        format C50 best12. ;
        format C51 best12. ;
        format C52 best12. ;
        format C53 best12. ;
        format C54 best12. ;
        format C55 best12. ;
        format C56 best12. ;
        format C57 best12. ;
        format C58 best12. ;
        format C59 best12. ;
        format C60 $1. ;
        format C61 $1. ;
        format C62 $1. ;
        format C63 $1. ;
        format C64 $1. ;
        format C65 $1. ;
        format C66 $1. ;
        format C67 $1. ;
        format C68 $1. ;
        format C69 $1. ;
        format C70 $1. ;
        format C71 $1. ;
        format C72 $2. ;
        format C73 $1. ;
        format C74 $1. ;
        format C75 $1. ;
        format C76 $1. ;
        format C77 $1. ;
        format C78 $1. ;
        format C79 $1. ;
        format C80 $1. ;
        format C81 $1. ;
        format C82 $1. ;
        format C83 $1. ;
        format C84 $1. ;
        format C85 $1. ;
        format C86 best12. ;
        format C87 $1. ;
        format C88 $1. ;
        format C89 $1. ;
        format C90 $1. ;
        format C91 $1. ;
        format C92 $1. ;
        format C93 $1. ;
        format C94 $1. ;
        format C95 $1. ;
        format C96 $1. ;
        format C97 $1. ;
        format C98 $1. ;
        format C99 $1. ;
        format C100 $1. ;
        format C101 $1. ;
        format C102 $1. ;
        format C103 $1. ;
        format C104 $1. ;
        format C105 $1. ;
        format C106 $1. ;
        format C107 $1. ;
        format C108 $1. ;
        format C109 $1. ;
        format C110 $1. ;
        format C111 $1. ;
        format C112 best12. ;
        format C113 best12. ;
        format C114 best12. ;
        format C115 best12. ;
        format C116 $2. ;
        format C117 $2. ;
        format C118 $2. ;
        format C119 $2. ;
        format C120 $2. ;
        format C121 $2. ;
        format C122 $1. ;
        format C123 $2. ;
        format C124 $1. ;
        format C125 $1. ;
        format C126 $2. ;
        format C127 $5. ;
        format C128 $1. ;
        format C129 best12. ;
        format C130 best12. ;
        format C131 best12. ;
        format C132 best12. ;
        format C133 best12. ;
        format C134 $1. ;
        format C135 $1. ;
        format C136 best12. ;
        format C137 $1. ;
        format C138 $1. ;
        format C139 best12. ;
        format C140 $2. ;
        format C141 $1. ;
        format C142 best12. ;
        format C143 $2. ;
        format C144 $1. ;
        format C145 best12. ;
        format C146 best12. ;
        format C147 best12. ;
        format C148 best12. ;
        format C149 $1. ;
        format C150 best12. ;
        format C151 $2. ;
        format C152 $1. ;
        format C153 best12. ;
        format C154 $2. ;
        format C155 $2. ;
        format C156 $2. ;
        format C157 $2. ;
        format C158 $2. ;
        format C159 $2. ;
        format C160 $2. ;
        format C161 $2. ;
        format C162 $1. ;
        format C163 best12. ;
        format C164 $1. ;
        format C165 $1. ;
        format C166 $1. ;
        format C167 $1. ;
        format C168 $1. ;
        format C169 $1. ;
        format C170 best12. ;
        format C171 best12. ;
        format C172 $1. ;
        format C173 $1. ;
        format C174 $1. ;
        format C175 best12. ;
        format C176 $1. ;
        format C177 $1. ;
        format C178 $2. ;
        format C179 $1. ;
        format C180 $1. ;
        format C181 best12. ;
        format C182 $1. ;
        format C183 $1. ;
        format C184 $2. ;
        format C185 $1. ;
        format C186 $1. ;
        format C187 best12. ;
        format C188 $1. ;
        format C189 $1. ;
        format C190 $2. ;
        format C191 $1. ;
        format C192 $1. ;
        format C193 best12. ;
        format C194 $1. ;
        format C195 $1. ;
        format C196 $2. ;
        format C197 $1. ;
        format C198 $1. ;
        format C199 best12. ;
        format C200 $1. ;
        format C201 $1. ;
        format C202 $2. ;
        format C203 $1. ;
        format C204 $1. ;
        format C205 best12. ;
        format C206 $1. ;
        format C207 $1. ;
        format C208 $2. ;
        format C209 $1. ;
        format C210 $1. ;
        format C211 best12. ;
        format C212 $1. ;
        format C213 $1. ;
        format C214 $2. ;
        format C215 $1. ;
        format C216 $1. ;
        format C217 best12. ;
        format C218 $1. ;
        format C219 $1. ;
        format C220 $2. ;
        format C221 $1. ;
        format C222 $1. ;
        format C223 best12. ;
        format C224 $1. ;
        format C225 $1. ;
        format C226 $2. ;
        format C227 $1. ;
        format C228 $1. ;
        format C229 best12. ;
        format C230 $1. ;
        format C231 $1. ;
        format C232 $4. ;
        format C233 $1. ;
        format C234 $1. ;
        format C235 best12. ;
        format C236 best12. ;
        format C237 best12. ;
        format C238 best12. ;
        format C239 best12. ;
        format C240 best12. ;
        format C241 best12. ;
        format C242 best12. ;
        format C243 best12. ;
        format C244 best12. ;
        format C245 best12. ;
        format C246 best12. ;
        format C247 best12. ;
        format C248 best12. ;
        format C249 $1. ;
        format C250 $1. ;
        format C251 $1. ;
        format C252 $1. ;
        format C253 best12. ;
        format C254 best12. ;
        format C255 best12. ;
        format C256 best12. ;
        format C257 best12. ;
        format C258 best12. ;
        format C259 best12. ;
        format C260 best12. ;
        format C261 best12. ;
        format C262 $1. ;
        format C263 best12. ;
        format C264 $2. ;
        format C265 $2. ;
        format C266 best12. ;
        format C267 best12. ;
        format C268 best12. ;
        format C269 $1. ;
        format C270 best12. ;
        format C271 $1. ;
        format C272 $1. ;
        format C273 $1. ;
        format C274 $1. ;
        format C275 $2. ;
        format C276 $1. ;
        format C277 $1. ;
        format C278 best12. ;
        format C279 $1. ;
        format C280 $1. ;
        format C281 best12. ;
    input
        C1 $
        C2 $
        C3 $
        C4 $
        C5 $
        C6 $
        C7 $
        C8 $
        C9 $
        C10 $
        C11 $
        C12 $
        C13 $
        C14 $
        C15 $
        C16 $
        C17 $
        C18 $
        C19 $
        C20 $
        C21 $
        C22 $
        C23 $
        C24 $
        C25 $
        C26 $
        C27 $
        C28 $
        C29 $
        C30 $
        C31 $
        C32 $
        C33 $
        C34 $
        C35 $
        C36 $
        C37 $
        C38 $
        C39 $
        C40 $
        C41 $
        C42 $
        C43 $
        C44 $
        C45 $
        C46 $
        C47 $
        C48 $
        C49 $
        C50 $
        C51 $
        C52 $
        C53 $
        C54 $
        C55 $
        C56 $
        C57 $
        C58 $
        C59 $
        C60 $
        C61 $
        C62 $
        C63 $
        C64 $
        C65 $
        C66 $
        C67 $
        C68 $
        C69 $
        C70 $
        C71 $
        C72 $
        C73 $
        C74 $
        C75 $
        C76 $
        C77 $
        C78 $
        C79 $
        C80 $
        C81 $
        C82 $
        C83 $
        C84 $
        C85 $
        C86 $
        C87 $
        C88 $
        C89 $
        C90 $
        C91 $
        C92 $
        C93 $
        C94 $
        C95 $
        C96 $
        C97 $
        C98 $
        C99 $
        C100 $
        C101 $
        C102 $
        C103 $
        C104 $
        C105 $
        C106 $
        C107 $
        C108 $
        C109 $
        C110 $
        C111 $
        C112 $
        C113 $
        C114 $
        C115 $
        C116 $
        C117 $
        C118 $
        C119 $
        C120 $
        C121 $
        C122 $
        C123 $
        C124 $
        C125 $
        C126 $
        C127 $
        C128 $
        C129 $
        C130 $
        C131 $
        C132 $
        C133 $
        C134 $
        C135 $
        C136 $
        C137 $
        C138 $
        C139 $
        C140 $
        C141 $
        C142 $
        C143 $
        C144 $
        C145 $
        C146 $
        C147 $
        C148 $
        C149 $
        C150 $
        C151 $
        C152 $
        C153 $
        C154 $
        C155 $
        C156 $
        C157 $
        C158 $
        C159 $
        C160 $
        C161 $
        C162 $
        C163 $
        C164 $
        C165 $
        C166 $
        C167 $
        C168 $
        C169 $
        C170 $
        C171 $
        C172 $
        C173 $
        C174 $
        C175 $
        C176 $
        C177 $
        C178 $
        C179 $
        C180 $
        C181 $
        C182 $
        C183 $
        C184 $
        C185 $
        C186 $
        C187 $
        C188 $
        C189 $
        C190 $
        C191 $
        C192 $
        C193 $
        C194 $
        C195 $
        C196 $
        C197 $
        C198 $
        C199 $
        C200 $
        C201 $
        C202 $
        C203 $
        C204 $
        C205 $
        C206 $
        C207 $
        C208 $
        C209 $
        C210 $
        C211 $
        C212 $
        C213 $
        C214 $
        C215 $
        C216 $
        C217 $
        C218 $
        C219 $
        C220 $
        C221 $
        C222 $
        C223 $
        C224 $
        C225 $
        C226 $
        C227 $
        C228 $
        C229 $
        C230 $
        C231 $
        C232 $
        C233 $
        C234 $
        C235 $
        C236 $
        C237 $
        C238 $
        C239 $
        C240 $
        C241 $
        C242 $
        C243 $
        C244 $
        C245 $
        C246 $
        C247 $
        C248 $
        C249 $
        C250 $
        C251 $
        C252 $
        C253 $
        C254 $
        C255 $
        C256 $
        C257 $
        C258 $
        C259 $
        C260 $
        C261 $
        C262 $
        C263 $
        C264 $
        C265 $
        C266 $
        C267 $
        C268 $
        C269 $
        C270 $
        C271 $
        C272 $
        C273 $
        C274 $
        C275 $
        C276 $
        C277 $
        C278 $
        C279 $
        C280 $
        C281 $
     ;

	label         C1 = '순번'
        C2 = '시도명'
        C3 = '시도코드'
        C4 = '시군구명'
        C5 = '시군구코드'
        C6 = '응답자'
        C7 = '주택 마련여부'
        C8 = '최초주택 마련방법'
        C9 = '최초주택 마련시기_년'
        C10 = '최초주택 마련기간_년'
        C11 = '최초주택 마련기간_월'
        C12 = '이사경험'
        C13 = '이사횟수_번'
        C14 = '현재주택 거주 시기_년'
        C15 = '현재 주택 전 이사경험'
        C16 = '현재주택 전 거주지'
        C17 = '코드'
        C18 = '주택유형_현재주택'
        C19 = '주택유형_이전주택'
        C20 = '주택 내 위치(현재주택)'
        C21 = '주택 내 위치_이전주택'
        C22 = '주택 점유형태_현재주택'
        C23 = '주택 점유형태_이전주택'
        C24 = '주택 구입시기_현재 주택'
        C25 = '주택구입방법'
        C26 = '타지 주택소유 여부_자가'
        C27 = '있다면 몇 채 입니까_타지소유_자가'
        C28 = '현재 주택의 임차여부'
        C29 = '타지 주택소유 임차_여부'
        C30 = '타지 주택소유 임차_채'
        C31 = '무주택 기간_소유 경험 없음, 년'
        C32 = '무주택 기간_소유 경험 있음, 년'
        C33 = '현재주택 내 거주 가구수'
        C34 = '현재주택 건설연도'
        C35 = '현재주택 원룸형 여부'
        C36 = '현재주택 방 침실'
        C37 = '현재주택 침실 이외의 방'
        C38 = '현재주택 거실'
        C39 = '현재주택 식당'
        C40 = '이전주택 원룸형 여부'
        C41 = '이전주택 방 침실'
        C42 = '이전주택 침실 이외의 방'
        C43 = '이전주택 거실'
        C44 = '이전주택 식당'
        C45 = '주택총면적_단독주택 현재'
        C46 = '주택총면적_단독주택 이전'
        C47 = '주택사용면적_단독주택 현재_1'
        C48 = '주택사용면적_단독주택 이전_1'
        C49 = '주택대지총면적_단독주택 현재'
        C50 = '주택대지총면적_단독주택 이전'
        C51 = '주택사용면적_단독주택 현재_2'
        C52 = '주택사용면적_단독주택 이전_2'
        C53 = '주택분양면적_단독주택 현재'
        C54 = '주택분양면적_단독주택 이전'
        C55 = '주택사용면적_아파트연립 현재'
        C56 = '주택사용면적_아파트연립 이전'
        C57 = '베란다 확장면적_아파트연립 현재'
        C58 = '주택사용면적_비거주용 현재'
        C59 = '주택사용면적_비거주용 이전'
        C60 = '사용형태_부엌의 사용형태'
        C61 = '사용형태_부엌의 종류'
        C62 = '사용형태_화장실 사용형태'
        C63 = '사용형태_화장실 종류'
        C64 = '사용형태_화장실 종류 양변기 여부'
        C65 = '사용형태_목욕시설 사용형태'
        C66 = '사용형태_목욕시설 종류'
        C67 = '사용형태_상수도시설 사용형태'
        C68 = '사용형태_하수시설 사용형태'
        C69 = '사용형태_누전차단기'
        C70 = '사용형태_화재감지기'
        C71 = '사용형태_난방시설'
        C72 = '사용형태_난방시설 종류'
        C73 = '사용형태_출입문'
        C74 = '사용형태_간이주택자재'
        C75 = '사용형태_지붕 재료 석면'
        C76 = '사용형태_산사태 위험지역'
        C77 = '사용형태_외부 창'
        C78 = '사용형태_부엌 환기시설'
        C79 = '사용형태_화장실 환기시설'
        C80 = '사용형태_침실 난방시설'
        C81 = '사용형태_구조 안정성'
        C82 = '사용형태_방풍'
        C83 = '사용형태_방수'
        C84 = '소방차 진입 가능성'
        C85 = '가구원 명의 보유 자동차'
        C86 = '보유자동차 대수'
        C87 = '주차위치'
        C88 = '심각한 교통문제'
        C89 = '주거환경 만족도_백화점 등 접근용이성'
        C90 = '주거환경 만족도_병원 등 접근용이성'
        C91 = '주거환경 만족도_공공기관 접근용이성'
        C92 = '주거환경 만족도_문화시설 등 접근용이성'
        C93 = '주거환경 만족도_대중교통 접근용이성'
        C94 = '주거환경 만족도_주차시설 이용편의성'
        C95 = '주거환경 만족도_출퇴근 및 통학시간'
        C96 = '주거환경 만족도_교육 환경'
        C97 = '주거환경 만족도_치안'
        C98 = '주거환경 만족도_집주변의 소음'
        C99 = '주거환경 만족도_청소상태'
        C100 = '주거환경 만족도_대기오염 정도'
        C101 = '주거환경 만족도_이웃과의 관계'
        C102 = '주거환경 만족도_주변 자연환경'
        C103 = '주거환경 만족도_전반적 주거환경'
        C104 = '주거환경 만족도_전반적 주택'
        C105 = '여부_청약저축'
        C106 = '여부_청약예금'
        C107 = '여부_청약부금'
        C108 = '여부_주택청양종합저축'
        C109 = '여부_일반저축'
        C110 = '여부_기타 가입'
        C111 = '여부_별도저축을 않음'
        C112 = '개수_청약저축'
        C113 = '개수_청약예금'
        C114 = '개수_청약부금'
        C115 = '개수_주택청약종합저축'
        C116 = '가입기간_청약저축 년'
        C117 = '가입기간_청약저축 월'
        C118 = '가입기간_청약예금 년'
        C119 = '가입기간_청약예금 월'
        C120 = '가입기간_청약부금 년'
        C121 = '가입기간_청약부금 월'
        C122 = '가입기간_주택청약종합저축 년'
        C123 = '가입기간_주택청약종합저축 월'
        C124 = '주택청약 신청계획'
        C125 = '2년 내 이사계획'
        C126 = '이사지역'
        C127 = '이사지역_코드'
        C128 = '이사 희망 주택유형'
        C129 = '이사 희망 주택규모_사용면적 단독주택'
        C130 = '이사 희망 주택규모_분양면적 아파트 등'
        C131 = '이사 희망 주택규모_사용면적 아파트 등'
        C132 = '이사 희망 주택규모_사용면적 비거주용건물'
        C133 = '이사 희망 주택규모_주택의 방수'
        C134 = '이사 희망 주택_자가 임대 여부'
        C135 = '이사 희망 주택_자가 주택 마련 방법'
        C136 = '이사 희망 주택_자가 주택가격'
        C137 = '이사 희망 주택_자가 현재주택의 처분'
        C138 = '이사 희망 주택_자가 주택구입자금 희망융자조건'
        C139 = '이사 희망 주택_자가 희망 융자금액 만원'
        C140 = '이사 희망 주택_자가 희망 융자기간 년'
        C141 = '이사 희망 주택_자가 융자 상환 방법'
        C142 = '이사 희망 주택_자가 소득 고려 월 상환액 만원'
        C143 = '이사 희망 주택_전월세 주택 마련 방법'
        C144 = '이사 희망 주택_전월세 여부'
        C145 = '이사 희망 주택_전월세 전세보증금 만원'
        C146 = '이사 희망 주택_전월세 보증금 있는 월세의 보증금 만원'
        C147 = '이사 희망 주택_전월세 보증금 있는 월세의 월세 만원'
        C148 = '이사 희망 주택_전월세 보증금 없는 월세 만원'
        C149 = '이사 희망 주택_전월세 희망융자조건'
        C150 = '이사 희망 주택_전월세 희망융자금액 만원'
        C151 = '이사 희망 주택_전월세 희망융자기간 년'
        C152 = '이사 희망 주택_전월세 융자 상환 방법'
        C153 = '이사 희망 주택_전월세 소득 고려 월 상환액 만원'
        C154 = '현재주택으로 이사한 이유 1'
        C155 = '현재주택으로 이사한 이유 2'
        C156 = '앞으로 이사하려는 이유 1'
        C157 = '앞으로 이사하려는 이유 2'
        C158 = '현재주택으로 이사시 고려사항 1'
        C159 = '현재주택으로 이사시 고려사항 2'
        C160 = '앞으로 이사시 고려사항 1'
        C161 = '앞으로 이사시 고려사항 2'
        C162 = '2년 내 거주외 목적 주택 구입 또는 신축 계획 유무'
        C163 = '2년 내 거주외 목적 주택 구입 또는 신축 개수_채'
        C164 = '은퇴 후 거주_희망 지역'
        C165 = '은퇴 후 거주_주된 생활양식'
        C166 = '은퇴 후 거주_선호 주택유형'
        C167 = '여가 목적 주택 구입 의향'
        C168 = '내 집 마련에 대한 의식_필요성'
        C169 = '내 집 마련에 대한 의식_필요한 이유'
        C170 = '가구원수_현재 명'
        C171 = '가구원수_이전 명'
        C172 = '1A_1관계'
        C173 = '1B_2성별'
        C174 = '1C_3결혼여부'
        C175 = '1D_4주민등록상 연령 세'
        C176 = '1E_5실제동거여부'
        C177 = '1F_6주민등록상 동거여부'
        C178 = '2A_1관계'
        C179 = '2B_2성별'
        C180 = '2C_3결혼여부'
        C181 = '2D_4주민등록상 연령 세'
        C182 = '2E_5실제동거여부'
        C183 = '2F_6주민등록상 동거여부'
        C184 = '3A_1관계'
        C185 = '3B_2성별'
        C186 = '3C_3결혼여부'
        C187 = '3D_4주민등록상 연령 세'
        C188 = '3E_5실제동거여부'
        C189 = '3F_6주민등록상 동거여부'
        C190 = '4A_1관계'
        C191 = '4B_2성별'
        C192 = '4C_3결혼여부'
        C193 = '4D_4주민등록상 연령 세'
        C194 = '4E_5실제동거여부'
        C195 = '4F_6주민등록상 동거여부'
        C196 = '5A_1관계'
        C197 = '5B_2성별'
        C198 = '5C_3결혼여부'
        C199 = '5D_4주민등록상 연령 세'
        C200 = '5E_5실제동거여부'
        C201 = '5F_6주민등록상 동거여부'
        C202 = '6A_1관계'
        C203 = '6B_2성별'
        C204 = '6C_3결혼여부'
        C205 = '6D_4주민등록상 연령 세'
        C206 = '6E_5실제동거여부'
        C207 = '6F_6주민등록상 동거여부'
        C208 = '7A_1관계'
        C209 = '7B_2성별'
        C210 = '7C_3결혼여부'
        C211 = '7D_4주민등록상 연령 세'
        C212 = '7E_5실제동거여부'
        C213 = '7F_6주민등록상 동거여부'
        C214 = '8A_1관계'
        C215 = '8B_2성별'
        C216 = '8C_3결혼여부'
        C217 = '8D_4주민등록상 연령 세'
        C218 = '8E_5실제동거여부'
        C219 = '8F_6주민등록상 동거여부'
        C220 = '9A_1관계'
        C221 = '9B_2성별'
        C222 = '9C_3결혼여부'
        C223 = '9D_4주민등록상 연령 세'
        C224 = '9E_5실제동거여부'
        C225 = '9F_6주민등록상 동거여부'
        C226 = '10A_1관계'
        C227 = '10B_2성별'
        C228 = '10C_3결혼여부'
        C229 = '10D_4주민등록상 연령 세'
        C230 = '10E_5실제동거여부'
        C231 = '10F_6주민등록상 동거여부'
        C232 = '가구주 결혼년도_년'
        C233 = '세대 구성수'
        C234 = '장애인 가구 여부'
        C235 = '장애인 가구 인원_명'
        C236 = '장애인 가구 중 장애인 등록 가구원_명'
        C237 = '현재주택의 가격_자가 만원'
        C238 = '현재주택의 가격_자가 매입가격 만원'
        C239 = '현재주택 임차료_전세 보증금 만원'
        C240 = '현재주택 임차료_월세보증금 만원'
        C241 = '현재주택 임차료_보증금있는 월세 만원'
        C242 = '현재주택 임차료_보증금없는 월세 만원'
        C243 = '구입_임차자금 마련 방법_자가 금융기관 융자 금액 만원'
        C244 = '구입_임차자금 마련 방법_자가 비금융기관 융자 금액 만원'
        C245 = '구입_임차자금 마련 방법_자가 무상 또는 자기자금 만원'
        C246 = '구입_임차자금 마련 방법_임차 금융기관 융자 금액 만원'
        C247 = '구입_임차자금 마련 방법_임차 비금융기관 융자 금액 만원'
        C248 = '구입_임차자금 마련 방법_임차 무상 또는 자기자금 만원'
        C249 = '현재 거주주택의 임차료나 대출금 상환 부담정도'
        C250 = '주거지원 프로그램 필요 여부'
        C251 = '필요한 주거지원 프로그램 1순위'
        C252 = '필요한 주거지원 프로그램 2순위'
        C253 = '가구소득_근로 및 사업소득 가구전체 만원'
        C254 = '가구소득_근로 및 사업소득 가구주 만원'
        C255 = '가구소득_금융소득 만원'
        C256 = '가구소득_부동산 임차료 만원'
        C257 = '가구소득_부동산 매매 차익 만원'
        C258 = '가구소득_기타소득 만원'
        C259 = '가구소득_월평균 총 소득 만원'
        C260 = '지난 1년간 월평균 생활비_만원'
        C261 = '지난 1년간 월평균 주거비_만원'
        C262 = '지난 1년간 저축여부'
        C263 = '월평균 저축액_만원'
        C264 = '저축의 주된 이유_1순위'
        C265 = '저축의 주된 이유_2순위'
        C266 = '총 자산_부동산 만원'
        C267 = '총 자산_부동산 중 주택자산 만원'
        C268 = '총 자산_금융자산 만원'
        C269 = '부채 유무'
        C270 = '총 부채액_만원'
        C271 = '국민기초생활보장대상 여부'
        C272 = '가구주가 된 배경'
        C273 = '가구주 학력'
        C274 = '가구주의 일한 여부'
        C275 = '지난 1주간 일한 내용'
        C276 = '가구주의 근무형태'
        C277 = '가구주의 직장까지 가는 주요 교통수단'
        C278 = '가구주의 통근 시간_편도 분'
        C279 = '무소득 가구주의 일'
        C280 = '읍부, 면부, 동부 코드'
        C281 = '가중치';

    run;
