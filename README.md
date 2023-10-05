# Archived GeoNetwork sphinx-build documentation module

This repository conatains archived reStructured text documentation for GeoNetwork 4.2, 3.12, and 2.10 releases. 

The archived reStructuredText documentaiton is available here:

* https://geonetwork-opensource.org/manuals/

This content has migrated to markdown in the core-geonetwork repository:

* https://github.com/geonetwork/core-geonetwork/tree/main/docs/manual

## License

This documentation is written under the creative commons license [Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)](LICENSE.md).

## Writing Guide

Check the ["Writing documentation" guide](https://geonetwork-opensource.org/manuals/3.8.x/en/contributing/writing-documentation.html).

## Build

To quickly build the English docs:

```
make html_eng
```

A build of the documentation (defaulting to English and French):

```
mvn package
```

The `latest` Maven profile updates the translations from Transifex (this will take some time).

```
mvn generate-resources -Platest
```

These can be used together:
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

## Before you start

The Maven build above makes use of the Transifex command line client `tx`: 

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
