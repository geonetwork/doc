# Project documentation module

The documentation use [RST format](http://sphinx-doc.org/rest.html).

Sphinx is required to build documentation.
See http://sphinx-doc.org/latest/install.html.

The theme is based on [sphinx_rtd_theme](https://github.com/snide/sphinx_rtd_theme).
See theme folder.

The internationalization is build used [sphinx-intl](http://www.sphinx-doc.org/es/stable/intl.html)
You can install it by pip install sphinx-intl or easy_install sphinx-intl.


To build the documentation, run:

```
mvn clean install
```

This will build all documentation in several languages, based on transifex translations.

If you want to get the latest translations for your build, run:

```
mvn clean install -Dlatest
```
