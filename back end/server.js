const express = require('express');
const cors = require('cors');
const rotas = require('./routes/rotas');

const app = express();

app.use(cors());
app.use(express.json());
app.use('/api', rotas);

app.listen(3000, () => {
    console.log("Servidor Online na porta 3000");
})

