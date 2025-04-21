export default function getStudentIdsSum(listOfStudents) {
  return listOfStudents.reduce((acc, obj) => acc + obj.id, 0);
}
