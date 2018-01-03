\version "2.18.0"
\language "deutsch"

\header {
  title = "Irské požehnání"
  tagline = ""
}

tinystems = #(define-music-function (parser location how) (list?) #{ \override Stem.details.beamed-lengths = #how #} )
normstems = \revert Stem.details



global = {
  \key b \major
  \time 4/4
  \magnifyStaff 0.9
}

soprano = {
  \global
  % Music follows here.
  d'8 f' b'4 es''4. d''8 | c''4 f'2 f'8 f' | g'4~ g'8 g' f' f' f' es' |
  f'2. f'8 f' | g'4~ g'8 g' f'4~ f'8 g' | a'4 g'8( a') b'4~ b'8 b' | b'4. b'8 b' b' a' b' |
  c''2. f'8 f' | \repeat volta 2 { g' g' f' es' f'4. f'8 | d'' d'' c'' d'' b'4. b'8 | es''2 
  es''8 d'' c'' b' | f'2. es'8 f' |
  }
  \alternative
  {
  	{ f'2. f'8 f' }
	{ f'1 }
  }
  \bar "|."
}

alto = {
  \global
  % Music follows here.
  d'8 c' d'4 es'4. es'8 | es'4 f'( es') c'8 d' | f'4( es'8) es' es' d' c' es' |
  c'4( d'2) c'8 d' | f'4( es'8) es' c'4( d'8) d' | d'4. d'8 g'4~ g'8 f' | es'( a') g'( f') es' es' f' g' |
  es'4( g' f') f'8 f' | \repeat volta 2 { f'8 es' c' c' c'4( d'8) d' | a' a' a' a' a'4( g'8) f' | es'( a' b' c'')
  f' f' g' g' | es'2. es'8 c' |
  }
  \alternative
  {
  	{ c'4( d'2) f'8 f' }
	{ c'4( d'2.) }
  }
  \bar "|."
}

tenor = {
  \global
  % Music follows here.
  f8 d a4 g4. g8 | a4 a( g) g8 a | b4~ b8 b g a b a |
  f2. b8 b | b4. b8 a4( b8) b | c'4. c'8 d'4. d'8 | g8( c') b( a) g c' b c' |
  b2( g4) f8 f | \repeat volta 2 { b8 b a a a4( b8) b | c' d' es' d' d'4. d'8 |
  b( c' b a) a b b c' | b4( g a) a8 a |
  }
  \alternative
  {
  	{ f2. f8 f }
	{ f1 }
  }
  \bar "|."
}

bass = {
  \global
  % Music follows here.
  b,8 b, b,4~ b,4. b,8 | b,4 b,2 b,8 b, | es4~ es8 es f f f f |
  b,2. d8 d | es4. es8 d4~ d8 d | fis4 e8( fis) g4. g8 | c4. c8 c c d e |
  f2. f8 f | \repeat volta 2 { es8 es es es d4. d8 | fis fis fis fis g4. g8 |
  c2 d8 d es es | f2. f8 f8 |
  }
  \alternative
  {
  	{ b,2. f8 f }
	{ b,1 }
  }
  \bar "|."
}

\paper
{
		#(define fonts
			(set-global-fonts
				#:music "ross"
				#:brace "ross"
				#:roman "EB Garamond"
				#:sans "Linux Libertine O"
				#:typewriter "monospace"
				#:factor (/ staff-height pt 20)
			)
		)
		#(set-paper-size "a5" 'landscape)

		system-system-spacing #'basic-distance = #20
		indent = #12
		left-margin = #5
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

		page-count = #1
}

\score {
	\new ChoirStaff <<
		\new Staff \with {
			midiInstrument = "violin"
		} <<
			\new Voice = "soprano" { \voiceOne \soprano }
			\new Voice = "alto" { \voiceTwo \alto }
		>>
		\new Lyrics = "text"
		\new Staff \with {
			midiInstrument = "cello"
		} <<
			\clef bass
			\new Voice = "tenor" { \voiceOne \tenor }
			\new Voice = "bass" { \voiceTwo \bass }
		>>

		\context Lyrics = "text" \with {
			\override VerticalAxisGroup #'staff-affinity = #CENTER
		} \lyricsto "tenor" 
		{
			May the road rise to meet you, may the wind be al -- ways at your back; __ may the sun shine warm up -- on your face,
			the rain fall soft up -- on your fields; __ and un -- \repeat volta 2 { til we meet a -- gain, __ un -- til we meet a --
			gain __ may God __ hold you in the palm __ of His }
			\alternative { { hand, __ and un -- } {hand. } }
		}
	>>
	\layout { }
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 60 4)
		}
	}
}

\score {
	\new ChoirStaff <<
		\new Staff \with {
			midiInstrument = "violin"
		} <<
			\new Voice = "soprano" { \unfoldRepeats \soprano }
			\new Voice = "alto" { \unfoldRepeats \alto }
		>>
		\new Staff \with {
			midiInstrument = "cello"
		} <<
			\clef bass
			\new Voice = "tenor" { \unfoldRepeats \tenor }
			\new Voice = "bass" { \unfoldRepeats \bass }
		>>
	>>
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 60 4)
		}
	}
}
