#!/usr/bin/perl

################################################################################
#                         Copyright © 2013  ANKUR DESHMUKH.                    #
#                                                                              #
# Module Name      : DateMath.pm                                               #
#                                                                              #
# Usage            : use ScrapeManager::DateMath;                              #
#                                                                              #
# Option Description:                                                          #
#                    There are no options for this Perl module.                #
#                                                                              #
# Input            : This program has no input argument.                       #
#                                                                              #
# Output           : Establishes standardized date math calculations. The date #
#                    valid formats can be found at the following url:          #
#                    http://search.cpan.org/~drolsky/DateTime-0.78/lib/DateTime#
#                    .pm#strftime_Patterns                                     #
#                                                                              #
#------------------------------------------------------------------------------#
#                      PUBLIC METHODS IN THIS PACKAGE                          #
#------------------------------------------------------------------------------#
#                                                                              #
#------------------------------------------------------------------------------#
#                       Subroutine: set_timezone                               #
#------------------------------------------------------------------------------#
# Usage            : my $dateManipulator = new ScrapeManager::DateMath;        #
#                    $dateManipulator->set_timezone("America/Pacific")         #
#                                                                              #
# Arguments        : This is a public subroutine that takes the valid time zone#
#                    as it's only input                                        #
#                                                                              #
# Returns          : Sets the current time zone for the DateMath object        #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#      Inputs            Description                                           #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Time Zone          A valid time zone name. The validity checked against  #
#                        the DateTime::TimeZone->is_valid_name routine         #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#                                                                              #
#------------------------------------------------------------------------------#
#                       Subroutine: get_timezone                               #
#------------------------------------------------------------------------------#
# Usage            : my $dateManipulator = new ScrapeManager::DateMath;        #
#                    $dateManipulator->get_timezone()                          #
#                                                                              #
# Arguments        : There are no inputs to this sub-routine.                  #
#                                                                              #
# Returns          : Returns the current DateMath object's time zone           #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#      Inputs            Description                                           #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Date Format        The format in which the user wants the current date.  #
#                        Defaulted to "%Y%m%d"                                 #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#                                                                              #
#------------------------------------------------------------------------------#
#                       Subroutine: get_local_timezone                         #
#------------------------------------------------------------------------------#
# Usage            : my $dateManipulator = new ScrapeManager::DateMath;        #
#                    $dateManipulator->get_local_timezone()                    #
#                                                                              #
# Arguments        : There are no inputs to this sub-routine.                  #
#                                                                              #
# Returns          : Returns the local time zone                               #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#      Inputs            Description                                           #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Date Format        The format in which the user wants the current date.  #
#                        Defaulted to "%Y%m%d"                                 #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#                                                                              #
#------------------------------------------------------------------------------#
#                       Subroutine: get_current_date                           #
#------------------------------------------------------------------------------#
# Usage            : my $dateManipulator = new ScrapeManager::DateMath;        #
#                    $dateManipulator->get_current_date('%m/%d/%Y')            #
#                                                                              #
# Arguments        : The output date format.                                   #
#                                                                              #
# Returns          : Returns the current date in user defined format           #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#      Inputs            Description                                           #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Date Format        The format in which the user wants the current date.  #
#                        Defaulted to "%Y%m%d"                                 #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#                                                                              #
#------------------------------------------------------------------------------#
#                       Subroutine: get_first_day_of_month                     #
#------------------------------------------------------------------------------#
# Usage            : my $dateManipulator = new ScrapeManager::DateMath;        #
#                    $dateManipulator->get_first_day_of_month(                 #
#                     check_date  => '20121201',                               #
#                     date_format => '%m/%d/%Y')                               #
#                                                                              #
# Arguments        : Hash of some or all of the inputs mentioned below.        #
#                                                                              #
# Returns          : Returns a date of the first day of the month for the date #
#                    provided, in the date format provided.                    #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#      Inputs            Description                                           #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Check Date         The date for which to get the first date for.         #
#                        Defaulted to todays date                              #
#     Date Format        The format in which the user desires the dates in     #
#                        Defaulted to "%Y%m%d"                                 #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#                                                                              #
#------------------------------------------------------------------------------#
#                       Subroutine: get_last_day_of_month                      #
#------------------------------------------------------------------------------#
# Usage            : my $dateManipulator = new ScrapeManager::DateMath;        #
#                    $dateManipulator->get_last_day_of_month(                  #
#                     check_date  => '20121201',                               #
#                     date_format => '%m/%d/%Y')                               #
#                                                                              #
# Arguments        : Hash of some or all of the inputs mentioned below.        #
#                                                                              #
# Returns          : Returns a date of the last day of the month for the date  #
#                    provided, in the date format provided.                    #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#      Inputs            Description                                           #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Check Date         The date for which to get the last date for.          #
#                        Defaulted to todays date                              #
#     Date Format        The format in which the user desires the dates in     #
#                        Defaulted to "%Y%m%d"                                 #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#                                                                              #
#------------------------------------------------------------------------------#
#                       Subroutine: get_month_cusp                             #
#------------------------------------------------------------------------------#
# Usage            : my $dateManipulator = new ScrapeManager::DateMath;        #
#                    $dateManipulator->get_month_cusp(                         #
#                     check_date  => '20121201',                               #
#                     date_format => '%m/%d/%Y')                               #
#                                                                              #
# Arguments        : Hash of some or all of the inputs mentioned below.        #
#                                                                              #
# Returns          : Returns a array ref which includes the date of the first  #
#                    and the last day of the month for the date provided, in   #
#                    the date format provided.                                 #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#      Inputs            Description                                           #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Check Date         The date for which to get the first and last date for.#
#                        Defaulted to todays date                              #
#     Date Format        The format in which the user desires the dates in     #
#                        Defaulted to "%Y%m%d"                                 #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#                                                                              #
#------------------------------------------------------------------------------#
#                       Subroutine: get_first_day_of_year                      #
#------------------------------------------------------------------------------#
# Usage            : my $dateManipulator = new ScrapeManager::DateMath;        #
#                    $dateManipulator->get_first_day_of_year(                  #
#                     check_date  => '20121201',                               #
#                     date_format => '%m/%d/%Y')                               #
#                                                                              #
# Arguments        : Hash of some or all of the inputs mentioned below.        #
#                                                                              #
# Returns          : Returns a date of the first day of the year for the date  #
#                    provided, in the date format provided.                    #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#      Inputs            Description                                           #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Check Date         The date for which to get the first date for.         #
#                        Defaulted to todays date                              #
#     Date Format        The format in which the user desires the dates in     #
#                        Defaulted to "%Y%m%d"                                 #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#                                                                              #
#------------------------------------------------------------------------------#
#                       Subroutine: get_last_day_of_year                       #
#------------------------------------------------------------------------------#
# Usage            : my $dateManipulator = new ScrapeManager::DateMath;        #
#                    $dateManipulator->get_last_day_of_year(                   #
#                     check_date  => '20121201',                               #
#                     date_format => '%m/%d/%Y')                               #
#                                                                              #
# Arguments        : Hash of some or all of the inputs mentioned below.        #
#                                                                              #
# Returns          : Returns a date of the last day of the year for the date   #
#                    provided, in the date format provided.                    #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#      Inputs            Description                                           #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Check Date         The date for which to get the last date for.          #
#                        Defaulted to todays date                              #
#     Date Format        The format in which the user desires the dates in     #
#                        Defaulted to "%Y%m%d"                                 #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#                                                                              #
#------------------------------------------------------------------------------#
#                       Subroutine: get_year_cusp                              #
#------------------------------------------------------------------------------#
# Usage            : my $dateManipulator = new ScrapeManager::DateMath;        #
#                    $dateManipulator->get_year_cusp(                          #
#                     check_date  => '20121201',                               #
#                     date_format => '%m/%d/%Y')                               #
#                                                                              #
# Arguments        : Hash of some or all of the inputs mentioned below.        #
#                                                                              #
# Returns          : Returns a array ref which includes the date of the first  #
#                    and the last day of the year for the date provided, in    #
#                    the date format provided.                                 #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#      Inputs            Description                                           #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Check Date         The date for which to get the first and last date for.#
#                        Defaulted to todays date                              #
#     Date Format        The format in which the user desires the dates in     #
#                        Defaulted to "%Y%m%d"                                 #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#                                                                              #
#------------------------------------------------------------------------------#
#                       Subroutine: get_range_between                          #
#------------------------------------------------------------------------------#
# Usage            : my $dateManipulator = new ScrapeManager::DateMath;        #
#                    $dateManipulator->get_range_between(                      #
#                     range_type      => 'DAYS',                               #
#                     start_date      => '20121201',                           #
#                     end_date        => '20130101',                           #
#                     key_date_format => '%Y%m%d',                             #
#                     val_date_format => '%m/%d/%Y')                           #
#                                                                              #
# Arguments        : Hash of some or all of the inputs mentioned below.        #
#                                                                              #
# Returns          : Returns a hash ref where the key is the date in the       #
#                    YYYYMMDD format and the value is array ref of the date in #
#                    user defined format.                                      #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#      Inputs            Description                                           #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Range Type         The range type determines how we want the data        #
#                        returned. Valid inputs are: MINUTES, HOURS, DAYS,     #
#                        WEEKS, MONTHS, YEARS                                  #
#                        Defaulted to DAYS                                     #
#     Start Date         The start date of the range.                          #
#                        Defaulted to todays date                              #
#     End Date           The end date of the range.                            #
#                        Defaulted to todays date                              #
#     Date Format        The format in which the user desires the dates in     #
#                        Defaulted to "%Y%m%d"                                 #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#

