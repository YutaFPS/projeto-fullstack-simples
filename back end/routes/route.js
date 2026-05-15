exports.register = async (req, res) => {

    try {

        const {
            nome,
            email,
            senha,
            bairro_id
        } = req.body;

        const foto = req.file
            ? req.file.buffer
            : null;

        const senhaCriptografada =
            await bcrypt.hash(senha, 10);

        const sql = `
            INSERT INTO usuarios
            (
                nome,
                email,
                senha,
                foto,
                bairro_id,
                data_hora
            )
            VALUES (?, ?, ?, ?, ?, NOW())
        `;

        db.query(
            sql,
            [
                nome,
                email,
                senhaCriptografada,
                foto,
                bairro_id
            ],
            (err, result) => {

                if (err) {
                    console.log(err);
                    return res.status(500).json(err);
                }

                res.json({
                    mensagem: "Usuário cadastrado"
                });

            }
        );

    } catch (error) {

        res.status(500).json(error);

    }

};