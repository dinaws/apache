node 'devops.amazonaws.com' {  
  class { 'apache':    
    default_mods => false, 
  }  

  include apache::mod::php  
  include apache::mod::ssl  

  apache::vhost { 'devops.amazonaws.com-http':    
    servername      => 'devops.amazonaws.com',    
    port            => '80',    
    docroot         => '/var/www/devops’,    
    redirect_status => 'permanent',    
    redirect_dest   => 'https://devops.amazonaws.com/',  
  }  

  apache::vhost { 'devops.amazonaws.com-https':    
    servername      => 'devops.amazonaws.com',    
    port            => '443',    
    docroot         => '/var/www/devops’,    
    ssl             => true,    
    ssl_cert        => '/etc/pki/tls/certs/localhost.crt',  
    ssl_key         => '/etc/pki/tls/private/localhost.key',
    
  }
}
