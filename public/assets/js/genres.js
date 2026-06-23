import js_fetch from './fetch.js';
import js_render from './render.js';

function _closeOverlay() {
    const nodeOverlay = document.querySelector(".overlay");
    if ( nodeOverlay ) {
        nodeOverlay.remove();
        const nodeEditingRow = document.querySelector(".genres__row--editing");
        if ( nodeEditingRow ) {
            nodeEditingRow.classList.remove("genres__row--editing");
        }
        const nodeDeletingRow = document.querySelector(".genres__row--deleting");
        if ( nodeDeletingRow ) {
            nodeDeletingRow.classList.remove("genres__row--deleting");
        }
         const nodeViewingBooksRow = document.querySelector(".genres__row--viewing");
        if ( nodeViewingBooksRow ) {
            nodeViewingBooksRow.classList.remove("genres__row--viewing");
        }
    }
}

function _updateGenre() {
    const nodeForm = document.querySelector(".editgenre__form");
    const genreId = nodeForm.getAttribute("data-genreid");
    const genreName = nodeForm.querySelector(".editgenre__input").value;
    //console.log( "Datos a guardar:" );
    //console.log( { genreId, genreName } );
    
    // TODO:Lógica para enviar los datos al servidor y actualizar el género.
    const handleReturn = ( dataResult ) => {
        // Tu código para mostrar los datos que provienen de la base datos( mod003, mod002... ).
        // Los datos se encuentran en dataResult
        console.log("Datos devueltos por el servidor después de grabar el género:");
        console.log( dataResult );
        if ( dataResult.status.codError === "000" ) {
            const nodesRow = document.querySelectorAll(".genres__row--data");
            console.log("Updating row");
            nodesRow.forEach( rowGenre => {
                if ( rowGenre.dataset.genreid === nodeForm.dataset.genreid ) {
                    rowGenre.querySelector(".genres__cell--name").textContent = genreName;
                }
            });
        } else {
            console.error( "Error al grabar el género." );
            console.error( dataResult );
        }
        // Cerramos el formulario.
        _closeOverlay();
    }

     // La recuperación de esos parámetros.
    const dataRequest = {
        action      :   "updateGenre",
        genre_id    :   genreId,
        genre_name  :   genreName,

        handler     :   handleReturn
    };
    console.log("Datos que se van a enviar al servidor para grabar el género:");
    console.log( dataRequest );
    js_fetch.apiFetch( dataRequest );

}

function _controlEditGenreForm() {
    const nodeGenreName = document.querySelector(".editgenre__form [name='genrename']");
    const nodeButton = document.querySelector(".editgenre__save");
    const currentName = document.querySelector(".genres__row--editing .genres__cell--name").textContent;
    if ( nodeGenreName.value && nodeGenreName.value !== currentName ) {
        nodeButton.disabled = false;
    } else {
        nodeButton.disabled = true;
    }
}

function _showEditGenreForm() {
    // Recuperar los datos del género a editar
    const genreRow = this.closest(".genres__row--data");
    const genreId = genreRow.getAttribute("data-genreid");
    const genreName = genreRow.querySelector(".genres__cell--name").textContent;

    genreRow.classList.add("genres__row--editing");

    // Crear un objeto con los datos del género para pasar al template de edición.
    const genreData = [{
        "genreId": genreId,
        "genreName": genreName
    }];  
    //console.log( "Datos del género a editar:" );
    //console.log( genreData );

    // Renderizar el formulario de edición con los datos del género.
    const editFormHTML = js_render.render( "editGenre", genreData );
    // Mostrar el formulario en la página
    document.querySelector(".main_content").insertAdjacentHTML( "beforeend", editFormHTML );

    // Añadir event listener para el botón de cancelar edición.
    const nodeClose = document.querySelector(".overlay__close");
    nodeClose.addEventListener("click", _closeOverlay );

    // Añadir event listener para el botón de guardar cambios.
    const nodeSave = document.querySelector(".editgenre__save");
    nodeSave.addEventListener("click", _updateGenre );

    // Si el campo de nombre del género no es vacío y es diferente del valor actual, habilitar el botón de guardar.
    const nodeGenreName = document.querySelector("[name='genrename']");
    nodeGenreName.addEventListener("input", _controlEditGenreForm );
}

