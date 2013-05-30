package TestBoolTrait;

use Moose;

has 'is_lit' => (
    traits          => ['Bool'],
    is              => 'rw',
    isa             => 'Bool',
    default         => 0,
    handles         => {
                        illuminate  => 'set',
                        darken      => 'unset',
                        flip_switch => 'toggle',
                        is_dark     => 'not',
                       }
);

1;