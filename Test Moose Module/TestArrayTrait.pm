package TestArrayTrait;
use Moose;

has 'options' => (
    traits          => ['Array'],
    is              => 'rw',
    isa             => 'ArrayRef[Str]',
    default         => sub { [] },
    handles         => {
                        all_options    => 'elements',
                        add_option     => 'push',
                        remove_option  => 'pop',
                        map_options    => 'map',
                        filter_options => 'grep',
                        find_option    => 'first',
                        find_option_index => 'first_index',
                        stringify      => 'reduce',
                        natatime       => 'natatime',
                        uniq           => 'uniq',
                        get_option     => 'get',
                        join_options   => 'join',
                        count_options  => 'count',
                        has_options    => 'count',
                        has_no_options => 'is_empty',
                        sort_options   => 'sort',
                        sortinplace_options => 'sort_in_place',
                       },
);

1;