module.exports = """
  <li class="{{type}}">
    <p>{{title}}</p>
    <p class="meta">
      {{#points}}
        <span class="points">{{points}}</span>
        <span class="pipe">|</span>
      {{/points}}
      <a href="{{url}}">link</a>
      <span class="pipe">|</span>
      <span class="age">Last update {{age}}</span>
    </p>
  </li>
"""
