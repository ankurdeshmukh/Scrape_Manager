package TestPerson;

use Moose;

has 'ssn' => (
    is              => 'rw',
    clearer         => 'clear_ssn',
    predicate       => 'has_ssn',
);

has 'size' => (
    is              => 'ro',
    builder         => '_build_size',
    predicate       => 'has_size',
);

## Use builder instead of default if there is a sub-routine for cleaner
## look and feel for the code.
sub _build_size {
    return ( 'small', 'large', 'medium' )[ int(rand 3) ];
};

has 'weight' => (
    isa             => 'Int',
    is              => 'rw',
    predicate       => 'has_weight',
    writer          => 'set_weight',
    reader          => 'get_weight'
);

has 'bigness' => (
    is              => 'ro',
    init_arg        => 'size'
);

1;