var it = require('tape')
var fs = require('fs')
var psshBox = require('..')

it('should find pssh-box binary', function (t) {
  var stats = fs.statSync(psshBox.path)
  t.ok(stats.isFile(psshBox.path))
  t.end()
})
