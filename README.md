# Project documentation module

The documentation use [RST format](http://sphinx-doc.org/rest.html).

To build the documentation you need to have [make](hpip install transifex-clientttps://www.gnu.org/software/make/) installed in your system:
```
sudo apt-get install make
```

Sphinx is required to build documentation.See http://sphinx-doc.org/latest/install.html.ç
YOu can install it with [pip](https://pip.pypa.io/en/stable/installing/):
```
sudo easy_install pip
sudo pip install sphinx
```

The theme is based on [sphinx_rtd_theme](https://github.com/snide/sphinx_rtd_theme) and the sphinx_bootstrap_theme.
You can install the style with pip too:
```
sudo pip install sphinx_bootstrap_theme
sudo pip install sphinx_rtd_theme
```

The internationalization is build used [sphinx-intl](http://www.sphinx-doc.org/es/stable/intl.html)
You can install it by pip install sphinx-intl or easy_install sphinx-intl.

To download the translations from Transifex, you will need the transifex command line client:
https://docs.transifex.com/client/installing-the-client
The Transifex Client is written in Python, so it runs on most systems. The easiest way to install it is with pip:

```
sudo pip install transifex-client
```
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

To build the documentation, run:

```
mvn clean install
```

This will build all documentation in several languages, based on transifex translations.

If you want to get the latest translations for your build, run:

```
mvn clean install -Dlatest
```

If you add some new section or update the text on an existing section, you have to update the transifex fields to make sure this change is spread to all languages. To achieve this, execute:

```
make update_translations
```
