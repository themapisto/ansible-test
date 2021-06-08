

# ansible playbook
  
  ansible은 IAC 도구입니다. 
  설치는 apt-get install -y ansible으로 설치를 합니다.
  
  추가적으로 sshpass install을 하여 기본적으로 vault password를 통해 ssh 접속을 하게 합니다.
  






# inventory

  ansible의 inventory는 앤서블 target을 지정해주는 역할을 합니다.
  인벤토리 파일인 hosts는 Github으로 관리하지 않겠습니다.
  사내 저장소를 쓰거나 Github의 private 저장소를 쓴다면 Github으로 관리 합니다.
  다만 여기에서의 예제는 Github public 저장소를 기준으로 하기 때문에 민감한 정보가 외부에 공개될 수 있습니다.
  마찬가지로 이 예제를 진행하시는 분들도 정보 공개 위험이 있으니 안전하게 진행하겠습니다.
  
  
# 인증 방법

  ansible의 인증방법 중 가장 많이 쓰는 부분은 sshpass / PublicPrivateKey / vault 암호 등이 있습니다.
  기본적으로 테스트 환경에서는 Public Private Key를 사용하겠습니다.
  
  ssh-keygen -t rsa 를 통해 PrivateKey를 생성합니다.
  생성한 뒤에 권한을 chmod를 통해 설정합니다.
  
  cd /root/.ssh/
  cat id_rsa.pub 의 퍼블릭 키를 복사하거나 (ssh-copy-id) 를 사용하여 키를 복사합니다.
  
  kpkim@local-host$ ssh-copy-id -i ~/.ssh/id_rsa.pub 172.10.0.x 
  
  

