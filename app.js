const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
    res.send({
        status: "ONLINE",
        modulo: "Facturación y Finanzas (Legacy)",
        entorno: process.env.NODE_ENV || "desarrollo",
        mensaje: "Conexión exitosa con el backend de pagos."
    });
});

app.listen(PORT, () => {
    console.log(`Modulo de Facturación corriendo en puerto ${PORT}`);
});