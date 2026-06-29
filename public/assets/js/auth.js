// auth.js
import js_fetch from './fetch.js';
import js_render from './render.js';

function _attachLoginEvents() {

    const container = document.querySelector("#auth_box");
    const loginBtn = container.querySelector(".login_btn");

    if (!loginBtn) return;

    loginBtn.addEventListener("click", () => {

        const email = container.querySelector(".login_email").value;
        const password = container.querySelector(".login_password").value;

        const handleReturn = (dataResult) => {
            console.log(dataResult);
            if (dataResult.status.codError === "000") {
                location.reload();
            } else {
                alert(dataResult.status.msgError);
            }
        };

        const dataRequest = {
            action: "login",
            email,
            password,
            handler: handleReturn
        };

        console.log("Authentication: ");
        console.log(dataRequest);
        js_fetch.apiFetch(dataRequest);
    });
}

function _attachUserEvents() {

    document.querySelector(".logout_btn")
        .addEventListener("click", () => {

            js_fetch.apiFetch({
                action: "logout",
                handler: () => location.reload()
            });
        });
}

function _attachToggleEvent() {
    const container = document.querySelector("#auth_box");
    const toggle = container.querySelector(".auth_toggle");
    const menu = container.querySelector(".auth_menu");

    if (!toggle || !menu) return;

    // open/close toggle button
    toggle.addEventListener("click", (e) => {
        e.stopPropagation();
        menu.classList.toggle("active");
    });

    // prevent clicks inside menu from closing it
    menu.addEventListener("click", (e) => {
        e.stopPropagation();
    });

    // close ONLY when clicking outside auth box
    document.addEventListener("click", (e) => {
        if (!container.contains(e.target)) {
            menu.classList.remove("active");
        }
    });
}

function _renderAuthBox(user) {
    const container = document.querySelector("#auth_box");

    if (!user) {
        container.innerHTML = js_render.render("authLogin", [{}]);
        _attachLoginEvents();
        _attachToggleEvent(); 
    } else {
        container.innerHTML = js_render.render("authUser", [{ name: user.username }]);
        _attachUserEvents();
        _attachToggleEvent(); 
    }
}

function _initAuth() {
    console.log("initAuth");

    const handleReturn = (dataResult) => {
        console.log(dataResult);
        _renderAuthBox(dataResult.data);
    };

    const dataRequest = {
        action: "getSession",
        handler: handleReturn
    }

    js_fetch.apiFetch(dataRequest);
}

document.addEventListener("DOMContentLoaded", _initAuth);