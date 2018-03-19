/**
 * ssTree 
 * 
 * $("target").ssTree(JSON)
 * 
 * click event 
 * 
 * $("target li").clickEvent();
 * 
 * li add event
 * 
 * $("button").addEvent();
 * 
 * JSON DATA 형식 예
 * 
 * root parent code  = 0;
 * 예){"data":[{mnNo=301, mnPrntNo=120, mnName=test300, mnIdx=0},{mnNo=301, mnPrntNo=0, mnName=test300, mnIdx=0}]}
 * 
 * 
 */
        $.fn.extend({
        	//data append menu tree
            ssTree:function(data){
            	//menu icon class name	
                var openedClass= 'glyphicon-folder-open',
                    closedClass= 'glyphicon-folder-close';
                
                //menu parent code
                var mnPrntNo;
                //menu idx
                var mnIdx;
                
                //menu append 
                $.each(data,function(index,dataThis){
                    mnPrntNo = dataThis.mnPrntNo;
                    mnIdx = dataThis.mnIdx;
  
                    //ul append
                    if($("#tree #"+mnPrntNo).find("ul").length==0){
                        $("#tree #"+mnPrntNo).append("<ul></ul>");
                    }//if

                    var lastLiMnIdx =  ""+$("#tree #"+mnPrntNo).find("ul:eq(0)>li:last").attr("name");
                    
                    //li append
                    $("#tree #"+mnPrntNo).find("ul:eq(0)").append("<li id='"+dataThis.mnNo+"' name='mnIdx"+mnIdx+"'><span>"+dataThis.mnName+"</span></li>");
                 
                });//data each

                var tree = $(this);
                
                //class add
                tree.addClass("tree");

                //li icon append
                tree.find('li').each(function (index) {

                    if($(this).has("ul").length>0){
                        var branch = $(this); //li with children ul
                       
                        branch.prepend("<i class='indicator glyphicon " + closedClass + "'></i>");
                        branch.addClass('branch');
                        
                        //toggle()
                        branch.children().children().toggle();
                    }//if
               	 	//root menu open
                    if(index==0){
                        $(this).openMenu();
                        $(this).addClass("current");
                    }
                });//tree each
            },//end ssTree
            //openMenu event
            openMenu : function(e){
            	//menu icon class name	
                var openedClass= 'glyphicon-folder-open',
                    closedClass= 'glyphicon-folder-close';

                var icon = $(this).children('i:first');
                icon.toggleClass(openedClass + " " + closedClass);
                $(this).children().children().toggle();

                //event bubbling block
                if(e!=undefined){
                    if(e.stopPropagation) e.stopPropagation(); //MOZILLA
    		        else e.cancelBubble = true; //IE
                }//if
            },//end openMenu
            //menu add
            addMenu : function(){
            	//menu icon class name	
                var openedClass= 'glyphicon-folder-open',
                    closedClass= 'glyphicon-folder-close';
                
                //ul&icon append
                if($(this).find("ul").length==0){
                    $(this).append("<ul></ul>");
                    $(this).addClass('branch');
                    $(this).prepend("<i class='indicator glyphicon " + closedClass + "'></i>");
                }//if
                
                //menu open
                if($(this).has("ul").children('i:first.glyphicon-folder-close').length>0){
                    $(this).has("ul").openMenu();
                }//if
                
                //li append
                $(this).children("ul").append("<li name='new' class='current'><span>new</span></li>");
                $("[name='new']").parents(".current").removeClass("current");
                $("[name='new']").clickEvent();
                
                //form html append ajax
                paging.ajaxSubmit("menuInsertForm.do","",function(html){
                	$("[name='detail']").html(html);
                    var newMenu = $("[name='new']");
                    var prnt = newMenu.parents('li:eq(0)');
                    
                    $("input[name='mnPrntNo']").val(prnt.attr("id"));
                    $("input[name='mnIdx']").val(newMenu.siblings().length); 
                },true,"html");//paging.ajaxSubmit
       
            },//end addMenu
            //menu click event 
            clickEvent : function(){
            	//이벤트 등록 
                $(this).on('click',function(e){
                	//현재 대상외 class 삭제
                    $("#tree li.current").removeClass("current");
                    //대상 class 추가 
                    $(this).addClass("current");
                    //메뉴 오픈 
                    $(this).openMenu(e); 
                   
                    //기본 루트 li 제외 if
                    if($(this).attr("id")!="0"){
                    	paging.ajaxSubmit("menuDetail.do",{mnNo:$(this).attr("id")},function(html){
                    		 $("[name='detail']").html(html);
                    	},true,"html");//paging.ajaxSubmit
                    }//if
                });//on click event
            },//end clickEvent
            //add event
            addEvent : function(){
                $(this).on("click",function(){
                    $("#tree li.current").addMenu();//메뉴 추가 
                    $(this).off("click"); //메뉴추가 이벤트 제거
                    $("#tree li").off("click"); //menu tree 이벤트 제거 
                });//onclick
            }//end addEvent
        });//end extend