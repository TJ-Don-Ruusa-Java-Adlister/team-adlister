<%@ c:taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--JSTL for Error Messages--%>
<c:if test="${error != null}">
    <div class="alert alert-danger" role="alert">${error}</div>
</c:if>