#                                                                              #
# Created By   : Ankur Deshmukh                                                #
#                                                                              #
# Version       Date          Changes Done                 Changes Done By     #
# -----------------------------------------------------------------------------#
# 1.0        15-Feb-2013      1. Created the file          Ankur Deshmukh      #
#                                                                              #
################################################################################
                                                                               
#package ScrapeManager::DateMath;
package DateMath;

use strict;
use Carp qw(carp croak);
use DateTime;
use DateTime::TimeZone;
use DateTime::Format::Natural;

################################################################################
# Subroutine name : new - Contsructor                                          #
#                                                                              #
# Inputs          : Class Type Name to create an object of that class type     #
#                                                                              #
# Output          : Returns the object of the specified class type             #
################################################################################
sub new {                                                                      
    my $class                = shift;                                             
    my $self                 = {};                                                
                                                                               
    ## Initializing the scalar values local to the DateMath object            ##
    $self->{range_type}      = 'DAYS';
    $self->{start_date}      = DateTime->now();
    $self->{end_date}        = DateTime->now();
    $self->{check_date}      = DateTime->now();
    
    $self->{key_date_format} = '%Y%m%d';
    $self->{date_format}     = $self->{val_date_format} = $self->{key_date_format};

    $self->{time_zone}       = DateTime::TimeZone->new( name => 'UTC' );
    
    bless ($self, $class);
    return $self;
} # new


