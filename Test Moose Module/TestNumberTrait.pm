package TestNumberTrait;

use Moose;

has 'integer' => (
    traits          => ['Number'],
    is              => 'ro',
    isa             => 'Num',
    default         => 5,
    handles         => {
                        set   => 'set',
                        add   => 'add',
                        sub   => 'sub',
                        mul   => 'mul',
                        div   => 'div',
                        abs   => 'abs',
                        mod   => 'mod'
                       }
);

1;