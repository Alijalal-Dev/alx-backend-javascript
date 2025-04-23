interface Student {
  firstName: string;
  lastName: string;
  age: number;
  location: string;
}

const student_01: Student = {
  firstName: 'Terry',
  lastName: 'Sophia',
  age: 18,
  location: 'Los Angeles',
};

const student_02: Student = {
  firstName: 'Bella',
  lastName: 'Rose',
  age: 21,
  location: 'San Fancisco',
};

const studentsList: Student[] = [student_01, student_02];

function createTableCell(content: string): HTMLTableCellElement {
  const cell = document.createElement('td');
  cell.textContent = content;
  cell.style.padding = '5px';
  cell.style.border = '1px solid #ddd';
  return cell;
}

function createTableRow(student: Student): HTMLTableRowElement {
  const row = document.createElement('tr');
  row.appendChild(createTableCell(`${student.firstName}`));
  row.appendChild(createTableCell(`${student.location}`));
  row.style.border = '1px solid #ddd';
  return row;
}

function renderTable(data: Student[]): void {
  const table = document.createElement('table');
  const tbody = document.createElement('tbody');
  table.style.borderCollapse = 'collapse';
  table.appendChild(tbody);

  data.forEach((student) => {
    const row = createTableRow(student);
    tbody.appendChild(row);
  });

  document.body.appendChild(table);
}

renderTable(studentsList);