################################################################################
# Subroutine name : set_timezone                                               #
#                                                                              #
# Inputs          : This is a public subroutine that takes the valid time zone #
#                   as it's only input                                         #
#                                                                              #
#------------------------------------------------------------------------------#
#                   Required                                                   #
# Inputs            /Optional        Data Type     Default Values              #
#------------------------------------------------------------------------------#
# time_zone         REQUIRED         SCALAR        NOT APPLICABLE              #
#------------------------------------------------------------------------------#
#                                                                              #
# Output          : Sets the current time zone for the DateMath object         #
#                                                                              #
################################################################################
sub set_timezone {
    my $self                 = shift;
    my $time_zone            = shift;
    
    if ( !( DateTime::TimeZone->is_valid_name( $time_zone ) ) ) {
        carp "Invalid time zone ($time_zone) specified.";
    }

    $self->{time_zone}       = $time_zone;
} # set_timezone


################################################################################
# Subroutine name : get_timezone                                               #
#                                                                              #
# Inputs          : This is a public subroutine that has no inputs.            #
#                                                                              #
# Output          : Returns the current objects time zone.                     #
#                                                                              #
################################################################################
sub get_timezone {
    my $self                 = shift;
    
    return $self->{time_zone};
} # get_timezone


################################################################################
# Subroutine name : get_local_timezone                                         #
#                                                                              #
# Inputs          : This is a public subroutine that has no inputs.            #
#                                                                              #
# Output          : Returns the current date in user defined format            #
#                                                                              #
################################################################################
sub get_local_timezone {
    my $self                 = shift;
    
    return DateTime::TimeZone->new( name => 'local' )->name();
} # get_local_timezone


