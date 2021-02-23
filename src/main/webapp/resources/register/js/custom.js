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
