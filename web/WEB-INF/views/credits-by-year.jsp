<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학년별 이수 학점 조회</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- /resources/css/main.css -->
    <link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet">
</head>
<body>
<div class="container main-container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>학년별 이수 학점 조회</h2>
        <a href="<c:url value='/'/>" class="btn btn-outline-secondary">홈으로</a>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead>
            <tr class="table-header text-center">
                <th>년도</th>
                <th>학기</th>
                <th>취득 학점</th>
                <th>상세보기</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${semesterCredits}" var="credit">
                <tr class="text-center">
                    <td>${credit.year}</td>
                    <td>${credit.semester}</td>
                    <td>${credit.totalCredits}</td>
                    <td>
                        <a href="<c:url value='/semester-details'>
                                    <c:param name='year' value='${credit.year}'/>
                                    <c:param name='semester' value='${credit.semester}'/>
                                </c:url>" class="btn btn-sm btn-success">링크</a>
                    </td>
                </tr>
            </c:forEach>
            <tr class="text-center total-row">
                <td>총계</td>
                <td></td>
                <td>${totalCredits}</td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </div>

    <!-- 푸터 -->
    <footer class="mt-5 text-center text-muted">
        <p>© 2025 최재영, 한성대학교 수강신청시스템. All rights reserved.</p>
    </footer>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
