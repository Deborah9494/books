// dataUI.js
const pagesToRender = { 
    "genres" : {
    "template" :    `<div class='genres'>
                        <div class='genres__actions'>
                            <button class='genres__insert'>Añadir género</button>
                        </div>
                        <div class='genres__row genres__row--header'>
                            <div class='genres__cell'>Id</div>
                            <div class='genres__cell'>Nombre</div>
                            <div class='genres__cell'>Acciones</div>
                        </div>
                        {dataGenres}
                    </div>`,
    "dataGenres":   `<div data-genreid='{genreId}' class='genres__row genres__row--data'>
                        <div class='genres__cell genres__cell--id'>{genreId}</div>
                        <div class='genres__cell genres__cell--name'>{genreName}</div>
                        <div class='genres__cell genres__cell--actions'>
                            <button class='genres__edit'>Editar</button>
                            <button class='genres__delete'>Borrar</button>
                            <button class='genres__show_books'>Ver Libros</button>
                        </div>     
                    </div>`,
    },
    "editGenre" : {
        "template":    `<div class="overlay editgenre">
                            {form}
                        </div>`,
        "form":     `<div data-genreid="{genreId}" class="editgenre__form editgenre__form--light">
                        <div class="overlay__header">
                            <h2>Editar género</h2>
                            <div class="overlay__close">X</div>
                        </div>
                        <div>
                            <input name="genrename" type="text" class='editgenre__input' placeholder="nombre del género" value="{genreName}">
                        </div>
                        <div>
                            <input type="button" value="Grabar" class="editgenre__save" disabled>
                        </div>
                    </div>`
    },
    "addGenre" : {
        "template": `<div class="overlay addgenre">
                        {form}
                    </div>`,
        "form": `<div class="addgenre__form addgenre__form--light">
                    <div class="overlay__header">
                        <h2>Nuevo género</h2>
                        <div class="overlay__close">X</div>
                    </div>
                    <div>
                        <input name="genrename" type="text" class='addgenre__input' placeholder="nombre del género">
                    </div>
                    <div>
                        <input type="button" value="Grabar" class="addgenre__save" disabled>
                    </div>
                </div>`
    },
    "genreRow" : {
        "template": `{dataGenre}`,
        "dataGenre": `<div data-genreid='{genreId}' class='genres__row genres__row--data'>
                        <div class='genres__cell genres__cell--id'>{genreId}</div>
                        <div class='genres__cell genres__cell--name'>{genreName}</div>
                        <div class='genres__cell genres__cell--actions'>
                            <button class='genres__edit'>Editar</button>
                            <button class='genres__delete'>Borrar</button>
                            <button class='genres__show_books'>Ver Libros</button>
                        </div> 
                    </div>`
    },
    "deleteGenre": {
        "template": `<div class="overlay deletegenre">
                        {deleteData}
                    </div>`,
        "deleteData": `<div data-genreid="{genreId}" class="deletegenre__form deletegenre__form--light">
                        <div class="overlay__header">
                            <h2>Deletear género</h2>
                            <div class="overlay__close">X</div>
                        </div>
                        <div>
                            <input name="genrename" type="text" class='deletegenre__input' placeholder="nombre del género" value="{genreName}" disabled>
                        </div>
                        <div>
                            <input type="button" value="Borrar" class="deletegenre__save">
                        </div>
                    </div>`
    },
    "genreBook": {
        "template": `
        <div class="card_container">
            {dataBooks}
        </div>
        `,
        "dataBooks": `
            <div class="card" 
                data-bookid="{book_id}"
                data-bookname="{book_name}"
                data-firstpublicationdate="{first_publication_date}"
                data-coverimage="{cover_image}"
                data-summary="{summary}"
                >  
                <div class="card_inner">   
                    <div class="card_front">          
                        <img class="card_image_full" 
                            src="{cover_image}" 
                            alt="{book_name}"
                        >          
                    <div class="card_title_overlay">{book_name}</div>      
                    </div>      
                
                    <div class="card_back">          
                        <a href="books.php?book_id={book_id}"><h3>{book_name}</h3></a>
                        <p class="date">{first_publication_date}</p>          
                        <p>{summary}</p>
                        <button data-bookid="{book_id}" class="genrebook__delete">Remove from genre</button>      
                    </div>  
                </div>
            </div>
        `
    },
    "book": {
        "template": `
            {bookCard}
        `,
        "bookCard": `
            <div class="card"
                data-bookid="{book_id}"
                data-bookname="{book_name}"
                data-firstpublicationdate="{first_publication_date}"
                data-coverimage="{cover_image}"
                data-summary="{summary}"
            >
                <div class="card_inner">   
                    <div class="card_front">          
                        <img class="card_image_full" 
                            src="{cover_image}" 
                            alt="{book_name}"
                        >          
                    <div class="card_title_overlay">{book_name}</div>      
                    </div>      
                
                    <div class="card_back">          
                        <a href="books.php?book_id={book_id}">  <h3>{book_name}</h3> 
                        </a>          
                        <p class="date">{first_publication_date}</p>          
                        <p>{summary}</p>   
                        <button data-bookid="{book_id}" class="genrebook__delete">Remove from genre</button>     
                    </div>  
                </div>
            </div>
        `
    },
    "addBookForm": {
        "template": `
        <div class="genrebooks__add">
            <div class="genrebooks__controls">
                <!-- <input name="book_search" type="text" class='genrebooks__search' placeholder="Buscar libro..."> -->
                <select name="book_select" class="genrebooks__select">
                    <option value="">Selecciona un libro</option>
                </select>
                <button class="genrebooks__addbutton">Añadir libro</button>
            </div>
        </div>
        `
    },
    "detailGenre": {
        "template": `
            <div class="overlay showbooks">
            <div class="showbooks__panel">
                <div class="overlay__header">
                    <h2>Libros de género "{genreName}"</h2>
                    <div class="overlay__close">X</div>
                </div>
                <div class="showbooks__body">
                    {addBookForm}
                    {dataBooks}
                </div>
            </div>
            </div>
        `,
        "genreName" : `{genreName}`,
        "addBookForm" : `{addBookForm}`,
        "dataBooks" :  `{dataBooks}`
    },
    "authors":{
        "template": `<div class="authors">
                        <div class="actions">
                            <button class="insert">Añadir autor</button>
                        </div>
                        <div class="row row--header">
                            <div class="cell cell--id">Id</div>
                            <div class="cell cell--name">Autor</div>
                            <div class="cell cell-country">País</div>
                            <div class="cell cell--summary">Summary</div>
                            <div class="cell cell--actions">Acciones</div>
                        </div>
                        {data}
                    </div>`,
        "data": `<div data-id='{id}' class='row row--data'>
                    <div class='cell cell--id'>{id}</div>
                    <div class='cell cell--name'>{name}</div>
                    <div class='cell cell--country'>{country}</div>
                    <div class='cell cell--summary'>{summary}</div>
                    <div class='cell cell--actions'>
                        <button class='edit'>Editar</button>
                        <button class='delete'>Borrar</button>
                    </div>
                </div>`
     },
     "optionsCountries": {
        "template": `{option}`,
        "option": `<option value="{iso3}">{country_name}</option>`
     },
     "editAuthor": {
        "template": `<div class="overlay edit">
                            {form}
                    </div>`,
        "form": `<div 
                    data-id="{id}"
                    data-original-name="{name}"
                    data-original-country="{country}"
                    data-original-summary="{summary}"
                    class="edit__form edit__form--light"
                 >
                    <div class="overlay__header">
                        <h2>Editar autor</h2>
                        <div class="overlay__close">X</div>
                    </div>
                    <div>
                        <input name="name" type="text" class='edit__input form__field' placeholder="nombre del autor" value="{name}">
                    </div>
                    <div>
                        <select name="country" class="edit__select form__field">
                            {optionsCountries}
                        </select>
                    </div>
                    <div>
                        <textarea name="summary" class='edit__textarea form__field' placeholder="summary">{summary}</textarea>
                    </div>
                    <div>
                        <button class="edit__save" disabled>Guardar</button>
                    </div>
                </div>
            </div>`
    },
    "addAuthor": {
    "template": `<div class="overlay add">
                    {form}
                </div>`,
    "form": `<div class="add__form add__form--light">
                <div class="overlay__header">
                    <h2>Añadir autor</h2>
                    <div class="overlay__close">X</div>
                </div>

                <div>
                    <input name="name" type="text" class="add__input form__field" placeholder="nombre del autor">
                </div>

                <div>
                    <select name="country" class="add__select form__field">
                        {optionsCountries}
                    </select>
                </div>

                <div>
                    <textarea name="summary" class="add__textarea form__field" placeholder="summary"></textarea>
                </div>

                <div>
                    <button class="add__save" disabled>Guardar</button>
                </div>
            </div>`
    },
    "deleteAuthor": {
        "template": `<div class="overlay delete">
                            {form}
                    </div>`,
        "form": `<div 
                    data-id="{id}"
                    class="delete__form delete__form--light"
                 >
                    <div class="overlay__header">
                        <h2>¿Borrar autor?</h2>
                        <div class="overlay__close">X</div>
                    </div>
                    <div>
                        <input name="name" type="text" class='delete__input form__field' placeholder="nombre del autor" value="{name}" disabled>
                    </div>
                    <div>
                        <input name="country" type="text" class='delete__input form__field' placeholder="país del autor" value="{country}" disabled>
                    </div>
                    <div>
                        <input name="summary" type="textarea" class='delete__input form__field' placeholder="summary" value="{summary}" disabled>
                    </div>
                    <div>
                        <button class="delete__save">Borrar</button>
                    </div>
                </div>
            </div>`
    }
};

export default pagesToRender;