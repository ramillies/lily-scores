\include "custom.ly"

\header {
	title = \markup \fontsize #3 \sans \bold "IV — Barcarole"
	composer = \markup\raise #4 "Alexandre Tansman"
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\key e \minor
	\time 6/8

	\globalstyle

	\set fontSize = #1
	\override Fingering.font-size = #-7
	\override Fingering.staff-padding = #'()
}

lining = {
	\global

	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 6 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 3 { s2. | \noBreak } s | \break
}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\repeat volta 2
	{
		\tempo\markup\main-tempo "Andantino grazioso & cantabile."
		<e-3>4. <h-0> |
		<c'-1> <a-2> |
		<e-3> <h-0> |
		<b-2> <a-3> |

		g8.-0 a16-3 h8-0 \once\override Fingering.extra-offset = #'(0 . -2.5) c'8.-1 \once\override Fingering.extra-offset = #'(-1 . -2.3) d'16-4( \once\override Fingering.extra-offset = #'(0 . -2.2) e'8-0) |
		<d'-1 h-3>4( c'8-1) h8.-0 e16-1 fis8-3 |
		<e-2 g-0>4\laissezVibrer r8 r8 <fis-4> <e-2> |
		\fup<fis-4>4 <cis-3>8 <dis-1>4. |

		\repeat percent 2
		{
			<e-2>4. <c-3> |
			<e-2> cis4 <dis-1>8 |
		}
	}

	\coda
	\key h \minor
	<e-2>4 <h'-4>8 <a'-2>8. <g'-3>16 <fis'-2>8 |

	\repeat volta 2
	{
		\barre "II" { <d'-2>4 <fis'-1>8 } <e'-0>8. <d'-4>16 <c'-1>8 |
		\barre "II" { <d'-2>4 <h-4>8 } <b-2>4. |
		<h-0>8. <cis'-1>16 <d'-2>8 \fleft <g'-1 d'-3 h-2>8. <d'-3>16 <h-2>8 |
		\once\override TextSpanner.bound-details.left.stencil-align-dir-y = #UP
		\once\override TextSpanner.extra-offset = #'(-.9 . -1.5) \barre "II" { <cis'-1>8. <a'-4>16 <g'-2>8 } \once\override TextSpanner.extra-offset = #'(-.9 . -.5)\barre "½II" { <fis'-1>8. <d'-2>16 <fis-3>8 } \fup |

		<h-0> <g'-3> <fis'-1> <f'-1>4 <cis'-2>8 |
		\barre "II" { <fis'-1>4 <cis'-1>8 <fis'-1>4 <dis'-3>8 } |
		<eis'-1>8. <dis'-4>16 <eis'-1>8 \fleft <fis'-1 des'-1 b-2>4\strum^"II" \fup <cis''-4>8( |
		<fis'-1>4() <fis''-4>8) <d''-1>4 <h'-1>8( |

		<g'-1>4() <e''-4>8) \fleft \barre "VII" { <fis'-1 cis''-2>4 \fup <a'-3>8( } |
		<fis'-1>4() <d''-4>8) \fleft \barre "VII" { <h'-1 g'-2>4 \fup <gis'-3>8 } |
		\fleft \barre "IV" { <fis'-3 ais'-4>8. <gis'-1>16 <ais'-3>8 } \fup \once\override TextSpanner.extra-offset = #'(0 . -1.2) \barre "VII" { <h'-1>4 <h'-1>8  |
		<fis'-1>4 <d'-1>8 } \fdown \once\override Fingering.extra-offset = #'(-.5 . .5) <g'-4>8. \fup <fis'-1>16 <e'-0>8 |
	}

	<d'-2>4. <fis-3>4 <h-0>8 |
	\fleft <a-1 fis-3>8. <g-0>16 <fis-3>8 <h,-2> <e-3> <dis-1> \key e \minor | 

	\coda-ending
	<e-3>8. <h,-2>16 <g-0>8 <e'-0>8. <h-0>16
	
	\new Voice
	{
	       \override Staff.OttavaBracket.stencil = #ly:line-spanner::print
	       \override Staff.OttavaBracket.left-bound-info = #ly:line-spanner::calc-left-bound-info-and-text
	       \override Staff.OttavaBracket.right-bound-info = #ly:line-spanner::calc-right-bound-info
	       \override Staff.OttavaBracket.bound-details.left.text = \markup \rotate #12 \line{\italic "arm." \concat{ { \override #'(font-name . "Monky Business")\large\sans\bold "8" } \small\raise #1 \underline"a"}}
	       \override Staff.OttavaBracket.bound-details.right.text = \markup { \draw-line #'(0 . -0.5) }
	       \override Staff.OttavaBracket.bound-details.right.padding = #-1
	       \override Staff.OttavaBracket.bound-details.right.Y = 0
	       \override Staff.OttavaBracket.extra-offset = #'(-0.5 . 2.7)
		\flagOn \ottava #1 g'8_\ffXII |
		e''8._\ffXII h'16_\ffXII h''8_\ffVII e'''4._\ffV \bar "|."
	}

}

