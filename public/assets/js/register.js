import js_fetch from './fetch.js';
import js_render from './render.js';

function _renderForm() {
    const handleReturn = (dataResult) => {
        if (dataResult.status.codError === "000"){

            const optionsCountries = js_render.render(("optionsCountries"), dataResult.data);
            
             const data = [{
                optionsCountries
            }];

            const html = js_render.render("registrationForm", data);
            document.querySelector(".register_container").insertAdjacentHTML("beforeend", html);;
    
            document.querySelector(".reg_btn").addEventListener("click", _register);
        } else {
            console.error(dataResult);
        }

    };

    js_fetch.apiFetch({
        action: "getAllCountries",
        handler: handleReturn
    });
}

async function _register() {
    console.log("Registration");
    const username = document.querySelector(".reg_username").value;
    const email = document.querySelector(".reg_email").value;
    const password = document.querySelector(".reg_password").value;
    const datebirth = document.querySelector(".reg_date").value;
    const country = document.querySelector(".reg_select[name='country']").value;
    console.log("Datos a enviar al servidor: ", {username, email, password, datebirth, country});

    const handleReturn = ( dataResult ) => {
        if (dataResult.status.codError === "000") {
            console.log(dataResult);
            alert("Account created!");
            window.location.href = "profile.php";
        } else {
            console.error(dataResult);
        } 
    };

    const dataRequest = {
        action: "userRegistration",
        username: username,
        user_email: email,
        user_password: password,
        datebirth: datebirth,
        iso3: country,
        handler: handleReturn
    }

    js_fetch.apiFetch( dataRequest );
} 

document.addEventListener("DOMContentLoaded", _renderForm);