module.exports = '''
  <li class="{{type}}">
    <p>{{title}}</p>
    <div class="meta">
      <div class="meta-left">
        <a href="{{url}}">link</a>
        {{#points}}
          <span class="pipe">|</span>
          <span class="points">{{points}}</span>
        {{/points}}
      </div>
      <div class="meta-right">
        <span class="age">Last update {{age}}</span>
      </div>
    </p>
  </li>
'''