basses = {
	\global
	\voiceTwo
	\stemDown
	\slurUp

	\repeat volta 2
	{
		<e,-0>8. <h,-2>16 <g-0>8 r <e-3> <g,-4> |
		e,8.-0 c16-3 fis8-4 r f-4 es-1 |
		e,8.-0 h,16-2 e,8 r e-3 g,-4 |
		e,8.-0 c16-1 fis8-3 r dis-1 fis,-2 |

		<d-0 h,-2 e,-0>4. <g-0 e-2 a,-0> |
		<fis-2 d-4>4 r8 <fis-3 d-4 g,-2>4 r8 |
		r8. <c-3>16 <ais,-1>8 <h,-1>4 r8 |
		\fdown <b,-1>4 r8 <a,-0> <g,-3> <fis,-2> |
		\fleft 

		\repeat percent 2
		{
			<e,-0>8.( <g,-3>16) <h,-2>8 <c-3>8.( <a,-0>16) <fis,-2>8 |
			<e,-0>8.( <g,-3>16) <h,-2>8 <cis-4>( <a,-0>) <fis,-2> |
		}
	}

	\key h \minor
	<e,-0>4 r8 <cis'-3 fis-1>4 r8 |

	\repeat volta 2
	{
		<fis-3 h,-1>4. <g-0 c-3>4. |
		<fis-3 h,-1>4. <fis-3>8. <e-1>16 <fis-3>8 |
		<d-0>4. <e,-0>4. |
		<e-1 a,-0>4. <a-1 d-0> |

		<fis-4 h,-1 g,-2> <h-0 cis-3> |
		<b-2 cis-3 fis,-1> <d'-2 a-1 h,-1> |
		<h-0 cis-3> \once\override Staff.Arpeggio.padding = #0 <fis-4 cis-3 fis,-1>\strum |
		r <fis'-2 h-0> |

		<h-0 e-1> <a-1> |
		<h-0 d-0> <d'-1 e-1> |
		<cis'-2 fis-1> <h,-1>4 r8 | 
		r4. <h-0 e-1>4 r8 |
	}

	<h-3>8. <g-0>16 <e-2>8 <fis>4 <d-0>8 |
	<c-2>4. <h,>4 <fis,-2>8_\dc-coda \key e \minor \bar "||"

	<e,-0>2. | s
}

\paper
{
		#(set-paper-size "a5landscape")
		page-count = #1
}

\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = "Kytara"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \melody }
			\new Voice { \clef "treble_8" \basses }
			\new Voice { \clef "treble_8" \lining }
		>>
	}
	\layout { }
}

\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		midiInstrument = "acoustic guitar (steel)"
		instrumentName = "Kytara"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melody }
			\new Voice { \clef "treble_8" \unfoldRepeats \basses }
			\new Voice { \clef "treble_8" \lining }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 60 4)
			\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
		}
	}
}
