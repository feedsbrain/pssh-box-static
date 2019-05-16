# pssh-box-static

[![Build Status](https://travis-ci.org/feedsbrain/pssh-box-static.svg?branch=master)](https://travis-ci.org/feedsbrain/pssh-box-static)

**[PSSH-BOX](https://github.com/google/shaka-packager/tree/master/packager/tools/pssh) static binaries for Mac OSX, Linux and Windows.**

Currently on supports 64-bit architecture in macOS, Linux and Windows (because that's the only machines that I have to compile the binaries). The current `pssh-box` is taken from `shaka-packager` version is `2.3.0`.

*Note:* The version of `pssh-box-static` follows [SemVer](http://semver.org). When releasing new versions, **we do *not* consider breaking changes in `pssh-box` or `shaka-packager` itself**, but only the JS interface (see below). To stop `pssh-box-static` from breaking your code by getting updated, [lock the version down](https://docs.npmjs.com/files/package.json#dependencies) or use a [lockfile](https://docs.npmjs.com/files/package-lock.json).

## Installation

This module is installed via npm:

``` bash
$ npm install pssh-box-static
```

## Example Usage

Returns the path of a statically linked `pssh-box` binary on the local filesystem.

``` js
var pssh = require('pssh-box-static');
console.log(pssh.path);
// /home/feedsbrain/workspaces/cool-project/node_modules/pssh-box-static/bin/linux/x64/pssh-box
```

## Sources of the binaries

[The build script](src/build.sh) will only compile the binary based on it's own build machine architecture. There are no cross architecture compilers at the moment. We will update this script if it's supported in the future.

## Building the project

Run `npm run build` to build the project on UNIX like operating system. Run `npm run build:win` to build the project on Windows.
