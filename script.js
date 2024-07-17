document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM fully loaded and parsed');

    const getButton = document.getElementById('getButton');
    const deleteButton = document.getElementById('deleteButton');

    if (getButton) {
        getButton.addEventListener('click', () => {
            console.log('GET button clicked');
            fetchData('GET');
        });
    } else {
        console.error('GET button not found');
    }

    if (deleteButton) {
        deleteButton.addEventListener('click', () => {
            console.log('DELETE button clicked');
            fetchData('DELETE');
        });
    } else {
        console.error('DELETE button not found');
    }

    function fetchData(method) {
        const url = 'http://localhost:3000/gilhari/v1/Book';
    
        console.log(`Fetching data with method: ${method}`);
    
        $.ajax({
            url: url,
            method: method,
            contentType: 'application/json',
            dataType: 'json', // Specify dataType as JSON to ensure jQuery correctly parses the response
            success: function (data) {
                console.log('Data received:', data);
                populateTable(data); // Assuming data is already parsed as JSON
            },
            error: function (error) {
                console.error('Error fetching data:', error);
                document.getElementById('apiResponse').innerText = 'Error fetching data';
            }
        });
    }
    

    function populateTable(data) {
        const tableBody = document.querySelector('#data-table tbody');
        tableBody.innerHTML = ''; // Clear previous data

        // Ensure data is an array
        if (!Array.isArray(data)) {
            console.error('Expected an array of data but got:', data);
            return;
        }

        // Loop through each item in the data array
        data.forEach(item => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${item.bookId}</td>
                <td>${item.bookName}</td>
                <td>${item.author}</td>
                <td>${item.description}</td>
                <td>${item.price}</td>
                <td>${new Date(item.release_date).toLocaleDateString()}</td>
                <td>${item.publisherId}</td>
            `;
            tableBody.appendChild(row);
        });
    }
});

