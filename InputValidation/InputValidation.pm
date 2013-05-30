#!/usr/bin/perl

###############################################################################
#                         Copyright © 2013  ANKUR DESHMUKH.                    #
#                                                                             #
# Program Name : InputValidation.pm                                           #
#                                                                             #
# Usage        : use EVCorp::InputValidation;                                 #
#                                                                             #
# Method Description:                                                         #
#                                                                             #
#-----------------------------------------------------------------------------#
#                               Subroutine: new                               #
#-----------------------------------------------------------------------------#
# Usage   :  use EVCorp::InputValidation;                                     #
#                                                                             #
#            my $inputValidator = new EVCorp::InputValidation;                #
#                                                                             #
# Args    :  There are no input arguments to this sub-routine                 #
#                                                                             #
# Returns :  This initializes the object which is used to call different      #
#            functions                                                        #
#-----------------------------------------------------------------------------#
#                                                                             #
#-----------------------------------------------------------------------------#
#                       Subroutine: input_argument_check                      #
#-----------------------------------------------------------------------------#
# Usage   :  use EVCorp::InputValidation;                                     #
#                                                                             #
#            my $inputValidator = new EVCorp::InputValidation;                #
#            my $argCheckErrors = $osArchiver->byname( <options> );           #
#                                                                             #
# Args    :  $inputArgCriteria    - A hash of hash which contains some        #
#                                   standard keys.                            #
#                                                                             #
# Details about the $inputArgCriteria hash:                                   #
# $inputArgCriteria= ('inputargument' =>                                      #
#                     {'inputValue'     => VALUE PROVIDED FOR THE INPUT ARG   #
#                      'dataType'       => ['STRING', 'DATE', 'NUMBER']       #
#                      'dataValues'     => ARRAY REF FOR VALID STRING         #
#                                          DATATYPES                          #
#                      'dataExpression' => EXPRESSION FOR INPUT VALIDATION    #
#                      'isRequiredFlag' => IS THE INPUT OPTION REQUIRED OR    #
#                                          OPTIONAL,                          #
#                      'defaultValue'   => DEFAULT VALUE                      #
#                     });                                                     #
#                                                                             #
# Returns :  This function validates the passed inputs.                       #
#-----------------------------------------------------------------------------#
#                                                                             #
# Created By   : Ankur Deshmukh                                               #
#                                                                             #
# Version       Date          Changes Done                 Changes Done By    #
# ----------------------------------------------------------------------------#
# 1.0         25-Jul-2012     1. Created the file          Ankur Deshmukh     #
#                                                                             #
###############################################################################

package EVCorp::InputValidation;

## Declaring the modules required in the excecution of the module            ## 
use strict;
use List::Util qw (first);
use Date::Manip  qw (ParseDate UnixDate);

###############################################################################
# Sub-Routine: new - Constructor                                              #
# Input      : The object of the class                                        #
# Output     : Initialize the global variables and bless $self to the class   #
###############################################################################
sub new {
    my $primaryObject    = shift;
    my $self             = {};
   
    ## Initialzing the global variables used in the program                  ##
    $self->{errorMsg}    = undef;
    
    bless ($self, $primaryObject);

    return $self;
}


