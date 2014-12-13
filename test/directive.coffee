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
    element = compile('<div ken><img src="" /></div>')(rootScope)

  it 'should compile', ->
    expect element
      .not.toBeNull()

  it 'should add CSS classes the element', ->
    hasClass = element.hasClass 'ken'

    expect hasClass
      .toBeTruthy()
