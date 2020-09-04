var idx = $("#question-list").children().length;

$(document).ready(function(){
	
    $("button[id='question-delete']").on("click", function(e) {
        e.preventDefault();
        deleteFile($(this));
    });
    function deleteFile(obj) {
        obj.parent().parent().remove();
    }
});

function addQuestion() {
	
    var str = " <div class='form-group row'>" +
    "<div class='col-md-3'></div>" +
    "<div class='col-md-7'>" +
    "	<input type='text' class='form-control' name='question_content' id = 'question_content'/>"+
    "</div>"+
    "<div class='col-md-2'>" + 
    "<button type='button' class='btn btn-primary' id = 'question-delete' >-</button>"+
    "</div>"+
    "</div>"+
    "</div>";
    
    $("#question-list").append(str);
    $("button[id='question-delete']").on("click", function(e) {
        e.preventDefault();
        deleteFile($(this));
    });
    function deleteFile(obj) {
        obj.parent().parent().remove();
    }
    idx++;
}




function formatDate(date) { 
	var d = new Date(date), 
		month = '' + (d.getMonth() + 1), 
		day = '' + d.getDate(), 
		year = d.getFullYear(); 
	if (month.length < 2) month = '0' + month; 
	if (day.length < 2) day = '0' + day; 
	return [year, month, day].join('-'); 
}


