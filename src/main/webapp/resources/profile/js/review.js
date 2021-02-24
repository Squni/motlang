const addReview = document.getElementById("add-review");
const reviewForm = document.getElementById("review-form");
const reviewCancel = document.getElementById("review-cancel");


addReview.addEventListener('click', ev => {
    reviewForm.removeAttribute('hidden');
    addReview.setAttribute('hidden', 'hidden');
});

reviewCancel.addEventListener('click', ev => {
    reviewForm.setAttribute('hidden', 'hidden');
    addReview.removeAttribute('hidden');
})