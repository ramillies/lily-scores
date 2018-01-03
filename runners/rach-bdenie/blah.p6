#!env perl6

use v6;

use Cairo;

my $im = Cairo::Image.open("sys-1.png");
my ($w, $h) = $im.width, $im.height;

given Cairo::Image.create(Cairo::FORMAT_ARGB32, $w, $h)
{
	given Cairo::Context.new($_)
	{

		.set_source_surface($im, 0, 0);
		.paint;

		.rgb(1,1,1);
		.operator = Cairo::Operator::OPERATOR_DIFFERENCE;
		.paint;
	};
	.write_png("image.png");
}
