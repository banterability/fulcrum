module.exports = '''
  <li class="{{type}}" style="background-color: rgba(255,0,0,{{staleness}});">
    <p>{{title}}</p>
    <div class="meta">
      <div class="meta-left">
        <a href="{{url}}">link</a>
        <span class="pipe">|</span>
        {{type}} {{#points}}({{points}}){{/points}}
      </div>
      <div class="meta-right">
        <span class="age">Last update {{age}}</span>
      </div>
    </p>
  </li>
'''
