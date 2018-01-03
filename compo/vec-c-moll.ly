\include "custom.ly"

\header {
	title = "Něco v c moll"
	subtitle = ""
	composer = "Darek"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\time 12/8
	\key c \minor
	\globalstyle

	\magnifyStaff #.9
}

liningI = {
	\global

	
}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\sans\large\bold "Andantino" 4 = 70

	\transpose c c'
	{
		c,8( g, c g, c es c es g es c g,) |
		f,,( c, f, as, c f as2.) |
		b,,8( es, b, es, b, d b, d f b f d) |
		g,,( b, d g b g d'2.) |

		as,8( es as c' as es) g,( d f b f d) |
		f,( c es as b as) es,( g, es g f es) |
		d,( f, g, f h, g,) c,( c es) <g,, b,,>( f, b,) |

		fis,,( es, a,,) f,,( b,, as,,) g,,( f, b, d f b) |
		ces'\strum( des' ces') b\strum( ces' as)  b(\strum gis fis e dis cis) |
		<h,, fis,>( e h,) <b,, f,>( b, g,,) c\strum( d c) <g,, d, g, b,>4. |
		c,8( g,  c) g,( c es) <c, g, c es g c'>2. \bar "|."
		
	}
}

bassesI = {
	\global
	\voiceTwo
	\slurUp
	\shiftOn

	s1.*8 |
	<fis' a es>4.\strum <d as e'>\strum <fis cis' e'>\strum s |
	s2. <as, g>4.\strum s |
	s1. \bar "|."
}

\paper
{
		#(set-paper-size "a5" 'landscape)
		page-count = #1
		ragged-last = ##t
}

\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = "Kytara"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \melodyI }
			\new Voice { \clef "treble_8" \bassesI }
			\new Voice { \clef "treble_8" \liningI }
		>>
	}
	\layout
	{
	}
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
		midiMinimumVolume = 1
		midiMaximumVolume = 1
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyI }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesI }
		>>
	}
	\midi {
		\context {
			\Score

		}
	}
}
