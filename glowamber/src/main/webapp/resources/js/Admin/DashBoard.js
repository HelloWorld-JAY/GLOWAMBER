$(function(){
	/* 년도 출력 */
	let date = new Date()
	let year = date.getFullYear()
	let nowmonth = date.getMonth()+1
	
	for(let i=0;i<10;i++){
		$('#year').append($('<option/>').val(year-i).text(year-i+"년"))
	}
	
	for(let i=1;i<13;i++){
		if(i<10){
			$('#month').append($('<option />').val("0"+i).text(i+"월"))
		}else{
			$('#month').append($('<option/>').val(i).text(i+"월"))
		}
	}
	
	/* 현재 월값 기본으로 하기 */
	let targetOption = $('#month').find(`option[value='${nowmonth}']`);
	targetOption.prop('selected',true)
	
	/* 차트를 넣을 캔버스 */
	const psChartCanvas = $('#monthlyPSCanvas')
	let psChart = null
	
	/* 월별 매입매출 차트 생성*/
	function createpsChart(data1,data2){
		if(psChart){
			psChart.destroy(); // 기존차트 삭제
		}
		
		psChart = new Chart(psChartCanvas,{
			type : 'bar'
			,data : {
				labels : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
				,datasets : [
					{
						label : '매입'
						,data : data1
						,backgroundColor : '#2a4bc0'
					}
					,{
						label : '매출'
						,data : data2
						,backgroundColor : '#c02a4b'
					}
				]
			}
			,options : {
				scales: {
                    y: {
                        beginAtZero: true	
                    }
                }
			}
		}) // chart-end
	}	//createpsChart-end
	
	
	/* 차트에 넣을 데이터 가져오기 */

	function fetchData(year){
		$.ajax({
			type : 'post'
			,data : { year : year}
			,url : '/glowamber/getChartData'
			,dataType : 'json'
			,success : function(result){
				for(data of result){
					if(data['storeStatus']=='입고'){
							/* 어떤 달에 입고되었는지 */
							let month = data['storeDate'].split('-')[1];
							
							/* 입고가격 구하기 */
							let purchase = data['storePrice'] * data['storeCount']
							
							monthlypurchasedata[month-1] += purchase
						}
						if(data['storeStatus']=='출고'){
							/* 어떤 달에 출고되었는지 */
							let month = data['storeDate'].split('-')[1];
							
							/* 출고가격 구하기 */
							let purchase = data['storePrice'] * data['storeCount']
							
							monthlysaledata[month-1] += purchase
						}
				}
				createpsChart(monthlypurchasedata,monthlysaledata)
			}
			,error: function (xhr, status, error) {
                console.error("데이터를 가져오는 데 실패했습니다:", error);
                alert("데이터 로드 실패!");
            }
		})
	}
	
	/* 초기 차트 생성 */
	let monthlypurchasedata = []
	let monthlysaledata = []
	
	for(let i=0;i<12;i++){
		monthlypurchasedata.push(0)
		monthlysaledata.push(0)
	}
	
	const initialYear = $("#year").val()
    fetchData(initialYear)
    
	/* 연도 바꿀때 */
	$('#year').change(function(){
	
		monthlypurchasedata = []
		monthlysaledata = []
		
		for(let i=0;i<12;i++){
			monthlypurchasedata.push(0)
			monthlysaledata.push(0)
		}
		
		let selectedYear = $(this).val()
		fetchData(selectedYear)
		
		
	})
	
	
	
	
	/********* 이번달 목표 매출 달성 현황 ***********/
	let targetSaleChart = $("#targetSaleCanvas")
	let SaleChart = null
	
	function createTargetSaleChart(data1,data2){
		if(SaleChart){
			SaleChart.destroy(); // 기존차트 삭제
		}
		
		// 목표 대비 퍼센트 계산
		const percentAchieved = (data1 / data2 * 100); 	// 달성률
		const remainingPercent = (100 - percentAchieved);	// 미달성률
		 SaleChart = new Chart(targetSaleChart, {
            type: 'doughnut'
            ,data: {
                labels: ['달성률 (%)', '미달성률 (%)']
                ,datasets: [{
                    data: [percentAchieved, remainingPercent] 
                    ,backgroundColor: [
                        '#c02a4b' // 달성률색
                        ,'#2a4bc0'  // 미달성률색
                    ]
                }]
            }
        }) // chart-end
	}	//createpsChart-end
	
	/* 매출액 데이터 가져오기 */
	function fetchSalesData(month,year) {
        $.ajax({
            url: '/glowamber/getSaleChartData'
            ,type: 'post'
            ,data: { 
            	 year : year
            	,month : month
            }
            ,dataType : 'json'
            ,success: function (result) {
            
            	for(sales of result){
            		let totalprice = sales['storePrice'] * sales['storeCount']
            		actualSales += totalprice								// 현재 매출액
            	}
            	$("#totalsale").text(actualSales)
                targetSales = 100;											// 목표 매출
                createTargetSaleChart(actualSales, targetSales); 			// 차트 갱신
            }
            ,error: function (error) {
                console.error("데이터를 가져오는 데 실패했습니다:", error);
                alert("데이터 로드 실패!");
            }
        });
    }
	
	
	
	/* 차트 출력 */
	let actualSales = 0;		// 현재 매출액
	let targetSales	= 0;		// 목표 매출액
	
	const initialMonth = $("#month").val();
    fetchSalesData(initialMonth,year);
	
	$("#month").change(function () {
		actualSales = 0;		
		targetSales	= 0;
        let selectedMonth = $(this).val();
        fetchSalesData(selectedMonth,year);
    });

})