package kr.ac.hansung.cse.controller;

import jakarta.validation.Valid;
import java.util.List;
import java.util.Map;
import kr.ac.hansung.cse.model.Course;
import kr.ac.hansung.cse.service.CourseService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class CourseController {

    private final CourseService courseService;

    @GetMapping("/credits-by-year")
    public String creditsByYear(Model model) {
        // 학기별 이수 학점 정보 가져오기
        List<Map<String, Object>> semesterCredits = courseService.getSemesterCredits();
        model.addAttribute("semesterCredits", semesterCredits);

        // 총 이수 학점 계산
        int totalCredits = semesterCredits.stream()
                .mapToInt(credit -> (Integer) credit.get("totalCredits"))
                .sum();
        model.addAttribute("totalCredits", totalCredits);

        return "credits-by-year";
    }

    @GetMapping("/semester-details")
    public String semesterDetails(@RequestParam("year") int year,
                                  @RequestParam("semester") int semester,
                                  Model model) {
        // 선택한 학기의 수강 내역 가져오기
        List<Course> semesterCourses = courseService.getSemesterCourses(year, semester);
        model.addAttribute("semesterCourses", semesterCourses);

        return "semester-details";
    }

    @GetMapping("/course-registration")
    public String courseRegistration(Model model) {
        // 수강신청 폼에 바인딩할 Course 객체 생성 (기본값 명시적으로 설정)
        Course course = Course.builder()
                .year(2025)
                .semester(2)
                .build();
        model.addAttribute("courseRegistration", course);

        return "course-registration";
    }

    @PostMapping("/register-course")
    public String registerCourse(@Valid @ModelAttribute("courseRegistration") Course course,
                                 BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "course-registration";
        }

        // 수강신청 처리
        courseService.registerCourse(course);

        return "redirect:/my-registrations";
    }

    @GetMapping("/my-registrations")
    public String myRegistrations(Model model) {
        // 2025년 2학기 수강신청 내역 가져오기
        List<Course> registeredCourses = courseService.getSemesterCourses(2025, 2);
        model.addAttribute("registeredCourses", registeredCourses);

        return "my-registrations";
    }
}
