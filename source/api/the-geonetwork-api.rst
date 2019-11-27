.. _geonetwork-api:

GeoNetwork API
##############

The REST API and documentation are available in your catalog at page http://localhost:8080/geonetwork/doc/api/ and linked from the footer on the home page.



Using the API to apply an XSL process
=====================================

This is an example to trigger an XSL process on a set of records. It illustrates how to make a set of actions using the API:


.. code-block:: shell

  export CATALOG=http://localhost:8080/internal-catalogue
  export CATALOGUSER=user
  export CATALOGPASS=pass
  export PROCESS=migrate-201904

  rm -f /tmp/cookie;
  curl -s -c /tmp/cookie -o /dev/null -X POST "$CATALOG/srv/eng/info?type=me";
  export TOKEN=`grep XSRF-TOKEN /tmp/cookie | cut -f 7`;
  curl -X POST -H "X-XSRF-TOKEN: $TOKEN" --user $CATALOGUSER:$CATALOGPASS -b /tmp/cookie \
    "$CATALOG/srv/eng/info?type=me"

  # MUST return @authenticated = true

  curl -X GET "$CATALOG/srv/fre/q?bucket=111&_isHarvested=n" \
      -H "X-XSRF-TOKEN: $TOKEN" -c /tmp/cookie -b /tmp/cookie --user $CATALOGUSER:$CATALOGPASS
  #It works

  curl -X PUT "$CATALOG/srv/api/0.1/selections/111" -H "accept: application/json" \
    -H "X-XSRF-TOKEN: $TOKEN" -c /tmp/cookie -b /tmp/cookie --user $CATALOGUSER:$CATALOGPASS
  #Body response = number of selected records

  curl -X GET "$CATALOG/srv/api/0.1/selections/111" -H "accept: application/json" \
    -H "X-XSRF-TOKEN: $TOKEN" -c /tmp/cookie -b /tmp/cookie --user $CATALOGUSER:$CATALOGPASS
  #Body returns an array of selected records

  curl -X POST "$CATALOG/srv/api/0.1/processes/$PROCESS?bucket=111&index=false" \
    -H "accept: application/json" -H "X-XSRF-TOKEN: $TOKEN" -c /tmp/cookie -b /tmp/cookie --user $CATALOGUSER:$CATALOGPASS




Building client for the API using codegen
=========================================

The API is described using the open API specification. `Codegen <https://swagger.io/swagger-codegen/>`_
is a tool to build an API client based on the specification. To build a java client use the following procedure.

First, create a configuration file apiconfig.json for the API:


.. code-block:: json

  {
    "groupId":"org.geonetwork-opensource",
    "artifactId":"OpenApiClient",
    "artifactVersion":"0.0.1",
    "library":"okhttp-gson",
    "apiPackage":"org.fao.geonet.openapi",
    "modelPackage":"org.fao.geonet.openapi.model"
  }



.. code-block:: shell

    java -jar swagger-codegen-cli.jar generate \
         -i http://localhost:8080/geonetwork/srv/v2/api-docs \
         -l java \
         -c apiconfig.json \
         -o /tmp/gn-openapi-java-client

    cd /tmp/gn-openapi-java-client

    mvn clean install


Once compiled, the java client can be used as a dependency; eg. for maven:


.. code-block:: xml

    <dependency>
      <groupId>org.geonetwork-opensource</groupId>
      <artifactId>OpenApiClient</artifactId>
      <version>0.0.1</version>
    </dependency>



Then the client API can be used in your Java application:


