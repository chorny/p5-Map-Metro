use Map::Metro::Standard::Moops;

# VERSION
# PODNAME: Map::Metro::Graph::Routing
# ABSTRACT: What is a routing?

class Map::Metro::Graph::Routing using Moose {

    has origin_station => (
        is => 'ro',
        isa => Station,
        required => 1,
    );
    has destination_station => (
        is => 'ro',
        isa => Station,
        required => 1,
    );
    has line_stations => (
        is => 'ro',
        isa => ArrayRef[ LineStation ],
        traits => ['Array'],
        default => sub {[]},
        handles => {
            add_line_station => 'push',
            find_line_station => 'first',
            all_line_stations => 'elements',
        }
    );
    has routes => (
        is => 'ro',
        isa => ArrayRef[ Route ],
        traits => ['Array'],
        handles => {
            get_route => 'get',
            add_route => 'push',
            all_routes => 'elements',
            sort_routes => 'sort',
            route_count => 'count',
            find_route => 'first',
        },
    );

    around add_line_station(LineStation $ls) {
        my $exists = $self->find_line_station(sub { $ls->line_station_id == $_->line_station_id });
        return if $exists;
        $self->$next($ls);
    }

    method ordered_routes {
        $self->sort_routes(sub { $_[0]->weight <=> $_[1]->weight });
    }
}


__END__

=pod

=head1 DESCRIPTION

A routing is the collection of L<Routes|Map::Metro::Graph::Route> possible between two L<Stations|Map::Metro::Graph::Station>.

=head1 METHODS

=head2 origin_station()

Returns the L<Station|Map::Metro::Graph::Station> object representing the starting station of the route.

=head2 destination_station()

Returns the L<Station|Map::Metro::Graph::Station> object representing the final station of the route.

=head2 line_stations()

Returns an array of all L<LineStation|Map::Metro::Graph::LineStations> possible in the routing.

=head2 routes()

Returns an array of all L<Route|Map::Metro::Graph::Routes> in the routing.

=cut
