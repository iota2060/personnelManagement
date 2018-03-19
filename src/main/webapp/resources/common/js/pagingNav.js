/** data 형식 : value 값은 문자열이 아닌 숫자형으로 넣을것 
 * var data = {	"totalNoticeNum" : 총게시물수,
 * 				"choicePage" : 선택페이지,
 * 				"viewNoticeMaxNum" : 한 페이지당 총 게시물 수 (default = 10),
 * 				"viewPageMaxNum" : 한 페이지당 총 페이지 수 (default = 10) }
 * 
 * callbackFunc(obj)  : page 클릭 이벤트 발생 시 할 일 (매개변수)
 *
 * 매개변수  = $(this) : 클릭 이벤트를 발생시킨 대상이므로 
 * page num을 구할 시에는 매개변수 받는매개변수명.attr("name") 로 구할 수 있음 
 * 
 * 예 ) $(append 시킬 위치 노드).pagingNav(data,function(target){
 * 			
 * 			searchStart(target.attr("name")); 
 * 			
 * 		}); 
 * 	
 */ 

//페이징 처리부분 
		 //페이징 처리부분 
    		$.fn.extend({
    			pagingNav : function(data,callbackFunc){
    				
    				var totalNoticeNum = data.totalNoticeNum;
    				
    				//console.log(totalNoticeNum);
    				var choicePage = data.choicePage;
    				var viewNoticeMaxNum = data.viewNoticeMaxNum;
    				var viewPageMaxNum = data.viewPageMaxNum;

    				//값을 넘기지 않았을 시 default 값 지정
    				typeof viewNoticeMaxNum =='undefined' ? viewNoticeMaxNum = 10 : viewNoticeMaxNum;
    				typeof viewPageMaxNum == 'undefined' ? viewPageMaxNum = 10 : viewPageMaxNum;

    				//총 페이지 수
    				var totalPageNum = Math.floor(((totalNoticeNum-1)/(viewNoticeMaxNum))+1);
    				
    				//시작 페이지 번호  
    				var startPageNum = Math.floor((choicePage-1)/viewPageMaxNum)*viewPageMaxNum+1;
    				
    				//마지막 페이지 번호
    				var endPageNum = (startPageNum+viewPageMaxNum)-1;

    				if(endPageNum>totalPageNum) {
    					endPageNum = totalPageNum;
    				}//if
    				
    				//$(this) html 초기화 
    				$(this).html("");
    				
    				$(this).append("<ul class='pagination'></ul>"); //ul append
    				var obj="";

    				//이전 바로 가기 + string
    				if(startPageNum>1) {
    					obj += "<li class='page-item'>";
    					obj += "<a id='ui_pgn_prev' aria-label='Previous' href='#' name='"+(startPageNum-viewPageMaxNum)+"' class='paging-link'>";
    					obj += "<span aria-hidden='true'>&laquo;</span>";
    					obj += "<span class='sr-only'>Previous</span></a></li>"
    				}//if
    				
    				//페이징 부분 + string
    				for(var i=startPageNum; i<=endPageNum; i++){
    					if(i==choicePage){
    						obj += "<li class='page-item active'>";
    					}else{
    						obj += "<li class='page-item'>"
    					}//if else
    					 obj += "<a href='javascript:void(0)' name='"+i+"' aria-label='Previous' class='page-link'>";
    					 obj += "<span>"+i+"</span></a></li>"
    				}//for
    				
    				//다음 페이지 + string
    				if(endPageNum<totalPageNum) {
    					obj += "<li class='page-item'>";
    					obj += "<a href='#' name='"+(startPageNum+viewPageMaxNum)+"' aria-label='Next' id='ui_pgn_next' class='page-link'>";
    					obj += "<span aria-hidden='true'>&raquo;</span>";
    					obj += "<span class='sr-only'>Next</span></a></li>";
    				}//if
    				
    				$(this).children("ul").append(obj);

    				//이벤트 등록
    				$(".page-item a").on('click',function(){
    				
    					if( typeof(callbackFunc) == "string" ) {
    						eval( callbackFunc )($(this));
    					} else if( typeof(callbackFunc) == "function" ) {
    						callbackFunc($(this));
    					}// else if
    					
    				});//onClick

    			}//pagingNav
    		});//extend