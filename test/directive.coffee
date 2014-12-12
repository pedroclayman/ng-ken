describe 'ng-ken: directive', ->

  compile = {}
  rootScope = {}
  element = {}

  beforeEach ->
    module 'ng-ken'

  beforeEach ->
    inject (_$compile_, _$rootScope_) ->
      compile = _$compile_
      rootScope = _$rootScope_


  beforeEach ->
    element = compile('<div ken></div>')(rootScope)

  it 'should compile', ->
    expect element
      .not.toBeNull()
