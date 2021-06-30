1. ansible.cfg 파일수정
2. ansible vault password 생성
3. New integration 연동
4. ansible-playbook /usr/local/bin -> /usr/bin path 변경
5. ansible-playbook chmod 755 
6. /etc/ansible/hosts 파일에 ip 하나 아무거나 넣어놓기
7. 테스트입니다.



# ansible playbook
  
  ansible은 IAC 도구입니다. 
  설치는 apt-get install -y ansible으로 설치를 합니다.
  
  추가적으로 sshpass install을 하여 기본적으로 vault password를 통해 ssh 접속을 하게 합니다.
  
# inventory

  ansible의 inventory는 앤서블 target을 지정해주는 역할을 합니다.
  인벤토리 파일인 hosts는 Github으로 관리하지 않겠습니다.
  
  운영환경에서는 ansible controll machine ( ACM ) 내부에 script를 통해 엔서블-playbook 실행 시 
  인벤토리를 /etc/ansible/${env: deploymentid}/ 디렉토리를 생성한후 
  hosts 파일을 생성합니다.
  
  인벤토리는 기본적으로 blueprint 내부에서 설정 property를 사용합니다.
  
# host_variable 

  inventory 안에 생성되는 host_vars 파일안에 타겟이 되는 vm의 아이피로 
  디렉토리를 생성하며, 그안에 vault password와 ansible_user등 지역변수를 생성합니다.
  
  위에 설명한 vault pass, ansible_user 을 제외한 다른 변수들은
  blueprint 안에서 , host_variable을 통해 deploy가 실행될시에 지역변수를 생성합니다.
  
# 인증 방법

  ansible의 인증방법 중 가장 많이 쓰는 부분은 sshpass / PublicPrivateKey / vault 암호 등이 있습니다.
  기본적으로 테스트 환경에서는 Public Private Key를 사용하겠습니다.
  
  ssh-keygen -t rsa 를 통해 PrivateKey를 생성합니다.
  생성한 뒤에 권한을 chmod를 통해 설정합니다.
  
  cd /root/.ssh/
  cat id_rsa.pub 의 퍼블릭 키를 복사하거나 (ssh-copy-id) 를 사용하여 키를 복사합니다.
  
  kpkim@local-host$ ssh-copy-id -i ~/.ssh/id_rsa.pub 172.10.0.x 
  
  
  @ vault password 사용을 원할시에
  
    1. sshpass 를 설치하고
    
    (도큐먼트 참고) 하여 기본세팅
    https://docs.vmware.com/en/vRealize-Automation/8.4/Using-and-Managing-Cloud-Assembly/GUID-9244FFDE-2039-48F6-9CB1-93508FCAFA75.html

    2. 여기서 주의할점은 ansible.cfg 에서 
    
    [default]
    ### 이부분에 vault 패스워드 경로를 적어야 한다
    ### 나는 echo로 추가했는데 이경우에 [diff] 아래에 적용이 되어 에러를 발생한다.
  
  
  
  			<table id="tableCustomCPU" class="dataTable-cell dataTable-hover" style="width: 100%;">
				<thead>
					<tr>
						<th id="name1">클러스터</th>
						<th>기준 CPU</th>
						<th id="vmName">가상머신 </th>
						<th>CPU</th>
						<th>Memory</th>
						<th>Disk</th>
						<th>Network</th>
						<th>시작 일시</th>
						<th>종료 일시</th>
						<th>기간</th>
						<th>1일 횟수</th>
					</tr>
				</thead>
			</table>
      
      
      
      function getCustomCPUList(cpu, clusterId, clusterName, serviceGroupId, serviceGroupName, category, startDate, endDate, startTime, endTime) {
			var userId = '0';
			if(sessionUserApproval < USER_CHECK){
				userId = sessionUserPK;
			}
			var tableCustomCPU = $('#tableCustomCPU').addClass('nowrap').DataTable({
				dom: 'B<"dataTable-body"rt><"dataTable-footer"ifp>',
				ajax: {
					url: '/performance/selectVMOvercpuList.do',
					type: 'POST',
					dataSrc: '',
					data: {
						cpu: cpu,
						clusterId: clusterId,
						tenantId: serviceGroupId,
						category: category,
						isUserTenantMapping: isUserTenantMapping,
						startDate: startDate,
						endDate: endDate,
						startTime: startTime,
						endTime: endTime,
						id: userId
					}
				},
				columns: [
					{data: 'vmName', render: function(data, type, row) {
						data = category == 'cluster' ? clusterName : serviceGroupName;
						return data;
					}},
					{data: 'cpu', render: function(data, type, row) {
						data = cpu + ' %';
						return data;
					}},
					{data: 'vmName', render: function(data, type, row) {
						data = '<a href="#">' + data + '</a>';
						return data;
					}},
					{data: 'cpu', render: function(data, type, row) {
						data = '<span class="text-danger">' + data + ' %</span>';
						return data;
					}},
					{data: 'memory', render: function(data, type, row) {
						data = data + ' %';
						return data;
					}},
					{data: 'disk', render: function(data, type, row) {
						data = data + ' KB';
						return data;
					}},
					{data: 'network', render: function(data, type, row) {
						data = data + ' KB';
						return data;
					}},
					{data: 'startDate'},
					{data: 'endDate'},
					{data: 'cnt', render: function(data, type, row) {
						data = data * 5 + '분';
						return data;
					}},
					{data: 'co'},
				],
				language: datatables_lang,
				colReorder: true,
				stateSave: true,
				lengthMenu: [[10, 25, 50, -1], ['10', '25', '50', '전체']],
				columnDefs: [{visible: false, targets: 1}],
				buttons: [{
					extend: 'collection',
					text: '내보내기',
					className: 'btn btn-export',
					buttons: [{
						extend: 'csvHtml5',
						charset: 'UTF-8',
						bom: true,
						text: 'CSV',
						title: 'CPU 기준 성능'
					}, {
						extend: 'excelHtml5',
						text: 'Excel',
						title: 'CPU 기준 성능'
					}]
				}, {
					extend: 'pageLength',
					className: 'btn btn-page',
				}, {
					extend: 'colvis',
					text: '테이블 편집',
					className: 'btn btn-colvis'
				}]
			});
			
			page_move();
		}




