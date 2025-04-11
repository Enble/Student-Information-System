package kr.ac.hansung.cse.service;

import kr.ac.hansung.cse.dao.CourseDao;
import kr.ac.hansung.cse.model.Course;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CourseService {

    private final CourseDao courseDao;

    /**
     * 학기별 이수 학점 정보를 가져옵니다.
     * @return 학기별 이수 학점 정보 리스트
     */
    @Transactional(readOnly = true)
    public List<Map<String, Object>> getSemesterCredits() {
        List<Course> allCourses = courseDao.findAll();

        // 연도와 학기별로 그룹화
        Map<Integer, Map<Integer, List<Course>>> coursesByYearAndSemester = allCourses.stream()
                .collect(Collectors.groupingBy(Course::getYear,
                        Collectors.groupingBy(Course::getSemester)));

        // 결과 리스트 생성
        List<Map<String, Object>> semesterCredits = new ArrayList<>();

        coursesByYearAndSemester.forEach((year, semesterMap) -> {
            semesterMap.forEach((semester, courses) -> {
                // 해당 학기의 총 학점 계산
                int totalCredits = courses.stream()
                        .mapToInt(Course::getCredit)
                        .sum();

                // 결과 맵 생성
                Map<String, Object> creditInfo = Map.of(
                        "year", year,
                        "semester", semester,
                        "totalCredits", totalCredits
                );

                semesterCredits.add(creditInfo);
            });
        });

        return semesterCredits;
    }

    /**
     * 특정 학기의 수강 내역을 가져옵니다.
     * @param year 학년도
     * @param semester 학기
     * @return 해당 학기의 수강 내역 리스트
     */
    @Transactional(readOnly = true)
    public List<Course> getSemesterCourses(int year, int semester) {
        List<Course> allCourses = courseDao.findAll();

        return allCourses.stream()
                .filter(course -> course.getYear() == year && course.getSemester() == semester)
                .collect(Collectors.toList());
    }

    /**
     * 강의를 수강 신청합니다.
     * @param course 수강 신청할 강의 정보
     */
    @Transactional
    public void registerCourse(Course course) {
        courseDao.save(course);
    }

    /**
     * 특정 학년도, 학기의 수강 신청 내역을 가져옵니다.
     * @param year 학년도
     * @param semester 학기
     * @return 수강 신청 내역 리스트
     */
    @Transactional(readOnly = true)
    public List<Course> getRegisteredCourses(int year, int semester) {
        List<Course> allCourses = courseDao.findAll();

        return allCourses.stream()
                .filter(course -> course.getYear() == year && course.getSemester() == semester)
                .collect(Collectors.toList());
    }
}
