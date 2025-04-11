<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수강 신청 조회</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- /resources/css/main.css -->
    <link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet">
</head>
<body>
<div class="container main-container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>수강 신청 조회</h2>
        <div>
            <a href="<c:url value='/course-registration'/>" class="btn btn-outline-primary me-2">수강 신청하기</a>
            <a href="<c:url value='/'/>" class="btn btn-outline-secondary">홈으로</a>
        </div>
    </div>

    <!-- 신청 내역 -->
    <div class="card mb-4">
        <div class="card-header bg-light d-flex justify-content-between align-items-center">
            <h5 class="mb-0">2025년 2학기 수강 신청 내역</h5>
        </div>
        <div class="card-body">
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
                    <c:forEach items="${registeredCourses}" var="course">
                        <tr class="text-center">
                            <td>${course.year}</td>
                            <td>${course.semester}</td>
                            <td>${course.courseName}</td>
                            <td>${course.courseType}</td>
                            <td>${course.professor}</td>
                            <td>${course.credit}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty registeredCourses}">
                        <tr>
                            <td colspan="6" class="text-center">신청한 과목이 없습니다.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
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
