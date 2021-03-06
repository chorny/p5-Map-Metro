use Map::Metro::Standard::Moops;

# VERSION
# PODNAME: Map::Metro::Cmd::AllRoutes

class Map::Metro::Cmd::AllRoutes extends Map::Metro::Cmd using Moose {

    use MooseX::App::Command;

    parameter cityname => (
        is => 'rw',
        isa => Str,
        documentation => 'The name of the city',
        required => 1,
    );

    command_short_description 'Display routes for *all* pairs of stations (slow)';

    method run {
        my %hooks = (hooks => ['PrettyPrinter']);
        my $graph = $self->cityname !~ m{\.} ? Map::Metro->new($self->cityname, %hooks)->parse : Map::Metro::Shim->new($self->cityname, %hooks)->parse;
        my $all = $graph->all_pairs;

    }
}

1;
