## Configuration of NiFi

  * NIFI_WEB_HTTP_PORT
    * This environment variable configures the nifi.properties file - nifi.web.http.port
    * The HTTP port.
    * Default = 8080
  * NIFI_WEB_HTTP_HOST
    * This environment variable configures the nifi.properties file - nifi.web.http.host
    * The HTTP host.
    * Default = $HOSTNAME  (the host environment variable)
  * NIFI_REMOTE_INPUT_HOST
    * This environment variable configures the nifi.properties file - nifi.remote.input.host
    * The host name that will be given out to clients to connect to this NiFi instance for Site-to-Site communication. By default, it is the value from InetAddress.getLocalHost().getHostName(). On UNIX-like operating systems, this is typically the output from the hostname command.
    * Default = $HOSTNAME  (the host environment variable)
  * NIFI_REMOTE_INPUT_SOCKET_PORT
    * This environment variable configures the nifi.properties file - nifi.remote.input.socket.port 
    * The remote input socket port for Site-to-Site communication. By default, it is blank, but it must have a value in order to use RAW socket as transport protocol for Site-to-Site.
    * Default = 10000
  * NIFI_REMOTE_INPUT_SECURE
    * This environment variable configures the nifi.properties file - nifi.remote.input.secure
    * This indicates whether communication between this instance of NiFi and remote NiFi instances should be secure. By default, it is set to false. In order for secure site-to-site to work, set the property to true. Many other Security Properties (below) must also be configured.
    * Default = false
  * NIFI_VARIABLE_REGISTRY_PROPERTIES
    * This environment variable configures the nifi.properties file - nifi.variable.registry.properties
    * This is a comma-separated list of file location paths for one or more custom property files.
    * Default = empty
  * NIFI_CLUSTER_IS_NODE
    * This environment variable configures the nifi.properties file - nifi.cluster.is.node
    * Set this to true if the instance is a node in a cluster.
    * Default = false
  * NIFI_CLUSTER_ADDRESS - DONT SET THIS! It will default to $HOSTNAME if you dont set it.
    * This environment variable configures the nifi.properties file - nifi.cluster.node.address
    * The fully qualified address of the node.
    * Default = $HOSTNAME  (the host environment variable)
      * Do not set this
  * NIFI_CLUSTER_NODE_PROTOCOL_PORT
    * This environment variable configures the nifi.properties file - nifi.cluster.node.protocol.port 
    * The node's protocol port. 
    * Default = empty
      * Do not set this
  * NIFI_CLUSTER_NODE_PROTOCOL_THREADS
    * This environment variable configures the nifi.properties file - nifi.cluster.node.protocol.threads
    * The number of threads that should be used to communicate with other nodes in the cluster. This property defaults to 10, but for large clusters, this value may need to be larger.
    * Default = 10
  * NIFI_CLUSTER_NODE_PROTOCOL_MAX_THREADS
    * This environment variable configures the nifi.properties file - nifi.cluster.node.protocol.max.threads
    * The maximum number of threads that should be used to communicate with other nodes in the cluster. 
    * Default = 50
  * NIFI_ZK_CONNECT_STRING
    * This environment variable configures the nifi.properties file - nifi.zookeeper.connect.string
    * The Connect String that is needed to connect to Apache ZooKeeper. This is a comma-separated list of hostname:port pairs. For example, localhost:2181,localhost:2182,localhost:2183. This should contain a list of all ZooKeeper instances in the ZooKeeper quorum.
    * Default = empty. This property must be specified to join a cluster bit it has no default value.
  * NIFI_ZK_ROOT_NODE
    * This environment variable configures the nifi.properties file - nifi.zookeeper.root.node
    * The root ZNode that should be used in ZooKeeper. ZooKeeper provides a directory-like structure for storing data. Each 'directory' in this structure is referred to as a ZNode. This denotes the root ZNode, or 'directory', that should be used for storing data. This is important to set correctly, as which cluster the NiFi instance attempts to join is determined by which ZooKeeper instance it connects to and the ZooKeeper Root Node that is specified.
    * Default = /nifi
  * NIFI_ELECTION_MAX_WAIT
    * This environment variable configures the nifi.properties file - nifi.cluster.flow.election.max.wait.time
    * Specifies the amount of time to wait before electing a Flow as the "correct" Flow. If the number of Nodes that have voted is equal to the number specified by the NIFI_ELECTION_MAX_CANDIDATES property, the cluster will not wait this long. Note that the time starts as soon as the first vote is cast.
    * Default = 5 mins
  * NIFI_ELECTION_MAX_CANDIDATES
    * This environment variable configures the nifi.properties file - nifi.cluster.flow.election.max.candidates
    * Specifies the number of Nodes required in the cluster to cause early election of Flows. This allows the Nodes in the cluster to avoid having to wait a long time before starting processing if we reach at least this number of nodes in the cluste
    * Default = empty
  * NIFI_AUTH
    * This environment variable configures whether NIFI uses ldap or tls for its authentication
      * tls = Enables Two-Way SSL user authentication (browser certificate)
        * In this configuration, the user will need to provide certificates and the associated configuration information. Of particular note, is the AUTH environment variable which is set to tls. Additionally, the user must provide an the DN as provided by an accessing client certificate in the NIFI_INITIAL_ADMIN_IDENTITY environment variable. This value will be used to seed the instance with an initial user with administrative privileges. You will need to mount an external volume to /opt/certs to provide the certificates you want to allow to authenticate.
      * ldap = Enables LDAP user authentication
        * Sets the nifi.properties - nifi.security.user.login.identity.provider to "ldap-provider"
    * Default = Empty. If this isnt set then there is no authentication or security.
  * NIFI_INITIAL_ADMIN_IDENTITY
    * The identity of an initial admin user that will be granted access to the UI and given the ability to create additional users, groups, and policies. The value of this property could be a DN when using certificates or LDAP, or a Kerberos principal. This property will only be used when there are no other policies defined. If this property is specified then a Legacy Authorized Users File can not be specified.
    * Maps to the INITIAL_ADMIN_IDENTITY environment variable
    * Default = empty. You must set this when initially starting a cluster.
  * NIFI_KEYSTORE_PATH
    * This environment variable configures the nifi.properties file - nifi.security.keystore, and the $HOME/.nifi-cli.nifi.properties - keystore
    * This is only used if NIFI_AUTH is set
    * Filename of the Keystore that contains the serverâ€™s private key.
    * Default = There is no default. You must set it if NIFI_AUTH is set
  * NIFI_KEYSTORE_TYPE
    * This environment variable configures the nifi.properties file - nifi.security.keystoreType, and the $HOME/.nifi-cli.nifi.properties - keystoreType
    * This is only used if NIFI_AUTH is set
    * The type of Keystore. Must be either PKCS12 or JKS. JKS is the preferred type, PKCS12 files will be loaded with BouncyCastle provider.
    * Default = There is no default. You must set it if NIFI_AUTH is set
  * NIFI_KEYSTORE_PASSWORD
    * This environment variable configures the nifi.properties file - nifi.security.keystorePasswd, and the $HOME/.nifi-cli.nifi.properties - keystorePasswd
    * The password for the Keystore.
    * This is only used if NIFI_AUTH is set
    * Default = There is no default. You must set it if NIFI_AUTH is set
  * NIFI_KEY_PASSWORD
    * This environment variable configures the nifi.properties file - nifi.security.keyPasswd, and the $HOME/.nifi-cli.nifi.properties - keyPasswd
    * The password for the certificate in the Keystore.
    * This is only used if NIFI_AUTH is set
    * Default. If not set, the value of $NIFI_KEYSTORE_PASSWORD will be used.
  * NIFI_TRUSTSTORE_PATH
    * This environment variable configures the nifi.properties file - nifi.security.truststore, and the $HOME/.nifi-cli.nifi.properties - truststore
    * Filename of the Truststore that will be used to authorize those connecting to NiFi. A secured instance with no Truststore will refuse all incoming connections.
    * This is only used if NIFI_AUTH is set
    * Default = There is no default. You must set it if NIFI_AUTH is set
  * NIFI_TRUSTSTORE_PASSWORD
    * This environment variable configures the nifi.properties file - nifi.security.truststorePasswd, and the $HOME/.nifi-cli.nifi.properties - truststorePasswd
    * The password for the Truststore.
    * This is only used if NIFI_AUTH is set
    * Default = $NIFI_KEYSTORE_PASSWORD. It uses the NIFI_KEYSTORE_PASSWORD environment variable if the truststorePasswd is not set
  * NIFI_TRUSTSTORE_TYPE
    * This environment variable configures the nifi.properties file - nifi.security.truststoreType, and the $HOME/.nifi-cli.nifi.properties - truststoreType
    * This is only used if NIFI_AUTH is set
    * Default = There is no default. You must set it if NIFI_AUTH is set
  * NIFI_WEB_HTTPS_PORT
    * This environment variable configures the nifi.properties file - nifi.web.https.port, and it disables NIFI_WEB_HTTP_PORT
    * The HTTPS port. It is blank by default. When configuring NiFi to run securely, this port should be configured.
    * Default. If NIFI_AUTH is set to tls then the default is 8443. If NIFI_AUTH isnt set then the default is empty
  * NIFI_WEB_HTTPS_HOST
    * This environment variable configures the nifi.properties file - nifi.web.https.host
    * The HTTPS host.
    * Default. If NIFI_AUTH is set to tls then the default is $HOSTNAME. If NIFI_AUTH isnt set then the default is empty
  * NIFI_LDAP_AUTHENTICATION_STRATEGY
    * This environment variable configures the login-identity-providers.xml <property name="Authentication Strategy"/>
    * How the connection to the LDAP server is authenticated. Possible values are ANONYMOUS, SIMPLE, LDAPS, or START_TLS.
    * This is only used if NIFI_AUTH is set to ldap
    * Default. If NIFI_AUTH is set to ldap then you must provide this.
  * NIFI_LDAP_MANAGER_DN
    * This environment variable configures the login-identity-providers.xml <property name="Manager DN"/>
    * The DN of the manager that is used to bind to the LDAP server to search for users.
    * This is only used if NIFI_AUTH is set to ldap
    * Default. If NIFI_AUTH is set to ldap then you must provide this.
  * NIFI_LDAP_MANAGER_PASSWORD
    * This environment variable configures the login-identity-providers.xml <property name="Manager Password"/>
    * The password of the manager that is used to bind to the LDAP server to search for users.
    * This is only used if NIFI_AUTH is set to ldap
    * Default. If NIFI_AUTH is set to ldap then you must provide this.
  * NIFI_LDAP_TLS_KEYSTORE
    * This environment variable configures the login-identity-providers.xml <property name="TLS - Keystore"/>
    * Path to the Keystore that is used when connecting to LDAP using LDAPS or START_TLS.
    * This is only used if NIFI_AUTH is set to ldap
    * Default. If NIFI_AUTH is set to ldap & NIFI_LDAP_AUTHENTICATION_STRATEGY is LDAPS -or- START_TLS then you must provide this.
  * NIFI_LDAP_TLS_KEYSTORE_PASSWORD
    * This environment variable configures the login-identity-providers.xml <property name="TLS - Keystore Password"/>
    * Password for the Keystore that is used when connecting to LDAP using LDAPS or START_TLS.
    * This is only used if NIFI_AUTH is set to ldap
    * Default. If NIFI_AUTH is set to ldap & NIFI_LDAP_AUTHENTICATION_STRATEGY is LDAPS -or- START_TLS then you must provide this.
  * NIFI_LDAP_TLS_KEYSTORE_TYPE
    * This environment variable configures the login-identity-providers.xml <property name="TLS - Keystore Type"/>
    * Type of the Keystore that is used when connecting to LDAP using LDAPS or START_TLS (i.e. JKS or PKCS12).
    * This is only used if NIFI_AUTH is set to ldap
    * Default. If NIFI_AUTH is set to ldap & NIFI_LDAP_AUTHENTICATION_STRATEGY is LDAPS -or- START_TLS then you must provide this.
  * NIFI_LDAP_TLS_TRUSTSTORE
    * This environment variable configures the login-identity-providers.xml <property name="TLS - Truststore"/>
    * Path to the Truststore that is used when connecting to LDAP using LDAPS or START_TLS.
    * This is only used if NIFI_AUTH is set to ldap
    * Default. If NIFI_AUTH is set to ldap & NIFI_LDAP_AUTHENTICATION_STRATEGY is LDAPS -or- START_TLS then you must provide this.
  * NIFI_LDAP_TLS_TRUSTSTORE_PASSWORD
    * This environment variable configures the login-identity-providers.xml <property name="TLS - Truststore Password"/>
    * Password for the Truststore that is used when connecting to LDAP using LDAPS or START_TLS.
    * This is only used if NIFI_AUTH is set to ldap
    * Default. If NIFI_AUTH is set to ldap & NIFI_LDAP_AUTHENTICATION_STRATEGY is LDAPS -or- START_TLS then you must provide this.
  * NIFI_LDAP_TLS_TRUSTSTORE_TYPE
    * This environment variable configures the login-identity-providers.xml <property name="TLS - Truststore Type"/>
    * Type of the Truststore that is used when connecting to LDAP using LDAPS or START_TLS (i.e. JKS or PKCS12).
    * This is only used if NIFI_AUTH is set to ldap
    * Default. If NIFI_AUTH is set to ldap & NIFI_LDAP_AUTHENTICATION_STRATEGY is LDAPS -or- START_TLS then you must provide this.
  * NIFI_LDAP_TLS_PROTOCOL
    * This environment variable configures the login-identity-providers.xml <property name="TLS - Protocol"/>
    * Protocol to use when connecting to LDAP using LDAPS or START_TLS. (i.e. TLS, TLSv1.1, TLSv1.2, etc).
    * This is only used if NIFI_AUTH is set to ldap
    * Default. If NIFI_AUTH is set to ldap & NIFI_LDAP_AUTHENTICATION_STRATEGY is LDAPS -or- START_TLS then you must provide this.
  * NIFI_LDAP_URL
    * This environment variable configures the login-identity-providers.xml <property name="Url"/>
    * Space-separated list of URLs of the LDAP servers (i.e. ldap://<hostname>:<port>).
    * This is only used if NIFI_AUTH is set to ldap
    * Default. If NIFI_AUTH is set to ldap then you must provide this.
  * NIFI_LDAP_USER_SEARCH_BASE
    * This environment variable configures the login-identity-providers.xml <property name="User Search Base"/>
    * Base DN for searching for users (i.e. CN=Users,DC=example,DC=com).
    * This is only used if NIFI_AUTH is set to ldap
    * Default. If NIFI_AUTH is set to ldap then you must provide this.
  * NIFI_LDAP_USER_SEARCH_FILTER
    * This environment variable configures the login-identity-providers.xml <property name="User Search Filter"/>
    * Filter for searching for users against the User Search Base. (i.e. sAMAccountName={0}). The user specified name is inserted into '{0}'.
    * This is only used if NIFI_AUTH is set to ldap
    * Default. If NIFI_AUTH is set to ldap then you must provide this.
  * NIFI_LDAP_IDENTITY_STRATEGY
    * This environment variable configures the login-identity-providers.xml <property name="Identity Strategy"/>
    * Strategy to identify users. Possible values are USE_DN and USE_USERNAME. The default functionality if this property is missing is USE_DN in order to retain backward compatibility. USE_DN will use the full DN of the user entry if possible. USE_USERNAME will use the username the user logged in with.
    * This is only used if NIFI_AUTH is set to ldap
    * Default = USE_DN
  * NIFI_DEBUG
    * This environment variable configures the logback.xml <logger name='org.apache.nifi.web.security'/> <logger name='org.apache.nifi.web.authorization'/> @level attribute to DEBUG
    * This enables bebugging properties of the NiFi system for the users
    * Debugging goes to the nifi-user.log & nifi-app.log files
    * Example:
      * export NIFI_DEBUG="org.apache.nifi.web.security=TRACE,org.apache.nifi.authorization=DEBUG,org.apache.nifi.web.api.config=TRACE"
