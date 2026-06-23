// searchBarDataFetch.js
import js_fetch from './fetch.js';

const search = {

    handleSearch() {

        const searchResults = document.getElementById("searchResults");
        const query = this.value.trim();
        if (query.length < 2) {
            searchResults.innerHTML = "";
            return;
        }
        // Handler
        const handleReturn = (data) => {
            console.log(data);
            if (!data) {
                searchResults.innerHTML = "<div class='search_item'>Error inesperado</div>";
                return;
            }
            if (data.status.codError === "001") {
                searchResults.innerHTML = "<div class='search_item'>No hay datos</div>";
                return;
            }
            if (data.status.codError === "002") {
                searchResults.innerHTML = `<div class='search_item'>${data.status.msgError}</div>`;
                return;
            }
            // Render
            let html = "";
            data.data.forEach(book => {
                html += "<div class='search_item'>";
                html += "<a href='books.php?book_id=" + book.book_id + "'>";
                html += book.book_name;
                html += "</a>";
                html += "<div class='search_authors'>";
                html += "Escrito por " + book.authors;
                html += "</div>";
                html += "</div>";
            });
            searchResults.innerHTML = html;
        };

        // Petición
        const dataRequest = {
            action: "searchBooksByNameAndAuthorFullName",
            query: query,
            handler: handleReturn
        };
        js_fetch.apiFetch(dataRequest);
    }
};

export default search;