function _deleteGenre(){
    const nodeForm = document.querySelector(".deletegenre__form");
    const genreId = nodeForm.getAttribute("data-genreid");
    const genreName = nodeForm.querySelector(".deletegenre__input").value;
    console.log( "Datos a borrar:" );
    console.log( { genreId, genreName } );

    const handleReturn = ( dataResult ) => {
        console.log("Datos devueltos por el servidor después de borrar el género:");
        console.log( dataResult );
        if ( dataResult.status.codError === "000" ) {
            const nodesRow = document.querySelectorAll(".genres__row--data");
            console.log("Removing row with id: ", genreId);
            nodesRow.forEach( rowGenre => {
                if ( rowGenre.dataset.genreid === nodeForm.dataset.genreid ) {
                    console.log(rowGenre);
                    rowGenre.remove();
                }
            });
        } else {
            console.error( "Error al borrar el género." );
            console.error( dataResult );
        }
        // Cerramos el formulario.
        _closeOverlay();
    }

     // La recuperación de esos parámetros.
    const dataRequest = {
        action      :   "deleteGenre",
        genre_id    :   genreId,

        handler     :   handleReturn
    };
    console.log("Datos que se van a enviar al servidor para borrar el género:");
    console.log( dataRequest );
    js_fetch.apiFetch( dataRequest );

}

function _showDeleteGenreForm(){
    // console.log("Delete button clicked");
    // Recuperar datos del género a borrar
    const genreRow = this.closest(".genres__row--data");
    const genreId = genreRow.getAttribute("data-genreid");
    const genreName = genreRow.querySelector(".genres__cell--name").textContent;

    genreRow.classList.add("genres__row--deleting");

    const genreData = [{
        "genreId": genreId,
        "genreName": genreName
    }];  

    console.log( "Datos del género a borrar:" );
    console.log( genreData );

    // Renderizar el overlay que pregunta si estás seguro con los datos del género.
    const deleteOverlayHTML = js_render.render( "deleteGenre", genreData );

    // Mostrar el overlay en la página
    document.querySelector(".main_content").insertAdjacentHTML( "beforeend", deleteOverlayHTML );

    // Añadir event listener para el botón de cancelar edición.
    const nodeClose = document.querySelector(".overlay__close");
    nodeClose.addEventListener("click", _closeOverlay );

    // Añadir event listener para el botón de guardar cambios.
    const nodeToDelete = document.querySelector(".deletegenre__save");
    nodeToDelete.addEventListener("click", _deleteGenre );

}

function _loadBooksSelect( genreId ) {
    const handleReturn = ( dataResult ) => {
        if (dataResult.status.codError === "000"){
            console.log("Datos devueltos por el servidor para cargar el select de libros:");
            console.log( dataResult );
            const selectNode = document.querySelector(".genrebooks__select");
            dataResult.data.forEach( book => {
                const option = document.createElement("option");
                option.value = book.book_id;
                option.textContent = book.book_name;
                 // EXTRA DATA
                option.dataset.bookname = book.book_name;
                option.dataset.cover = book.cover_image;
                option.dataset.summary = book.summary;
                option.dataset.date = book.first_publication_date;
                selectNode.appendChild(option);
            });
        } else {
            console.error( "Error al recuperar los libros para el select." );
            console.error( dataResult );
        }
    };
    const dataRequest = {
        action : "getBooksNotInGenre",
        genre_id : genreId,
        handler : handleReturn
    };
    js_fetch.apiFetch( dataRequest );

}

