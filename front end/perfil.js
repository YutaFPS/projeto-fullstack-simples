const API = "http://localhost:3000";

const usuario = JSON.parse(
    localStorage.getItem("usuario")
);

if (!usuario) {

    alert("Você precisa estar logado");

    window.location.href = "index.html";

}


async function carregarPerfil() {

    const resposta = await fetch(
        `${API}/perfil/${usuario.id}`
    );

    const dados = await resposta.json();

    document.getElementById("dadosPerfil")
    .innerHTML = `

        <h2>${dados.nome}</h2>

        <p>${dados.email}</p>

        <p>${dados.nome_bairro}</p>

    `;

}

carregarPerfil();