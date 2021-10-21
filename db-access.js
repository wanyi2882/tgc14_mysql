const mysql = require('mysql2/promise')

async function main () {
    const connection = await mysql.createConnection({
        'host': 'localhost', // "127.0.0.1" also means localhost
        'user': 'root',
        'database': 'Chinook'
    })

    let [albums] = await connection.execute("SELECT * FROM Album")
    // => connection.execute returns an array of two elements
    // first element is the results
    // second element returns the number of results
    console.log(albums)

}

main ();