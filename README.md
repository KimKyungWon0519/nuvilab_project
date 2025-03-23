# 누비랩 사전과제 프로젝트

- Flutter Version : 3.7.12
- Architecture : CleanArchitecture

### 프로젝트 초기화
1. .env를 project root 경로에 추가
2. 아래의 커맨드 실행
```
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### 실행 / 설치 방법
```
flutter run --dart-define-from-file=.env <build_option>
```

```
flutter build apk --dart-define-from-file=.env <build_option>

flutter install
```

### 전략
1. 미세먼지와 초미세먼지를 API로 부터 받아올 때 병렬로 가져옴.  
직렬로 가져올 시 `미세먼지 API 소요 시간 + 초미세먼지 API 소요 시간` 걸리지만, 병렬로 가져올 시 `중복 소요 시간 + (미세먼지 API 소요 시간 - 초미세먼지 API 소요 시간)`으로 계산된다.
2. LocalStorage에 데이터를 저장할 때 비동기로 저장하여 대기 시간을 줄임