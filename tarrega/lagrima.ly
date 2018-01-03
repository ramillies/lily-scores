\include "custom.ly"

\header {
	title = \markup\typewriter\fontsize #9 "Lágrima"
	composer = "Francisco Tarrega"
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\key e \major
	\time 6/8

	\set Timing.beatStructure = 2,2,2

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

	\transpose c c'
	{
		\tempo\markup\main-tempo "Andante."
		\repeat volta 2
		{
			\repeat percent 2 { gis4-4\glissando a-4\glissando h-4 |
			fis2-4 r4 | }
			e'4-4 dis'-4 cis'-4 |
			s4 cis-2 s |
			gis-4 \barre "II" { cis8-1 fis-1 h,, <a,-1 dis-3> } |
			<gis,-3 h,-1 e-0>2 r4
		}

		\key e \minor
		\repeat volta 2
		{
			g8-1 c'(-4 h)-3 e-0 \barre "II" { <a,-1 dis-4 fis-1> g-2 } |
			e2.-0 |
			<g,-0 h,-0>8 e'-4 a, c'-4 fis, a-4 |
			<dis-3 fis-1>2 s4 |
			g4-4\glissando a-4\glissando h-4 |
			d'8([-4 c'-3 h])-2 a([-4 g-3 fis-2)] |
			e4-0 fis-3 h,8-0 a,-3 |
			e2-0 r4
		}

	}

}

middle = {
	\global
	\voiceTwo
	
	\override Stem.details.beamed-minimum-free-lengths = #'(0)
	\override Stem.details.beamed-extreme-minimum-free-lengths = #'(0)

	\repeat volta 2
	{
		\override Stem.details.beamed-lengths = #'(2)
		\repeat percent 2 { gis'8 <h-0> a' <h-0> h' <h-0> |
		fis' h-0 \revert Stem.details.beamed-lengths a-3 h-0 h,-2 h | }
		\barre "IX" { e''8 <e'-1> dis'' <e'-1> } \barre "VII" { cis'' <fis'-1> } |
		\slurUp
		\fup <h'-4>( <gis'-1>) cis' <e'-1>( <fis'-3>) <a'-1> |
		gis' <e'-0> s2 \fleft |
		s2. |
	}

	\key e \minor

	\repeat volta 2
	{
		s2. |
		e'8( <a-3 c'-1> <g-2 h-1> <fis-3 a-1> <e-2 g-0> <fis-3 a-1>) |
		s2. |
		\barre "II" { dis'8 <h-2>( <c'-4>) <h-2> <h-2> <fis'-1> | }
		\override Stem.details.beamed-lengths = #'(2)
		g' <h-0> a' <h-0> h' <h-0> |
		\revert Stem.details.beamed-lengths 
		s2. |
		e'8 <g-0 h-0> fis' <a-2 c'-1> s4 |
		<e-2 g-0>2 f4\rest |
	}
}

basses = {
	\global
	\voiceFour

	\repeat volta 2
	{
		\override Glissando.extra-offset = #'(0 . -1)
		\repeat percent 2 { e4-1\glissando fis-2\glissando gis-2 |
		dis2.-1 | }
		\revert Glissando.extra-offset 
		cis'4-3 h-1 a-1 |
		h-0 s2 |
		h4-0 ais-2 h,-1 |
		e4-2 e,-0 r_\fine |
	}

	\key e \minor

	\repeat volta 2
	{
		<e,-0 h-0>2 h,4-1 |
		e,2.-0 |
		e,4-0 a-3\glissando fis-3 |
		h,2-1 s4 |
		\override Glissando.extra-offset = #'(0 . -1)
		e4-2\glissando fis-2\glissando g-1 |
		\revert Glissando.extra-offset
		a,2.-0 |
		s2 h,8-2 dis-1 |
		s4 e,2-0_\dc-fine |
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
			\new Voice { \clef "treble_8" \middle }
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
			\new Voice { \clef "treble_8" \unfoldRepeats \middle }
			\new Voice { \clef "treble_8" \unfoldRepeats \basses }
			\new Voice { \clef "treble_8" \lining }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 70 4)
			\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
		}
	}
}
