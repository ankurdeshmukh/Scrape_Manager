package TestCounterTrait;

use Moose;

has 'counter' => (
    traits          => ['Counter'],
    is              => 'ro',
    isa             => 'Num',
    default         => 0,
    handles         => {
                        inc_counter   => 'inc',
                        dec_counter   => 'dec',
                        reset_counter => 'reset',
                        set_counter   => 'set',
                       }
);

1;