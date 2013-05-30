use strict;
use DateTime::TimeZone;

print DateTime::TimeZone->new( name => 'local' )->name();
