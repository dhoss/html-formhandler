package HTML::FormHandler::Widget::Wrapper::Base;

use Moose::Role;

sub render_label {
    my $self = shift;
    return '<label class="label" for="' . $self->id . '">' . $self->label . ': </label>';
}

sub render_class {
    my ( $self, $result ) = @_;

    $result ||= $self->result;
    my $class = '';
    if ( $self->css_class || $result->has_errors ) {
        my @css_class;
        push( @css_class, split( /[ ,]+/, $self->css_class ) ) if $self->css_class;
        push( @css_class, 'error' ) if $result->has_errors;
        $class .= ' class="';
        $class .= join( ' ' => @css_class );
        $class .= '"';
    }
    return $class;
}

no Moose::Role;
1;
