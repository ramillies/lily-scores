\include "custom.ly"

\header {
	title = \markup \fontsize #3 \sans \bold "II — Sarabande"
	composer = \markup\raise #4 "Alexandre Tansman"
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\key h \major
	\time 3/4

	\globalstyle
	\set Score.voltaSpannerDuration = #(ly:make-moment 9/4)
}

lining = {
	\global

	s2.*8 |\break
	s2.*9 |\break
	s2.*8 |\break
	\repeat unfold 8 { s2. | \noBreak } 
}

melody = {
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\main-tempo "Lento."
	\repeat volta 3
	{
		\times 2/3 { <h-0>8_\markup{\dynamic "p" \italic "tranquillo e legato"} <fis'-1> <fis-3> } fis4\finger "-" fis\finger "-" |
		gis\finger "~" fis2\finger "~" |
		\times 2/3 { h8 fis' <fis-4> } fis4 \barre "½*IV" { <fis-1> |
		<gis-3> } fis2-3 |
		fis'4-4 \barre "IV" { h'8-4 gis'-1 e'4-2 } |
		<gis-1 fis'-4>4 <fis-3 h-4>8 <ais-1> <e-2 gis-1>4 |
	}
	\alternative
	{
		{
			<gis-1 cis'-1>8 cis''-4 gis'4-4 fis'8-1 e'\finger "~" |
			fis'4-2 gis4.-1 ais8-2 |
			h2-0 fis'8-3 gis-1 |
			fis4-4 h8-1 fis\finger "-" fis'4-1 |
			h4.-0 fis'8-1 gis4-1 |
			fis4-4 h8-0 h'-4 fis'4-1^"II" |

			\transpose c c'
			{
				\barre "½*VI" { cis4-1 gis,-1 dis8-3 cis-1 } |
				fis4-1 cis'-4 gis-4 |
				\barre "VI" { <dis-3 fisis-4 ais-1>2.~ |
				q } |
				dis4-4 e-0 ais,-3 |
				\repeat volta 2 { \barre "½*IV" { h,-0 cis-3 fis,-1 } | }
				gis,-1 cis-3 h,8-0 ais,-2 |
				h,2.-0 |
				gis,4-1 cis-2 h,8-0 ais,-2 |
				h,2.-0 |
				gis,-1 |
				\phrasingSlurDown
				\barre "IV" { gis,,8\( dis,-2 dis4-1 <gis-1>8 <dis'-4>\) } |

				\repeat volta 2 { gis2.-1 | gis,8\( dis-2 dis'-4 \ottava #1 \arm-osm \flagOn gis'-3 dis''4-4\) \flagOff \ottava #0 }
				gis,2.-1 |
				\barre "IV" { gis,,8\( dis,-2 dis4-1 <gis-1>8 <dis'-4>\) } |
				\barre "IX" { <fis-3 ais-4 cis'-1>2.~ |
				q } |
			}
		}
		{
			\once\override TextSpanner.extra-offset = #'(0 . -1)
			\barre "½*VI" { <cis'-1>8 <cis''-4> gis'4-4 } fis'8-1 e'\finger "~" |
			fis'4-2 gis4.-1 ais8-2 |
		}
		{
			\barre "IV" { <fis-1 h-1>4 <gis-3 e'-2> } \barre "II" { <ais-2 fis'-1> |
			<fis-3 dis'-4>2. } \bar "|."
		}
	}
}

basses = {
	\global
	\voiceTwo
	\stemDown
	\slurUp

	\repeat volta 3
	{
		s2. | s |
		cis2-3 dis16(-3 cis8.)~-1 |
		cis4 gis,-2 h,8-1 cis-2 |
		<dis-2 cis'-3>4 <gis,-1 dis'-1> <cis-1 h-3> |
		\barre "½*I" { h,8-2 ais,-1 } gis,4-2 cis-4 |
	}
	\alternative
	{
		{
			h,4-2 r ais8-2 gis\finger "~" |
			\barre "I" { fis4.-4 e8-3 dis-1 } cis-3 |
			dis4_\markup\italic "dolce"-3 cis-2 h,\finger "~" |
			ais,-1 gis,-3 fis,-1 |
			dis-3 cis-3 h,-2 |
			ais,-1 \rall gis,-1 fis,-1 \bar "||"


			\a-tempo <e,-0 fis-4>2 r4 |
			q2 r4 |
			dis-1 dis dis~ |
			dis dis dis |
			<< { \voiceTwo\fleft <h-3>8 ais-2 gis4-1 fis-4 } \\ { \voiceFour gis,4-1 r2} >> 
			\repeat volta 2 { << { \voiceTwo\fleft <gis-3>8 fis-1 e4-4 dis-4 } \\ { \voiceFour gis,2.-1 } >> | }
			e2-2 r4 |
			gis,8-1 e-4 dis4-3 cis8-3 h,-1 |
			r8 fis4-4 e8-1 dis-1 cis-3 |
			gis,8-1 e-4 dis4-3 cis8-3 ais,-1 |

			\phrasingSlurUp
			fis8_\markup\italic "dolce, un poco rubato"-4\( e-1 dis4-1 cis8-4 ais,-1 |
			gis,4-1\) r2 |
			\repeat volta 2 { fis'8-4\( e'-2 dis'4-2 cis'8-2 ais8-4 |
			gis4-1\) r2 | }
			\rall
			fis8-4\( e-1 dis4-1 cis8-4 ais,-1 |
			gis,4-1\) r2 |
			fis2.~-1 |
			fis |
		}
		{
			<< { \voiceTwo gis4-1 gis\rest ais8-2 gis\finger "~" } \\ { \voiceFour h,2-2 r4 } >> |
			fis4.-4 e8-3 dis-1 cis-3 |
		}
		{
			gis,4-1 cis-1 fis,-1 |
			h,2.-1 \bar "|."
		}
	}

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
