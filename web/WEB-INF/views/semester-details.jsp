<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학기별 수강 내역</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- /resources/css/main.css -->
    <link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet">
</head>
<body>
<div class="container main-container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>2025년도 2학기 수강 내역</h2>
        <div>
            <a href="<c:url value='/credits-by-year'/>" class="btn btn-outline-primary me-2">이전으로</a>
            <a href="<c:url value='/'/>" class="btn btn-outline-secondary">홈으로</a>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead>
            <tr class="table-header text-center">
                <th>년도</th>
                <th>학기</th>
                <th>교과목명</th>
                <th>교과구분</th>
                <th>담당교수</th>
                <th>학점</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${semesterCourses}" var="course">
                <tr class="text-center">
                    <td>${course.year}</td>
                    <td>${course.semester}</td>
                    <td>${course.courseName}</td>
                    <td>${course.courseType}</td>
                    <td>${course.professor}</td>
                    <td>${course.credit}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty semesterCourses}">
                <tr>
                    <td colspan="6" class="text-center">해당 학기에 수강한 과목이 없습니다.</td>
                </tr>
            </c:if>
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
