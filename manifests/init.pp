# = Class: logstash_forwarder_config
#
class logstash_forwarder_config(
    $package_url = undef,
    $servers = [],
    $use_ssl = 'false',
    $ssl_key = undef,
    $ssl_ca_path = undef,
    $ssl_certificate = undef,
    $files = {},
    $present = 'true',
    ) {

    if (str2bool($present)){

        validate_array($servers)
        
        if ($package_url and $package_url != 'false') {
            $manage_repo = false
            $real_package_url = $package_url
        } else {
            $manage_repo = true
            $real_package_url = undef
        }

        if (!str2bool($use_ssl)){
            $real_ssl_key = undef
            $real_ssl_ca_path = undef
            $real_ssl_certificate = undef
        } else {
            $real_ssl_key = $ssl_key
            $real_ssl_ca_path = $ssl_ca_path
            $real_ssl_certificate = $ssl_certificate
        }

        class { 'logstashforwarder' :
            package_url => $real_package_url,
            manage_repo => $manage_repo,
            servers     => $servers,
            ssl_key     => $real_ssl_key,
            ssl_ca      => $real_ssl_ca_path,
            ssl_cert    => $real_ssl_certificate,
        }

        validate_hash($files)
        create_resources('logstashforwarder::file', $files)
    }
}
