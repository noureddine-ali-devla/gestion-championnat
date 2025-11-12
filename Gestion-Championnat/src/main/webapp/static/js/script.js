
function validateForm(form) {
    const inputs = form.querySelectorAll("input[type=text], input[type=password], input[type=number], select");
    for (let input of inputs) {
        if (!input.value.trim()) {
            alert("Veuillez remplir tous les champs !");
            return false;
        }
    }
    return true;
}

function showAlert(message, type="info") {
    const alertBox = document.createElement("div");
    alertBox.className = `alert ${type}`;
    alertBox.innerText = message;
    document.body.prepend(alertBox);
    setTimeout(() => alertBox.remove(), 3000);
}


function checkSession(user) {
    if (!user) {
        window.location.href = "login.jsp";
    }
}


function addRow(tableId, rowData) {
    const table = document.getElementById(tableId);
    const row = table.insertRow(-1);
    rowData.forEach(data => {
        const cell = row.insertCell();
        cell.innerText = data;
    });
}


document.addEventListener("DOMContentLoaded", function() {
    // Validation globale de tous les formulaires
    const forms = document.querySelectorAll("form");
    forms.forEach(form => {
        form.addEventListener("submit", function(e) {
            if (!validateForm(form)) {
                e.preventDefault();
            }
        });
    });
});