################################################################################
# Subroutine name : get_current_date                                           #
#                                                                              #
# Inputs          : This is a public subroutine that takes the format in which #
#                   the user wants the current date to be returned back to him.#
#                                                                              #
#------------------------------------------------------------------------------#
#                   Required                                                   #
# Inputs            /Optional        Data Type     Default Values              #
#------------------------------------------------------------------------------#
# date_format       OPTIONAL         SCALAR        %Y%m%d                      #
#------------------------------------------------------------------------------#
#                                                                              #
# Output          : Returns the the local time zone                            #
#                                                                              #
################################################################################
sub get_current_date {                                                              
    my $self                 = shift;                                                   
    my $date_format          = shift;
    
    $date_format             = $self->{date_format} if ( !( defined $date_format ) );

    return DateTime->now( time_zone  => $self->{time_zone} )-> strftime( $date_format );   
} # get_current_date


################################################################################
# Subroutine name : get_first_day_of_month                                     #
#                                                                              #
# Inputs          : This is a public subroutine that takes a valid date and the#
#                   date_format in which the date needs to be returned.        #
#                                                                              #
#------------------------------------------------------------------------------#
#                   Required                                                   #
# Inputs            /Optional        Data Type     Default Values              #
#------------------------------------------------------------------------------#
# check_date        OPTIONAL         SCALAR        Current Date                #
# date_format       OPTIONAL         SCALAR        %Y%m%d                      #
#------------------------------------------------------------------------------#
#                                                                              #
# Output          : Returns a date of the first day of the month for the date  #
#                   provided, in the date format provided.                     #
#                                                                              #
################################################################################
sub get_first_day_of_month {
    my $self                 = shift;                                                   
    my %parameters           = (@_);
    
    ## Declaring the variables local to the get_first_day_of_month sub-routine##
    
    $self->_clean_keys( \%parameters, qr/^(check_date|date_format)$/ );
    
    ## Creating a new DateTime::Format::Natural object                        ##
    $self->{date_parser}     = DateTime::Format::Natural->new( timezone -> $self->{time_zone} );

    my $formatted_date       = $self->{date_parser}->parse_datetime( $self->{check_date} );
    
    my $first_day_of_month   = DateTime->new( year      => $formatted_date->year,
                                              month     => $formatted_date->month,
                                              time_zone => $self->{time_zone} );
    
    return $first_day_of_month->strftime( $self->{date_format} );
} # get_first_day_of_month


################################################################################
# Subroutine name : get_last_day_of_month                                      #
#                                                                              #
# Inputs          : This is a public subroutine that takes a valid date and the#
#                   date_format in which the date needs to be returned.        #
#                                                                              #
#------------------------------------------------------------------------------#
#                   Required                                                   #
# Inputs            /Optional        Data Type     Default Values              #
#------------------------------------------------------------------------------#
# check_date        OPTIONAL         SCALAR        Current Date                #
# date_format       OPTIONAL         SCALAR        %Y%m%d                      #
#------------------------------------------------------------------------------#
#                                                                              #
# Output          : Returns a date of the last day of the month for the date   #
#                   provided, in the date format provided.                     #
#                                                                              #
################################################################################
sub get_last_day_of_month {
    my $self                 = shift;                                                   
    my %parameters           = (@_);
    
    ## Declaring the variables local to the get_last_day_of_month sub-routine ##
    
    $self->_clean_keys( \%parameters, qr/^(check_date|date_format)$/ );
    
    ## Creating a new DateTime::Format::Natural object                        ##
    $self->{date_parser}     = DateTime::Format::Natural->new( timezone -> $self->{time_zone} );
    
    my $formatted_date       = $self->{date_parser}->parse_datetime( $self->{check_date} );
    
    my $last_day_of_month    = DateTime->last_day_of_month( year      => $formatted_date->year,
                                                            month     => $formatted_date->month,
                                                            time_zone => $self->{time_zone} );
    
    return $last_day_of_month->strftime( $self->{date_format} );
} # get_last_day_of_month


