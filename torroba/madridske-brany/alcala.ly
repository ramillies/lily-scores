\include "custom.ly"

\header {
	title = "Puerta de Alcalá"
	subtitle = "(„Alcalská brána“)"
	composer = "Federico Moreno Torroba"
	arranger = \markup\tiny "revise a prstoklady: Darek (VII/16)"
	poet = ""
	meter = ""
	tagline = ""
}


global = {
	\time 3/4
	\key c \major
	\globalstyle
	\set Score.voltaSpannerDuration = #(ly:make-moment 6/8)
}

liningI = {
	\global
	
	\partial 4. s4. |
	s2.*3 | \break
	s2.*4 | \break
	s2.*4 | \break

	s2.*4 | \break
	s2.*3 | \break
	s2.*4 | \break
	s2.*3 | \break

}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\sans\large\bold "Largo" 4 = 56
	\partial 4. <g-0>8(\mf <e-2 c'-1> <f-3 d'-1>) |
	\transpose c c'
	{
		\repeat volta 2
		{
			\shape #'((0 . 1.8) (-.2 . 1.8) (-.5 . .5) (-.5 . .5)) Slur
			\priraz{e16-0 f-1} <c,-3 e-0>8 <e,-2 d-4> <a,-2 c-1> \once\override Fingering.extra-offset = #'(0 . .3) <h,\finger"~" d\finger"~"> <g,-0 e-0> <a,-2 f-1> |
			<g-1 d-1 h,-2>4.^"½III" g8-1 <e-1 c'-4> <h-4>16 <a\finger"~"> |

			<e,-2 g-4>4 <g\finger"-" c\finger"-" a,-2>8[ \priraz{\fdown<g-4>32 <f-1> <e-0>\fleft} f8-1] e16-0 d-4 c-1 e-0 |
			\barre "III" { <g,-1 h,-2 d-4>4~ q16 <h,-2 g-1> } <c-1 a-1>^"½V" <d-\tweak extra-offset #'(0 . .2) \finger"~" h\finger"~">-\tweak extra-offset #'(-.8 . 0) ^"½VII" c'4~-4 |
			c' \priraz{c'32-4 h-3 a-2 g-1} a8-3 h-4 \shape #'((0 . 1.2) (0 . 1.2) (-.5 . .5) (-.5 . .5)) Slur \priraz{g16-3 a-4} <e,-2 g-3>4 |

			\shape #'((0 . .7) (-.3 . .7) (-.7 . .7) (-.7 . .7)) Slur \priraz{a16-3 h-4} <c-2 a-3>4 \barre "VII" { <h,-4 e-3 g-2>8 h-1 } \priraz{h32-3 a-1 h-3} <e-1 c'-4>8 <c-2 e-3 a-4> |
			<h,-3 e-4 g-2>4 <a,,-0 e,-2 g,-0 c-1>8 <e,-1 h,-3 e-4 g-2> <a,,-0 e,-2 g,-0 c-1>4 |
			f8-1 a-4 \priraz{a16-4 g-2 f-1} g8-4 e-0 <c\finger"-"> d-4 |

			<h,~-0 h,,-1 e,,-0>4 <h, f,\finger"-" h,,\finger"-">8 <a,-2 d-4> \barre "I" { <f-1> <g-4> }|
			<h,~-0 h,,-1 e,,-0>4 h,16 d-4 h,-0 a,-2 h,-0 d-3 f-1 a-4 |
			\tieDown f-2( e-0 f8~-2) f <d-4> <e-0> <g-1>^"III" |
		}
		\alternative
		{
			{
				f16-1( e-0 f8~-1) f16^"½I" d-3 c'-4 g-3 f-1\glissando d\glissando c( d-2) |
				h,-4(^"II" a,-1 h,8~-4) \tempo\markup\sans\bold "Rit." h, a,-1 <gis,-1 d-4>->^"I" <gis,-1 e-0>-> |
				\key a \major \tempo\markup\sans\bold "A tempo"
				\priraz{cis'16-1 d'-2} <e-1 cis'-1>8^"½IX" <gis-3 h-1> <fis\finger"~" a\finger"~"> <gis,-2 h-4> <a,-1 cis'-4> <h,-2 d'-4> |
				\tieUp

				\barre "VII" { \priraz{h16-1 cis'-3} h8-1 a-4 } \once\override TextSpanner.extra-offset = #'(.3 . -2.5) \barre "IV" { \priraz{a16-2 h-4} a8-2 gis-1 } \priraz{gis32-4 fis-2 e-0} fis8-2 gis-4 |
				<gis,-3 h,-0 e-0>4^"½*IV" \once\override Slur.extra-offset = #'(0 . .5) \priraz{e16-0 fis-2} e8^"½*II"-0 d-3 \priraz{d16-1 e-4} d-1\glissando cis-1 fis-1^"⅓II" a-4 |
				\override Slur.extra-offset = #'(0 . .5) \priraz{e-0 fis-2} e8-0^"½*II" d-3 \priraz{cis16-1 d-1} cis8-1 <a,-1>^"II" <cis-1 e-0>4^\fermata-\tweak extra-offset #'(-1.3 . -1) ^"½*VI" \revert Slur.extra-offset|

				\priraz{cis'16-1 d'-2} <e-1 cis'-1>8^"½IX" <gis-3 h-1> <fis\finger"~" a\finger"~"> <gis,-2 h-4> <a,-1 cis'-4> <h,-2 d'-4> |
				\barre "VII" { \priraz{h16-1 cis'-3} h8-1 a-4 } \barre "IV" { \priraz{a16-2 h-4} a8-2 gis-1 } \priraz{gis32-4 fis-2 e-0} fis8-2 gis-4 |
				<cis,-1 e-0>4 \shape #'((0 . 2.5) (-1.5 . 1.7) (-.6 . .2) (0 . 0)) Slur \priraz{fis16-1 gis-3} <ais,-2 fis-1>8 <gis,-\tweak extra-offset #'(0 . .3) \finger"~" e-0> \tempo\markup\sans\bold "Rit." <ais,\finger"~" fis-1> <h,-0 gis-4> |

				<h,-1 dis-1 ais-4>^"IV" <gis\finger"~"> \tempo\markup\sans\bold "A tempo" <b,-2 es-4 g-3>8^\fermata r4. |
				\priraz{e16-0 fis-2} <h,-0 e-0>8 dis-4 \barre "II" { \priraz{dis16-3 e-4} dis-3 cis-1 fis-1 a-4 } \barre "VII" {  <a,-1 dis-1 cis'-4>8 fis-1 |
				<gis-3 cis'-4> <h-1> } \barre "½V" { <h-4> <f-3 a-1>~ q16 } a,-4 h,-0 c-1 |

				\key c \major
				\override Slur.extra-offset = #'(0 . .5) \priraz{a16-3 h-4} a8-3 gis-3 \priraz{g16-3 a-4} g8-4 fis-4 \barre "½I" { f16-1 c(-1 f\finger"-" a)-4 } \revert Slur.extra-offset|
				\barre "½*V" { <d-3 f-2 h-4>4~ q8^\fermata } r c-2 d-4
			}
			{
				<e-0 c,-3 g,,-2>4 d16-4 c-1 g,-0 c\finger"-" \barre "III" { <b,-1 d-1>8 <g-1> } |
				\once\override Beam.positions = #'(5 . 6) <f,-3 c-1 e-0> <e-3 a-4>^"III" <b,-2 es-4 g-3> <as\finger"~" c'\finger"~"> <a-3> <g-1>^"½III" |
				\priraz{a16-3 h-4} a8-3 <g\finger"~"> \priraz{g16-3 a-4} <g-3>8 <f-1> <c-2 f-4 a-3>4 |
				<e-2 g-1 c'-1>2.^\fermata^"VIII" \bar "|."
			}
		}
		
	}
}

bassesI = {
	\global
	\voiceTwo
	\slurUp
	\shiftOn

	\partial 4. s4. |
	\repeat volta 2
	{
		\grace{s8} s2. |
		d4-0 <e,-0>8 r <a-3> <g-2>16 <f\finger"~"> |

		<h-0>8 c'16-1 g-0 <d-0>4 <f-3 a\finger"-">8 r |
		r d-3 g,-1 r <a-3 f'-2> <g-0 e'-1> |
		<f-3 d'-2>4 <f-1 h-0> \override NoteColumn.force-hshift = #1.5 c'8-1( h16-0 c'-1) \revert NoteColumn.force-hshift |

		f8-1 g16-2 f-1 <e-1>4 <a-3>8 <f-1> |
		<e-1>4 s2 |
		<d-0 a-2>8 f-1 <e-2 c'-1>4 <a,-0 e-\tweak extra-offset #'(0 . -.3) \finger"-" g-0> |

		\override NoteColumn.force-hshift = #1.5 f16-3( e-2 f8-3) \revert NoteColumn.force-hshift s4 <es-1 a-3 c'-1>4 |
		\override NoteColumn.force-hshift = #1.5 f16-3( e-2 f8-3) \revert NoteColumn.force-hshift \fright <e,-0> \fleft r4. |
		<a-3 h-0>4 <gis-1 h-0> <g-3 b-1> |
	}
	\alternative
	{
		{
			<a-2 h-0> <as-1 c'-1>8 r4. |
			<c-2 e-1>4 e,-0\p \once\override Accidental.extra-offset = #'(2 . 0) <ais,-\tweak extra-offset #'(2 . 0) -1 f-2>8 <h,-2 d-0> |
			\key a \major
			\grace{s8} a,2-0 s4 |

			<a-1 d'-1 fis'-1> <fis-1 h-1> <d-0 a-1> |
			cis8-1 gis,-1 <h,-1 fis-4 a-1>4 <a,-0 fis-2> |
			<h,-1 fis-4 a-1> <a,-3 d-4 fis-2>8 <fis,-1 cis-3 e-1> <cis-4 e-2 gis-1>4_\fermata |

			\grace{s8} a,2-0 s4 |
			<a-1 d'-1 fis'-1> <fis-1 h-1> <d-0 a-1> |
			<gis-2>8 <h-0> s2 |
			
			<fis-1>8[ <e-\tweak extra-offset #'(0 . .3) \finger"~"> <es-1>]_\fermata ais,-1 \priraz{<cis-3>16} h,8-1 ais,-1 |
			<gis,-4 e-2>4 <a,-0 e-1> <h,-1>8 r |
			<e-1 d'-1>4 <es~-2 c'~-1 f'-3>4 <es c'>16 s8. |

			\key c \major
			<f-1 c'-2>8 <d-0 d'-2> <e-2 a-3 c'-1> <dis-1> <d-0 a-2>16 r8. |
			<g-1>8[ <d-1> g]_\fermata g-0 e-1 f-3 |
		}
		{
			\override NoteColumn.force-hshift = #1.5 h16-4( a-1 h8-4) \revert NoteColumn.force-hshift <b,-1 e-3>4 <g,-1 f-1> |
			<a,-0>8 <c-1 f-1> <es-1> <as\finger"~" es'\finger"~"> <f-1 h-0> <h-2 d'-1> |
			<f-1 c'-2> <e-\tweak extra-offset #'(0 . .3) \finger"~"> <e-\tweak extra-offset #'(0 . .3) \finger"-"> <d-0> <f-1>4 |
			<c-1 g-3>2._\fermata \bar "|."
		}
	}
}

\paper
{
	page-count = #1
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
		%\displayControlPoints
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
