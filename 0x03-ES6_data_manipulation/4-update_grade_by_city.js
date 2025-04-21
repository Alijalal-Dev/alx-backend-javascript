export default function updateStudentGradeByCity(
  listOfStudents,
  city,
  newGrades,
) {
  return listOfStudents
    .filter((obj) => obj.location === city)
    .map((obj) => {
      const grade = newGrades.find((grd) => grd.studentId === obj.id);
      return { ...obj, grade: grade ? grade.grade : 'N/A' };
    });
}
