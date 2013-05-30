## Retrieving the first and last day of the month for the given range     ##
        ## start date                                                             ##
        my $first_day_of_month    = DateTime->new( year      => $range_start_date->year,
                                                   month     => $range_start_date->month,
                                                   time_zone => $self->{time_zone} );

        my $last_day_of_month     = DateTime->last_day_of_month( year      => $range_start_date->year,
                                                                 month     => $range_start_date->month,
                                                                 time_zone => $self->{time_zone});


################################################################################
# Subroutine name : get_months_between                                         #
#                                                                              #
# Inputs          : This is public subroutine takes a list of inputs in the    #
#                   name value pair format. The inputs are as follows:         #
#                                                                              #
#------------------------------------------------------------------------------#
#                   Required                                                   #
# Inputs            /Optional        Data Type     Default Values              #
#------------------------------------------------------------------------------#
# start_date        OPTIONAL         SCALAR        Current Date                #
# end_date          OPTIONAL         SCALAR        Current Date                #
# date_format       OPTIONAL         SCALAR        %Y%m%d                      #
#------------------------------------------------------------------------------#
#                                                                              #
# Output          : Returns a hash ref where the key is the date in the        #
#                   YYYYMMDD format and the value is array ref of the date and #
#                   the start and end of the month in user defined format.     #
#                                                                              #
################################################################################
sub get_months_between {
    my $self                 = shift;                                                   
    my %parameters           = (@_);
    
    ## Declaring the variables local to the get_dates_between sub-routine     ##
    my (%month_range_hash);

    $self->_clean_keys( \%parameters, qr/^(start_date|end_date|date_format)$/ );

    my ($range_start_date, 
        $range_end_date)     = sort (DateTime::Format::DateManip->parse_datetime($self->{start_date}), 
                                     DateTime::Format::DateManip->parse_datetime($self->{end_date}));
    
    my $month_duration       = $range_end_date->delta_md( $range_start_date );

    for (my $range = 0; $range <= $month_duration->in_units( 'months' ); $range++) {

        if ($range != 0 ) {
            $range_start_date->add( months => 1 );
        }
        
        $month_range_hash{ $first_day_of_month->strftime( '%Y%m%d' ) } 
                                  = [ $range_start_date->strftime( $self->{date_format} ),
                                      $first_day_of_month->strftime( $self->{date_format} ),
                                      $last_day_of_month->strftime( $self->{date_format} ) ];
    } # for range

    return (\%month_range_hash);
} # get_months_between


################################################################################
# Subroutine name : get_years_between                                         #
#                                                                              #
# Inputs          : This is public subroutine takes a list of inputs in the    #
#                   name value pair format. The inputs are as follows:         #
#                                                                              #
#------------------------------------------------------------------------------#
#                   Required                                                   #
# Inputs            /Optional        Data Type     Default Values              #
#------------------------------------------------------------------------------#
# start_date        OPTIONAL         SCALAR        Current Date                #
# end_date          OPTIONAL         SCALAR        Current Date                #
# date_format       OPTIONAL         SCALAR        %Y%m%d                      #
#------------------------------------------------------------------------------#
#                                                                              #
# Output          : Returns a hash ref where the key is the date in the        #
#                   YYYYMMDD format and the value is array ref of the date at  #
#                   the start and end of the year in user defined format.      #
#                                                                              #
################################################################################
sub get_years_between {
    my $self                 = shift;                                                   
    my %parameters           = (@_);
    
    ## Declaring the variables local to the get_dates_between sub-routine     ##
    my (%year_range_hash);

    $self->_clean_keys( \%parameters, qr/^(start_date|end_date|date_format)$/ );

    my ($range_start_date, 
        $range_end_date)     = sort (DateTime::Format::DateManip->parse_datetime($self->{start_date}), 
                                     DateTime::Format::DateManip->parse_datetime($self->{end_date}));
    
    my $year_duration        = $range_end_date->delta_md( $range_start_date );

    for (my $range = 0; $range <= $year_duration->in_units( 'years' ); $range++) {

        if ($range != 0 ) {
            $range_start_date->add( years => 1 );
        }
        
        ## Retrieving the first and last day of the month for the given range     ##
        ## start date                                                             ##
        my $first_day_of_year     = DateTime->new( year      => $range_start_date->year,
                                                   time_zone => $self->{time_zone} );

        my $last_day_of_year      = DateTime->new( year      => $range_start_date->year,
                                                   month     => 12,
                                                   day       => 31 
                                                   time_zone => $self->{time_zone} );

        $year_range_hash{ $first_day_of_year->strftime( '%Y%m%d' ) } 
                                  = [ $range_start_date->strftime( $self->{date_format} ),
                                      $first_day_of_year->strftime( $self->{date_format} ),
                                      $last_day_of_year->strftime( $self->{date_format} ) ];
    } # for range

    return (\%year_range_hash);
} # get_years_between
