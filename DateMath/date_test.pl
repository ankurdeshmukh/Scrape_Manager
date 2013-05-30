use strict;
use DateTime;
use DateTime::Format::Natural;
use Data::Dumper;


my $parser = DateTime::Format::Natural->new();

my $range_start_date = $parser->parse_datetime($ARGV[0]);

if ($parser->success) {
    print "Good\n";
    printf("%02d.%02d.%4d %02d:%02d:%02d\n", $range_start_date->day,
                                              $range_start_date->month,
                                              $range_start_date->year,
                                              $range_start_date->hour,
                                              $range_start_date->min,
                                              $range_start_date->sec);
}
else {
    warn $parser->error;
}

#my $range_end_date = $parser->parse_datetime($ARGV[1]);

#my $rangeType = 'WEEKS';
#
#my $duration = $range_end_date->delta_days($range_start_date);
#
#$range_start_date->add( lc($rangeType) => 1 );
#
#print $duration->in_units( lc($rangeType) ), "\n";
#
#print $range_start_date->strftime( '%Y%m%d' ), "\n";