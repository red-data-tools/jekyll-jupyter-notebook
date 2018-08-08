---
layout: default
title: Top
---

## Top page

Here is a Jupyter Notebook:

{% jupyter_notebook "python.ipynb" %}

### Raw rendered pages

  * [Raw IPython kernel](python-raw.html)

### Other kernels

  * [IRuby kernel](ruby/)

### Blog posts

{% for post in site.posts %}
  * [{{ post.title }} ({{ post.date | date: "%Y-%m-%d" }})]({{ post.url }})
{% endfor %}