################################################################################
# Subroutine name : get_month_cusp                                             #
#                                                                              #
# Inputs          : This is a public subroutine that takes a valid date and the#
#                   date_format in which the date needs to be returned.        #
#                                                                              #
#------------------------------------------------------------------------------#
#                   Required                                                   #
# Inputs            /Optional        Data Type     Default Values              #
#------------------------------------------------------------------------------#
# check_date        OPTIONAL         SCALAR        Current Date                #
# date_format       OPTIONAL         SCALAR        %Y%m%d                      #
#------------------------------------------------------------------------------#
#                                                                              #
# Output          : Returns a array ref which includes the date of the first   #
#                   and the last day of the month for the date provided, in the#
#                   date format provided.                                      #
#                                                                              #
################################################################################
sub get_month_cusp {
    my $self                 = shift;                                                   
    
    ## Declaring the variables local to the get_month_cusp sub-routine        ##
    
    return ( $self->get_first_day_of_month( @_ ),
             $self->get_last_day_of_month( @_ ) );
} # get_month_cusp


################################################################################
# Subroutine name : get_first_day_of_year                                      #
#                                                                              #
# Inputs          : This is a public subroutine that takes a valid date and the#
#                   date_format in which the date needs to be returned.        #
#                                                                              #
#------------------------------------------------------------------------------#
#                   Required                                                   #
# Inputs            /Optional        Data Type     Default Values              #
#------------------------------------------------------------------------------#
# check_date        OPTIONAL         SCALAR        Current Date                #
# date_format       OPTIONAL         SCALAR        %Y%m%d                      #
#------------------------------------------------------------------------------#
#                                                                              #
# Output          : Returns a date of the first day of the year for the date   #
#                   provided, in the date format provided.                     #
#                                                                              #
################################################################################
sub get_first_day_of_year {
    my $self                 = shift;                                                   
    my %parameters           = (@_);
    
    ## Declaring the variables local to the get_first_day_of_month sub-routine##
    
    $self->_clean_keys( \%parameters, qr/^(check_date|date_format)$/ );

    ## Creating a new DateTime::Format::Natural object                        ##
    $self->{date_parser}     = DateTime::Format::Natural->new( timezone -> $self->{time_zone} );
    
    my $formatted_date       = $self->{date_parser}->parse_datetime($self->{check_date});
    
    my $first_day_of_year    = DateTime->new( year      => $formatted_date->year,
                                              time_zone => $self->{time_zone} );
    
    return $first_day_of_year->strftime( $self->{date_format} );
} # get_first_day_of_year


