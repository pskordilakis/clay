'use strict';

function migrations(knex) {
  console.log('asdsd');
}

var knex = require('knex')({
  client: 'mysql',
  connection: {
    host: 'mysql',
    user: 'prime',
    password: 'secret',
    database: 'clay'
  }
}); // read file migrations.js
migrations(knex);
