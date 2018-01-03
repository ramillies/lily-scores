\include "custom.ly"

\header {
	title = \markup{\override #'(baseline-skip . 1) \center-column{\line{\typewriter\fontsize #8 "Ensom Vandrer."} \large "(„Osamělý poutník“)"}}
	subtitle = "(„Osamělý poutník“)"
	composer = \markup\right-column{"Edvard Grieg" "pro kytaru upravil Darek" }
	arranger = ""
	%poet = \markup\center-column{\line{\concat{"5" \small\raise #1 \underline "a"} "= Fis"} \line{\concat{"6" \small\raise #1 \underline "a"} "= H"}}
	poet = \markup\line{"Ladění: " \raise #.75 \score { \new Staff \new Voice { \magnifyStaff #.65 \omit Staff.TimeSignature \clef "treble_8" \fleft\once\override Accidental.color = #red <e'-1 h-2 g-3 d-4 \tweak color #red fis,-\tweak color #red -5 \tweak color #red h,,-\tweak color #red -6>1 } \layout { indent = 0\cm } } }
	meter = ""
	tagline = ""
}

global = {
	\key h \minor
	\time 6/8

	\globalstyle

	\override Arpeggio.padding = #-1

	\magnifyStaff #.95
}

lining = {
	\global

	\partial 8 s8 |
	s2.*4 | \break
	s2.*6 | \break
	s2.*5 | \break

	\repeat unfold 4 { s2. | \noBreak }

}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\transpose c c'
	{
		\tempo\markup\main-tempo "Allegretto semplice." \tempo 4 = 60

		\partial 8 <h-1 d-2 h,-3 h,-0>8[ |
		\fright <a-1 a,-3>8. \fleft <g g,>16 <fis fis,>8] 4 <h-1 d-2 h,-3 h,-0>8[ |
		\grace{<a-1>16\=1( <h-4>} <a\=1) a,>8. <g g,>16 <fis fis,>8] 4 d16-3( e) |
		<d,-0 h,-0 fis-1>4. <e,-1 ais,-2 cis-1 fis-1>8.^"II" <\parenthesize fis,-1 cis-3 ais-4>16 <e-1 cis'-4>( <fis d'>) |
		<e-1 cis'-4>8^"V"\strum <d,-0 d-1 fis-1 h-1>4^"VII"~ 4 <d-3 fis-2 d'-1>8[ |
		<cis cis'>8. <h, h>16 <a,-3 a-1>8] <a,-3 d-4 a-1>4 <d-3 fis-2 d'-1>8[ |
		\priraz{<cis'-1>16 <d'-2>} <cis-3 cis'-1>8. <h, h>16 <a,-3 a-1>8] <a,-3 d-4 a-1>4 fis16-2( g-3) |
		<fis,-3 d-4 a-2>4. <g, cis-1 a-4>8.( <e-1 cis'-4>16 <g e'> <a fis'>) |
		<g-2 e'-3>8 <a,-1 fis-3 d'-2> r r4 <fis-1 fis'-4>8 |

		\repeat volta 2
		{
			e'8.-4 d'16-1 cis'8-1 d'8.-4 h16-1 d'8-4 |
			<fis-3 ais-4 cis'-2>4.~ 4 <fis-1 fis'-4>8 |
			f'8.-4 e'16-4 d'-1 cis'-1 e'8.-4 d'16-4 h-1 d'-4 |
			<fis-3 ais-4 cis'-2>4.~ 4 dis16-1( eis-3) |
			\repeat volta 2 { <ais,-4 cis-1 fis-3>4.~ 4 dis16-1( eis-3) | }
			\set Timing.beatStructure = 2,1,2,1
			cis8 fis dis16( eis) cis8 fis dis16( eis) |
			\set Timing.beatStructure = 2,2,2
			cis8 fis cis fis  fis8-4\strum h-4 |
			\set Timing.beatStructure = 3,3
			<< { a8.-4 g16-1 fis8-1 4-1 g8 | fis8.-1 \slurDown \times 2/3 { \fleft <e-0>32( <fis-4> e) } d8-3  } \\ { \voiceFour \fleft <c-3 dis-2>4.~ 4 <g,-0 h,-0>8~ | 4. } >> <g,-3 h,-2 d-1>4\strum^\fermata  d16-3( e) |
			<d,-0 h,-0 fis-1>4. <e,-1 ais,-2 cis-1 fis-1>8.^"II" <\parenthesize fis,-1 cis-3 ais-4>16 <e-1 cis'-4>( <fis d'>) |
			
		}
		\alternative
		{
			{ <e-1 cis'-4>8^"V"\strum <d,-0 d-1 fis-1 h-1>4^"VII"~ 4^\fermata  <fis-1 fis'-4>8 | }
			{ <e-1 cis'-4>8^"V"\strum <d,-0 d-1 fis-1 h-1>4^"VII"~ 4.^\fermata \bar "|." }
		}
	}

}

basses = {
	\global
	\voiceTwo

	\partial 8 h8~ |
	\shape #'((0 . 0) (-.25 . -1.4) (.25 . -1.4) (0 . 0)) Tie 4.~ 4 8~ |
	\shape #'((0 . 0) (-.25 . -1.4) (.25 . -1.4) (0 . 0)) Tie 4.~ 4 h,16-1( cis) |
	r4 << { \voiceTwo fis,8-0~ 4. } \\ { \voiceFour s4. g8-0 } >> |
	<h,-1 g-1>8\strum r <fis,-0>8[\laissezVibrer <h,,-0>]\laissezVibrer s4 |
	s2. |
	s2 s8 d16-0( e-1) |
	r4 a,8\laissezVibrer s4. |
	<d-0 g-0>8 r a,-1\laissezVibrer[ d,-1\laissezVibrer] r4 |

	\repeat volta 2
	{
		<g'-3 b'-2>4. <eis'-3 gis'-2> |
		r4 cis8-1 fis,4-0 r8 |
		<g'-3 b'-2>4. <eis'-3 gis'-2> |
		r4 cis8-1 fis,4-0 <fis-1 h-1>8 |
		\repeat volta 2 { r4 cis8 fis,4 <fis h>8 } |
		<fis-3 ais-2>4^"½II" <fis-1 h-1>8^"IV" <fis ais>4 <fis h>8 |
		<fis ais>4 <fis ais h,-4>4 <e,-3 h,-4 fis-1 h-1>4\strum-\tweak extra-offset #'(-1 . -1) ^"½*IV" |
		a,4 r8 r4 d8-0 |
		fis8.-3 e16-3 <d-0>8 <h,,-0 fis,-0>4_\fermata\strum h,16-1( cis) |
		r4 << { \voiceTwo fis,8-0~ 4. } \\ { \voiceFour s4. g8-0 } >> |
	}
	\alternative
	{
		{ <h,-1 g-1>8\strum r fis,8\laissezVibrer[ h,,_\fermata\laissezVibrer] s4 | }
		{ <h,-1 g-1>8\strum r \slurUp fis,8\=1([ h,,\=2(] <fis,\=1) h,,\=2)>4_\fermata \bar "|." }
	}
}

\paper
{
		#(set-paper-size "a5landscape")
		page-count = #1

		bookTitleMarkup = \markup\column {
			\fill-line
			{
				\fromproperty #'header:poet
				\fontsize #5 \fromproperty #'header:title
				\fromproperty #'header:composer
			}
			\fill-line
			{
				\fromproperty #'header:meter
				\fromproperty #'header:arranger
			}
		}

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
		}
	}
}
