// render.js
import dataUI from './dataUI.js';
const js_render = {
    render( keyToRender, dataRender ) {
        const pageToRender = dataUI[ keyToRender ];

        if ( !pageToRender || typeof pageToRender.template !== "string" ) {
            throw new Error( `js_render.render: falta la plantilla 'template' en dataUI["${keyToRender}"].` );
        }

        let renderedPage = pageToRender.template;
       

        for ( const keyPage in pageToRender ) {
            if ( !Object.hasOwn( pageToRender, keyPage ) ) continue;
            //if ( keyPage === "template" ) continue;

            const rowTemplate = pageToRender[ keyPage ];
            
            let rowsConcat = "";
            dataRender.forEach( element => {
                let row = rowTemplate;
                Object.keys( element ).forEach( keyData => {
                    row = row.replaceAll( `{${keyData}}`, element[ keyData ] );
                });
                rowsConcat+= row;
            });

            renderedPage = renderedPage.replaceAll( `{${keyPage}}`, rowsConcat );
        }
        
        return renderedPage;
    }
}
export default js_render;
