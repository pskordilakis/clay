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
import { migrations } from '../migrations'
migrations(knex)
