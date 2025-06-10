const fs = require('fs');

function countStudents(path) {
  let content;
  
  try {
    content = fs.readFileSync(path);
  } catch (err) {
    throw new Error('Cannot load the database');
  }
  
  content = content.toString().split('\n');
  
  // Filter out empty lines and lines with insufficient data
  let students = content.filter((item) => {
    const trimmed = item.trim();
    return trimmed && trimmed.split(',').length >= 4;
  });
  
  students = students.map((item) => item.split(','));
  
  // Remove header row (first row)
  if (students.length > 0) {
    students = students.slice(1);
  }
  
  const NUMBER_OF_STUDENTS = students.length;
  console.log(`Number of students: ${NUMBER_OF_STUDENTS}`);
  
  const fields = {};
  for (const student of students) {
    const field = student[3].trim();
    const name = student[0].trim();
    
    if (!fields[field]) {
      fields[field] = [];
    }
    fields[field].push(name);
  }
  
  for (const key of Object.keys(fields)) {
    console.log(
      `Number of students in ${key}: ${fields[key].length}. List: ${fields[key].join(', ')}`
    );
  }
}

module.exports = countStudents;
