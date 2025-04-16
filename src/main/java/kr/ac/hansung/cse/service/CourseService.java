package kr.ac.hansung.cse.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import kr.ac.hansung.cse.dao.CourseDao;
import kr.ac.hansung.cse.model.Course;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CourseService {

    private final CourseDao courseDao;

    /**
     * 학기별 이수 학점 정보를 가져옵니다.
     *
     * @return 학기별 이수 학점 정보 리스트
     */
    @Transactional(readOnly = true)
    public List<Map<String, Object>> getSemesterCredits() {
        // 모든 과목 조회
        List<Course> allCourses = courseDao.findAll();

        // 연도와 학기별로 그룹화
        Map<Integer, Map<Integer, List<Course>>> coursesByYearAndSemester = allCourses.stream()
                .collect(Collectors.groupingBy(
                        Course::getYear,                            // 첫 번째 키: 연도
                        Collectors.groupingBy(Course::getSemester)  // 두 번째 키: 학기
                ));

        // 결과 리스트 생성
        List<Map<String, Object>> semesterCredits = new ArrayList<>();

        // 연도별로 처리
        for (Map.Entry<Integer, Map<Integer, List<Course>>> yearEntry : coursesByYearAndSemester.entrySet()) {
            Integer year = yearEntry.getKey();
            Map<Integer, List<Course>> semesterMap = yearEntry.getValue();

            // 각 학기별로 처리
            for (Map.Entry<Integer, List<Course>> semesterEntry : semesterMap.entrySet()) {
                Integer semester = semesterEntry.getKey();
                List<Course> courses = semesterEntry.getValue();

                // 해당 학기의 총 학점 계산
                int totalCredits = 0;
                for (Course course : courses) {
                    totalCredits += course.getCredit();
                }

                // 결과 맵 생성
                Map<String, Object> creditInfo = Map.of(
                        "year", year,
                        "semester", semester,
                        "totalCredits", totalCredits
                );

                semesterCredits.add(creditInfo);
            }
        }

        return semesterCredits;
    }

    /**
     * 특정 학기의 수강 내역을 가져옵니다.
     *
     * @param year     학년도
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
     *
     * @param course 수강 신청할 강의 정보
     */
    @Transactional
    public void registerCourse(Course course) {
        courseDao.save(course);
    }
}
