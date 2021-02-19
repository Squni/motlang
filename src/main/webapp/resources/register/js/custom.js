const myInput = document.getElementById("psw");
const letter = document.getElementById("letter");
const capital = document.getElementById("capital");
const number = document.getElementById("number");
const length = document.getElementById("length");

// Highlight errors
const e1 = document.getElementById("e1");
const e2 = document.getElementById("e2");
const e3 = document.getElementById("e3");
const username = document.getElementById("username");
const email = document.getElementById("email");
const terms = document.getElementById("terms");
const termsBox = document.getElementById("agree-term");
const confirm = document.getElementById("confirm");
const termsConditions = document.getElementById("termsConditions");

termsBox.addEventListener('click', ev => {
    if (termsBox.getAttribute("value") == "true") {
        termsBox.setAttribute("value", "false");
        terms.insertAdjacentHTML("afterend", `<span id="star" style="color: red">*</span>`);
    } else {
        termsBox.setAttribute("value", "true");
        termsConditions.querySelector("#star").remove();
    }
})

if (e1 != null) {
    terms.style.color = "red";
}


if (e3 != null) {
    username.style.borderColor = "red";
    email.style.borderColor = "red";
}

// When the user clicks on the password field, show the message box
myInput.onfocus = function () {
    document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function () {
    document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function () {
    // Validate lowercase letters
    const lowerCaseLetters = /[a-z]/g;
    if (myInput.value.match(lowerCaseLetters)) {
        letter.classList.remove("invalid");
        letter.classList.add("valid");
    } else {
        letter.classList.remove("valid");
        letter.classList.add("invalid");
    }

    // Validate capital letters
    const upperCaseLetters = /[A-Z]/g;
    if (myInput.value.match(upperCaseLetters)) {
        capital.classList.remove("invalid");
        capital.classList.add("valid");
    } else {
        capital.classList.remove("valid");
        capital.classList.add("invalid");
    }

    // Validate numbers
    const numbers = /[0-9]/g;
    if (myInput.value.match(numbers)) {
        number.classList.remove("invalid");
        number.classList.add("valid");
    } else {
        number.classList.remove("valid");
        number.classList.add("invalid");
    }

    // Validate length
    if (myInput.value.length >= 8) {
        length.classList.remove("invalid");
        length.classList.add("valid");
    } else {
        length.classList.remove("valid");
        length.classList.add("invalid");
    }
}