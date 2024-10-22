const express = require('express')
const path = require('path');
const basicAuth = require('express-basic-auth');

const app = express();

var securedRoutes = require('express').Router()

securedRoutes.use((req, res, next) => {

    // -----------------------------------------------------------------------
    // authentication middleware
  
    const auth = {login: 'upsun', password: 'friday'} // change this
  
    // parse login and password from headers
    const b64auth = (req.headers.authorization || '').split(' ')[1] || ''
    const [login, password] = Buffer.from(b64auth, 'base64').toString().split(':')
  
    // Verify login and password are set and correct
    if (login && password && login === auth.login && password === auth.password) {
      // Access granted...
      return next()
    }
  
    // Access denied...
    res.set('WWW-Authenticate', 'Basic realm="401"') // change this
    res.status(401).send('Authentication required.') // custom message
  
    // -----------------------------------------------------------------------
  
  })


securedRoutes.get('*', (req, res) => {
    res.send("you are authorized to view this");
});

app.use('/dcxs/*', securedRoutes)
app.get('/*', (req, res) => {
    res.send("welome to the docs")
});

app.listen(process.env.PORT, () => {
    console.info(`ExpressJS listening on ${process.env.PORT}.`)
})