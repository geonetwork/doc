.. _doing-a-release:


Doing a |project_name| release
##############################

This section documents the steps followed by the development team to do a new release.


Once the release branch has been thoroughly tested and is stable a release can be made.


1. Get the branch

.. code-block:: shell

    versionbranch=3.0.x
    version=3.0.2
    minorversion=0
    newversion=$version-$minorversion
    currentversion=3.0.2-SNAPSHOT
    previousversion=3.0.1
    nextversion=3.0.3-SNAPSHOT
    modules=( "e2e-tests" )
    git clone --recursive https://github.com/geonetwork/core-geonetwork.git \
              geonetwork-$versionbranch
    cd geonetwork-$versionbranch


2. Create or move to the branch for the version


.. code-block:: shell

    # Create it if it does not exist yet
    git checkout -b $versionbranch origin/master

    # Move into it if it exist
    git checkout $versionbranch


3. Update version number



.. code-block:: shell

    ./update-version.sh $currentversion $newversion


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


4. Build the new release


.. code-block:: shell

    mvn clean install -DskipTests -Pwith-doc -Des.spring.profile=es -Des.url=


5. Create the installer


.. code-block:: shell

    cd release
    mvn clean install -Djetty-download
    cd ../installer
    ant
    cd ..

6. Re-build the new release

This is required as previous step creates a file ``WEB-INF/server.prop``, otherwise the old version will be added to the war file. **This should be improved.**

.. code-block:: shell

    mvn clean install -DskipTests -Pwith-doc -Des.spring.profile=es -Des.url=



7. Commit the new version (in submodule first and then in the main module)


.. code-block:: shell

    # Then commit the new version
    git add .
    git commit -m "Update version to $newversion"


8. Test the installer


.. code-block:: shell

    cd geonetwork-$version
    java -jar geonetwork-$newversion/geonetwork-install-$newversion.jar



9. Tag the release


.. code-block:: shell

    git tag -a $version -m "Tag for $version release"
    git push origin $version


10. Set version number to SNAPSHOT


.. code-block:: shell

    ./update-version.sh $newversion $nextversion


11. Add migration script for the next version.

In ``WEB-INF/config-db/database_migration.xml`` add an entry for the new version:

.. code-block:: xml

        <entry key="3.0.3">
          <list>
            <value>WEB-INF/classes/setup/sql/migrate/v303/migrate-</value>
          </list>
        </entry>

In ``WEB-INF/classes/setup/sql/migrate``, create the SQL migration script:

.. code-block:: sql

      UPDATE Settings SET value='3.0.3' WHERE name='system/platform/version';
      UPDATE Settings SET value='SNAPSHOT' WHERE name='system/platform/subVersion';

12. Commit/Push the changes for the version update.

.. code-block:: shell

    git add .
    git commit -m "Update version to $nextversion"

    git push origin $versionbranch

13. Merge in depending branches

If needed, merge the changes into the develop branch.

14. Generate checksum files

* If using Linux:
.. code-block:: shell

    cd web/target && md5sum geonetwork.war > geonetwork.war.md5 && cd ../..
    cd geonetwork-$version && md5sum geonetwork-install-$newversion.jar > geonetwork-install-$newversion.jar.md5 && cd ..

* If using Mac OS X:
.. code-block:: shell

    md5 -r web/target/geonetwork.war > web/target/geonetwork.war.md5
    md5 -r geonetwork-$newversion/geonetwork-install-$newversion.jar > geonetwork-$newversion/geonetwork-install-$newversion.jar.md5


15. Publish in sourceforge

.. code-block:: shell

    sftp $sourceforge_username,geonetwork@frs.sourceforge.net
    # For stable release
    cd /home/frs/project/g/ge/geonetwork/GeoNetwork_opensource
    # or for RC release
    cd /home/frs/project/g/ge/geonetwork/GeoNetwork_unstable_development_versions/
    mkdir 3.0.0
    cd 3.0.0
    put docs/changes3.0.0-0.txt
    put geonetwork*/*.jar
    put geonetwork*/*.md5
    put web/target/geonetwork.war
    put web/target/geonetwork.war.md5
    bye

16. Add changes to the documentation https://github.com/geonetwork/website

- Add the changes file for the release to https://github.com/geonetwork/doc/tree/develop/source/overview/change-log
- List the previous file in https://github.com/geonetwork/doc/blob/develop/source/overview/change-log/index.rst

17. Update the following files in the website https://github.com/geonetwork/website

- Update the version: https://github.com/geonetwork/website/blob/master/docsrc/conf.py
- Update the download link: https://github.com/geonetwork/website/blob/master/docsrc/downloads.rst
- Add the section for the new release: https://github.com/geonetwork/website/blob/master/docsrc/news.rst

18. Publish the website
