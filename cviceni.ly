\include "custom.ly"

global = {
	\key c \major
	\time 2/2
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)
	\globalstyle
}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\set tupletSpannerDuration = #(ly:make-moment 3 4)

	\tempo\markup\main-tempo "Allegro." 4 = 82
	<c e g>4 <e g c'> <f a c'>2 |
	<d g h>4 <h, g d> <g, h, d>2 |
	<g, c e>4 <c e g> <c f a> <f a c'> |
	<d g h>1 |
	<e g c'>4 <g c' e'> <g h d'>2 |
	<a c' f'>4 <c f' a'> <c' e' g'>2 |
	<c f' a'>4 <a c' f'> <g h d'> <d g h> |
	<e g c'>2 <c e g> \bar "|."
}

basses = {
	\global
	\voiceTwo

	c2 f |
	g g, |
	c f |
	g1 |
	c2 g |
	f c |
	f, g, |
	c1 \bar"|."

}


\paper
{
	page-breaking = #ly:one-line-breaking
}

\score {
	\new PianoStaff \with {
		instrumentName = \markup\small\center-column{"PIANO" "PRINCIPAL"}
		shortInstrumentName = "I"
		\consists #Span_stem_engraver
	} {
		\set PianoStaff.connectArpeggios = ##t
		<<
			\new Staff = "RH" { <<
				\new Voice { \clef "treble" \transpose c c' \melody }
			>> }
			\new Staff = "LH" {
				\new Voice { \clef "bass" \basses }
			}
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
	\new PianoStaff \with {
		instrumentName = \markup\small\center-column{"PIANO" "PRINCIPAL"}
		midiMinimumVolume = 1
		midiMaximumVolume = 1
		midiInstrument = "acoustic grand"
	} {
		\set PianoStaff.connectArpeggios = ##t
		<<
			\new Staff = "RH" { <<
				\new Voice { \clef "treble" \transpose c c' \unfoldRepeats \melody }
			>> }
			\new Staff = "LH" {
				\new Voice { \clef "bass" \unfoldRepeats \basses }
			}
		>>
	}
	\midi {
		\context {
			\Score
		}
	}
}
