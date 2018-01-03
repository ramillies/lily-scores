#!env perl6

use v6;

use NativeCall;

use SDL2::Raw;
use JSON::Tiny;

use lib ".";

use Music;
use Cairo;

constant SDL = "SDL2";
constant IMG = "SDL2_image";

sub SDL_GetDesktopDisplayMode(int32, SDL_DisplayMode is rw) returns int32 is native(SDL) { * };
sub SDL_FreeSurface(SDL_Surface) is native(SDL) { * };
sub SDL_QueryTexture(SDL_Texture, uint32 is rw, int32 is rw, int32 is rw, int32 is rw) returns int32 is native(SDL) { * };

sub IMG_Init(int32) returns int32 is native(IMG) { * };
sub IMG_Load(Str) returns SDL_Surface is native(IMG) { * };

sub load-image(SDL_Renderer $rend, SDL_DisplayMode $display, Str $path)
{
	my $im = Cairo::Image.open($path);
	my ($w, $h) = $im.width, $im.height;
	my $q = $w/$display.w max $h/$display.h;

	my $processed = Cairo::Image.record(
		{
			.scale(1/$q, 1/$q);
			.set_source_surface($im, 0, 0);
			.paint;

			.rgb(1,1,1);
			.operator = Cairo::Operator::OPERATOR_DIFFERENCE;
			.paint;
		},
	($w/$q).Int, ($h/$q).Int, Cairo::FORMAT_ARGB32);

	my $tex = SDL_CreateTexture($rend, %PIXELFORMAT<ARGB8888>, STATIC, ($w/$q).Int, ($h/$q).Int);
	SDL_UpdateTexture($tex, SDL_Rect.new(:x(0), :y(0), :w(($w/$q).Int), :h(($h/$q).Int)), $processed.data, $processed.stride // 4*($h/$q).Int);
	$tex, $w, $h, $q;
}

sub texture-size(SDL_Texture $tex)
{
	SDL_QueryTexture($tex, my uint32 $, my int32 $, my int32 $w, my int32 $h);
	$w, $h;
}

sub MAIN(Str $music-file where *.IO.f, Str $in where *.IO.f, Bool :$debug-lines = False)
{
	die "Cannot init SDL2." if SDL_Init(VIDEO +| AUDIO) < 0;
	init-audio;

	my SDL_DisplayMode $display .= new;
	die "Cannot query resolution." if SDL_GetDesktopDisplayMode(1, $display) < 0;

	my $win = SDL_CreateWindow("Adding points to '$in'", SDL_WINDOWPOS_CENTERED_MASK, SDL_WINDOWPOS_CENTERED_MASK, $display.w, $display.h, OPENGL);
	my $rend = SDL_CreateRenderer($win, -1, ACCELERATED +| PRESENTVSYNC);

	my $data = $in.IO.slurp.&from-json;

	my ($tex, $w, $h, $q) = load-image($rend, $display, $data<images>[0]<name>);

	my ($image,$next-line) = 0, 1;

	my $music = MusicFile.new(path => $music-file);
	$music.play;
	$music.pause;

	main: loop
	{
		my $event = SDL_Event.new;
		while SDL_PollEvent($event)
		{
			given SDL_CastEvent($event)
			{
				when *.type == KEYDOWN
				{
					if .scancode == 44
					{
						if $music.is-paused { $music.resume } else { $music.pause }
					}
				}
				when *.type == QUIT { last main }
			}
		}

		SDL_SetRenderDrawColor($rend, 0, 0, 0, 255);
		SDL_RenderClear($rend);

		SDL_RenderCopy($rend, $tex, SDL_Rect, SDL_Rect.new(w => ($w/$q).Int, h => ($h/$q).Int, x => 0, y => 0));

		if $data<images>[0]<lines>[0]<time> ≤ $music.time-playing ≤ $data<images>[*-1]<lines>[*-1]<time>
		{
			if $music.time-playing ≥ $data<images>[$image]<lines>[$next-line]<time>
			{
				$next-line++;
				if $next-line == +$data<images>[$image]<lines> && ($image+1) < $data<images>
				{
					$image++;
					SDL_DestroyTexture($tex);
					($tex,$w,$h,$q) = load-image($rend, $display, $data<images>[$image]<name>);
					$next-line = 1;
				}
			}

			my $x = $data<images>[$image]<lines>[$next-line-1]<x> + ($data<images>[$image]<lines>[$next-line]<x> - $data<images>[$image]<lines>[$next-line-1]<x>) * ($music.time-playing - $data<images>[$image]<lines>[$next-line-1]<time>) / ($data<images>[$image]<lines>[$next-line]<time> - $data<images>[$image]<lines>[$next-line-1]<time>);
			SDL_SetRenderDrawColor($rend, 255, 0, 0, 255);
			SDL_RenderFillRect($rend, SDL_Rect.new(x => ($x/$q).Int-2, y => 0, w => 4, h => $h));
		}

		if $debug-lines
		{
			SDL_SetRenderDrawColor($rend, 0, 0, 255, 80);
			SDL_RenderDrawLine($rend, (.<x>/$q).Int, 0, (.<x>/$q).Int, $h) for $data<images>[$image]<lines>;
		}

		SDL_RenderPresent($rend);

		last unless $music;
	}

	quit-audio;
	SDL_Quit();
}
