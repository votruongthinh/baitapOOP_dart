class Person {
  final String id;
  final String name;
  final int age;
  final String gender;
  Person({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
  });
}

class Student extends Person {
  final String grade;
  final List<double> score;

  Student({
    required String id,
    required String name,
    required int age,
    required String gender,
    required this.grade,
    required this.score,
  }) : super(id: id, name: name, age: age, gender: gender);

  double averageScore() {
    if (score.isEmpty) {
      return 0;
    }
    double sum = 0;
    for (double diem in score) {
      sum += diem;
    }
    return sum / score.length;
  }

  //hiện thị thông tin của sinh viên
  void displayStudentInfo() {
    print("Student ID: $id");
    print("Student Name:$name");
    print("Student Age: $age");
    print("Student gender: $gender");
    print("Student Grade: $grade");
    print("Student Score:$score");
    print("Student averageScore: ${averageScore().toStringAsFixed(2)}");
  }
}

class Teacher extends Person {
  final String subject;
  final double salary;

  Teacher({
    required String id,
    required String name,
    required int age,
    required String gender,
    required this.subject,
    required this.salary,
  }) : super(id: id, name: name, age: age, gender: gender);
  void displayTeacherInfo() {
    print("Teacher ID: $id");
    print("Teacher Name: $name");
    print("Teacher Age: $age");
    print("Teacher Gender: $gender");
    print("Teacher Subject: $subject");
    print("Teacher Salary: $salary");
  }
}

class Classroom {
  final String id;
  final String name;

  List<Student> students = [];
  Teacher? teacher;
  Classroom({required this.id, required this.name});

  void addStudent(Student student) {
    students.add(student);
  }

  //giáo viên phụ trách
  void assignTeacher(Teacher teacher) {
    this.teacher = teacher;
  }

  void displayClassroomInfo() {
    print("=======================================");
    print("Classroom ID: $id");
    print("Classroom Name: $name");
    print("Teacher: ${teacher?.name ?? 'no teacher assigned'}");
    print("=======================================");

    print("List of Students:");

    if (students.isEmpty) {
      print("No students in the classroom.");
    } else {
      for (var student in students) {
        print(
          "- ${student.name}| Class: ${student.grade}| Average Score: ${student.averageScore().toStringAsFixed(2)}",
        );
      }
    }

    print("=======================================");
  }
}

void main() {
  Student student1 = Student(
    id: "1",
    name: "Nguyễn Văn An",
    age: 16,
    gender: "Nam",
    grade: "10A1",
    score: [8, 7.5, 9],
  );

  Student student2 = Student(
    id: "2",
    name: "Trần Thị Bình",
    age: 16,
    gender: "Nữ",
    grade: "10A1",
    score: [9, 8.5, 9.5],
  );

  Student student3 = Student(
    id: "3",
    name: "Lê Văn Cường",
    age: 16,
    gender: "Nam",
    grade: "10A1",
    score: [6, 7, 6.5],
  );

  // -------------------------
  // TẠO GIÁO VIÊN
  // -------------------------

  Teacher teacher1 = Teacher(
    id: "1",
    name: "Nguyễn Văn Minh",
    age: 35,
    gender: "Nam",
    subject: "Toán",
    salary: 15000000,
  );

  // -------------------------
  // TẠO LỚP HỌC
  // -------------------------

  Classroom classroom = Classroom(id: "1", name: "10A1");

  // -------------------------
  // THÊM HỌC SINH
  // -------------------------

  classroom.addStudent(student1);
  classroom.addStudent(student2);
  classroom.addStudent(student3);

  // -------------------------
  // GÁN GIÁO VIÊN
  // -------------------------

  classroom.assignTeacher(teacher1);

  // -------------------------
  // HIỂN THỊ THÔNG TIN
  // -------------------------

  print("Information of Students");
  print("==============================");

  student1.displayStudentInfo();

  print("\nInformation of Teacher");
  print("==============================");

  teacher1.displayTeacherInfo();

  print("\nInformation of Classroom");
  print("==============================");

  classroom.displayClassroomInfo();
}
