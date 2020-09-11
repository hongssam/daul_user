<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<ul class="page-navigation">
	<c:choose>
		<c:when test="${pagination.curPage ne 1 }">
			<li class="page-item " onclick="fn_paging(1);">
				<a class="page-link">
					<span class="fa-angle-double-left"></span>
				</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item disabled">
				<a class="page-link" onclick="fn_paging(1);">
					<span class="fa-angle-double-left"></span>
				</a>
			</li>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${pagination.curPage ne 1 }">
			<li class="page-item ">
				<a class="page-link" onclick="fn_paging('${pagination.prevPage}');">
					<span class="fa-angle-left"></span>
				</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item disabled">
				<a class="page-link"  onclick="fn_paging('${pagination.prevPage}');">
					<span class="fa-angle-left"></span>
				</a>
			</li>
		</c:otherwise>
	</c:choose>
	<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
		<c:choose>
			<c:when test="${pageNum eq  pagination.curPage}">
				<li class="page-item text active" aria-current="page">
					<a class="page-link">${pageNum }</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item text ">
					<a class="page-link" onclick="fn_paging('${pageNum}');">${pageNum }</a>
				</li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
			<li class="page-item ">
				<a class="page-link" onclick="fn_paging('${pagination.nextPage}');">
					<span class="fa-angle-right"></span>
				</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item disabled">
				<a class="page-link" onclick="fn_paging('${pagination.nextPage}');">
					<span class="fa-angle-right"></span>
				</a>
			</li>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
			<li class="page-item">
				<a class="page-link" onclick="fn_paging('${pagination.pageCnt}');">
					<span class="fa-angle-double-right"></span>
				</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item disabled">
				<a class="page-link" onclick="fn_paging('${pagination.pageCnt}');">
					<span class="fa-angle-double-right"></span>
				</a>
			</li>
		</c:otherwise>
	</c:choose>
</ul>