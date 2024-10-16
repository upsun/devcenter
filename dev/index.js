const express = require('express')
const path = require('path');

const app = express();

app.use(express.json());

/* Handle 404 requests */
app.get('/*', (req, res) => {
    res.status(404).sendFile('/404.html', {
      root: path.join(__dirname, 'public'),
    })
})

app.listen(process.env.PORT, () => {
    console.info(`ExpressJS listening on ${process.env.PORT}.`)
})
