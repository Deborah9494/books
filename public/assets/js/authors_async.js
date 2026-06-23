// public/assets/js/authors_async.js
import js_fetch from './fetch.js';
import js_render from './render.js';
import js_utils from './utils.js';

function _deleteAuthor() {
    console.log("Borrar autor");
    const nodeForm = document.querySelector(".delete__form");
    const id = nodeForm.getAttribute("data-id");
    console.log("ID del autor a borrar: ", id);
    const handleReturn = (dataResult) => {
        if (dataResult.status.codError === "000") {
            console.log(dataResult.data);
            // Recargar la lista de autores
            document.querySelector(".authors").remove();
            _getAuthors();
        } else {
            console.error(dataResult);
        }
        js_utils.closeOverlay();
    };
    const dataRequest = {
        action: "deleteAuthor",
        id: id,
        handler: handleReturn,
    };
    js_fetch.apiFetch(dataRequest);
}

function _showDeleteForm(){
    const row = this.closest(".row--data");
    const id = row.getAttribute("data-id");
    const name = row.querySelector(".cell--name").textContent;
    const country = row.querySelector(".cell--country").textContent;
    const summary = row.querySelector(".cell--summary").textContent;
    console.log("Delete author with id: ", id);
    console.log("Author details - Name: ", name, ", Country: ", country, ", Summary: ", summary);
    const data = [{
        id: id,
        name: name,
        country: country,
        summary: summary
    }];
    const html = js_render.render("deleteAuthor", data);
    document.body.insertAdjacentHTML("beforeend", html);

    const nodeClose = document.querySelector(".overlay__close");
    nodeClose.addEventListener("click", js_utils.closeOverlay);

    const nodeDelete = document.querySelector(".delete__save");
    nodeDelete.addEventListener("click", _deleteAuthor);
}

// Validación
// Si los campos no son vacío y son diferentes de los actuales, 
// habilitar el botón de guardar.
function _controlEditForm() {
    const nodeForm = document.querySelector(".edit__form");

    const name = nodeForm.querySelector(".edit__input[name='name']").value;
    const country = nodeForm.querySelector(".edit__select[name='country']").value;
    const summary = nodeForm.querySelector(".edit__textarea[name='summary']").value;

    const originalName = nodeForm.dataset.originalName;
    const originalCountry = nodeForm.dataset.originalCountry;
    const originalSummary = nodeForm.dataset.originalSummary;

    const button = nodeForm.querySelector(".edit__save");

    let valid = true;
    let hasChanges = false;

    // No permitir campos vacíos
    if (
        name.trim() === "" ||
        country.trim() === "" ||
        summary.trim() === ""
    ) {
        valid = false;
    }

    // Detectar cambios
    if (
        name.trim() !== originalName.trim() ||
        country.trim() !== originalCountry.trim() ||
        summary.trim() !== originalSummary.trim()
    ) {
        hasChanges = true;
    }

    button.disabled = !(valid && hasChanges);
}

function _updateAuthor() {
    console.log( "Grabar cambios del autor" );
    const nodeForm = document.querySelector(".edit__form");
    const id = nodeForm.getAttribute("data-id");
    const name = nodeForm.querySelector(".edit__input[name='name']").value;
    const country = nodeForm.querySelector(".edit__select[name='country']").value;
    const summary = nodeForm.querySelector(".edit__textarea[name='summary']").value;

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
                country: country,
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

            const nodeForm = document.querySelector(".edit__form");

            // Validación
            document.querySelector(".edit__input")
                .addEventListener("input", _controlEditForm);

            document.querySelector(".edit__select")
                .addEventListener("change", _controlEditForm);

            document.querySelector(".edit__textarea")
                .addEventListener("input", _controlEditForm);

            // Estado inicial
            _controlEditForm();


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

function _addAuthor(){
    console.log("Añadir nuevo autor");
    const nodeForm = document.querySelector(".add__form");
    const name = nodeForm.querySelector(".add__input[name='name']").value;
    const country = nodeForm.querySelector(".add__select[name='country']").value;
    const summary = nodeForm.querySelector(".add__textarea[name='summary']").value;
    console.log("Datos del nuevo autor:", { name, country, summary });

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
        action      : "addAuthor",
        name        : name,
        iso3        : country,
        summary     : summary,
        handler     : handleReturn
    };

    js_fetch.apiFetch( dataRequest );
}

function _controlAddForm() {
    const nodeForm = document.querySelector(".add__form");
    const button = nodeForm.querySelector(".add__save");
    const name = nodeForm.querySelector(".add__input[name='name']").value;
    const country = nodeForm.querySelector(".add__select[name='country']").value;
    const summary = nodeForm.querySelector(".add__textarea[name='summary']").value;

    let valid =
        name.trim() !== "" &&
        country.trim() !== "" &&
        summary.trim() !== "";

    button.disabled = !valid;
};

function _showInsertForm() {
    const handleReturn = (dataResult) => {
        if (dataResult.status.codError === "000") {
            const optionsCountries = js_render.render(
                "optionsCountries",
                dataResult.data
            );
            const data = [{
                optionsCountries
            }];

            const html = js_render.render("addAuthor", data);
            document.body.insertAdjacentHTML("beforeend", html);

            const nodeClose = document.querySelector(".overlay__close");
            nodeClose.addEventListener("click", js_utils.closeOverlay);
            const nodeForm = document.querySelector(".add__form");
            const button = nodeForm.querySelector(".add__save");

            nodeForm.querySelector(".add__input")
                .addEventListener("input", _controlAddForm);
            nodeForm.querySelector(".add__select")
                .addEventListener("change", _controlAddForm);
            nodeForm.querySelector(".add__textarea")
                .addEventListener("input", _controlAddForm);
            _controlAddForm();
            button.addEventListener("click", _addAuthor);
        }
    };

    js_fetch.apiFetch({
        action: "getAllCountries",
        handler: handleReturn
    });
}

/* function _showDeleteForm() {
    const nodeRow = this.closest(".row--data");
    const id = nodeRow.dataset.id;
    console.log( "Borrar autor con id: ", id );
} */


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