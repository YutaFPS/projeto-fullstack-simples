require('dotenv').config();

const express = require('express');
const cors = require('cors');

const rotas = require('./routes/route');

const app = express();

app.use(cors());
app.use(express.json());

app.use('/api', rotas);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Servidor Online na porta ${PORT}`);
});

// server.js para rodar o servidor ;)