# README

## Name

Jekyll Jupyter Notebook plugin

## Description

Jekyll Jupyter Notebook plugin adds [Jupyter](http://jupyter.org/) Notebook support to Jekyll. You can embed Jupyter Notebooks into your texts.

## Install

Add the following line to your site's `Gemfile`:

```ruby
gem "jekyll-jupyter-notebook"
```

Run the following command line to make the gem available:

```console
% bundle install
```

Add the following line to your site's `_config.yml`:

```yaml
plugins:
  - jekyll-jupyter-notebook
```

## Usage

Put a Jupyter Notebook (`sample.ipynb`) to the directory that has the target text (`my-text.md`) like the following:

```text
.
|-- my-text.md
`-- sample.ipynb
```

Put the following tag into the target text:

```markdown
{% jupyter_notebook "sample.ipynb" %}
```

If you use kramdown as Markdown parser and get strange result, try to surround `{% jupyter_notebook ...%}` with `{::nomarkdown}` and `{:/nomarkdown}` like the following:

```markdown
{::nomarkdown}
{% jupyter_notebook "sample.ipynb" %}
{:/nomarkdown}
```

## Configurations

You can customize `.ipynb` to `.html` conversion by `jupyter_notebook` in `_config.yml`:

```yaml
jupyter_notebook:
  # ...
```

### `prompt`

You can control whether a converted `.html` includes `In [N]`/`Out[N]` prompts or not by `prompt`:

```yaml
jupyter_notebook:
  prompt: true
```

The default value is `true`. It means that `In [N]`/`Out[N]` are shown.

You can remove them by using `false`:

```yaml
jupyter_notebook:
  prompt: false
```

### `input`

Similar to how `prompt` works, you can also control whether a converted `.html` includes code inputs or not by using `input`:

```yaml
jupyter_notebook:
  input: true
```

The default value is `true`. It means that input code blocks are shown.

You can remove them by using `false`:

```yaml
jupyter_notebook:
  input: false
```

## Authors

* Kouhei Sutou \<kou@clear-code.com\>

## License

Apache License 2.0. See doc/text/apache-2.0.txt and NOTICE.txt for details.

(Kouhei Sutou has a right to change the license including contributed patches.)
