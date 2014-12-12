gulp      = require 'gulp'
coffee    = require 'gulp-coffee'
uglify    = require 'gulp-uglify'
del       = require 'del'
fs        = require 'fs'
gutil     = require 'gulp-util'
concat    = require 'gulp-concat'


gulp.task 'compile', ['clear'], ->
  gulp.src './src/**/*.coffee'
    .pipe coffee bare:true
    .pipe gulp.dest 'build/scripts'
    .pipe concat 'ng-ken.js'
    .pipe gulp.dest 'dist/scripts'
    .pipe uglify()
    .pipe concat 'ng-ken.min.js'
    .pipe gulp.dest 'dist/scripts'

gulp.task 'clear', ->
  del './build/**.*'
  del './dist/**.*'

gulp.task 'version', ->
  pkg = require './package.json'
  stringSrc "version", "#{pkg.name} - #{pkg.version}\n===========================\n#{pkg.description}"
  .pipe(gulp.dest('dist/'))

gulp.task 'watch', ->
  gulp.watch './src/**/*.coffee', ['compile']

gulp.task 'default', ->
  gulp.start ['compile', 'version']


###########################################
### helpers
###########################################

stringSrc = (filename, content) ->
  src = require('stream').Readable( objectMode:true )
  src._read = ->
    @push (new gutil.File(cwd: "", base: "", path: filename, contents: new Buffer(content)))
    @push null
  src
