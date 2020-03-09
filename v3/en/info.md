### Table of Contents

{% assign top_ten_pages = site.pages | where:"document","Top Ten Proactive Controls" | sort: "order" %}
<ul>
{% for ttp in top_ten_pages %}

<li><a href="www-project-proactive-controls/v3/en/{{ ttp.url }}">{{ ttp.title }}</a></li>

{% endfor %}

t222

<ul>
  {% assign mypages = site.pages | where:"document","OWASP Top Ten Proactive Controls 2018"| sort: "order" %}
    {% for page in mypages %}
    {% if page.order > 0 %}
    <li><a href="{{ page.url | absolute_url }}">{{ page.title }}</a></li>
    {% endif %}
    {% endfor %}
</ul>
</ul>