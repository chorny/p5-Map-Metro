requires 'perl', '5.016000';

requires 'Data::Dump::Streamer';
requires 'Eponymous::Hash';
requires 'File::ShareDir';
requires 'Graph';
requires 'IO::Interactive';
requires 'Kavorka';
requires 'Kavorka::TraitFor::Parameter::doc';
requires 'List::AllUtils';
requires 'List::Compare';
requires 'Module::Pluggable';
requires 'Moose';
requires 'MooseX::App';
requires 'MooseX::AttributeShortcuts';
requires 'MooseX::AttributeDocumented';
requires 'MooseX::SetOnce',
requires 'Moops';
requires 'namespace::clean';
requires 'Path::Tiny';
requires 'String::Trim';
requires 'Sub::Exporter';
requires 'Syntax::Collector';
requires 'Term::Size::Any';
requires 'Text::Undiacritic';
requires 'Throwable::X';
requires 'true';
requires 'Type::Tiny::Enum';
requires 'Types::Path::Tiny';
requires 'Types::Standard';
requires 'XML::Writer';

recommends 'GraphViz2';

on 'test' => sub {
    requires 'Syntax::Collector';
};
