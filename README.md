# Project documentation module

Documentation for GeoNetwork Opensource available via https://geonetwork-opensource.org.
This manual is included in each build in the `docs` folder as a git submodule.

This documentation is supports open access using a [Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)](LICENSE.md).

![GeoNetwork Logo](source/_static/GN3.png "GeoNetwork")

# Writing Guide

Check the ["Writing documentation" guide](https://geonetwork-opensource.org/manuals/3.8.x/en/contributing/writing-documentation.html).

# Build

GeoNetwork documentation is based on [Maven](https://maven.apache.org), [Sphinx](https://www.sphinx-doc.org) and [Pip](https://pypi.org/project/pip/).

To quickly build the english docs:

```
pip install sphinx_bootstrap_theme
make html_eng
```

A build of the documentation (defaulting to English and French):

```
mvn package
```

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

# Before you start

The maven build above makes use of the transifex command line client `tx`: 

* https://docs.transifex.com/client/introduction

Prior to use you will need to generate and API key:

* https://www.transifex.com/user/settings/api/

If you have never used `tx` before you will need to run it once interactively to install the API key:

```
tx pull --language='fr'
[?] Enter your api token:
```

Another option is to generate manually the file `~/.transifexrc` including your API token:
```
[https://www.transifex.com]
api_hostname = https://api.transifex.com
hostname = https://www.transifex.com
password = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
username = api

```
