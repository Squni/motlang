const edit = document.getElementById('edit-btn');
const editForm = document.getElementById('edit-form');
const tab1 = document.getElementById('home');
const tab2 = document.getElementById('profile');
const cancel = document.getElementById('cancel');
const tab1Btn = document.getElementById('home-tab');
const tab2Btn = document.getElementById('profile-tab');

edit.addEventListener('click', ev => {
    edit.setAttribute('hidden', 'hidden');
    tab1.classList.remove('show', 'active');
    tab2.classList.remove('show', 'active');
    tab1Btn.classList.remove('show', 'active');
    tab2Btn.classList.remove('show', 'active');
    editForm.classList.add('active', 'show');
})

tab1Btn.addEventListener('click', ev => {
    edit.removeAttribute('hidden');
})

tab2Btn.addEventListener('click', ev => {
    edit.removeAttribute('hidden');
})

cancel.addEventListener('click', ev => {
    edit.removeAttribute('hidden');
    editForm.classList.remove('show');
    editForm.classList.remove('active');
    tab1.classList.add('show', 'active');
    tab1Btn.classList.add('show', 'active');
})

tab1.addEventListener('click', ev => {
    tab2.classList.remove('show');
    tab2.classList.remove('active');
    tab1.classList.add('show', 'active');
})

tab2.addEventListener('click', ev => {
    editForm.classList.remove('show', 'active');
    tab1.classList.remove('show', 'active');
    tab2.classList.add('show', 'active');
})