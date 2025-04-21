#!/bin/bash

# Initialize a new git repository if not already in one
if [ ! -d .git ]; then
    git init
fi

# Create and commit each file
cat > 0-get_list_students.js << 'EOF'
export default function getListStudents() {
  return [
    { id: 1, firstName: 'Guillaume', location: 'San Francisco' },
    { id: 2, firstName: 'James', location: 'Columbia' },
    { id: 5, firstName: 'Serena', location: 'San Francisco' },
  ];
}
EOF
git add 0-get_list_students.js
git commit -m "0-get_list_students.js"

cat > 1-get_list_student_ids.js << 'EOF'
export default function getListStudentIds(arrayOfObjects) {
  if (!Array.isArray(arrayOfObjects)) return [];
  return arrayOfObjects.map((obj) => obj.id);
}
EOF
git add 1-get_list_student_ids.js
git commit -m "1-get_list_student_ids.js"

cat > 2-get_students_by_loc.js << 'EOF'
export default function getStudentsByLocation(listOfStudents, city) {
  return listOfStudents.filter((obj) => obj.location === city);
}
EOF
git add 2-get_students_by_loc.js
git commit -m "2-get_students_by_loc.js"

cat > 3-get_ids_sum.js << 'EOF'
export default function getStudentIdsSum(listOfStudents) {
  return listOfStudents.reduce((acc, obj) => acc + obj.id, 0);
}
EOF
git add 3-get_ids_sum.js
git commit -m "3-get_ids_sum.js"

cat > 4-update_grade_by_city.js << 'EOF'
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
EOF
git add 4-update_grade_by_city.js
git commit -m "4-update_grade_by_city.js"

cat > 5-typed_arrays.js << 'EOF'
export default function createInt8TypedArray(length, position, value) {
  const array = new ArrayBuffer(length);
  const val = new DataView(array);
  try {
    val.setInt8(position, value);
    return val;
  } catch (err) {
    throw Error('Position outside range');
  }
}
EOF
git add 5-typed_arrays.js
git commit -m "5-typed_arrays.js"

cat > 6-set.js << 'EOF'
export default function setFromArray(array) {
  return new Set(array);
}
EOF
git add 6-set.js
git commit -m "6-set.js"

cat > 7-has_array_values.js << 'EOF'
export default function hasValuesFromArray(set, array) {
  return array.every((item) => set.has(item));
}
EOF
git add 7-has_array_values.js
git commit -m "7-has_array_values.js"

cat > 8-clean_set.js << 'EOF'
export default function cleanSet(set, startString) {
  if (
    typeof set !== 'object'
    || typeof startString !== 'string'
    || startString.length === 0
  ) {
    return '';
  }

  return [...set]
    .map(
      (item) => item && item.startsWith(startString) && item.slice(startString.length),
    )
    .filter((item) => item)
    .join('-');
}
EOF
git add 8-clean_set.js
git commit -m "8-clean_set.js"

cat > 9-groceries_list.js << 'EOF'
export default function groceriesList() {
  return new Map([
    ['Apples', 10],
    ['Tomatoes', 10],
    ['Pasta', 1],
    ['Rice', 1],
    ['Banana', 5],
  ]);
}
EOF
git add 9-groceries_list.js
git commit -m "9-groceries_list.js"

cat > 10-update_uniq_items.js << 'EOF'
export default function updateUniqueItems(map) {
  if (!(map instanceof Map)) throw new Error('Cannot process');
  map.forEach((value, key) => {
    if (value === 1) map.set(key, 100);
  });
}
EOF
git add 10-update_uniq_items.js
git commit -m "10-update_uniq_items.js"

cat > 100-weak.js << 'EOF'
export const weakMap = new WeakMap();

export function queryAPI(endpoint) {
  let count = weakMap.get(endpoint) || 0;
  count += 1;
  if (count >= 5) throw new Error('Endpoint load is high');
  weakMap.set(endpoint, count);
}
EOF
git add 100-weak.js
git commit -m "100-weak.js"

echo "All files created and committed successfully!"
