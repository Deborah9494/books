// searchBar.js
import search from './searchBarDataFetch.js';

document.addEventListener("DOMContentLoaded", () => {
    const searchInput = document.getElementById("searchInput");
    searchInput.addEventListener("keyup", search.handleSearch);
});

document.addEventListener("click", (event) => {
    const searchBox = document.querySelector(".search_box");
    const searchResults = document.getElementById("searchResults");
    if (!searchBox.contains(event.target)) {
        searchResults.innerHTML = "";
    }
});
