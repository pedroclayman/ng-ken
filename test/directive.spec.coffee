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

  describe '', ->
    beforeEach ->
      element = compile('<div ken><img src="" /></div>')(rootScope)

    it 'should compile', ->
      expect element
        .not.toBeNull()

    it 'should add CSS classes the element', ->
      hasClass = element.hasClass 'ken'

      expect hasClass
        .toBeTruthy()

  describe '', ->
    beforeEach ->
      element = compile('<div ken></div>')(rootScope)

    it 'should not fail if there are no children', ->
      children = element[0].children

      expect children.length
        .toBe 0

  describe '', ->

    beforeEach ->
      rootScope.options =
        duration:'123s'

      element = compile('<div ken="options"><img src="" /></div>')(rootScope)

    it 'should add inline style transition-duration with a value passed from the outer scope', ->
      firstChild = element[0].querySelector ':first-child'

      expect firstChild
        .not.toBeNull()

      style = firstChild.style.transitionDuration
      expect style
        .toEqual '123s'
