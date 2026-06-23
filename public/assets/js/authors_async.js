// public/assets/js/authors_async.js
import js_fetch from './fetch.js';
import js_render from './render.js';
import js_utils from './utils.js';

function _updateAuthor() {
    console.log( "Grabar cambios del autor" );
    const nodeForm = document.querySelector(".edit__form");
    const id = nodeForm.getAttribute("data-id");
    const name = nodeForm.querySelector(".edit__input[name='name']").value;
    const country = nodeForm.querySelector(".edit__select[name='country']").value;
    const summary = nodeForm.querySelector(".edit__textarea[name='summary']").value;

    // validar
    const handleReturn = ( dataResult ) => {
        if ( dataResult.status.codError === "000" ) {
            console.log( dataResult.data );
            // Recargar la lista de autores
            document.querySelector(".authors").remove();
            _getAuthors();
        } else {
            console.error( dataResult );
        }
       js_utils.closeOverlay();
    }
    const dataRequest = {
        action      : "updateAuthor",
        id          : id,
        name        : name,
        iso3     : country,
        summary     : summary,
        handler     : handleReturn
    };
    js_fetch.apiFetch( dataRequest );
}

function _showEditForm() {
    // Recuperar datos del todos los paises
    const handleReturn = ( dataResult ) => {
        if ( dataResult.status.codError === "000" ) {
            console.log( dataResult.data );
            // Mostrar formulario con datos del autor a editar
            const nodeRow = this.closest(".row--data");
            const id = nodeRow.dataset.id;
            const name = nodeRow.querySelector(".cell--name").textContent;
            const country = nodeRow.querySelector(".cell--country").textContent;
            const summary = nodeRow.querySelector(".cell--summary").textContent;

            const optionsCountries = js_render.render( "optionsCountries", dataResult.data);
            
            const data = [{
                id: id,
                name: name,
                optionsCountries: optionsCountries,
                summary: summary
            }];

            console.log( data );
            const html = js_render.render( "editAuthor", data );
            document.body.insertAdjacentHTML( "beforeend", html );

            // Poner selected al país del autor
            const nodeSelect = document.querySelector(".edit__select[name='country']");
            nodeSelect.value = country;

            // Añadir eventos al formulario
            const nodeClose = document.querySelector(".overlay__close");
            nodeClose.addEventListener( "click", js_utils.closeOverlay );

            // Añadir evento al botón de grabar
            const nodeSave = document.querySelector(".edit__save");
            nodeSave.addEventListener( "click", _updateAuthor );


        }else {
            console.error( dataResult );
        }
    }

    const dataRequest = {
        action      : "getAllCountries",
        handler     : handleReturn
    };

    js_fetch.apiFetch( dataRequest );
}

function _showInsertForm() {
    console.log( "Insertar nuevo autor" );
}

function _showDeleteForm() {
    const nodeRow = this.closest(".row--data");
    const id = nodeRow.dataset.id;
    console.log( "Borrar autor con id: ", id );
}


// VIEW ALL
function  _getAuthors() {
    const handleReturn = ( dataResult ) => {
        if ( dataResult.status.codError === "000" ) {
            console.log( dataResult.data );
            const html = js_render.render( "authors", dataResult.data );
            document.body.insertAdjacentHTML( "beforeend", html );
            
            const nodesEdit = document.querySelectorAll("button.edit");
            nodesEdit.forEach( node => {
                node.addEventListener("click", _showEditForm );
            });

            const nodeInsert = document.querySelector("button.insert");
            nodeInsert.addEventListener("click", _showInsertForm );

            const nodesDelete = document.querySelectorAll("button.delete");
            nodesDelete.forEach( node => {
                node.addEventListener("click", _showDeleteForm );
            });

        } else {
            console.error( dataResult );
        }
    }

    const dataRequest = {
        action      : "getAllAuthors",
        handler     : handleReturn
    };
    
    return js_fetch.apiFetch( dataRequest );
}


document.addEventListener( "DOMContentLoaded", async () => {
    await _getAuthors(); 
});