function _addBookToGenre( genreId ) {
    console.log("Función _addBookToGenre() ejecutada para el género con ID: ", genreId);
    const selectNode = document.querySelector(".genrebooks__select");
    const bookId = selectNode.value;
    if ( !bookId ) {
        console.warn("No book selected to add to genre.");
        return;
    }
   
    const selectedOption = selectNode.options[selectNode.selectedIndex];
    const newBook = {
        book_id: selectedOption.value,
        book_name: selectedOption.dataset.bookname,
        cover_image: selectedOption.dataset.cover,
        summary: selectedOption.dataset.summary,
        first_publication_date: selectedOption.dataset.date
    };

    const handleReturn = ( dataResult ) => {
        if (dataResult.status.codError === "000"){
            console.log("Datos devueltos por el servidor después de añadir el libro al género:");
            console.log( dataResult );
            console.log("Nuevo libro añadido al género:");
            console.log( newBook );
            let html = '';
            const nodeEmpty = document.querySelector(".genrebooks__empty");
            if ( nodeEmpty ) {
                nodeEmpty.remove();
                html = js_render.render("genreBook", [newBook] ); 
                document.querySelector(".showbooks__body").insertAdjacentHTML("beforeend", html);

            }else {
                html = js_render.render("book", [newBook] );
                document.querySelector(".card_container").insertAdjacentHTML("afterbegin", html);
            }

            // Añadir event listener al nuevo botón de eliminar del libro añadido.
            const newBookNode = document.querySelector(`.genrebook__delete[data-bookid="${newBook.book_id}"]`);
            newBookNode.addEventListener("click", () => _removeBookFromGenre( genreId, newBook.book_id ) );

            // Eliminar el libro del select
            selectNode.removeChild( selectNode.querySelector(`option[value="${bookId}"]`) );

        } else {
            console.error( "Error al añadir el libro al género." );
            console.error( dataResult );
        }
    };

    const dataRequest = {
        action : "addBookToGenre",
        genre_id : genreId,
        book_id : bookId,
        handler : handleReturn
    };
    console.log("Datos que se van a enviar al servidor para añadir el libro al género:");
    console.log( dataRequest );
    js_fetch.apiFetch( dataRequest );

}

function _removeBookFromGenre( genreId, bookId ) {
    console.log("Función _removeBookFromGenre() ejecutada para el género con ID: ", genreId, " y el libro con ID: ", bookId);
    const handleReturn = ( dataResult ) => {
        if (dataResult.status.codError === "000"){
            console.log("Datos devueltos por el servidor después de eliminar el libro del género:");
            console.log( dataResult );

            const cardNode = document.querySelector(`.genrebook__delete[data-bookid="${bookId}"]`).closest(".card");
           

            // Añadir el libro eliminado de nuevo al select
            const selectNode = document.querySelector(".genrebooks__select");
            const removedBookOption = document.createElement("option");
            removedBookOption.value = bookId;
            removedBookOption.textContent = cardNode.dataset.bookname;
            removedBookOption.dataset.bookname = cardNode.dataset.bookname;
            removedBookOption.dataset.cover = cardNode.dataset.coverimage;
            removedBookOption.dataset.summary = cardNode.dataset.summary;
            removedBookOption.dataset.date = cardNode.dataset.firstpublicationdate;
            selectNode.appendChild(removedBookOption);

            // Sort options in select
            const optionsArray = Array.from(selectNode.options).slice(1); // Exclude the first option
            optionsArray.sort((a, b) => a.textContent.localeCompare(b.textContent));
            optionsArray.forEach(option => selectNode.appendChild(option));
            

            // Eliminar el libro de la lista de libros del género
            cardNode.remove();

        } else {
            console.error( "Error al eliminar el libro del género." );
            console.error( dataResult );
        }
    };

    const dataRequest = {
        action : "removeBookFromGenre",
        genre_id : genreId,
        book_id : bookId,
        handler : handleReturn
    };
    console.log("Datos que se van a enviar al servidor para eliminar el libro del género:");
    console.log( dataRequest );
    js_fetch.apiFetch( dataRequest );

}

