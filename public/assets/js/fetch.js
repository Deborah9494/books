// fetch.js
const js_fetch = {
    async apiFetch(dataRequest) {
        try {
            console.log( window.location.pathname );
            const response = await fetch( "api/fetch.php", {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(dataRequest)
            });

            if (!response.ok) {
                console.error( "Sin comunicación con el servidor: ", response.status );
                throw Error(response.status);
            }

            const body = await response.text();

            let dataRetrieved;
            try {
                dataRetrieved = JSON.parse(body);
            } catch {
                console.error( "La respuesta no es JSON válido: ", body );
                throw Error(body);
            }

            if (typeof dataRequest.handler === 'function') {
                if (typeof dataRequest.returnIndex !== "undefined") {
                    dataRequest.handler(dataRetrieved, dataRequest.returnIndex);
                } else {
                    dataRequest.handler(dataRetrieved);
                }
            } else {
                console.warn(`No se definió un handler para action "${dataRequest.action}"`);
            }
        } catch (error) {
            console.error(error);
            throw error;
        }
    }
};

export default js_fetch;