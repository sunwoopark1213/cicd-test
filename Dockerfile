# 1단계: 베이스 이미지 설정
FROM python:3.14-alpine

# 2단계: 작업 디렉토리 설정
WORKDIR /app

# 3단계: 종속성 설치 (캐시 활용을 위해 먼저 복사)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4단계: 소스 코드 복사
COPY . .

# 6단계: 실행 명령 (Uvicorn)
# --host 0.0.0.0은 외부 접속을 허용하기 위해 반드시다.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]