function _showOverlayGenreBooks(){
    // Recuperar los datos del género a editar
    const genreRow = this.closest(".genres__row--data");
    const genreId = genreRow.getAttribute("data-genreid");
    const genreName = genreRow.querySelector(".genres__cell--name").textContent;

    const handleReturn = ( dataResult ) => {
        if (dataResult.status.codError === "000"){
            genreRow.classList.add("genres__row--viewing");

            console.log("Datos devueltos por el servidor:");
            console.log( dataResult );

            // TODO: put data in array
            // 1. fetch or prepare books array
            const booksData = dataResult.data;

            let detailHTML = "";
            const addBookFormHTML = js_render.render("addBookForm", [{}]);
            if (booksData[0].book_id !== null) {
                const booksHTML = js_render.render("genreBook", booksData);

                detailHTML = js_render.render("detailGenre", [{
                    genreName: genreName,
                    addBookForm: addBookFormHTML,
                    dataBooks: booksHTML
                }]);
            } else {
                detailHTML = js_render.render("detailGenre", [{
                    genreName: genreName,
                    addBookForm: addBookFormHTML,
                    dataBooks: `<p class="genrebooks__empty">No hay libros en este género</p>`
                }]);
            }
            document
                    .querySelector(".main_content")
                    .insertAdjacentHTML("beforeend", detailHTML);

            // Add data to select of addBookForm
            _loadBooksSelect( genreId );

            // Añadir event listener para el botón de cancelar edición.
            document.querySelector(".overlay__close")
            .addEventListener("click", _closeOverlay);

            // Add event listener to add book button
            document.querySelector(".genrebooks__addbutton").addEventListener("click", () => _addBookToGenre(genreId) );

            // Add event listeners to remove books buttons
            const removeButtons = document.querySelectorAll(".genrebook__delete");
            removeButtons.forEach( button => {
                button.addEventListener("click", () => _removeBookFromGenre( genreId, button.dataset.bookid ));
            });

        }else{
            console.error( "Error al recuperar los libros del género." );
            console.error( dataResult );
        }
    }

    const dataRequest = {
        action : "getBooksGenre",
        genre_id : genreId,
        handler : handleReturn
    };
    console.log("Datos que se van a enviar al servidor para mostrar los libros del género:");
    console.log( dataRequest );
    js_fetch.apiFetch( dataRequest );
}

function _getGenres() {
    const handleReturn = ( dataResult ) => {
        if ( dataResult.status.codError === "000" ) {
            //console.log( "Datos recibidos del servidor:" );
            //console.log( dataResult.data );
            const genres_rendered = js_render.render( "genres", dataResult.data );
            document.querySelector(".main_content").insertAdjacentHTML( "beforeend", genres_rendered );

            // Añadir los event listeners para los botones...  
            // de editar
            const nodesEdit = document.querySelectorAll(".genres__edit");
            nodesEdit.forEach( node => {
                node.addEventListener("click", _showEditGenreForm );
            });
            // de borrar 
            // todo: all borrar buttons red?
            const nodesDelete = document.querySelectorAll(".genres__delete");
            nodesDelete.forEach( node => {
                node.addEventListener("click", _showDeleteGenreForm );
            });
            // y de ver libros.
            // TODO: or go directly to a page?
            const nodesShowBooks = document.querySelectorAll(".genres__show_books");
            nodesShowBooks.forEach( node => {
                node.addEventListener("click", _showOverlayGenreBooks );
            }); 
            
            } else {
                console.error( "Error al cargar todos los géneros." );
                console.error( dataResult );
        }
    }

    // La recuperación de esos parámetros.
    const dataRequest = {
        action      : "getGenres",
        // Los parámetros que necesites para recuperar la información.
        // parametroId : valorParametroId,
        handler     : handleReturn
    };
    return js_fetch.apiFetch( dataRequest );
}

