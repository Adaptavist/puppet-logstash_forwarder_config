# puppet-logstash_forwarder_config

A puppet module for managing and configuring logstash-forwarder module, creating tracked files and source repository management

[logstash-forwarder wiki](https://github.com/Adaptavist/puppet-logstash-forwarder):

## Usage

Installation, make sure service is running and will be started at boot time:
Manages files, ceritficates and package source repo

```

 logstash_forwarder_config::ssl_key: '/path/to/ssl/root/ssl_key'
 logstash_forwarder_config::ssl_ca_path: '/path/to/ssl/root/ssl_ca_path'
 logstash_forwarder_config::ssl_certificate: '/path/to/ssl/root/ssl_certificate'
 logstash_forwarder_config::files:
   'apache-access':
      paths: 
        - '/var/log/httpd/*access*.log'
      fields:
        'type': 'apache-access'
    'apache-error':
      paths:
        - '/var/log/httpd/*error*.log'
      fields:
        'type': 'apache-error'
 logstash_forwarder_config::present: true
 logstash_forwarder_config::servers:
   - 'listof.hosts:12345'
   - '127.0.0.1:9987'

```

Removal:

```
     logstash_forwarder_config::present: false
```

Disable default source repo:

```
  
  logstash_forwarder_config::repo::manage_repo: false

```

## Dependencies

puppet-logstash_forwarder module, tag 'v0.1.0'

