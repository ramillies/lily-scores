\include "custom.ly"

\header {
	title = "Puerta de San Vicente"
	subtitle = "(„Brána sv. Vincenta“)"
	composer = "Federico Moreno Torroba"
%	arranger = \markup\tiny "revise a prstoklady: Darek (VII/16)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\time 6/8
	\key e \major
	\set Score.voltaSpannerDuration = #(ly:make-moment 6/8)
	\globalstyle
}

liningI = {
	\global
	
	\repeat unfold 4 { s2. | \noBreak } s | \break
	\repeat unfold 3 { s2. | \noBreak } s | \break
	\repeat unfold 3 { s2. | \noBreak } s | \break
	\repeat unfold 3 { s2. | \noBreak } s | \break
	\repeat unfold 4 { s2. | \noBreak } s | \break
	\repeat unfold 2 { s2. | \noBreak } s | \break
	\repeat unfold 3 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\sans\large\bold "Allegro gracioso" 4 = 82
	\transpose c c'
	{
		\repeat volta 2
		{
			<e, gis, h, e>8. gis16 h8~ h a cis' |
			h16 a gis fis gis8~ gis cis e |
			<dis, a, fis>16 gis cis fis gis h a gis fis gis cis gis |

			<e, a, dis fis>4. <gis, cis e> |
			<cis e a>~ q16 r r4 |
		}
		\alternative
		{
			{
				h,,8 fis, h, a,16( gis, fis, gis, e, gis,) |
				\key g \major
				r8_\markup\italic "cediendo" e16 c g, c g fis e fis d e |
				c g, e4_\markup\italic "espressivo" r16 <c e>8 q q16 |
				
				r16_\markup\italic "tranquillo" a, dis fis a fis c' h a g a fis |
				\priraz{g16 fis} g fis g4 r16 <c e>8 q q16 |

				r16 es a,4 r16 <a, es>8 q q16 |
				e,,16 g,( c e) h, g f,( h, d g) c g |
				
				\key e \major
				gis8. fis16( e fis) gis8. fis16( e fis) |
				gis8. dis16( fis e) cis( h, fisis, gis, h, e) |
				
				a8. gis16( h a) \tempo\markup\sans\bold "Accel." fis( gis) e( fis) dis( h,) |
				\tempo\markup\sans\bold "A tempo" cis8. h,16 a, h, c8 d c |

				h,8~ h,16 cis( \tempo\markup\sans\bold "Rit." d f a g a f d f) |
				\tempo\markup\sans\bold "A tempo" <gis, h, e>4.~ q8 <a, cis fis> <gis, h, e> |
				\repeat unfold 3 { <a, cis fis> <gis, h, e> } |

				<a, cis fis>4. <gis, h, e> |
				<d a>8 <cis a> <h, gis> <e gis>8. fis16( e fis) |
				gis8. fis16( e fis) gis( fis e c h, a,) |
				
				\repeat unfold 2 { h,8. cis16( ais, cis) } |
				dis4.~ dis16( ais, dis fis gis, dis) |

				<h,, fis> a, cis fis gis, e g, cis e cis <h,, a, dis>8 |
			}
			{
				h,,8 fis, h, a,16( gis, fis, gis, e, fis,) |
				gis,8 gis, gis, gis,8. cis16( fis e) |
				gis gis, cis e dis cis h4. |

				h16 e dis e fis e <g,, d, g>4. |
				fis <h, dis gis>8-> <a, cis fis>-> <h, dis gis>-> |
				<a, cis fis>2. |

				\repeat unfold 2 { e8. gis16 h8~ h a cis' | }
				h4 \times 2/3 { a16 gis fis } gis4.~ |
				<h, e gis>8 r4 r4. \bar "|."
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
		<e, h,>8. h16 dis'8 <cis' e'>4. |
		<e h> q |
		s s |

		r8 h, h, r h, h, |
		r h, h, h,16 cis h, e cis a, |
	}
	\alternative
	{
		{
			s2. |
			\key g \major
			h,4. e8 c h, |
			a,8. h,16 c d e8 g fis |

			<a, fis>4. r |
			e8. h16 d' c' h8 fis a |

			gis8~ gis16 h, h, h, h,8 \priraz{d16} c8 h, |
			e,4 d8 f4 e8 |

			\key e \major
			h,16 e gis4 b,16 e gis4 |
			h,16 e gis4 r4. |

			r8 <h, e a cis'>4 dis'8 cis' a |
			a,16 e gis8 fis f16( a,) f( a,) f( a,) |

			f16 a, d8 f c' h a |
			<a, d>4.~ q8 <a, e>8 <a, d> |
			\repeat unfold 3 { <a, e> <a, d> } |

			<a, e>4. <a, d> |
			fis16 a, e a, d a, cis gis a4 |
			c16 gis a4 r4. |

			gis,16( dis e4) a,16( dis fis4) |
			fis,16 h, gis fis dis h, <e, cis e>4. |

			s4. h,4 s8 |
		}
		{
			s2. |
			cis16 e c e h, e b,8 e4 |
			h,4. r8 <h, a dis'> q |

			<c g> r4 r16 h ais h cis' h |
			r8 <h, fis a cis'> q <h, e> <h, fis> <h, e> |
			<h, e>2.

			\repeat unfold 2 { <e, h, e gis h>8. h16 dis'8 <cis' e'>4. | }
			<e h>4. q |
			<e, h, e>8 r4 r4. 
		}
	}

}

\paper
{
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
