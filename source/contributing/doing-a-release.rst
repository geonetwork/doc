.. _doing-a-release:


Doing a GeoNetwork release
##########################

This section documents the steps followed by the development team to do a new release.


Once the release branch has been thoroughly tested and is stable a release can be made.

1. Build the release

In the following example, the branch is in `3.10-SNAPSHOT` and we are going to release version `3.10.2`.

.. code-block:: shell

    # Setup properties
    frombranch=origin/3.10.x
    versionbranch=3.10.x
    newversion=3.10.2
    minorversion=0
    newversionwithminor=$newversion-$minorversion
    currentversion=3.10-SNAPSHOT
    previousversion=3.10.1
    nextversion=3.10-SNAPSHOT

    # Get the branch
    git clone --recursive https://github.com/geonetwork/core-geonetwork.git \
              geonetwork-$versionbranch
    cd geonetwork-$versionbranch


    # Create or move to the branch for the version
    # Create it if it does not exist yet
    git checkout -b $versionbranch $frombranch
    # or move into it if it exist
    # git checkout $versionbranch

    git submodule update --init

    # Update version number (in pom.xml, installer config and SQL)
    ./update-version.sh $currentversion $newversion


    # Build the new release
    mvn clean install -DskipTests -Pwith-doc


    # Generate list of changes
    cat <<EOF > docs/changes$newversionwithminor.txt
    ================================================================================
    ===
    === GeoNetwork $newversion: List of changes
    ===
    ================================================================================
    EOF
    git log --pretty='format:- %s' $previousversion... >> docs/changes$newversionwithminor.txt


    # Download Jetty and create the installer
    cd release
    mvn process-resources -Djetty-download
    mvn package



2. Test the installer


.. code-block:: shell

    cd target/GeoNetwork-$newversion
    unzip geonetwork-bundle-$newversion.zip -d geonetwork-bundle-$newversion
    cd geonetwork-bundle-$newversion/bin
    ./startup.sh



3. Commit & tag the new version


.. code-block:: shell

    # Then commit the new version
    git add .
    git commit -m "Update version to $newversionwithminor"

    # Push the release tag
    git tag -a $newversion -m "Tag for $newversion release"
    git push origin $newversion
    
    # Set version number to SNAPSHOT
    ./update-version.sh $newversion $nextversion

    # Add SQL migration step for the next version
    mkdir web/src/main/webapp/WEB-INF/classes/setup/sql/migrate/v3103
    cat <<EOF > web/src/main/webapp/WEB-INF/classes/setup/sql/migrate/v3103/migrate-default.sql
    UPDATE Settings SET value='3.10.3' WHERE name='system/platform/version';
    UPDATE Settings SET value='SNAPSHOT' WHERE name='system/platform/subVersion';
    EOF
    vi web/src/main/webResources/WEB-INF/config-db/database_migration.xml


In ``WEB-INF/config-db/database_migration.xml`` add an entry for the new version in the 2 steps:

.. code-block:: xml

    <entry key="3.10.3">
      <list>
        <value>WEB-INF/classes/setup/sql/migrate/v3103/migrate-</value>
      </list>
    </entry>




.. code-block:: shell


    git add .
    git commit -m "Update version to $nextversion"


    # Push the branch
    git push origin $versionbranch



4. Publishing

Generate checksum files

* If using Linux:


.. code-block:: shell

    cd web/target && md5sum geonetwork.war > geonetwork.war.md5 && cd ../..
    cd release/target/GeoNetwork-$newversion && md5sum geonetwork-bundle-$newversion.zip >  geonetwork-bundle-$newversion.zip.md5 && cd ../..

* If using Mac OS X:


.. code-block:: shell

    md5 -r web/target/geonetwork.war > web/target/geonetwork.war.md5
    md5 -r release/target/GeoNetwork-$newversion/geonetwork-bundle-$newversion.zip > release/target/GeoNetwork-$newversion/geonetwork-bundle-$newversion.zip.md5

On sourceforge first:

.. code-block:: shell

    sftp $sourceforge_username,geonetwork@frs.sourceforge.net
    # For stable release
    cd /home/frs/project/g/ge/geonetwork/GeoNetwork_opensource
    # or for RC release
    cd /home/frs/project/g/ge/geonetwork/GeoNetwork_unstable_development_versions/
    mkdir v3.10.2
    cd v3.10.2
    put docs/changes3.10.2-0.txt
    put release/target/GeoNetwork*/geonetwork-bundle*.zip*
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

If a major version, then master version has to be updated to the next one (eg. if stable branch it's created from master for 3.10.0, then master 3.9-SNAPSHOT should be updated to 3.11-SNAPSHOT).

.. code-block:: shell

    nextMajorVersion=3.11-SNAPSHOT

    # Create it if it does not exist yet
    git checkout master
    ./update-version.sh $currentversion $nextMajorVersion


In the following folder ``web/src/main/webapp/WEB-INF/classes/setup/sql/migrate`` create ``v3110`` folder.

In this folder create a ``migrate-default.sql`` with the following content:

.. code-block:: sql

  UPDATE Settings SET value='3.11.0' WHERE name='system/platform/version';
  UPDATE Settings SET value='SNAPSHOT' WHERE name='system/platform/subVersion';



In ``web/src/main/webResources/WEB-INF/config-db/database_migration.xml`` add the following for the migration to call the migration script:


.. code-block:: xml

    <entry key="3.11.0">
      <list>
        <value>WEB-INF/classes/setup/sql/migrate/v3110/migrate-</value>
      </list>
    </entry>


Commit the new version

.. code-block:: shell

    git add .
    git commit -m "Update version to $nextMajorVersion"
    git push origin master


