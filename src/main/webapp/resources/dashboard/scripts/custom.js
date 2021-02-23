const rating = document.getElementById("filter-rating");
const rank = document.getElementById("filter-rank");
const pairByRank = document.getElementById("pair-by-rank");
const pairByRating = document.getElementById("pair-by-rating");
const searchBarBody = document.getElementById("search-bar-body");
const searchBtn = document.getElementById("search-btn");
const searchBtnClose = document.getElementById("search-btn-close");


rating.addEventListener('click', ev => {
    rank.classList.remove('active');
    rating.classList.add('active');
    pairByRating.removeAttribute('hidden');
    pairByRank.setAttribute('hidden', 'hidden');

});

rank.addEventListener('click', ev => {
    rating.classList.remove('active');
    rank.classList.add('active');
    pairByRank.removeAttribute('hidden');
    pairByRating.setAttribute('hidden', 'hidden');

})