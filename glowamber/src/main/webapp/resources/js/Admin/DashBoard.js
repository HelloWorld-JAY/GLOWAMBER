$(function(){
	SelectYear()
	
	/* 년도 출력 */
	function SelectYear(){
		let date = new Date()
		let year = date.getFullYear()
		for(let i=0;i<10;i++){
			$('#year').append($('<option/>').val(year-i).text(year-i))
		}
	}
	
	$('#year').change(function(){
		mothlychart()
	})
	
	/* 월별 매입매출 차트 */
	function mothlychart(){
		let monthlyCanvas = $('#monthlyPurchaseSalesCanvas')
		
		let monthlychartlabels = []
		let monthlysaledata = []
		let monthlypurchasedata = []
		
		/* 차트에 넣을 데이터 만들기 */
		for(let i=1;i<13;i++){
			monthlychartlabels.push(i);
			monthlysaledata.push(0);
			monthlypurchasedata.push(0);
		}
		$.ajax({
			type : 'post'
			,url : '/glowamber/getChartData'
			,dataType : 'json'
			,success : function(result){
				for(data of result){
				console.log(data['storeDate'].split('-')[0])
					if($('#year').val()==data['storeDate'].split('-')[0]){
						if(data['storeStatus']=='입고'){
							/* 어떤 달에 입고되었는지 */
							let month = data['storeDate'].split('-')[1];
							
							/* 입고가격 구하기 */
							let purchase = data['storePrice'] * data['storeCount']
							
							monthlypurchasedata[month-1] += purchase
						}
						if(data['storeStatus']=='출고'){
							/* 어떤 달에 입고되었는지 */
							let month = data['storeDate'].split('-')[1];
							
							/* 입고가격 구하기 */
							let purchase = data['storePrice'] * data['storeCount']
							
							monthlysaledata[month-1] += purchase
						}
					}
				}
			}
		})
		/* 차트 생성 */
		let monthlychart = new Chart(monthlyCanvas,{
			type : 'bar'
			,data : {
				labels : monthlychartlabels
				,datasets : [
					{
						label : '매입'
						,data : monthlypurchasedata
					}
					,{
						label : '매출'
						,data : monthlysaledata
					}
				]
			}
			,options: {
				  responsive: true					// 반응형 여부 (기본값 true)
				  ,maintainAspectRatio: true 		// 크기 고정
				  ,plugins: {
				  	tooltip: { 						// 튤팁 스타일링
				      enabled: true, 				// 튤팁 활성화 (기본값 true)
				      backgroundColor: '#h3h3h3', 	// 튤팁 색상
				      padding: 10					// 튤팁 패딩
				    }
				    ,legend: { 						// 범례 스타일링
				        position: 'bottom' 			// 범례 위치
				    }
				  }
				  ,scales: {
			            yAxes: [
			            	{
			               		 ticks: {
			                    	beginAtZero: true
			                	 }
			            }]
			            ,xAxes: [{
			                stacked: true
			            }]
			       }
			}
		})
	}
	
	/* 이번달에 가장 많이 팔린 카테고리보기 */
    function mostCateChart(){
    	let mostCateCanvas = $('#monthMostCateCanvas')
    	
    	let catechart = new Chart(mostCateCanvas,{
			type : 'doughnut'
			,data : {
				labels : monthlychartlabels
				,datasets : [
					{
						label : '매입'
						,data : monthlypurchasedata
					}
					,{
						label : '매출'
						,data : monthlysaledata
					}
				]
			}
			,options: {
				  responsive: true, 				// 반응형 여부 (기본값 true)
				  maintainAspectRatio: true, 		// 크기 고정
				  plugins: {
				  	tooltip: { 						// 튤팁 스타일링
				      enabled: true, 				// 튤팁 활성화 (기본값 true)
				      backgroundColor: '#h3h3h3', 		// 튤팁 색상
				      padding: 10					// 튤팁 패딩
				    },
				    legend: { 						// 범례 스타일링
				        position: 'bottom' 			// 범례 위치
				    }
				  },
				  scales: { 						// x축과 y축에 대한 설정
					x: {
				      grid: { 						// 축에 대한 격자선
				        display: false, 			// grid 활성화 (기본값 true)
				      }
				   	},
				    y: {
				      min: 0, 						// y축에 대한 최소값
				      max: 50, 						// y축에 대한 최대값
				      border: { 					// 축에 대한 테두리 속성
				      	dash: [5, 5] 				// 점선 형태
				      },
				    }
				  }
			}
		})
    }
    
    
    
})