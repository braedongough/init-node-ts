#!/bin/bash 

if [ -z "$1" ]
  then
    echo "No project name supplied"
    exit 1
fi

mkdir $1
cd $1/

# Create package.json
echo '{
  "name": "'$1'",
  "version": "1.0.0",
  "description": "This project was bootstrapped using real straps from a boot",
  "main": "src/index.ts",
  "scripts": {
    "start": "nodemon src/index.ts"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "express": "^4.17.1",
    "ts-node": "^8.10.1"
  },
  "devDependencies": {
    "@types/express": "^4.17.6",
    "@types/node": "^14.0.4",
    "nodemon": "^2.0.4",
    "typescript": "^3.9.3"
  }
}
' > package.json

# Create tsconfig
echo '
{
  "compilerOptions": {
    "module": "commonjs",
    "esModuleInterop": true,
    "target": "es6",
    "noImplicitAny": true,
    "moduleResolution": "node",
    "sourceMap": true,
    "outDir": "dist",
    "baseUrl": ".",
    "paths": {
      "*": ["node_modules/*"]
    }
  },
  "include": ["src/**/*"]
}' > tsconfig.json

mkdir src

# create server in src/index.ts
echo "
import express from 'express'

const app = express()
app.set('port', process.env.PORT || 3000)

app.get('/', (req, res) => {
    res.send('hey bitch lets get crackin')

    console.log('chokolademælk er godt for dine knogler')
})

const server = app.listen(app.get('port'), () => {
    console.log(
        '  App is running at http://localhost:%d in %s mode',
        app.get('port'),
        app.get('env')
    )
    console.log('  Press CTRL-C to stop\n')
})

export default server" > src/index.ts

git init

yarn