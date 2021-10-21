const express = require('express')
const hbs = require('hbs')
const wax = require('wax-on')
const mysql = require('mysql2/promise')
const helpers = require('handlebars-helpers')({
    'handlebars': hbs.handlebars
})

const app = express();

//SETUP Express

app.use(express.static('public'))
app.set('view engine', 'hbs')
app.use(express.urlencoded({
    'extended': false
}))

// setup wax-on for template inheritance
wax.on(hbs.handlebars)
wax.setLayoutPath('./views/layouts')

// Routes
async function main(){
    app.get('/', function(req,res){
        res.send("Hello World")
    })
}

main()

app.listen(3000, ()=>{
    "server has started"
}
)