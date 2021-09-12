<%@ include file="../common/header.jspf" %>
<%@ include file="../common/navigation.jspf" %>


	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">LIST OF TODO</h3>
			<hr>
			<div class="container text-right">
				<a href="/add-todo" class="btn btn-success" >ADD TODO</a>
			</div>
			<br>
			<table class="table table-hover shadow p-3 mb-5 bg-body rounded">
			<caption><spring:message code="todo.caption" /></caption>
				<thead>
					<tr>
						<th>Id</th>
						<th>User</th>
						<th>Desc</th>
						<th>Target Date</th>
						<th>IsDone</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					
					<c:forEach items="${todos}" var="todo">
						<tr>
							<td><c:out value="${todo.id }" /></td>
							<td><c:out value="${todo.user }" /></td>
							<td><c:out value="${todo.desc }" /></td>
							<td><c:out value="${todo.targetDate }" /></td>
							<td><c:out value="${todo.done }" /></td>
							
							<td><a href="update-todo?id=<c:out value='${todo.id}' />" class="btn btn-warning">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; 
							<a href="delete-todo?id=<c:out value='${todo.id}' />" class="btn btn-danger">Delete</a></td>
						</tr>
					</c:forEach>
				
				</tbody>

			</table>
		</div>
	</div>
	
	<!--  !DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap Table with Add and Delete Row Feature</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
    color: #404E67;
    background: #F5F7FA;
    font-family: 'Open Sans', sans-serif;
}
.table-wrapper {
    width: 700px;
    margin: 30px auto;
    background: #fff;
    padding: 20px;	
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {
    padding-bottom: 10px;
    margin: 0 0 10px;
}
.table-title h2 {
    margin: 6px 0 0;
    font-size: 22px;
}
.table-title .add-todo {
    float: right;
    height: 30px;
    font-weight: bold;
    font-size: 12px;
    text-shadow: none;
    min-width: 100px;
    border-radius: 50px;
    line-height: 13px;
}
.table-title .add-todo i {
    margin-right: 4px;
}
table.table {
    table-layout: fixed;
}
table.table tr th, table.table tr td {
    border-color: #e9e9e9;
}
table.table th i {
    font-size: 13px;
    margin: 0 5px;
    cursor: pointer;
}
table.table th:last-child {
    width: 100px;
}
table.table td a {
    cursor: pointer;
    display: inline-block;
    margin: 0 5px;
    min-width: 24px;
}    
table.table td a.add {
    color: #27C46B;
}
table.table td a.edit {
    color: #FFC107;
}
table.table td a.delete {
    color: #E34724;
}
table.table td i {
    font-size: 19px;
}
table.table td a.add i {
    font-size: 24px;
    margin-right: -1px;
    position: relative;
    top: 3px;
}    
table.table .form-control {
    height: 32px;
    line-height: 32px;
    box-shadow: none;
    border-radius: 2px;
}
table.table .form-control.error {
    border-color: #f50000;
}
table.table td .add {
    display: none;
}
</style>
<script>
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
	var actions = $("table td:last-child").html();
	// Append table with add row form on add new button click
    $(".add-todo").click(function(){
		$(this).attr("disabled", "disabled");
		var index = $("table tbody tr:last-child").index();
        var row = '<tr>' +
        	'<td><input type="hidden" class="form-control" name="id" id="id" value="<c:out value='${todo.id}' />" /></td>'+
            '<td><input type="hidden" class="form-control" name="user" id="user" value="<c:out value='${todo.user}' />"></td>' +
            '<td><input type="text" class="form-control" name="desc" id="desc" value="<c:out value='${todo.desc}' />"></td>' +
            '<td><input type="hidden" class="form-control" name="targetDate" id="targetDate" value="<c:out value='${todo.targetDate}' />"></td>' +
            '<td><input type="hidden" class="form-control" name="isDone" id="isDone" value="<c:out value='${todo.done}' />"></td>' +
			'<td>' + actions + '</td>' +
        '</tr>';
    	$("table").append(row);		
		$("table tbody tr").eq(index + 1).find(".add-todo, .edit-todo").toggle();
        $('[data-toggle="tooltip"]').tooltip();
    });
	// Add row on add button click
	$(document).on("click", ".add-todo", function(){
		var empty = false;
		var input = $(this).parents("tr").find('input[type="text"]');
        input.each(function(){
			if(!$(this).val()){
				$(this).addClass("error");
				empty = true;
			} else{
                $(this).removeClass("error");
            }
		});
		$(this).parents("tr").find(".error").first().focus();
		if(!empty){
			input.each(function(){
				$(this).parent("td").html($(this).val());
			});			
			$(this).parents("tr").find(".add-todo, .edit-todo").toggle();
			$(".add-todo").removeAttr("disabled");
		}		
    });
	// Edit row on edit button click
	$(document).on("click", ".update-todo", function(){		
        $(this).parents("tr").find("td:not(:last-child)").each(function(){
			$(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
		});		
		$(this).parents("tr").find(".add-todo, .edit-todo").toggle();
		$(".add-todo").attr("disabled", "disabled");
    });
	// Delete row on delete button click
	$(document).on("click", ".delete-todo", function(){
        $(this).parents("tr").remove();
		$(".add-todo").removeAttr("disabled");
    });
});
</script>
</head>
<body>
<div class="container-lg">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-8"><h2>Todo <b>Details</b></h2></div>
                    <div class="col-sm-4">
                        <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Add New</button>
                    </div>
                </div>
            </div>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Id</th>
						<th>User</th>
						<th>Desc</th>
						<th>Target Date</th>
						<th>IsDone</th>
						<th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach items="${todos}" var="todo">
						<tr>
							<td><c:out value="${todo.id }" /></td>
							<td><c:out value="${todo.user }" /></td>
							<td><c:out value="${todo.desc }" /></td>
							<td><c:out value="${todo.targetDate }" /></td>
							<td><c:out value="${todo.done }" /></td>
							
							<td>
							
							<a class="/add-todo" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                            <a class="updating-todo?id=<c:out value='${todo.id}' />" title="Update" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                            <a class="delete-todo?id=<c:out value='${todo.id}' />" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
         
							</td>
						</tr>
					</c:forEach>
                 
                </tbody>
            </table>
        </div>
    </div>
</div>     
</body>
</html-->
	
<%@ include file="../common/footer.jspf" %>	


