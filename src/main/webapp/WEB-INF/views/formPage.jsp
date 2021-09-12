<%@ include file="../common/header.jspf" %>
<%@ include file="../common/navigation.jspf" %>

	<br>
	<div class="container col-md-5">
		<div class="card shadow p-3 mb-5 bg-body rounded">
			<div class="card-body">
				
				<form action="/add-todo" method="post">
		
				<c:if test="${todo != null}">
					<input type="hidden" name="id" value="<c:out value='${todo.id}' />" />
				</c:if>
			
				<fieldset class="form-group">
					<!--label>User</label--> <input type="hidden"
						value="<c:out value='${todo.user }' />" class="form-control"
						name="user" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Description</label> <input type="text"
						value="<c:out value='${todo.desc }' />" class="form-control"
						name="desc">
				</fieldset>

				<fieldset class="form-group">
					<!--label>Target Date</label--> <input type="hidden"
						value="<c:out value='${todo.targetDate }' />" class="form-control"
						name="targetDate">
				</fieldset>
				
				<fieldset class="form-group">
					<!--label>IsDone</label--> <input type="hidden"
						value="<c:out value='${todo.done }' />" class="form-control"
						name="isDone">
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
<%@ include file="../common/footer.jspf" %>	
