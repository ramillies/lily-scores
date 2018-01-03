\include "custom.ly"

\header {
	title = "Puerta de Toledo"
	subtitle = "(„Toledská brána“)"
	composer = "Federico Moreno Torroba"
	%arranger = \markup\tiny "revise a prstoklady: Darek (VII/16)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\time 3/4
	\key e \major
	\set Score.voltaSpannerDuration = #(ly:make-moment 6/8)
	\globalstyle
}

liningI = {
	\global
	
}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\sans\large\bold "Allegretto" 4 = 96
	\transpose c c'
	{
		\repeat volta 2
		{
			gis8 gis16 gis a8 gis h <a, cis fis> |
			gis gis16 gis a gis cis' h a gis fis gis |
			e8 e16 dis cis h, e gis h4 |

			a8 \times 2/3 { gis16 fis e } fis8 \times 2/3 { e16 dis cis } dis8 h, |
			\key c \major
			<d gis>8 gis16 gis <d a>8 gis <c f h> a |
			<d gis> gis16 gis a gis a h <a d'> cis' h a |

			h8. c'16 a8. h16 g8 a32( g f e) |
			f8. e16 f8. e16 f8 g32( f e d) |
			<a, e>8 e16 e f8 e a h, |

			<h, e> e16 e f e c f a e a c' |
			<d, c h>2. |
			s |

			r8 <fis, a dis>[ r <g, c e> r <fis, c e>] |
			\key e \major
			r \tempo\markup\sans\bold "Rit." <h, dis>16 <a, cis> <h, dis>8 <a, cis> <h, dis>4 |
		}
		\alternative
		{
			{
				\tempo\markup\sans\bold "A tempo" r8 <cis e a>16 h <h, dis gis>8 <cis e a> <a, cis fis> <fis, a, dis> |

				<e, gis, h, e>8 r r4 \times 4/6 { a16 f c f c a, } |
				<e, gis, h, e>8 r r4 \times 4/6 { f16 a, es, f a, es, } |
				<gis, e>8 e16 e ces ces e e ces ces e e |

				<e, c g>8 r r2 |
				r8 <as, c f>8 <as, c g> es f c |
				r <cis fis>16 a, \repeat unfold 2 { <dis gis>8 <a, fis> } |

				<a e>8 h16 e <cis a>8 <e cis'> <gis, e> <h, gis> |
				r cis16 cis cis8 dis h, dis |
				cis dis h, dis cis a |

				cis' dis,16[ e,] fis, e, dis, e, fis, gis, a, h, |
				cis h, a, gis, fis, gis, a, h, cis dis e fis |
			}
			{
				\tempo\markup\sans\bold "A tempo"
				r8 fis16 cis a,( cis fis a gis fis e fis) |
				r8 fis16 c a, c fis a gis fis gis a |
				\key c \major
				d' c' h a c' h a g fis e d c |

				h,8. c16 cis8. d16 dis4 |
				r8 <c e>16 <h, d> <c e>8 <e g> <f a> <e g> |
				c <f a>16 <e g> <f a>8 <d f> <f a> <f d'> |
				<a f'> <a,, f,> c, f, a, c |
				\key e \major
				f r4. <fis, a, dis>8 r |
				<e, gis, h, e> gis16 gis gis8 gis \priraz{h16} a8 fis |
				gis r <gis, h, e> r4. \bar "|."
			}
		}
	}
}

bassesI = {
	\global
	\voiceTwo
	\slurUp
	\shiftOn

	\repeat volta 2
	{
		<e, h,>8 his, cis e dis h, |
		<e, h,> his, cis16 r4.. |
		<cis' a,>4 <gis, e> r8 <cis gis e'> |

		<fis cis'>4 <a, e a> <h, fis a> |
		\key c \major
		<e, e>8 h, fis e e r |
		e, h, e16 r8. <h fis'>8 r |
		
		r <d' g'>[ r <f a dis'>] <e h> r |
		r <f, c f>[ r <cis ais>] <d ais> r |
		c g a g f4 |

		<c g> a s |
		r8 fis'16 fis' e'8 fis' e' fis' |
		<e b d' b'>8 fis'16 fis' e'8 fis' e' fis' |

		h,8. c16 h,8. c16 a,8. c16 |
		\key e \major
		h,2~ h,8 h, |
	}
	\alternative
	{
		{
			fis4 h,8 fis e h, |
			
			<e, h,> d16 d d8 d d4 |
			<e, h, e>8 h,16 h, h,8 h, h,4 |
			<e, h,>8 <b d'>8 <f a> <b d'> <f a> <b d'> |

			r8 b,16 b, c8 a, b, g, |
			b,2. |
			h, |

			<fis cis' e'>4 s s |
			<h, e a fis'>2. |
			q |
			s |
			s |
		}
		{
			<h, e>8 s s2 |
			<h, e>8 s s2 |
			\key c \major
			s2. |
			
			r8 <h, e a>[ r <h, f a> r <h, fis a>] |
			<c g>4 r2 |
			s2. |

			s |
			\key e \major
			s2 h,8 r |
			<e, h, e>8 h h h c' a |
			h r <e, h, e> r4. \bar "|."
		}
	}
}

\paper
{
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
		\context
		{
			\Staff \RemoveEmptyStaves
			\override VerticalAxisGroup.remove-first = ##t
		}
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