###############################################################################
# Function : input_argument_check                                             #
# Input    : $inputArgCriteria    - A hash of hash which contains some        #
#                                   standard keys.                            #
#                                                                             #
# Details about the $inputArgCriteria hash:                                   #
# $inputArgCriteria= ('inputargument' =>                                      #
#                     {'inputValue'     => VALUE PROVIDED FOR THE INPUT ARG   #
#                      'dataType'       => ['STRING', 'DATE', 'NUMBER']       #
#                      'dataValues'     => ARRAY REF FOR VALID STRING         #
#                                          DATATYPES                          #
#                      'dataExpression' => EXPRESSION FOR INPUT VALIDATION    #
#                      'isRequiredFlag' => IS THE INPUT OPTION REQUIRED OR    #
#                                          OPTIONAL,                          #
#                      'defaultValue'   => DEFAULT VALUE                      #
#                     });                                                     #
# Output   : This function checks the arguments passed to a Perl script anc   #
#            checks their validity.                                           #
###############################################################################
sub input_argument_check {
    my $self                       = shift;
    my $argCriterion               = shift;

    ## Declaring the variables that are local to the sub-routine byname      ##
    my (@errorMessages);
    
    foreach my $argValue (keys %{$argCriterion}) {
        
        ## Check if the input argument is defined and not equal to ''        ##
        if (($argCriterion->{$argValue}{'inputValue'}) && ($argCriterion->{$argValue}{'inputValue'} ne '')) {
            
            ## If the input argument has been specified then check if it     ##
            ## matches the criterion associated with the argument.           ##
            if (uc($argCriterion->{$argValue}{'dataType'}) eq 'NUMBER') {
            
                ## Checking if the valid options have been passed for a      ##
                ## number type input, using a regular expression.            ##
                if ($argCriterion->{$argValue}{'inputValue'} =~ /^(\d+)(-(\d+))?$/) {
                    my $minNumber       = $1;
                    my $maxNumber       = $3;
                        
                    if ($minNumber) {
                        (my $minExpression   = $argCriterion->{$argValue}{'dataExpression'}) =~ s/\&\&VAR/$minNumber/ig;

                        if (! (eval $minExpression)) {
                            push @errorMessages, "Argument check failed for input argument --" . $argValue . ".\n" .
                                                 "  Type of Data            => " . uc($argCriterion->{$argValue}{'dataType'}) . "\n" .
                                                 "  Value Specified by user => " . $argCriterion->{$argValue}{'inputValue'} . "\n" .
                                                 "  Valid Values Include    => Any Number or From_Number-To_Number that statisfies the following expression: " . $minExpression;
                        }
                    }

                    if ($maxNumber) {
                        (my $maxExpression   = $argCriterion->{$argValue}{'dataExpression'}) =~ s/\&\&VAR/$maxNumber/ig;

                        if (! (eval $maxExpression)) {
                            push @errorMessages, "Argument check failed for input argument --" . $argValue . ".\n" .
                                                 "  Type of Data            => " . uc($argCriterion->{$argValue}{'dataType'}) . "\n" .
                                                 "  Value Specified by user => " . $argCriterion->{$argValue}{'inputValue'} . "\n" .
                                                 "  Valid Values Include    => Any Number or From_Number-To_Number that statisfies the following expression: " . $maxExpression;
                        }
                    }
                }
                else {
                    push @errorMessages, "Argument check failed for input argument --" . $argValue . ".\n" .
                                         "  Type of Data            => " . uc($argCriterion->{$argValue}{'dataType'}) . "\n" .
                                         "  Value Specified by user => " . $argCriterion->{$argValue}{'inputValue'} . "\n" .
                                         "  Valid Values Include    => Any Number or From_Number-To_Number that is greater than 2000. (2011 or 2011-2010)";
                }
            }

            ## If the input argument has been specified then check if it     ##
            ## matches the criterion associated with the argument.           ##
            if (uc($argCriterion->{$argValue}{'dataType'}) eq 'STRING') {
                
                ## Checking if the valid options have been passed for a      ##
                ## string type input, using the List::Util module            ##
                if (!(first { uc($_) eq uc($argCriterion->{$argValue}{'inputValue'}) } @{$argCriterion->{$argValue}{'dataValues'}})) {
                    
                    push @errorMessages, "Argument check failed for input argument --" . $argValue . ".\n" .
                                         "  Type of Data            => " . uc($argCriterion->{$argValue}{'dataType'}) . "\n" .
                                         "  Value Specified by user => " . $argCriterion->{$argValue}{'inputValue'} . "\n" .
                                         "  Valid Values Include    => " . join(',', @{$argCriterion->{$argValue}{'dataValues'}});
                }
            }

            ## If the input argument has been specified then check if it     ##
            ## matches the criterion associated with the argument.           ##
            if (uc($argCriterion->{$argValue}{'dataType'}) eq 'DATE') {
            
                ## Checking if the valid options have been passed for a      ##
                ## number type input, using a regular expression.            ##
                if ($argCriterion->{$argValue}{'inputValue'} =~ /^(.+?)(\-(.+?))?$/) {
                    my $minInputDate    = $1;
                    my $maxInputDate    = $3;
                        
                    if ($minInputDate) {
                        my $minCalcDate = ParseDate($minInputDate);

                        if (! ($minCalcDate)) {
                            push @errorMessages, "Argument check failed for input argument --" . $argValue . ".\n" .
                                                 "  Type of Data            => " . uc($argCriterion->{$argValue}{'dataType'}) . "\n" .
                                                 "  Value Specified by user => " . $argCriterion->{$argValue}{'inputValue'} . "\n" .
                                                 "  Valid Values Include    => Any Date or From_Date-To_Date. [20120426 or 20120426-20120420]";
                        }
                    }

                    if ($maxInputDate) {
                        my $maxCalcDate = ParseDate($maxInputDate);

                        if (! ($maxCalcDate)) {
                            push @errorMessages, "Argument check failed for input argument --" . $argValue . ".\n" .
                                                 "  Type of Data            => " . uc($argCriterion->{$argValue}{'dataType'}) . "\n" .
                                                 "  Value Specified by user => " . $argCriterion->{$argValue}{'inputValue'} . "\n" .
                                                 "  Valid Values Include    => Any Date or From_Date-To_Date. [20120426 or 20120426-20120420]";
                        }
                    }
                }
                else {
                    push @errorMessages, "Argument check failed for input argument --" . $argValue . ".\n" .
                                         "  Type of Data            => " . uc($argCriterion->{$argValue}{'dataType'}) . "\n" .
                                         "  Value Specified by user => " . $argCriterion->{$argValue}{'inputValue'} . "\n" .
                                         "  Valid Values Include    => Any Date or From_Date-To_Date. [20120426 or 20120426-20120420]";
                }
            }
        }
        else {
            ## Check if the argument is a required argument                  ##
            if (uc($argCriterion->{$argValue}{'isRequiredFlag'}) eq 'Y') {
                ## Check if the default value has been defined for the       ##
                ## argument                                                  ##
                if ($argCriterion->{$argValue}{'defaultValue'}) {
                    if (ref $argCriterion->{$argValue}{'defaultValue'} eq 'CODE') {
                        $argCriterion->{$argValue}{'inputValue'} = &{$argCriterion->{$argValue}{'defaultValue'}};
                    }
                    else {
                        $argCriterion->{$argValue}{'inputValue'} = $argCriterion->{$argValue}{'defaultValue'};
                    }
                }
                ## if the default value has not been defined then generate an##
                ## error message.                                            ##
                else {
                    push @errorMessages, "Argument check failed for input argument --" . $argValue . ".\n" .
                                         "  Type of Data            => " . uc($argCriterion->{$argValue}{'dataType'}) . "\n" .
                                         "  Value Specified by user => " . $argCriterion->{$argValue}{'inputValue'} . "\n" .
                                         "  Error Message => No value was passed for the required argument $argValue and it has no default value as well.";
                }
            }
            ## If the argument is an optional argument and has not been      ##
            ## defined then we do not care about it.                         ##
            else {
                return (\@errorMessages);
            }
        }
    }

    return (\@errorMessages);

}

1;