# Project documentation module

The documentation use [RST format](http://sphinx-doc.org/rest.html).

**All translations should be done on Transifex web interface. No properties files should be committed to this repository.**

## Updating the documentation

If you add some new section or update the text on an existing section, you have to update the transifex fields to make sure this change is spread to all languages. To achieve this, execute:

```
make update_translations
```

## How to build the documentation

### Installing the tools

To build the documentation you need to have [make](https://www.gnu.org/software/make/) installed in your system:
```
sudo apt-get install make
```

Sphinx is required to build documentation.See http://sphinx-doc.org/latest/install.html.
You can install it with [pip](https://pip.pypa.io/en/stable/installing/):
```
sudo easy_install pip
sudo pip install sphinx
```

The theme is based on [sphinx_rtd_theme](https://github.com/snide/sphinx_rtd_theme) and the sphinx_bootstrap_theme.
You can install the style with pip too:
```
sudo pip install sphinx_boostrap_theme
sudo pip install sphinx_rtd_theme
```

The internationalization is build using [sphinx-intl](http://www.sphinx-doc.org/es/stable/intl.html):

```
sudo pip install sphinx-intl
```

To download the translations from Transifex, you will need the transifex command line client:
https://docs.transifex.com/client/installing-the-client
The Transifex Client is written in Python, so it runs on most systems. The easiest way to install it is with pip:

```
sudo pip install transifex-client
```
If you don't want to use the transifex-client, either you will have to manually download the translated files or you will only be able to build the English version of the documentation.

### Configuring your local

And then you need to configure your transifex user:
https://docs.transifex.com/client/client-configuration
~/.transifexrc stores your Transifex.com credentials. This config file is unique per user, and it's stored in your home directory.

```
[https://www.transifex.com]
username = your_username/api
token =
password = p@ssw0rd/api_token
hostname = https://www.transifex.com
```
### Building the documentation

To build the documentation, run:

```
mvn clean install
```

This will build all documentation in English only.

To build all documentation in several languages (right now: es,fr,ge,it,ko,nl,cz,ca,fi,is), based on transifex translations:

```
mvn clean install -Pall
```

If you want to get the latest translations for your build, run:

```
mvn clean install -Platest,all
```

#### Adding a new language

If you want to add a new language to the build, you will have to edit the file https://github.com/geonetwork/doc/blob/develop/Makefile#L59 and add the languages you want to build the documentation for.

If you want it to be publicly available on geonetwork-opensource.org webpage, make sure you make a PR with the change and ask for advice on the https://github.com/geonetwork/website project.
