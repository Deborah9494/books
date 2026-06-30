const js_utils = {
    esFechaValida(fechaStr) {
        // Validar formato
        const regex = /^\d{4}-\d{2}-\d{2}$/;

        if (!regex.test(fechaStr)) {
            return false;
        }

        // Convertir a fecha
        const fecha = new Date(fechaStr);

        // Validar que sea una fecha real
        if (isNaN(fecha.getTime())) {
            return false;
        }

        // Evitar fechas inválidas como 2024-02-31
        const [anio, mes, dia] = fechaStr.split('-').map(Number);

        return (
            fecha.getUTCFullYear() === anio &&
            fecha.getUTCMonth() + 1 === mes &&
            fecha.getUTCDate() === dia
        );
    },
    formatNumber( num ) {
        return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    },
    closeOverlay() {
        const nodeOverlay = document.querySelector(".overlay");
        if ( nodeOverlay ) {
            nodeOverlay.remove();
        }
    },
    filterTable(event) {
        const text = event.target.value.toLowerCase().trim();
        const rows = document.querySelectorAll(".row--data");
        rows.forEach(row => {
            const rowText = row.textContent.toLowerCase();
            if (rowText.includes(text)) {
                row.style.display = "";
            } else {
                row.style.display = "none";
            }
        });
    }
}

export default js_utils;