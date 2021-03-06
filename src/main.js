const knex = require('knex')({
  client: 'mysql',
  connection: {
    host : 'mysql',
    user : 'prime',
    password : 'secret',
    database : 'clay'
  }
})

// read file migrations.js
import { migrations } from '../app/migrations'

migrations(knex)
  .then(() => process.exit(0))

