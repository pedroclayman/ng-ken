gulp        = require 'gulp'
coffee      = require 'gulp-coffee'
uglify      = require 'gulp-uglify'
fs          = require 'fs'
gutil       = require 'gulp-util'
concat      = require 'gulp-concat'
sass        = require 'gulp-sass'
clean       = require 'gulp-clean'
minifyCss   = require 'gulp-minify-css'
rename      = require 'gulp-rename'


gulp.task 'compile-coffee', ->
  gulp.src './src/**/*.coffee'
    .pipe coffee bare:true
    .pipe gulp.dest 'build/scripts'
    .pipe concat 'ng-ken.js'
    .pipe gulp.dest 'dist/scripts'
    .pipe uglify()
    .pipe concat 'ng-ken.min.js'
    .pipe gulp.dest 'dist/scripts'

gulp.task 'compile-scss', ->
  gulp.src './styles/**/*.scss'
   .pipe sass()
   .pipe gulp.dest 'build/styles'
   .pipe concat 'ng-ken.css'
   .pipe gulp.dest 'dist/styles'
   .pipe minifyCss keepBreaks:false
   .pipe rename 'ng-ken.min.css'
   .pipe gulp.dest 'dist/styles'

gulp.task 'clean', ->
  gulp.src './build/**', read:false
    .pipe clean()
  gulp.src './dist/**', read:false
    .pipe clean()

gulp.task 'version', ->
  pkg = require './package.json'
  stringSrc "version", "#{pkg.name} - #{pkg.version}\n===========================\n#{pkg.description}"
  .pipe(gulp.dest('dist/'))


gulp.task 'watch', ->
  gulp.watch './src/**/*.coffee', ['compile-coffee']

gulp.task 'default', ['clean'], ->
  gulp.start ['compile-coffee', 'compile-scss', 'version']


###########################################
### helpers
###########################################

stringSrc = (filename, content) ->
  src = require('stream').Readable( objectMode:true )
  src._read = ->
    @push (new gutil.File(cwd: "", base: "", path: filename, contents: new Buffer(content)))
    @push null
  src