function _addGenre(){
    console.log("Función _addGenre() ejecutada.");
    // TODO: check if empty
    const genreName = document.querySelector(".addgenre__form [name='genrename']").value;
    console.log( "Datos a guardar:" );
    console.log( { genreName } );
    
    // Lógica para enviar los datos al servidor y añadir el género.
    const handleReturn = ( dataResult ) => {
        // Tu código para mostrar los datos que provienen de la base datos( mod003, mod002... ).
        // Los datos se encuentran en dataResult
        console.log("Datos devueltos por el servidor después de añadir el género:");
        console.log( dataResult );
        if ( dataResult.status.codError === "000" ) {
            // Crear objeto con la informacion del nuevo género con el ID devuelto por el servidor
            const newGenreId = dataResult.data.insertId;
            // console.log("newGenreId: ", newGenreId);
            const newGenre = {
                genreId: newGenreId,
                genreName: genreName
            };

            if (document.querySelector(".genres")){
                // Insertar el nuevo género en la tabla sin recargar toda la lista
                const newGenreRendered = js_render.render( "genreRow", [newGenre] );

                // Insertar la nueva fila arriba en la tabla
                const genresHeader = document.querySelector(".genres__row--header");
                genresHeader.insertAdjacentHTML("afterend", newGenreRendered);

                // Asignar el event listener al nuevo botón de editar
                const newGenreEditButton = document.querySelector(`.genres__row--data[data-genreid="${newGenreId}"] .genres__edit`);
                newGenreEditButton.addEventListener("click", _showEditGenreForm );
                // y al botón Borrar
                 const newGenreDeleteButton = document.querySelector(`.genres__row--data[data-genreid="${newGenreId}"] .genres__delete`);
                newGenreDeleteButton.addEventListener("click", _showDeleteGenreForm );
                // y al botón Ver Libros
                const newGenreShowBooksButton = document.querySelector(`.genres__row--data[data-genreid="${newGenreId}"] .genres__show_books`);
                newGenreShowBooksButton.addEventListener("click", _showOverlayGenreBooks );
                

            } else {
                // Si no hay tabla, recargar la lista de géneros
                _getGenres();
            }
            
        } else {
            console.error( "Error al añadir el género." );
            console.error( dataResult );
        }
        // Cerramos el formulario.
        _closeOverlay();
    }

     // La recuperación de esos parámetros.
    const dataRequest = {
        action      :   "addGenre",
        genre_name  :   genreName,

        handler     :   handleReturn
    };
    console.log("Datos que se van a enviar al servidor para añadir el nuevo género:");
    console.log( dataRequest );
    js_fetch.apiFetch( dataRequest );

}

function _controlAddGenreForm() {
    const nodeGenreName = document.querySelector(".addgenre__form [name='genrename']");
    const nodeButton = document.querySelector(".addgenre__save");
    if ( nodeGenreName.value !== "" ) {
        nodeButton.disabled = false;
    } else {
        nodeButton.disabled = true;
    }
}

// Función para manejar la adición de un género
function _showAddGenreForm(){
    console.log("Bóton de añadir género clickeado.");
    // Crear un objeto con los datos del género para pasar al template de adición.
    const genreData = [{
        "genreName": ''
    }];  

    // Renderizar el formulario de adición.
    const addFormHTML = js_render.render( "addGenre", genreData );
    // Mostrar el formulario en la página
    document.querySelector(".main_content").insertAdjacentHTML( "beforeend", addFormHTML );

    // Añadir event listener para el botón de cancelar adición.
    const nodeClose = document.querySelector(".overlay__close");
    nodeClose.addEventListener("click", _closeOverlay );

    // Añadir event listener para el botón de guardar cambios.
    const nodeSave = document.querySelector(".addgenre__save");
    nodeSave.addEventListener("click", _addGenre );

    // Si el campo de nombre del género no es vacío, habilitar el botón de guardar.
    const nodeGenreName = document.querySelector("[name='genrename']");
    // event input: se dispara cada vez que el valor del input cambia, ya sea por escritura, pegado, autocompletado, etc.
    nodeGenreName.addEventListener("input", _controlAddGenreForm );

}

function _addEventListenerToAddGenreButton() {
    const nodeAddButton = document.querySelector("button.genres__insert");
    nodeAddButton.addEventListener( "click", _showAddGenreForm );
}

document.addEventListener( "DOMContentLoaded", async () => {
    await _getGenres();

    // Definir el event listener para el botón de añadir género
    _addEventListenerToAddGenreButton();


});