.. _doing-a-release:


Doing a |project_name| release
##############################

This section documents the steps followed by the development team to do a new release.


Once the release branch has been thoroughly tested and is stable a release can be made.


#. Get the branch

.. code-block:: shell

    versionbranch=3.0.x
    version=3.0.0
    minorversion=0
    newversion=$version-$minorversion
    currentversion=3.0.0-SNAPSHOT
    previousversion=2.10.x
    modules=( "geoserver" "e2e-tests" )
    git clone --recursive https://github.com/geonetwork/core-geonetwork.git \
              geonetwork-$versionbranch
    cd geonetwork-$versionbranch


#. Create or move to the branch for the version


.. code-block:: shell

    # Create it if it does not exist yet
    git checkout -b $versionbranch origin/develop

    # Move into it if it exist
    git checkout $versionbranch


#. Update version number



.. code-block:: shell

    ./update-version.sh $currentversion $newversion



#. Build the new release


.. code-block:: shell

    mvn clean install -DskipTests -Pwith-doc


#. Create the installer


.. code-block:: shell

    cd installer
    ant
    cd ..


#. Test the installer


.. code-block:: shell

    cd geonetwork-$version
    java -jar geonetwork-$newversion/geonetwork-install-$newversion.jar



# Generate list of changes


.. code-block:: shell

    cat <<EOF > docs/changes$newversion.txt
    ================================================================================
    ===
    === GeoNetwork $version: List of changes
    ===
    ================================================================================
    EOF
    git log --pretty='format:- %s' origin/$previousversion... >> docs/changes$newversion.txt


#. Commit the new version (in submodule first and then in the main module)


.. code-block:: shell

    cd geoserver
    git add .
    git commit -m "Update version to $newversion"
    cd ..
    git add .
    git commit -m "Update version to $newversion"


#. Tag the release


.. code-block:: shell

    git tag -a $version -m "Tag for $version release"
    git push origin $version


#. Set version number to SNAPSHOT


.. code-block:: shell

    ./update-version.sh $newversion $version-SNAPSHOT
    git add .
    git commit -m "Update version to $version-SNAPSHOT"
    git push origin $versionbranch


#. Publish in sourceforge


.. code-block:: shell

    sftp $sourceforge_username,geonetwork@frs.sourceforge.net
    # For stable release
    cd /home/frs/project/g/ge/geonetwork/GeoNetwork_opensource
    # or for RC release
    cd /home/frs/project/g/ge/geonetwork/cd GeoNetwork_unstable_development_versions/
    mkdir 3.0.0
    cd 3.0.0
    put docs/changes$newversion.txt
    put geonetwork*/*.jar
    put web/target/geonetwork.war




.. seealso::

  Branches are not created for submodule. It may be relevant if the release plan to make major
  changes in them.


  .. code-block:: shell

        for i in "${modules[@]}"
        do
              cd $i; git checkout -b $versionbranch origin/develop; cd ..
        done


