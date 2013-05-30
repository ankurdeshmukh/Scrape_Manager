package TestWebsite;

use Moose;

#has 'uri' => (
#    is              => 'rw',
#    isa             => 'URI',
#    handles         => [ qw(host path abs) ]
#);



#has 'uri' => (
#    is              => 'rw',
#    isa             => 'URI',
#    handles         => {
#        hostname         => 'host',
#        path             => 'path',
#        absolute_path    => 'abs'
#    }
#);


has 'uri' => (
    is              => 'rw',
    isa             => 'URI',
    handles         => qr/^(?:host|path|query.*)/,
);


1;