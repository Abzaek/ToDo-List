document.getElementById('taskForm').addEventListener('submit', function(e) {
    e.preventDefault(); 

    let taskDescription = document.getElementById('Task').value;
    let isDone = document.getElementById('isDone').checked;
    let deadline = document.getElementById('datetime').value;
    
    // Reset Button deletes the all the table entries
    document.getElementById('resetBtn').addEventListener('click', function() {
        let tbody = document.querySelector('#tbody');
        tbody.innerHTML = '';
    });


    function formToTable() {
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
        deleteButton.classList.add('btn','btn-sm','btn-danger','buttons');

        deleteButton.addEventListener('click', function() {
            var row = this.closest('tr');
            row.remove();
        });

        newRow.appendChild(descriptionCell);
        newRow.appendChild(deadlineCell);
        newRow.appendChild(isDoneCell);
        deleteCell.appendChild(deleteButton);
        newRow.appendChild(deleteCell);

        tableBody.appendChild(newRow);
    }
    
    //denies an empty entry
    !taskDescription ? !deadline ? alert("Your submission is empty") : alert("please enter your task description") : !deadline ? alert("please enter the deadline") : formToTable();

    
});

