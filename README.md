# Project documentation module

Check the ["Writing documentation" guide](https://geonetwork-opensource.org/manuals/3.8.x/en/contributing/writing-documentation.html).


# Build

The `latest` maven profile updates the translations from Transifex.

Documentation for all languages:

```
mvn package -Pall,latest
```

Documentation for English and French:

```
mvn package -Platest
```

A subset of languages (for example: English, French and Spanish):

```
mvn package -Platest -Dlangs='"en" "fr" "es"'
```