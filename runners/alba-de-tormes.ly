\include "custom.ly"

\header {
	title = "Alba de Tormes"
	subtitle = "(„Píseň trubadůra“)"
	composer = \markup\line{"Federico Moreno Torroba"}  
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\key d \major
	\time 2/4
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)
	\globalstyle
}

lining = {
	\global

}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\set tupletSpannerDuration = #(ly:make-moment 3 4)

	\tempo\markup\main-tempo "Moderato"
	\repeat volta 3
	{
		r8 a( <fis' cis'>4) |
		r8 a( <fis' dis'>4) |
		r8 a( <fis' h>4) |
		r8 << { g' h'^\fermata cis' } \\ { <e' h>4 g8 } >> |
		
		r8 a <fis' cis'>4 |
	}
	\alternative
	{
		{
			r8 f( <d' as>4) |
			r8 << { cis'8( e'4) } \\ { <gis e>4. } >> |
			r8 <dis' fis>8( <fis' b>4) |
			r8 <d' as>8( <f' cis'>4) |

			r8 <e' h g>[ <g' d' h> <fis' cis' a> |
			<a' fis' cis'> <g' d' h> <fis' cis' a> <g' d' h>] |
			<e' h g>4 <fis' cis' a>^\markup\italic "(rit.)" |
		}
		{
			\key es \major
			r8 << { d'( g'4) } \\ { b4. } >> |
			r8 <d' b>8( g'4) |

			R2*2|
			r8 <g' es'>8( b'4) |
			r8 <g' es'>8( b'4) |
			d8[ es g b] |

			\priraz{b16 c'} b8[ a g f] |
			r8 <f' c' as>8( <as' f' c'>4) |
			r8 <es' h fis>8( <as' es' h>4) |
			r8 <d' as f>[ <c' g es> <d' as f>] |
			<es' b g>[ <f' c' as> <g' d' b> <as' f' c'>] |

			r8 << { fis'( g'4) } \\ { b4. } >> |
			\key d \major
			r8 << { a'( b'4) } \\ { d'4. } >> |
			r8 e'[ fis' e'] |
			h'^\fermata[ a' g' fis'] |
			e'4-> fis'-> |
		}
		{
			r8 f( <d' as>4) |
			r8 g( <e' h>4) |
			r8 <f' c' as>-.[( <g' c' as>-. <f' c' as>-.)] |
		}
	}

	r <e' d' gis> r <fis' cis' a> |
	\repeat unfold 2 { r a( <fis' cis'>4) | }
	r8 <cis' a>[ <fis' cis' a> <a' fis' cis'>] |
	<cis'' a' fis'>2^\fermata \bar "|."

}

basses = {
	\global
	\voiceTwo

	\repeat volta 3
	{
		d4. a,8 |
		h,4. fis,8 |
		e,4. d8 |
		a,2( |
		d4.) a,8 |
	}
	\alternative
	{
		{
			b,4. f,8 |
			fis,4. fis,8 |
			h,4. h,8 |
			b,4. b,8 |

			a,2~ |
			a,~ |
			a,8 a,4 a,8 |
		}
		{
			\key es \major
			c4. g,8 |
			c4. d8 |

			f[ e d c] |
			h,[ c \priraz e16 d8 c] |
			f4. c8 |
			f4. c8 |
			s2 |

			s |
			b,4. es8 |
			b,4. es8 |
			b,4 r |
			R2 |

			es4. es8 |
			\key d \major
			e4. e8 |
			<h g d a,>2~ |
			q4_\fermata r |

			q4 <cis' g a,> |
		}
		{
			b,4. b,8 |
			a,4. a,8 |
			d2 |
			b,4 a, |
			d4. a,8 |
			d4. a,8 |
			d2 |
			d_\fermata_\markup\lower #6 \tiny "6. X. 2015 D."
		}
	}
}


\paper
{
	page-breaking = #ly:one-line-breaking
}

\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = "Kytara"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melody }
			\new Voice { \clef "treble_8" \unfoldRepeats \basses }
		>>
	}
	\layout {  }
}
