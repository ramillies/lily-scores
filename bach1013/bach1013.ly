\include "custom.ly"

\header {
	title = "Partita BWV 1013"
	dedication = ""
	composer = ""
	arranger = ""
	subtitle = ""
	poet = ""
	tagline = ""
}

global = {
	\globalstyle
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)
	\time 4/4
	\key c \minor
}

lining = {
	\global
}

\include "part1.ily"

\paper
{
	page-count = #2
}

\score {
	\new Staff \with {
		instrumentName = "Altka"
	} {
		<<
			\new Voice { \clef "treble" \melody }
			\new Voice { \clef "treble" \lining }
		>>
	}

	\layout { }
}

\score {
	\new Staff \with {
		midiInstrument = "recorder"
		midiMinimumVolume = 1
		midiMaximumVolume = 1
	} {
		<<
			\new Voice { \clef "treble" \unfoldRepeats \melody }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 70 4)
		}
	}
}
