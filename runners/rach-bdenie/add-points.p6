#!env perl6

use v6;

use NativeCall;

use SDL2::Raw;
use JSON::Tiny;

use lib ".";

use Music;

constant SDL = "SDL2";
constant IMG = "SDL2_image";

sub SDL_GetDesktopDisplayMode(int32, SDL_DisplayMode is rw) returns int32 is native(SDL) { * };
sub SDL_FreeSurface(SDL_Surface) is native(SDL) { * };
sub SDL_QueryTexture(SDL_Texture, uint32 is rw, int32 is rw, int32 is rw, int32 is rw) returns int32 is native(SDL) { * };

sub IMG_Init(int32) returns int32 is native(IMG) { * };
sub IMG_Load(Str) returns SDL_Surface is native(IMG) { * };

sub load-image(SDL_Renderer $rend, Str $path)
{
	my $surf = IMG_Load($path);
	die "Cannot load image '$path'." unless $surf;
	my $tex = SDL_CreateTextureFromSurface($rend, $surf);
	die "Cannot convert surface into texture: '{SDL_GetError()}'." unless $tex;
	SDL_FreeSurface($surf);
	$tex;
}

sub texture-size(SDL_Texture $tex)
{
	SDL_QueryTexture($tex, my uint32 $, my int32 $, my int32 $w, my int32 $h);
	$w, $h;
}

sub MAIN(Str $in where *.IO.f, Str $out = $in)
{
	die "Cannot init SDL2." if SDL_Init(VIDEO +| AUDIO) < 0;

	my SDL_DisplayMode $display .= new;
	die "Cannot query resolution." if SDL_GetDesktopDisplayMode(0, $display) < 0;

	my $win = SDL_CreateWindow("Adding points to '$in'", SDL_WINDOWPOS_CENTERED_MASK, SDL_WINDOWPOS_CENTERED_MASK, $display.w, $display.h, OPENGL +| FULLSCREEN);
	my $rend = SDL_CreateRenderer($win, -1, ACCELERATED +| PRESENTVSYNC);

	my $data = $in.IO.slurp.&from-json;

	my $tex = load-image($rend, $data<images>[0]<name>);
	my ($w,$h) = texture-size($tex);
	my $q = $w/$display.w max $h/$display.h;

	my $image = 0;

	main: loop
	{
		my $event = SDL_Event.new;
		while SDL_PollEvent($event)
		{
			given SDL_CastEvent($event)
			{
				when *.type == MOUSEBUTTONDOWN
				{
					if .button == 1
					{
						$data<images>[$image]<lines>.push(%( x => .x*$q )) .= sort(*<x>) if .x*$q ≤ $w;
					}
					if .button == 3 && $data<images>[$image]<lines> > 0
					{
						my $click = .x * $q;
						$data<images>[$image]<lines>.splice: (^($data<images>[$image]<lines>)).sort({abs($click - $data<images>[$image]<lines>[$_]<x>)})[0], 1;
					}
				}
				when *.type == MOUSEWHEEL
				{
					$image = (($image - .y) min $data<images>-1) max 0;
					SDL_DestroyTexture($tex);
					$tex = load-image($rend, $data<images>[$image]<name>);
					($w,$h) = texture-size($tex);
					$q = $w/$display.w max $h/$display.h;
				}
				when *.type == QUIT { last main }
			}
		}

		SDL_SetRenderDrawColor($rend, 0, 0, 0, 255);
		SDL_RenderClear($rend);


		SDL_RenderCopy($rend, $tex, SDL_Rect, SDL_Rect.new(w => ($w/$q).Int, h => ($h/$q).Int, x => 0, y => 0));
		SDL_SetRenderDrawColor($rend, 255, 0, 0, 255);
		SDL_RenderFillRect($rend, SDL_Rect.new(x => (.<x>/$q).Int-2, y => 0, w => 4, h => $h)) for @($data<images>[$image]<lines>);

		SDL_RenderPresent($rend);
	}

	try { $out.IO.spurt: $data.&to-json }
	CATCH { warn "Result output failed; outputting to stdout: $_"; $data.&to-json.say; }

	SDL_Quit();
}
