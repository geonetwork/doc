# Project documentation module

Documentation for GeoNetwork Opensource available via [geonetwork-opensource.org](https://geonetwork-opensource.org).
This manual is included in each build in the `docs` folder as a git submodule.

* `_build`: contains reference `pot` files used by Transifex for translation.
* `source/config.py`: sphinx build configuration settings
* `theme`: geonetwork documentation theme


GeoNetwork documentation is supports open access using a [Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)](LICENSE.md).

![GeoNetwork Logo](source/_static/GN3.png "GeoNetwork")

# Writing Guide

Check the ["Writing documentation" guide](https://geonetwork-opensource.org/manuals/3.8.x/en/contributing/writing-documentation.html).

# Build

To quickly build the english docs:

```
make html_eng
```

# Translations

A build of the documentation (defaulting to English and French):

```
mvn package
```

## Before you start

Install `tx` client:

#. The maven build above makes use of the transifex command line client :command:`tx`: 

   * https://docs.transifex.com/client/introduction
   
   Intall: `pip install transifex-client`

#. Generate an API key: https://www.transifex.com/user/settings/api/
   
#. To install API key:

   * Either create manually the file `~/.transifexrc` including your API token:
   
     ```
     [https://www.transifex.com]
     api_hostname = https://api.transifex.com
     hostname = https://www.transifex.com
     password = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
     username = api
     ```

   * Or run `tx` once interactively to install the API key:

     ```
     tx pull --language='fr'
     [?] Enter your api token:
     ```

Install `sphinx-intl`:

#. Manging translations requires :command:`sphinx-intl` tool:
   
   * http://sphinx-intl.rtfd.io

#. Install: `pip install sphinx-intl`

Recommend `python-levenshtein`:

#. Speed up calculating edit-distance when cross comparing changes using `sphinx-intl`:
   
   * https://github.com/ztane/python-Levenshtein/

#. Install: `pip install python-levenshtein`


## Update Translations from Transefex

The `latest` maven profile updates the translations from Transifex (this will take some time).

```
mvn generate-resources -Platest
```

These can be be used together:
```
mvn package -Platest
```

To use all languages:

```
mvn package -Platest -Pall
```

A subset of languages (for example: English, French and Spanish):

```
mvn package -Platest -Dlangs='"en" "fr" "es"' -Dtranslations='en,fr,es'
```

## Publish new documentation for translation

To update the `pot` files in `_build/locale`:

```
make update_translations
```

And commit the change:

```
git add _build/locale
git commit -m "updated translations"
```


