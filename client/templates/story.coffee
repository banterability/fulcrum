module.exports = '''
  <li class="{{type}}">
    <p>{{title}}</p>
    <div class="stale-light {{staleClass}}"></div>
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
