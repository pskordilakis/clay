# Clay

CLI tool to transform databases. Update/Transform database to new schema using migration files.

## Workflow

Clay uses docker to build an environment for tinkering with an existing database.
The basic flow is based on the three following steps:
1. A mysql container is used to load any provided dump file.
2. Run migrations against the database using [knex.js](https://knexjs.org) library.
3. Create a new dump file from the altered database that you can use to import in a new database.

## Installation

Clone/Fork repository. __Keep in private repository if you do not want anything exposed to the public.__

The only prerequisite that you need to have installed is docker.

## Writing migrations

The entry point of the application is located in app/migrations/index.js. In this file a function is defined that accepts the knex object (connection with the running database). You can structure your program any way you want, but you must use the provided object to execute the queries and in the end return a Promise.

### Example
``` js
export function migrations(knex) {
    const alterations = [
        knex.schema.table('client', table => table.dropColumn('title')),
        knex.schema.dropTable('company'),
    ]

    return Promise.all(alterations)
}
```

## Usage

A script is provided for ease of use.

### Start the environment

The following command will create and start the mysql container. Also it will download the node dependencies.

``` bash
./clay up
```

### Run migration files

Move the dump file you want to use in app/db, all input and output dumps resides in this folder.

Use run command to execute the migrations. The parameters is the input dump file name and the output file name.
__In both parameters only the filename must be provided__. It get/create the files from app/db path.

``` bash
./clay run <in.sql> <out.sql>
```

The command have 4 stages.
1. Transpile the code for nodejs.
2. Restore database from <in.sql>
3. Execute migrations
4. Create new dump as <out.sql>


With the run command you can write and see the results in iterations. The out.sql will be from the provided in.sql dump file.

### Cleanup

Use down command. To stop all running containers.

``` bash
./clay down
```
