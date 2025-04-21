export default function getStudentsByLocation(listOfStudents, city) {
  return listOfStudents.filter((obj) => obj.location === city);
}
