.. _doing-a-release:


Doing a |project_name| release
##############################

This section documents the steps followed by the development team to do a new release.


Once the release branch has been thoroughly tested and is stable a release can be made.

1. Build the release

.. code-block:: shell

    # Setup properties
    frombranch=origin/master
    versionbranch=3.8.x
    version=3.8.0
    minorversion=0
    newversion=$version-$minorversion
    currentversion=3.7.0-SNAPSHOT
    previousversion=3.6.0
    nextversion=3.8.1-SNAPSHOT
    nextMajorVersion=3.9.0-SNAPSHOT
    modules=( "schemas/iso19115-3.2018" )


    # Get the branch
    git clone --recursive https://github.com/geonetwork/core-geonetwork.git \
              geonetwork-$versionbranch
    cd geonetwork-$versionbranch


    # Create or move to the branch for the version
    # Create it if it does not exist yet
    git checkout -b $versionbranch $frombranch
    # or move into it if it exist
    # git checkout $versionbranch


    # Update version number (in pom.xml, installer config and SQL)
    ./update-version.sh $currentversion $newversion


    # Build the new release
    mvn clean install -DskipTests -Pwith-doc


    # Generate list of changes
    cat <<EOF > docs/changes$newversion.txt
    ================================================================================
    ===
    === GeoNetwork $version: List of changes
    ===
    ================================================================================
    EOF
    git log --pretty='format:- %s' $previousversion... >> docs/changes$newversion.txt


    # Download Jetty and create the installer
    cd release
    mvn clean install -Djetty-download
    cd ../installer
    ant
    cd ..



2. Test the installer


.. code-block:: shell

    cd geonetwork-$version
    java -jar geonetwork-$newversion/geonetwork-install-$newversion.jar



3. Commit & tag the new version (in submodule first and then in the main module)


.. code-block:: shell

    # Then create the new branch for the plugin (ie.19115-3.2018)
    cd schemas/iso19115-3.2018/
    git checkout -b $versionbranch $frombranch
    git push origin $versionbranch
    # TODO: Check if plugin version needs an update or not and when ?
    cd ../..

    # Then commit the new version
    git add .
    git commit -m "Update version to $newversion"

    # Set version number to SNAPSHOT
    ./update-version.sh $newversion $nextversion

    # Add SQL migration step for the next version
    mkdir web/src/main/webapp/WEB-INF/classes/setup/sql/migrate/v383
    cat <<EOF > web/src/main/webapp/WEB-INF/classes/setup/sql/migrate/v383/migrate-default.sql
    UPDATE Settings SET value='3.8.3' WHERE name='system/platform/version';
    UPDATE Settings SET value='SNAPSHOT' WHERE name='system/platform/subVersion';
    EOF
    vi web/src/main/webResources/WEB-INF/config-db/database_migration.xml


In ``WEB-INF/config-db/database_migration.xml`` add an entry for the new version in the 2 steps:

.. code-block:: xml

    <entry key="3.8.1">
      <list>
        <value>WEB-INF/classes/setup/sql/migrate/v381/migrate-</value>
      </list>
    </entry>




.. code-block:: shell


    git add .
    git commit -m "Update version to $nextversion"


    # Push the branch
    git push origin $versionbranch

    # Push the release tag
    git tag -a $version -m "Tag for $version release"
    git push origin $version


4. Publishing

Generate checksum files

* If using Linux:


.. code-block:: shell

    cd web/target && md5sum geonetwork.war > geonetwork.war.md5 && cd ../..
    cd geonetwork-$version && md5sum geonetwork-install-$newversion.jar > geonetwork-install-$newversion.jar.md5 && cd ..

* If using Mac OS X:


.. code-block:: shell

    md5 -r web/target/geonetwork.war > web/target/geonetwork.war.md5
    md5 -r geonetwork-$newversion/geonetwork-install-$newversion.jar > geonetwork-$newversion/geonetwork-install-$newversion.jar.md5

On sourceforge first:

.. code-block:: shell

    sftp $sourceforge_username,geonetwork@frs.sourceforge.net
    # For stable release
    cd /home/frs/project/g/ge/geonetwork/GeoNetwork_opensource
    # or for RC release
    cd /home/frs/project/g/ge/geonetwork/GeoNetwork_unstable_development_versions/
    mkdir v3.0.0
    cd v3.0.0
    put docs/changes3.0.0-0.txt
    put geonetwork*/*.jar*
    put web/target/geonetwork.war*
    bye


Update or add the changelog in the documentation https://github.com/geonetwork/doc.

Close the milestone on github https://github.com/geonetwork/core-geonetwork/milestones?state=closed with link to sourceforge download.

Publish the release on github https://github.com/geonetwork/core-geonetwork/releases.

Update the website links https://github.com/geonetwork/website

- Add the changes file for the release to https://github.com/geonetwork/doc/tree/develop/source/overview/change-log
- List the previous file in https://github.com/geonetwork/doc/blob/develop/source/overview/change-log/index.rst
- Update the version: https://github.com/geonetwork/website/blob/master/docsrc/conf.py
- Update the download link: https://github.com/geonetwork/website/blob/master/docsrc/downloads.rst
- Add the section for the new release: https://github.com/geonetwork/website/blob/master/docsrc/news.rst

Send an email to the mailing lists.


5. Merge in depending branches

If a major version, then master version has to be updated to the next one (eg. if 3.8.0, then 3.7.x is 3.9.x).

.. code-block:: shell

    # Create it if it does not exist yet
    git checkout master
    ./update-version.sh $currentversion $nextMajorVersion


In the following folder ``web/src/main/webapp/WEB-INF/classes/setup/sql/migrate`` create ``v370`` folder.

In this folder create a ``migrate-default.sql`` with the following content:

.. code-block:: sql

  UPDATE Settings SET value='3.7.0' WHERE name='system/platform/version';
  UPDATE Settings SET value='SNAPSHOT' WHERE name='system/platform/subVersion';



In ``web/src/main/webResources/WEB-INF/config-db/database_migration.xml`` add the following for the migration to call the migration script:


.. code-block:: xml

    <entry key="3.7.0">
      <list>
        <value>WEB-INF/classes/setup/sql/migrate/v370/migrate-</value>
      </list>
    </entry>


Commit the new version

.. code-block:: shell

    git add .
    git commit -m "Update version to $nextMajorVersion"
    git push origin master


