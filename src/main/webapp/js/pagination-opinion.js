//<ul class="page-navigation mt20">
//</ul>
var ul_page = document.querySelector("ul.page-navigation");

function setPaginationInit(data) {
	while (ul_page.hasChildNodes()) {
		ul_page.removeChild(ul_page.childNodes[0]);
	} 
		
	setDoublePrev(data);
	setPrev(data);
	setPageNum(data);
	setNext(data);
	setDoubleNext(data);
}

function getLiElement() {
	var li = document.createElement("li");
	li.classList.add("page-item");
	
	return li;
} 

function setDoublePrev(data) {
	var li = getLiElement();
	
	if (data.curPage === 1) {
		li.classList.add("disabled");
	}
	
	var a_double_prev = 
		'<a class="page-link" onclick="fn_paging(1);">' +
			'<span class="fa-angle-double-left"></span>' +
		'</a>';
	
	li.innerHTML = a_double_prev;
	ul_page.appendChild(li);
}

function setPrev(data) {
	var li = getLiElement();
	
	if (data.curPage === 1) {
		li.classList.add("disabled");
	}
	
	var a_prev = 
		'<a class="page-link" onclick="fn_paging(' + data.prevPage + ');">' +
			'<span class="fa-angle-left"></span>' +
		'</a>';
	
	li.innerHTML = a_prev;
	ul_page.appendChild(li);
}

function setPageNum(data) {
	for (var i = data.startPage; i <= data.endPage; i++) {
		var li = getLiElement();
		li.classList.add("text");
		
		var a;
		
		if (i === data.curPage) {
			li.classList.add("active");
			li.setAttribute("aria-current", "page");
			
			a = '<a class="page-link">' + i + '</a>';
		} else {
			a = '<a class="page-link" onclick="fn_paging(' + i + ');">' + i + '</a>';
		}
		
		li.innerHTML = a;
		ul_page.appendChild(li);
	}
}

function setNext(data) {
	var li = getLiElement();
	
	if (data.curPage === data.pageCnt) {
		li.classList.add("disabled");
	}
	
	var a = 
		'<a class="page-link" onclick="fn_paging(' + data.nextPage + ');">' +
			'<span class="fa-angle-right"></span>' +
		'</a>';
	
	li.innerHTML = a;
	ul_page.appendChild(li);
}

function setDoubleNext(data) {
	var li = getLiElement();
	
	if (data.curPage === data.pageCnt) {
		li.classList.add("disabled");
	}
	
	var a = 
		'<a class="page-link" onclick="fn_paging(' + data.pageCnt + ');">' +
			'<span class="fa-angle-double-right"></span>' +
		'</a>';
	
	li.innerHTML = a;
	ul_page.appendChild(li);
}