<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수강 신청하기</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- /resources/css/main.css -->
    <link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet">
</head>
<body>
<div class="container main-container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>수강 신청하기</h2>
        <a href="<c:url value='/' />" class="btn btn-outline-secondary">홈으로</a>
    </div>

    <!-- 수강 신청 폼 -->
    <div class="card mb-4">
        <div class="card-header bg-light">
            <h5>수강 신청</h5>
        </div>
        <div class="card-body">
            <c:if test="${not empty org.springframework.validation.BindingResult.courseRegistration.allErrors}">
                <div class="alert alert-danger">
                    <p>다음과 같은 오류가 발생했습니다:</p>
                    <ul>
                        <c:forEach var="error" items="${org.springframework.validation.BindingResult.courseRegistration.allErrors}">
                            <li>${error.defaultMessage}</li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>

            <form:form action="${pageContext.request.contextPath}/register-course" method="post"
                       modelAttribute="courseRegistration" class="row g-3">
                <div class="col-md-6">
                    <form:label path="year" class="form-label">수강년도</form:label>
                    <form:input path="year" class="form-control readonly-field" readonly="true" />
                    <form:errors path="year" cssClass="error-text" />
                </div>
                <div class="col-md-6">
                    <form:label path="semester" class="form-label">학기</form:label>
                    <form:input path="semester" class="form-control readonly-field" readonly="true" />
                    <form:errors path="semester" cssClass="error-text" />
                </div>
                <div class="col-md-6">
                    <form:label path="courseCode" class="form-label">교과코드</form:label>
                    <form:input path="courseCode" class="form-control" placeholder="예: CSE0032" />
                    <form:errors path="courseCode" cssClass="error-text" />
                </div>
                <div class="col-md-6">
                    <form:label path="courseName" class="form-label">교과목명</form:label>
                    <form:input path="courseName" class="form-control" placeholder="예: 웹프레임워크 I" />
                    <form:errors path="courseName" cssClass="error-text" />
                </div>
                <div class="col-md-4">
                    <form:label path="courseType" class="form-label">교과구분</form:label>
                    <form:select path="courseType" class="form-select">
                        <form:option value="">-- 선택하세요 --</form:option>
                        <form:option value="전필">전공필수</form:option>
                        <form:option value="전선">전공선택</form:option>
                        <form:option value="교양">교양</form:option>
                    </form:select>
                    <form:errors path="courseType" cssClass="error-text" />
                </div>
                <div class="col-md-4">
                    <form:label path="professor" class="form-label">담당교수</form:label>
                    <form:input path="professor" class="form-control" placeholder="예: 김남윤" />
                    <form:errors path="professor" cssClass="error-text" />
                </div>
                <div class="col-md-4">
                    <form:label path="credit" class="form-label">학점</form:label>
                    <form:select path="credit" class="form-select">
                        <form:option value="">-- 선택하세요 --</form:option>
                        <form:option value="1">1학점</form:option>
                        <form:option value="2">2학점</form:option>
                        <form:option value="3">3학점</form:option>
                        <form:option value="4">4학점</form:option>
                    </form:select>
                    <form:errors path="credit" cssClass="error-text" />
                </div>

                <div class="col-12 mt-4">
                    <button type="submit" class="btn btn-success">수강 신청</button>
                    <button type="button" class="btn btn-outline-secondary" onclick="resetForm()">초기화</button>
                </div>
            </form:form>
        </div>
    </div>

    <!-- 푸터 -->
    <footer class="mt-5 text-center text-muted">
        <p>© 2025 최재영, 한성대학교 수강신청시스템. All rights reserved.</p>
    </footer>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 초기화 버튼 동작 정의 (year, semester 값은 유지)
    function resetForm() {
        document.getElementById('courseCode').value = '';
        document.getElementById('courseName').value = '';
        document.getElementById('courseType').value = '';
        document.getElementById('professor').value = '';
        document.getElementById('credit').value = '';
    }
</script>
</body>
</html>
