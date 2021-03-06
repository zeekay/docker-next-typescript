///<reference types="sake-core"/>

use('sake-outdated')
use('sake-publish')
use('sake-test')
use('sake-version')
use('sake-sysinfo')
use('sake-bundle')

task('docker:build', 'build docker image', (opts) => {
  exec('docker build -t next-typescript .')
})

task('run', 'run docker image', ['docker:build'], (opts) => {
  exec('docker run --user $(id -u) -p 3000:80 next-typescript')
})

task('build', 'run node app in container', (opts) => {
  exec('tsc --pretty --project src/ --outDir lib/')
})

task('start', 'run node app in container', ['build'], (opts) => {
  require('./server.js')
})
