
akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ npm init -y
Wrote to ...\altschool-s02-e01\package.json:

{
  "name": "altschool-s02-e01",
  "version": "1.0.0",
  "description": "AltSchool Second Semester Exam (Practical)",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/akcumeh/altschool-s02-e01.git"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "type": "commonjs",
  "bugs": {
    "url": "https://github.com/akcumeh/altschool-s02-e01/issues"
  },
  "homepage": "https://github.com/akcumeh/altschool-s02-e01#readme"
}




akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ npm i --save-dev nodemon

added 30 packages, and audited 31 packages in 5s

4 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ touch .gitignore

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ touch .env

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ mkdir config; touch config/db.js

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ npm i

up to date, audited 31 packages in 2s

4 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ mkdir models

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ cd models/

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01/models (main)
$ touch User.js Post.js

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01/models (main)
$ cd ..; mkdir utils controllers; touch server.js

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ npm i express mongoose jsonwebtoken bcryptjs dotenv

added 95 packages, and audited 126 packages in 16s

29 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ npm run dev

> altschool-s02-e01@1.0.0 dev
> nodemon server.js

[nodemon] 3.1.11
[nodemon] to restart at any time, enter `rs`
[nodemon] watching path(s): *.*
[nodemon] watching extensions: js,mjs,cjs,json
[nodemon] starting `node server.js`
[dotenv@17.2.4] injecting env (4) from .env -- tip: ⚙️  specify custom .env file path with { path: '/custom/path/.env' }
server is running on port 3000
connected to db


akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ ls
config/  controllers/  models/  node_modules/  package.json  package-lock.json  README.md  server.js  utils/

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ mkdir utils/
mkdir: cannot create directory ‘utils/’: File exists

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ cd utils; ls

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01/utils (main)
$ touch readingTimeCalculator.js

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01/utils (main)
$ cd ../controllers/; ls

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01/controllers (main)
$ touch authController.js blogController.js; mkdir ../routes

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01/controllers (main)
$ cd ../routes/; touch authRoutes.js blogRoutes.js

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01/routes (main)
$ mkdir ../middleware; touch ../middleware/auth.js

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01/routes (main)
$ cd ..

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ npm run dev

> altschool-s02-e01@1.0.0 dev
> nodemon server.js

[nodemon] 3.1.11
[nodemon] to restart at any time, enter `rs`
[nodemon] watching path(s): *.*
[nodemon] watching extensions: js,mjs,cjs,json
[nodemon] starting `node server.js`
[dotenv@17.2.4] injecting env (4) from .env -- tip: 🔄 add secrets lifecycle management: https://dotenvx.com/ops
server is running on port 3000
error connecting: Could not connect to any servers in your MongoDB Atlas cluster. One common reason is that you're trying to access the database from an IP that isn't whitelisted. Make sure your current IP address is on your Atlas cluster's IP whitelist: https://www.mongodb.com/docs/atlas/security-whitelist/
[nodemon] app crashed - waiting for file changes before starting...
rs
[nodemon] starting `node server.js`
[dotenv@17.2.4] injecting env (4) from .env -- tip: ⚙️  specify custom .env file path with { path: '/custom/path/.env' }
server is running on port 3000
connected to db
[nodemon] restarting due to changes...
[nodemon] starting `node server.js`
[dotenv@17.2.4] injecting env (4) from .env -- tip: ⚙️  write to custom object with { processEnv: myObject }
[nodemon] restarting due to changes...
[nodemon] starting `node server.js`
[dotenv@17.2.4] injecting env (4) from .env -- tip: 🔐 encrypt with Dotenvx: https://dotenvx.com
server is running on port 3000
connected to db
[nodemon] restarting due to changes...
[nodemon] starting `node server.js`
[dotenv@17.2.4] injecting env (4) from .env -- tip: 👥 sync secrets across teammates & machines: https://dotenvx.com/ops
server is running on port 3000
connected to db
[nodemon] restarting due to changes...
[nodemon] starting `node server.js`
[dotenv@17.2.4] injecting env (4) from .env -- tip: 📡 add observability to secrets: https://dotenvx.com/ops
server is running on port 3000
[nodemon] restarting due to changes...
[nodemon] starting `node server.js`
[dotenv@17.2.4] injecting env (4) from .env -- tip: ⚙️  suppress all logs with { quiet: true }
server is running on port 3000
[nodemon] restarting due to changes...
[nodemon] starting `node server.js`
[dotenv@17.2.4] injecting env (4) from .env -- tip: ⚙️  suppress all logs with { quiet: true }
server is running on port 3000
connected to db
[nodemon] restarting due to changes...
[nodemon] starting `node server.js`
[dotenv@17.2.4] injecting env (4) from .env -- tip: ✅ audit secrets and track compliance: https://dotenvx.com/ops
server is running on port 3000
connected to db
[nodemon] restarting due to changes...
[nodemon] starting `node server.js`
[dotenv@17.2.4] injecting env (4) from .env -- tip: 🔄 add secrets lifecycle management: https://dotenvx.com/ops
server is running on port 3000
connected to db
[nodemon] restarting due to changes...
[nodemon] starting `node server.js`
[dotenv@17.2.4] injecting env (4) from .env -- tip: ⚙️  specify custom .env file path with { path: '/custom/path/.env' }
[nodemon] restarting due to changes...
[nodemon] starting `node server.js`
[dotenv@17.2.4] injecting env (4) from .env -- tip: ⚙️  specify custom .env file path with { path: '/custom/path/.env' }
server is running on port 3000
connected to db
[nodemon] restarting due to changes...
[nodemon] starting `node server.js`
[dotenv@17.2.4] injecting env (4) from .env -- tip: 🗂️ backup and recover secrets: https://dotenvx.com/ops
server is running on port 3000
connected to db


akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ npm i -g heroku
npm warn deprecated osenv@0.1.5: This package is no longer supported.
npm warn deprecated inflight@1.0.6: This module is not supported, and leaks memory. Do not use it. Check out lru-cache if you want a good and tested way to coalesce async requests by a key value, which is much more comprehensive and powerful.
npm warn deprecated rimraf@2.7.1: Rimraf versions prior to v4 are no longer supported
npm warn deprecated glob@7.2.3: Old versions of glob are not supported, and contain widely publicized security vulnerabilities, which have been fixed in the current version. Please update. Support for old versions may be purchased (at exorbitant rates) by contacting i@izs.me
npm warn deprecated @oclif/screen@3.0.8: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated @oclif/screen@1.0.4: Deprecated in favor of @oclif/core
npm warn deprecated @oclif/color@0.1.2: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated uuid@3.3.2: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
npm warn deprecated @oclif/command@1.8.36: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated @oclif/help@1.0.15: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated rimraf@2.6.3: Rimraf versions prior to v4 are no longer supported
npm warn deprecated strip-eof@2.0.0: Renamed to `strip-final-newline` to better represent its functionality.
npm warn deprecated @oclif/errors@1.3.6: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated @heroku-cli/plugin-ps@8.1.7: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated @oclif/parser@3.8.17: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated @oclif/config@1.18.16: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated @oclif/config@1.18.17: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated @heroku-cli/plugin-run@8.1.4: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.        
npm warn deprecated @oclif/screen@3.0.8: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated @oclif/screen@1.0.4: Deprecated in favor of @oclif/core
npm warn deprecated acorn-import-assertions@1.9.0: package has been renamed to acorn-import-attributes
npm warn deprecated cli-ux@4.9.3: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated debug@4.1.1: Debug versions >=3.2.0 <3.2.7 || >=4 <4.3.1 have a low-severity ReDos regression when used in a Node.js environment. It is recommended you upgrade to 3.2.7 or 4.3.1. (https://github.com/visionmedia/debug/issues/797)
npm warn deprecated heroku-cli-util@8.0.12: This package has been deprecated. Install the new supported version at https://www.npmjs.com/package/@heroku/heroku-cli-util
npm warn deprecated cli-ux@6.0.9: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.

added 14 packages, removed 15 packages, and changed 951 packages in 2m

52 packages are looking for funding
  run `npm fund` for details

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ heroku login
heroku: Press any key to open up the browser to login or q to exit: 
Opening browser to https://cli-auth.heroku.com/auth/...
Logging in... done
Logged in as ...@gmail.com

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ heroku create altsch-s02-e01
 »   Warning: heroku update available from 8.7.1 to 10.16.0.
Creating ⬢ altsch-s02-e01... !
 !    To create an app, verify your account by adding payment information. Verify now at https://heroku.com/verify Learn more at
 !    https://devcenter.heroku.com/articles/account-verification

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ heroku create altsch-s02-e01
 »   Warning: heroku update available from 8.7.1 to 10.16.0.
Creating ⬢ altsch-s02-e01... done
https://altsch-s02-e01-dfa405ab572e.herokuapp.com/ | https://git.heroku.com/altsch-s02-e01.git

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ heroku config:set MONGODB_URI="mongodb+srv://blah.mongodb.net/blogging-api"
 »   Warning: heroku update available from 8.7.1 to 10.16.0.
Setting MONGODB_URI and restarting ⬢ altsch-s02-e01... done, v3
MONGODB_URI: mongodb+srv://blah.mongodb.net/blogging-api

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ heroku config:set JWT_SECRET="..."
 »   Warning: heroku update available from 8.7.1 to 10.16.0.
Setting JWT_SECRET and restarting ⬢ altsch-s02-e01... done, v4
JWT_SECRET: ...

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ heroku config:set JWT_EXPIRY="1h"
 »   Warning: heroku update available from 8.7.1 to 10.16.0.
Setting JWT_EXPIRY and restarting ⬢ altsch-s02-e01... done, v5
JWT_EXPIRY: 1h

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ touch Procfile

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
school-s02-e01 (main)
$ npm i joi

added 8 packages, and audited 134 packages in 15s
school-s02-e01 (main)
$ npm i joi

added 8 packages, and audited 134 packages in 15s

school-s02-e01 (main)
$ npm i joi

added 8 packages, and audited 134 packages in 15s
$ npm i joi

added 8 packages, and audited 134 packages in 15s

added 8 packages, and audited 134 packages in 15s
added 8 packages, and audited 134 packages in 15s

29 packages are looking for funding
29 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

main)
$ touch utils/validator.js

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ git add .

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ git commit -m "prepare to deploy"
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ git push heroku main
fatal: unable to access 'https://git.heroku.com/altsch-s02-e01.git/': Could not resolve host: git.heroku.com

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ git push heroku main
Enumerating objects: 47, done.
Counting objects: 100% (47/47), done.
Delta compression using up to 8 threads
Compressing objects: 100% (43/43), done.
Writing objects: 100% (47/47), 21.89 KiB | 476.00 KiB/s, done.
Total 47 (delta 13), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Updated 18 paths from ece1f71
remote: Compressing source files... done.
remote: Building source:
remote: 
remote: -----> Building on the Heroku-24 stack
remote: -----> Determining which buildpack to use for this app
remote: -----> Node.js app detected
remote:
remote: -----> Creating runtime environment
remote:
remote:        NPM_CONFIG_LOGLEVEL=error
remote:        NODE_VERBOSE=false
remote:        NODE_ENV=production
remote:        NODE_MODULES_CACHE=true
remote:
remote: -----> Installing binaries
remote:        engines.node (package.json):   unspecified
remote:        engines.npm (package.json):    unspecified (use default)
remote:
remote:        Resolving node version 24.x...
remote:        Downloading and installing node 24.13.0...
remote:        Validating checksum
remote:        Using default npm version: 11.6.2
remote:
remote: -----> Installing dependencies
remote:        Installing node modules
remote:
remote:        added 132 packages, and audited 133 packages in 1s
remote:
remote:        29 packages are looking for funding
remote:          run `npm fund` for details
remote:
remote:        found 0 vulnerabilities
remote:        npm notice
remote:        npm notice New minor version of npm available! 11.6.2 -> 11.9.0
remote:        npm notice Changelog: https://github.com/npm/cli/releases/tag/v11.9.0
remote:        npm notice To update run: npm install -g npm@11.9.0
remote:        npm notice
remote:
remote: -----> Build
remote:
remote: -----> Caching build
remote:        - npm cache
remote:
remote: -----> Pruning devDependencies
remote:
remote:        removed 26 packages, and audited 107 packages in 429ms
remote:
remote:        25 packages are looking for funding
remote:          run `npm fund` for details
remote:
remote:        found 0 vulnerabilities
remote:        npm notice
remote:        npm notice New minor version of npm available! 11.6.2 -> 11.9.0
remote:        npm notice Changelog: https://github.com/npm/cli/releases/tag/v11.9.0
remote:        npm notice To update run: npm install -g npm@11.9.0
remote:        npm notice
remote:
remote: -----> Build succeeded!
remote: -----> Discovering process types
remote:        Procfile declares types -> web
remote:
remote: -----> Compressing...
remote:        Done: 56.7M
remote: -----> Launching...
remote:        Released v6
remote:        https://altsch-s02-e01-dfa405ab572e.herokuapp.com/ deployed to Heroku
remote:
remote: Verifying deploy... done.
To https://git.heroku.com/altsch-s02-e01.git
 * [new branch]      main -> main

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ heroku open
 »   Warning: heroku update available from 8.7.1 to 10.16.0.

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$ touch cli-logs.txt

akcumeh@Angel-PC-3 MINGW64 ~.../altschool-s02-e01 (main)
$