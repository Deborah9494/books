import js_fetch from './fetch.js';
import js_render from './render.js';

async function _initProfile() {
    const handleReturn = (dataResult) => {
        const container = document.querySelector("#profile_container");
        console.log(dataResult);
        if (!dataResult.data) {
            container.innerHTML = `
                <h2>No has iniciado sesión</h2>
                <p>Por favor inicia sesión para ver tu perfil.</p>
            `;
            return;
        }
        const user = dataResult.data;
        container.innerHTML = `
            <div class="profile_card">
                <h1>${user.username}</h1>
                <p><b>Email:</b> ${user.email}</p>
                <p><b>País:</b> ${user.ISO3}</p>
                <p><b>Creado:</b> ${user.created_at}</p>
                <p><b>Fecha de nacimiento:</b> ${user.date_birth}</p>
            </div>
        `;
    }

    const dataRequest = {
        action: "getSession",
        handler: handleReturn
    };
    js_fetch.apiFetch(dataRequest);
}

document.addEventListener("DOMContentLoaded", _initProfile);