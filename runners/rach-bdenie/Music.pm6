unit module Music;

use NativeCall;

constant SDL = "SDL2";
constant MIXER = "SDL2_mixer";

my sub SDL_Init(uint32) returns int32 is native(SDL) { * };
my sub SDL_Quit is native(SDL) { * };

my sub Mix_Init(int32) returns int32 is native(MIXER) { * };
my sub Mix_Quit is native(MIXER) { * };
my sub Mix_OpenAudio(int32, uint16, int32, int32) is native(MIXER) { * };
my sub Mix_CloseAudio is native(MIXER) { * };

my class MixMusic is repr('CPointer') { }

my sub Mix_LoadMUS(Str) returns MixMusic is native(MIXER) { * };
my sub Mix_FreeMusic(MixMusic) is native(MIXER) { * };
my sub Mix_PlayMusic(MixMusic, int32) returns int32 is native(MIXER) { * };
my sub Mix_PlayingMusic returns int32 is native(MIXER) { * };
my sub Mix_PausedMusic returns int32 is native(MIXER) { * };

my sub Mix_PauseMusic is native(MIXER) { * };
my sub Mix_ResumeMusic is native(MIXER) { * };
my sub Mix_RewindMusic is native(MIXER) { * };
my sub Mix_HaltMusic returns int32 is native(MIXER) { * };

my sub Mix_SetMusicPosition(num64) returns int32 is native(MIXER) { * };
my sub Mix_VolumeMusic(int32) returns int32 is native(MIXER) { * };

sub init-audio is export
{
	die "Cannot init audio." if Mix_OpenAudio(48000, 16 + 1+<15, 2, 4096);
}

sub quit-audio is export
{
	Mix_CloseAudio();
}

class MusicFile is export
{
	has Str $.path is required;
	has MixMusic $!music;
	has Instant $!play-start;
	has Real $!playtime-when-last-paused = 0;

	method TWEAK
	{
		die "Cannot load path '$!path'." unless $!music = Mix_LoadMUS($!path);
	}

	method play
	{
		die "Cannot play music." if Mix_PlayMusic($!music, 1) == -1;
		$!play-start = now;
		$!playtime-when-last-paused = 0;
	}

	method is-playing { ?Mix_PlayingMusic }
	method is-paused { ?Mix_PausedMusic }
	method time-playing
	{
		return 0 unless $.is-playing;
		$!playtime-when-last-paused + ($.is-paused ?? 0 !! now - $!play-start);
	}

	method pause
	{
		$!playtime-when-last-paused = $.time-playing;
		Mix_PauseMusic;
	}

	method resume
	{
		$!play-start = now;
		Mix_ResumeMusic;
	}

	method stop { Mix_HaltMusic; $.rewind; }

	method rewind
	{
		$!play-start = now;
		$!playtime-when-last-paused = 0;
		Mix_RewindMusic;
	}

	method seek(Real $time)
	{
		$.rewind;
		my $e = Mix_SetMusicPosition($time.Num);
		$!playtime-when-last-paused = $time;
		$e != -1
	}

	method volume { Mix_VolumeMusic(-1)/128 }
	method set-volume(Real $volume where 0 ≤ * ≤ 1) { Mix_VolumeMusic(($volume*128).Int); $.volume }
}
