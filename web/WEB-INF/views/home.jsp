<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수강 신청 시스템</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- /resources/css/main.css -->
    <link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet">
</head>
<body>
<div class="container main-container">
    <div class="header-section">
        <h1 class="mb-3">수강 신청 시스템</h1>
        <p class="text-muted">학생을 위한 종합 수강 관리 시스템입니다.</p>
    </div>

    <div class="row g-4">
        <!-- 학년별 이수 학점 조회 -->
        <div class="col-md-4">
            <a href="<c:url value='/credits-by-year'/>" class="text-decoration-none text-dark">
                <div class="card menu-card">
                    <img src="<c:url value='/resources/images/credits.jfif'/>" class="card-img-top" alt="학점 조회">
                    <div class="card-body">
                        <h5 class="card-title">학년별 이수 학점 조회</h5>
                        <p class="card-text">학년별로 현재 이수한 학점과 남은 필수 학점을 확인할 수 있습니다.</p>
                    </div>
                </div>
            </a>
        </div>

        <!-- 수강 신청하기 -->
        <div class="col-md-4">
            <a href="<c:url value='/course-registration'/>" class="text-decoration-none text-dark">
                <div class="card menu-card">
                    <img src="<c:url value='/resources/images/registration.jfif'/>" class="card-img-top" alt="수강 신청">
                    <div class="card-body">
                        <h5 class="card-title">수강 신청하기</h5>
                        <p class="card-text">새로운 강의를 검색하고 원하는 수업을 신청할 수 있습니다.</p>
                    </div>
                </div>
            </a>
        </div>

        <!-- 수강 신청 조회 -->
        <div class="col-md-4">
            <a href="<c:url value='/my-registrations'/>" class="text-decoration-none text-dark">
                <div class="card menu-card">
                    <img src="<c:url value='/resources/images/schedule.jfif'/>" class="card-img-top" alt="신청 조회">
                    <div class="card-body">
                        <h5 class="card-title">수강 신청 조회</h5>
                        <p class="card-text">신청한 강의 목록과 시간표를 확인하고 관리할 수 있습니다.</p>
                    </div>
                </div>
            </a>
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
