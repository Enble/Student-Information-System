package kr.ac.hansung.cse.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor(access = AccessLevel.PROTECTED)
@Entity
@Table(name = "courses")
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // 수강년도
    @Column(name = "year")
    @NotNull(message = "연도는 null일 수 없습니다")
    @Min(value = 1900, message = "연도는 1900보다 커야 합니다")
    @Max(value = 2100, message = "연도는 2100보다 작아야 합니다")
    private Integer year;

    // 학기
    @Column(name = "semester")
    @NotNull(message = "학기는 null일 수 없습니다")
    @Min(value = 1, message = "학기는 0보다 커야 합니다")
    @Max(value = 2, message = "학기는 2보다 작거나 같아야 합니다")
    private Integer semester;

    // 교과코드
    @Column(name = "course_code", length = 10)
    @Size(min = 2, max = 10, message = "교과코드는 2자에서 10자 사이여야 합니다")
    private String courseCode;

    // 교과목명
    @Column(name = "course_name", length = 100)
    @Size(min = 2, max = 100, message = "교과목명은 2자에서 100자 사이여야 합니다")
    private String courseName;

    // 교과구분
    @Column(name = "course_type", length = 20)
    @Size(min = 2, max = 20, message = "교과구분은 2자에서 20자 사이여야 합니다")
    private String courseType;

    // 담당교수
    @Column(name = "professor", length = 50)
    @Size(min = 2, max = 50, message = "교수명은 2자에서 50자 사이여야 합니다")
    private String professor;

    // 학점
    @Column(name = "credit")
    @NotNull(message = "학점은 null일 수 없습니다")
    @Min(value = 1, message = "학점은 0보다 커야 합니다")
    @Max(value = 4, message = "학점은 4보다 작거나 같아야 합니다")
    private Integer credit;
}
