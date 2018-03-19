<!--
/**
 * @author 유건상 (ggonsika@naver.com, http://blog.naver.com/ggonsika)
 * 
 * 맨 위의 이름은 가능한한 남겨주시고 (^^)
 * 사용자 마음대로 수정을 가하셔도 법적 처벌은 얼토당토하며
 * 무한카피, 무한 배포는 필수입니다.
 */

/**
 * [설명]
 * java 의 Map 인터페이스와 유사하게 사용가능하다.
 * 내부적으로 key=value 형태를 javascript 의 Object 를 이용하여 구현했다.
 *
 * [생성자]
 * 1. JMap()
 *
 * [Public Method]
 *   - map.get(key):object - 지정된 key 에 해당하는 value 를 얻는다
 *   - map.remove(key):void - 지정된 key 에 해당하는 value 를 삭제한다
 *   - map.keys():array - 전체 Key 값들을 배열로 얻는다
 *   - map.values():array - 맵의 전체 값들을 배열로 얻는다
 *   - map.containsKey(key):boolean - key 가 포함되어 있다면 true 를 반환한다.
 *   - map.isEmpty():boolean - 맵이 비어있다면 true 를 반환한다.
 *   - map.clear():void - 맵을 비운다
 *   - map.size():int - 맵을 크기를 얻는다
 *   - map.getObject():object - MapData Object 를 얻는다
 *
 * [사용예]
 * <html>
 * <head>
 * <script language=javascript src="JMap.js"></script>
 * <script language=javascript>
 * <!--
 *     var map = new JMap();
 *     map.put("a", "11");
 *     map.put("b", "22");
 *     map.put("c", "33");
 *     
 *     alert("map.size()=" + map.size());
 *     alert("map.isEmpty()=" + map.isEmpty());
 *     alert("map.get('a')=" + map.get('a'));
 *     alert("map.containsKey('a')=" + map.containsKey('a'));
 *     map.remove('a');
 *     alert("map.remove('a')");
 *     alert("map.containsKey('a')=" + map.containsKey('a'));
 *     alert("map.get('a')=" + map.get('a'));
 *     alert("map.keys()=" + map.keys());
 *     alert("map.values()=" + map.values());
 *     map.clear();
 *     alert("map.clear()");
 *     alert("map.size()=" + map.size());
 *     alert("map.getObject()=" + map.getObject());
 * -->
 * </script>
 * </head>
 * </html>
 * 
 */
var JMap = function (obj) {
    
	/* Map Data 저장 각체 */
	var mapData = (obj != null) ? cloneObject(obj) : new Object();
	
	/**
	 * public
	 * 지정된 key 에 해당하는 value 를 넣는다
	 * @param key 키
	 * @param value 값
	 */
	this.put = function(key, value) {
		mapData[key] = value;
	}
	
	/**
	 * public
	 * 지정된 key 에 해당하는 value 를 얻는다
	 * @param key 키값
	 * @return 키에 해당하는 값
	 */
	this.get = function(key) {
		return mapData[key];
	}
	
	/**
	 * public
	 * 지정된 key 를 삭제한다
	 * @param key 키값
	 */
	this.remove = function(key) {
		for (var tKey in mapData) {
			if (tKey == key) {
				delete mapData[tKey];
				break;
			}
		}
	}
	
	/**
	 * public
	 * 맵의 전체 Key 값들을 배열로 얻는다
	 * @return key 값들의 Array
	 */
	this.keys = function() {
		var keys = [];
		for (var key in mapData) {
			keys.push(key);
		}
		return keys;
	}
	
	/**
	 * public
	 * 맵의 전체 값들을 배열로 얻는다.
	 * @return key 값들의 Array
	 */
	this.values = function() {
		var values = [];
		for (var key in mapData) {
			values.push(mapData[key]);
		}
		return values;
	}
	
	/**
	 * public
	 * Map에 key 가 포함되어 있다면 true
	 * @param key 키값
	 * @return 키값 포함 여부
	 */
	this.containsKey = function(key) {
		for (var tKey in mapData) {
			if (tKey == key) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * public
	 * Map이 비어있다면 true
	 * @return 맵이 비었는지의 여부
	 */
	this.isEmpty = function() {
		return (this.size() == 0);
	}
	
	/**
	 * public
	 * Map을 비운다
	 */
	this.clear = function() {
		for (var key in mapData) {
			delete mapData[key];
		}
	}
	
	/**
	 * public
	 * Map을 크기를 얻는다
	 * @return 맵의 크기
	 */
	this.size = function() {
		var size = 0;
		for (var key in mapData) {
			size++;
		}
		return size;
	}
	
	/**
	 * public
	 * Object 객체를 얻는다 (JSON 과 같은 외부 작업을 위해..)
	 * @return 문자열
	 */
	this.getObject = function() {
		return cloneObject(mapData);
	}
	
	/**
	 * private
	 * Object 객체를 얻는다 (JSON 과 같은 외부 작업을 위해..)
	 * @return 문자열
	 */
	var cloneObject = function(obj) {
		var cloneObj = {};
		for (var attrName in obj) {
			cloneObj[attrName] = obj[attrName];
		}
		return cloneObj;
	}
} // End of JMap Class

//-->


