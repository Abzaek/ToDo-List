document.getElementById('taskForm').addEventListener('submit', function(e) {
    e.preventDefault(); 

    let taskDescription = document.getElementById('Task').value;
    let isDone = document.getElementById('isDone').checked;
    let deadline = document.getElementById('datetime').value;

    let tableBody = document.querySelector('table');
    let newRow = document.createElement('tr');

    let descriptionCell = document.createElement('td');
    let deadlineCell = document.createElement('td');
    let isDoneCell = document.createElement('td');
    let deleteCell = document.createElement('td');

    descriptionCell.textContent = taskDescription;
    isDoneCell.textContent = isDone ? 'Yes' : 'No';
    deadlineCell.textContent = deadline;
    
    
    let deleteButton = document.createElement('button');
    deleteButton.textContent = 'DELETE';
    deleteButton.classList.add('buttons');

    newRow.appendChild(descriptionCell);
    newRow.appendChild(deadlineCell);
    newRow.appendChild(isDoneCell);
    deleteCell.appendChild(deleteButton);
    newRow.appendChild(deleteCell);

    tableBody.appendChild(newRow);
});
