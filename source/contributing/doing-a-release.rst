.. _doing-a-release:


Doing a |project_name| release
##############################

This section documents the steps followed by the development team to do a new release.


Once the release branch has been thoroughly tested and is stable a release can be made.


1. Get the source code

.. code-block:: shell

    currentversion=3.5.x-SNAPSHOT
    versionbranch=3.6.x
    version=3.6.0
    minorversion=0
    nextMajorVersion=3.7.0-SNAPSHOT
    newversion=$version-$minorversion
    previousversion=3.4.4
    nextversion=3.6.1-SNAPSHOT
    git clone --recursive https://github.com/geonetwork/core-geonetwork.git \
              geonetwork-$versionbranch
    cd geonetwork-$versionbranch


2. (if major version) Create the branch for the version based on master


.. code-block:: shell

    # Create it if it does not exist yet
    git checkout -b $versionbranch origin/master


2. (if minor version) Move to the branch for the version


.. code-block:: shell

    # Move into it as it exist (eg. 3.6.x)
    git checkout $versionbranch


3. Update version number



.. code-block:: shell

    ./update-version.sh $currentversion $newversion



This will update all pom.xml, installer build file and data-db-default.sql.



4. Generate list of changes


.. code-block:: shell

    cat <<EOF > docs/changes$newversion.txt
    ================================================================================
    ===
    === GeoNetwork $version: List of changes
    ===
    ================================================================================
    EOF
    git log --pretty='format:- %s' $previousversion... >> docs/changes$newversion.txt



5. (if major release) Generate a DB migration script

This will set the version number from master (eg. 3.5.X) to the major release (eg. 3.6.0).

In the following folder ``web/src/main/webapp/WEB-INF/classes/setup/sql/migrate`` create ``v360`` folder.

In this folder create a ``migrate-default.sql`` with the following content:

.. code-block:: sql

  UPDATE Settings SET value='3.6.0' WHERE name='system/platform/version';
  UPDATE Settings SET value='0' WHERE name='system/platform/subVersion';



In ``web/src/main/webResources/WEB-INF/config-db/database_migration.xml`` add the following for the migration to call the migration script:


.. code-block:: xml

    <entry key="3.6.0">
      <list>
        <value>WEB-INF/classes/setup/sql/migrate/v360/migrate-</value>
      </list>
    </entry>

For minor version, this is not required as it is supposed to be done at the end of the release process.

For major version, check that all migration scripts made for the previous minor releases are also in the master branch. If not, backport them.


6. Build the new release


.. code-block:: shell

    mvn clean install -DskipTests -Pwith-doc -Des.spring.profile=es -Des.url=


7. Create the installer


.. code-block:: shell

    cd release
    mvn clean install -Djetty-download
    cd ../installer
    ant
    cd ..

8. Re-build the new release

This is required as previous step creates a file ``WEB-INF/server.prop``, otherwise the old version will be added to the war file. **This should be improved.**

.. code-block:: shell

    mvn clean install -DskipTests -Pwith-doc -Des.spring.profile=es -Des.url=



9. Commit the new version


.. code-block:: shell

    # Then commit the new version
    git add .
    git commit -m "Update version to $newversion"


10. Test the installer


.. code-block:: shell

    cd geonetwork-$version
    java -jar geonetwork-$newversion/geonetwork-install-$newversion.jar



11. Tag the release


.. code-block:: shell

    git tag -a $version -m "Tag for $version release"
    git push origin $version


12. Set version number to SNAPSHOT


.. code-block:: shell

    ./update-version.sh $newversion $nextversion


13. Add migration script for the next version.

In ``web/src/main/webResources/WEB-INF/config-db/database_migration.xml`` add an entry for the new version:

.. code-block:: xml

        <entry key="3.6.1">
          <list>
            <value>WEB-INF/classes/setup/sql/migrate/v361/migrate-</value>
          </list>
        </entry>

In ``web/src/main/webapp/WEB-INF/classes/setup/sql/migrate``, create the SQL migration script:

.. code-block:: sql

      UPDATE Settings SET value='3.6.1' WHERE name='system/platform/version';
      UPDATE Settings SET value='SNAPSHOT' WHERE name='system/platform/subVersion';

14. Commit/Push the changes for the version update.

.. code-block:: shell

    git add .
    git commit -m "Update version to $nextversion"

    git push origin $versionbranch

15. Merge in depending branches

If needed, merge the changes into the develop branch.

16. Generate checksum files

* If using Linux:
.. code-block:: shell

    cd web/target && md5sum geonetwork.war > geonetwork.war.md5 && cd ../..
    cd geonetwork-$version && md5sum geonetwork-install-$newversion.jar > geonetwork-install-$newversion.jar.md5 && cd ..

* If using Mac OS X:
.. code-block:: shell

    md5 -r web/target/geonetwork.war > web/target/geonetwork.war.md5
    md5 -r geonetwork-$newversion/geonetwork-install-$newversion.jar > geonetwork-$newversion/geonetwork-install-$newversion.jar.md5


17. Publish in sourceforge

.. code-block:: shell

    sftp $sourceforge_username,geonetwork@frs.sourceforge.net
    # For stable release
    cd /home/frs/project/g/ge/geonetwork/GeoNetwork_opensource
    # or for RC release
    cd /home/frs/project/g/ge/geonetwork/GeoNetwork_unstable_development_versions/
    mkdir v3.6.0
    cd v3.6.0
    put docs/changes3.6.0-0.txt
    put geonetwork*/*.jar
    put geonetwork*/*.md5
    put web/target/geonetwork.war
    put web/target/geonetwork.war.md5
    bye

18. Add changes to the documentation https://github.com/geonetwork/website

- Add the changes file for the release to https://github.com/geonetwork/doc/tree/develop/source/overview/change-log
- List the previous file in https://github.com/geonetwork/doc/blob/develop/source/overview/change-log/index.rst

19. Update the following files in the website https://github.com/geonetwork/website

- Update the version: https://github.com/geonetwork/website/blob/master/docsrc/conf.py
- Update the download link: https://github.com/geonetwork/website/blob/master/docsrc/downloads.rst
- Add the section for the new release: https://github.com/geonetwork/website/blob/master/docsrc/news.rst
- Close the milestone on github and move issues and PR to next release.



20. Publish the website


21. Update the release page on github


See https://github.com/geonetwork/core-geonetwork/releases



22. (if major version) Update master branch for the next version


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