################################################################################
# Subroutine name : get_last_day_of_year                                       #
#                                                                              #
# Inputs          : This is a public subroutine that takes a valid date and the#
#                   date_format in which the date needs to be returned.        #
#                                                                              #
#------------------------------------------------------------------------------#
#                   Required                                                   #
# Inputs            /Optional        Data Type     Default Values              #
#------------------------------------------------------------------------------#
# check_date        OPTIONAL         SCALAR        Current Date                #
# date_format       OPTIONAL         SCALAR        %Y%m%d                      #
#------------------------------------------------------------------------------#
#                                                                              #
# Output          : Returns a date of the last day of the year for the date    #
#                   provided, in the date format provided.                     #
#                                                                              #
################################################################################
sub get_last_day_of_year {
    my $self                 = shift;                                                   
    my %parameters           = (@_);
    
    ## Declaring the variables local to the get_last_day_of_month sub-routine ##
    
    $self->_clean_keys( \%parameters, qr/^(check_date|date_format)$/ );

    ## Creating a new DateTime::Format::Natural object                        ##
    $self->{date_parser}     = DateTime::Format::Natural->new( timezone -> $self->{time_zone} );
    
    my $formatted_date       = $self->{date_parser}->parse_datetime($self->{check_date});
    
    my $last_day_of_year     = DateTime->new( year      => $formatted_date->year,
                                              month     => 12,
                                              day       => 31,
                                              time_zone => $self->{time_zone} );
    
    return $last_day_of_year->strftime( $self->{date_format} );
} # get_last_day_of_year


################################################################################
# Subroutine name : get_year_cusp                                              #
#                                                                              #
# Inputs          : This is a public subroutine that takes a valid date and the#
#                   date_format in which the date needs to be returned.        #
#                                                                              #
#------------------------------------------------------------------------------#
#                   Required                                                   #
# Inputs            /Optional        Data Type     Default Values              #
#------------------------------------------------------------------------------#
# check_date        OPTIONAL         SCALAR        Current Date                #
# date_format       OPTIONAL         SCALAR        %Y%m%d                      #
#------------------------------------------------------------------------------#
#                                                                              #
# Output          : Returns a array ref which includes the date of the first   #
#                   and the last day of the year for the date provided, in the #
#                   date format provided.                                      #
#                                                                              #
################################################################################
sub get_year_cusp {
    my $self                 = shift;                                                   
    
    ## Declaring the variables local to the get_month_cusp sub-routine        ##
    
    return ( $self->get_first_day_of_year( @_ ),
             $self->get_last_day_of_year( @_ ) );
} # get_year_cusp


################################################################################
# Subroutine name : get_range_between                                          #
#                                                                              #
# Inputs          : This is public subroutine takes a list of inputs in the    #
#                   name value pair format. The inputs are as follows:         #
#                                                                              #
#------------------------------------------------------------------------------#
#                   Required                                                   #
# Inputs            /Optional        Data Type     Default Values              #
#------------------------------------------------------------------------------#
# range_type        OPTIONAL         SCALAR        DAYS                        #
# start_date        OPTIONAL         SCALAR        Current Date                #
# end_date          OPTIONAL         SCALAR        Current Date                #
# key_date_format   OPTIONAL         SCALAR        %Y%m%d                      #
# val_date_format   OPTIONAL         SCALAR        %Y%m%d                      #
#------------------------------------------------------------------------------#
#                                                                              #
# Output          : Returns a hash ref where the key is the date in the        #
#                   YYYYMMDD format and the value is array ref of the date in  #
#                   user defined format.                                       #
#                                                                              #
################################################################################
sub get_range_between {
    my $self                 = shift;                                                   
    my %parameters           = (@_);
    
    ## Declaring the variables local to the get_range_between sub-routine     ##
    my (%range_hash, $range_duration, $range_in_units);
    
    $self->_clean_keys( \%parameters, qr/^(range_type|start_date|end_date|key_date_format|val_date_format)$/ );
    
    ## Creating a new DateTime::Format::Natural object                        ##
    $self->{date_parser}     = DateTime::Format::Natural->new( timezone -> $self->{time_zone} );
    
    my ($range_start_date, 
        $range_end_date)     = sort( $self->{date_parser}->parse_datetime( $self->{start_date} ), 
                                     $self->{date_parser}->parse_datetime( $self->{end_date} ) );
    
    ## Setting the time zone for the range_start_date and range_end_date      ##
    $range_start_date->set_time_zone( $self->{time_zone} ); 
    $range_end_date->set_time_zone( $self->{time_zone} ); 

    if (uc( $self->{range_type} )    eq 'MINUTES') {
        $range_duration      = $range_end_date->delta_ms( $range_start_date );
    }
    elsif (uc( $self->{range_type} ) eq 'HOURS') {
        $range_duration      = $range_end_date->delta_ms( $range_start_date );
    }
    elsif (uc( $self->{range_type} ) eq 'DAYS') {
        $range_duration      = $range_end_date->delta_days( $range_start_date );
    }
    elsif (uc( $self->{range_type} ) eq 'WEEKS') {
        $range_duration      = $range_end_date->delta_days( $range_start_date );
    }
    elsif (uc( $self->{range_type} ) eq 'MONTHS') {
        $range_duration      = $range_end_date->delta_md( $range_start_date );
    }
    elsif (uc( $self->{range_type} ) eq 'YEARS') {
        $range_duration      = $range_end_date->delta_md( $range_start_date );
    }
    else {
        croak "Invalid Range Type specified: " . $self->{range_type} . ". Valid inputs are: MINUTES, HOURS, DAYS, WEEKS, MONTHS, YEARS\n";
    }
    
    for (my $range = 0; $range <= $range_duration->in_units( lc($self->{range_type}) ); $range++) {
        
        if ($range != 0) {
            $range_start_date->add( lc($self->{range_type}) => 1 );
        }
        
        $range_hash{ $range_start_date->strftime( $self->{key_date_format} ) } 
                                  = $range_start_date->strftime( $self->{val_date_format} );
    } # for range

    return (\%range_hash);
} # get_range_between


