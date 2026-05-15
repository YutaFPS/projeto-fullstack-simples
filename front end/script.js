const API = "http://localhost:3000";

const modal = document.getElementById("modalLogin");
const abrirModal = document.getElementById("abrirModal");
const fechar = document.querySelector(".fechar");

abrirModal.onclick = () => {
    modal.style.display = "flex";
};

fechar.onclick = () => {
    modal.style.display = "none";
};

window.onclick = (e) => {
    if (e.target === modal) {
        modal.style.display = "none";
    }
};


const cadastroForm = document.getElementById("cadastroForm");

cadastroForm.addEventListener("submit", async (e) => {

    e.preventDefault();

    const formData = new FormData(cadastroForm);

    const resposta = await fetch(`${API}/register`, {
        method: "POST",
        body: formData
    });

    const dados = await resposta.json();

    alert(dados.mensagem);

});


const loginForm = document.getElementById("loginForm");

loginForm.addEventListener("submit", async (e) => {

    e.preventDefault();

    const form = new FormData(loginForm);

    const body = {
        email: form.get("email"),
        senha: form.get("senha")
    };

    const resposta = await fetch(`${API}/login`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(body)
})});