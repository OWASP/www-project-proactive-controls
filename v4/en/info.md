### Table of Contents
<ul>
  {% assign mypages = site.pages | where:"document","OWASP Top Ten Proactive Controls 2024"| sort: "order" %}
    {% for page in mypages %}
    {% if page.order > 0 %}
    <li><a href="{{ page.url | absolute_url }}">{{ page.title }}</a></li>
    {% endif %}
    {% endfor %}
</ul>


{% comment %} rm the first H1  {% endcomment %}
<style type="test/css">
  h1.page-title {display: none; }
</style>