################################################################################
# Subroutine name : _clean_keys                                                #
#                                                                              #
# Inputs          : This is a private subroutine that takes a hash ref and     #
#                   hask key regular expression                                #
#                   The inputs are as follows:                                 #
#                                                                              #
#------------------------------------------------------------------------------#
#                   Required                                                   #
# Inputs            /Optional        Data Type     Default Values              #
#------------------------------------------------------------------------------#
# parameters        REQUIRED         HASH REF                                  #
# regex_keyname     REQUIRED         SCALAR                                    #
#------------------------------------------------------------------------------#
#                                                                              #
# Output          : The subroutine checks if the keys specified for $parameters#
#                   are valid based on $regex_keyname. If it is valid key then #
#                   it assigns the $parameters values to the object of the     #
#                   class.                                                     #
#                                                                              #
################################################################################
sub _clean_keys {
    my $self                 = shift;
    my $parameters           = shift;
    my $regex_keyname        = shift;

    foreach my $hash_key ( keys %$parameters ) {
        if ( $hash_key !~ qr/$regex_keyname/ ) {
            carp "Invalid key ($hash_key) specified. List of valid keys: range_type, start_date, end_date, check_date, date_format";
            delete $parameters->{$hash_key};
            next;
        }

        $self->{$hash_key}   = $parameters->{$hash_key}
    } # for keys %$parameters

    return;
} # _clean_keys

1;

## Testing the DateMath package                                             ##
package main;
use Data::Dumper;

my $date1 = '20121103';
my $date2 = '20121105';

my $dateMathObject = new DateMath;


#$dateMathObject->set_timezone('America/Los_Angeles');

my $timezone = $dateMathObject->get_timezone();

print $timezone, "\n";

my $local_timezone = $dateMathObject->get_local_timezone();

print $local_timezone, "\n";


my $hashref = $dateMathObject->get_range_between( range_type  => 'HOURS',
                                                  start_date  => $date1,
                                                  end_date    => $date2,
                                                  key_date_format => '%Y%m%d%H%M%S%Z',
                                                  val_date_format => '%m/%d/%Y %H:%M:%S %Z');

foreach my $key (sort keys %$hashref) {
    print $key . ' - ' . $hashref->{$key} . "\n";
}

my ($first_mon, $last_mon) = $dateMathObject->get_month_cusp( check_date  => $date1,
                                                      date_format => '%m/%d/%Y %H:%M:%S');

print $first_mon . '-' . $last_mon . "\n";

my ($first_yr, $last_yr) = $dateMathObject->get_year_cusp( check_date  => $date1,
                                                date_format => '%m/%d/%Y %H:%M:%S');

print $first_yr . '-' . $last_yr . "\n";