.. code-block:: java

    import com.squareup.okhttp.Interceptor;
    import com.squareup.okhttp.Request;
    import com.squareup.okhttp.Response;
    import org.fao.geonet.ApiClient;
    import org.fao.geonet.ApiException;
    import org.fao.geonet.Configuration;
    import org.fao.geonet.openapi.MeApi;
    import org.fao.geonet.openapi.RecordsApi;
    import org.fao.geonet.openapi.model.MeResponse;
    import org.fao.geonet.openapi.model.SimpleMetadataProcessingReport;
    import org.junit.jupiter.api.BeforeAll;
    import org.junit.jupiter.api.Test;
    import org.junit.jupiter.api.TestInstance;

    import java.io.IOException;
    import java.util.Arrays;
    import java.util.Base64;

    import static org.junit.jupiter.api.Assertions.assertEquals;
    import static org.junit.jupiter.api.Assertions.assertNotNull;

    @TestInstance(TestInstance.Lifecycle.PER_CLASS)
    public class GnJavaApiClientTest {

        private static final String CATALOGUE_URL = "http://localhost:8080/geonetwork";

        ApiClient client;

        private static final String USERNAME = "admin";
        private static final String PASSWORD = "admin";


        @BeforeAll
        private void initConfiguration() {
            client
                = Configuration.getDefaultApiClient();
            client.setBasePath(CATALOGUE_URL);
        }

        /**
         * Get user information when anonymous or connected.
         */
        @Test
        public void getMeInfoTest() {
            try {
                client.getHttpClient().networkInterceptors().clear();

                MeApi meApi = new MeApi();
                MeResponse meResponse = meApi.getMe();
                // User is not authenticated
                assertEquals(null, meResponse);

                // Configure HTTP basic authorization: basicAuth
                client.getHttpClient().networkInterceptors().add(new BasicAuthInterceptor(USERNAME, PASSWORD));

                meResponse = meApi.getMe();
                // User is authenticated
                assertEquals(USERNAME, meResponse.getName());

            } catch (ApiException e) {
                e.printStackTrace();
            }
        }


        /**
         * Insert and delete a record.
         */
        @Test
        public void insertAndDeleteRecord() {

            // Configure HTTP basic authorization: basicAuth
            client.getHttpClient().networkInterceptors().add(new BasicAuthInterceptor(USERNAME, PASSWORD));


            try {
                final RecordsApi api = new RecordsApi();

                SimpleMetadataProcessingReport report = api.insert("METADATA",
                    null,
                    Arrays.asList(new String[]{"http://sextant.ifremer.fr/geonetwork/srv/fre/xml.metadata.get?uuid=ec41b8b2-c184-46e7-86c6-a24f0ac295ad"}),
                    null, null,
                    true, "NOTHING",
                    null,
                    null,
                    false,
                    null,
                    null,
                    null);

                int nbOfRecordInserted = report.getMetadataInfos().size();


                // One record MUST be inserted
                assertEquals(1, nbOfRecordInserted);

                if (nbOfRecordInserted == 1) {
                    Object[] list = report.getMetadataInfos().keySet().toArray();
                    String metadataId = (String) list[0];
                    String record = api.getRecord(metadataId, "application/xml");
                    assertNotNull(record);

                    api.deleteRecord(metadataId, false);

                    try {
                        api.getRecord(metadataId, "application/xml");
                    } catch (ApiException e) {
                        assertEquals(404, e.getCode());
                    }
                }
            } catch (ApiException e) {
                e.printStackTrace();
            }
        }


        /**
         * Interceptor to add basic authentication header on each request.
         * <p>
         * TODO: How-to make generated client taking care of setting BA from swagger config.
         * TODO: Add support for CSRF token.
         */
        public class BasicAuthInterceptor implements Interceptor {
            String username;
            String password;

            public BasicAuthInterceptor(String username, String password) {
                this.username = username;
                this.password = password;
            }

            @Override
            public Response intercept(Interceptor.Chain chain) throws IOException {
                byte[] auth = Base64.getEncoder()
                    .encode((username + ":" + password).getBytes());

                Request compressedRequest = chain.request().newBuilder()
                    .header("Authorization", "Basic " + new String(auth))
                    .build();

                return chain.proceed(compressedRequest);
            }
        }
    }

