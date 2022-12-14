/* -----------------------------------------------------------------------
작성일 : 2022년 12월 16일
작성자 : 이관희
기  능 : 네비게이션, 키오스크등에 활용할 초성 검색 함수

SELECT 결과 = [DBO].[UF_초성조회] ('아버지')
--------------------------------------------------------------------------*/
CREATE FUNCTION [DBO].[UF_초성조회] (@입력문자 NVARCHAR(500))
	RETURNS	NVARCHAR(500)
AS
BEGIN

	DECLARE  @문자길이	INTEGER
			,@변환위치	INTEGER
			,@변환문자	NVARCHAR(1)

	DECLARE	@초성결과	NVARCHAR(200) = ''
	SSS
	SET @문자길이 = LEN(@입력문자)
	SET @변환위치 = 0
	SET @초성결과 = ''

	WHILE 1 = 1 BEGIN

		SET @변환위치 = @변환위치 + 1

		IF (@변환위치 > @문자길이 OR @변환위치 > 100) BREAK

		SET @변환문자 = UPPER(SUBSTRING(@입력문자, @변환위치, 1))

		IF (@변환문자 >= '가' AND @변환문자 <= '깋') SET @초성결과 = @초성결과 + 'ㄱ'
   ELSE IF (@변환문자 >= '나' AND @변환문자 <= '닣') SET @초성결과 = @초성결과 + 'ㄴ'
   ELSE IF (@변환문자 >= '다' AND @변환문자 <= '딯') SET @초성결과 = @초성결과 + 'ㄷ'
   ELSE IF (@변환문자 >= '라' AND @변환문자 <= '맇') SET @초성결과 = @초성결과 + 'ㄹ'
   ELSE IF (@변환문자 >= '마' AND @변환문자 <= '밓') SET @초성결과 = @초성결과 + 'ㅁ'
   ELSE IF (@변환문자 >= '바' AND @변환문자 <= '빟') SET @초성결과 = @초성결과 + 'ㅂ'
   ELSE IF (@변환문자 >= '사' AND @변환문자 <= '싷') SET @초성결과 = @초성결과 + 'ㅅ'
   ELSE IF (@변환문자 >= '아' AND @변환문자 <= '잏') SET @초성결과 = @초성결과 + 'ㅇ'
   ELSE IF (@변환문자 >= '자' AND @변환문자 <= '짛') SET @초성결과 = @초성결과 + 'ㅈ'
   ELSE IF (@변환문자 >= '차' AND @변환문자 <= '칳') SET @초성결과 = @초성결과 + 'ㅊ'
   ELSE IF (@변환문자 >= '카' AND @변환문자 <= '킿') SET @초성결과 = @초성결과 + 'ㅋ'
   ELSE IF (@변환문자 >= '타' AND @변환문자 <= '팋') SET @초성결과 = @초성결과 + 'ㅌ'
   ELSE IF (@변환문자 >= '파' AND @변환문자 <= '핗') SET @초성결과 = @초성결과 + 'ㅍ'
   ELSE IF (@변환문자 >= '하' AND @변환문자 <= '힣') SET @초성결과 = @초성결과 + 'ㅎ'
   ELSE IF (@변환문자 >= '빠' AND @변환문자 <= '삫') SET @초성결과 = @초성결과 + 'ㅃ'
   ELSE IF (@변환문자 >= '싸' AND @변환문자 <= '앃') SET @초성결과 = @초성결과 + 'ㅆ'
   ELSE IF (@변환문자 >= '짜' AND @변환문자 <= '찧') SET @초성결과 = @초성결과 + 'ㅉ'
   ELSE IF (@변환문자 >= 'A'  AND @변환문자 <= 'Z') SET @초성결과 = @초성결과 + @변환문자
   ELSE IF (@변환문자 >= '0'  AND @변환문자 <= '9') SET @초성결과 = @초성결과 + @변환문자
   ELSE												SET @초성결과 = @초성결과 + @변환문자
END

RETURN	@초성결과
END
	