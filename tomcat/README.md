1. 구조 
<img src="https://user-images.githubusercontent.com/52188918/121293854-4bf22500-c927-11eb-8d70-b25f7dfa3b56.png"  width="700" height="370">

2. role 이란? 

	Role은 파일이 특정 디렉토리 이름에 들어있을 것이라고 예상한다. Role은 이러한 디렉토리 중 하나 이상이 포함되어야하지만 사용되지 않는 디렉토리는 제외해도 된다. 
	사용중인 각 디렉토리는 관련 컨텐츠를 가지고 있는 main.yml 파일을 반드시 포함해야한다.:

3. role 내부 디렉토리 
        
        
        tasks : role에 의해 실행될 주요 task 목록을 포함한다.
        handlers : 해당 role 또는 이외의 다른 곳에서 사용할 수 있는 핸들러를 포함한다.
        defaults : role의 디폴트 변수 (자세한 내용은 변수 사용 참조)
        vars : role에 대한 다른 변수 (자세한 내용은 변수 사용 참조)
        files : 해당 role을 통해 배포 할 수 있는 파일이 포함되어 있다.
        templates : 해당 role을 통해 배포 할 수 있는 템플릿이 포함되어 있다.
        meta : 해당 role에 대한 일부 메타 데이터를 정의한다. 자세한 내용을 아래를 참조하라.
