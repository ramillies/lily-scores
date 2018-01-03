\include "custom.ly"

\header {
	title = "Čingischán"
	subtitle = ""
	instrument = ""
	composer = "Lidová píseň"
	arranger = "upr. Kamila Zenklová"
	copyright = ""
	tagline = ""
}

global = {
	\globalstyle
	\key e \minor
	\time 4/4
}

lining = {
	\global

}

soprano = \transpose c c'{
	\global

	\tempo\markup\main-tempo "Allegro con moto."
	\tempo 4 = 70

	h8 a a g g fis fis e |
	e h,4 h, 8 e d-> |
	r2 d4-> r |
	d-> r d-> r |

	h8 a a g g fis fis e |
	e h,4 h, 8 e d-> |
	r2 d4-> r |
	d-> r d-> r |

	e1 |
	e |
	d |
	d |

}

altoI = \transpose c c' {
	\global
}

altoII = \transpose c c' {
	\global
}

tenor = {
	\global
	
}

bassI = {
	\global
	\voiceOne

}

bassII = {
	\global
	\voiceTwo

}

vsoprano = \lyricmode {
}

valto = \lyricmode {
}

vtenor = \lyricmode {
}

vbass = \lyricmode {
}

rehearsalMidi = #
(define-music-function
 (parser location name midiInstrument lyrics) (string? string? ly:music?)
 #{
	 \unfoldRepeats <<
		 \new Staff = "soprano" \new Voice = "soprano" { s1*0\f \soprano }
		 \new Staff = "altoI" \new Voice = "altoI" { s1*0\f \altoI }
		 \new Staff = "altoII" \new Voice = "altoII" { s1*0\f \altoII }
		 \new Staff = "tenor" \new Voice = "tenor" { s1*0\f \tenor }
		 \new Staff = "bass1" \new Voice = "bass1" { s1*0\f \bassI }
		 \new Staff = "bass2" \new Voice = "bass2" { s1*0\f \bassII }
		 \context Staff = $name {
			 \set Score.midiMinimumVolume = #0.5
			 \set Score.midiMaximumVolume = #0.5
			 \set Score.tempoWholesPerMinute = #(ly:make-moment 70 4)
			 \set Staff.midiMinimumVolume = #0.8
			 \set Staff.midiMaximumVolume = #1.0
			 \set Staff.midiInstrument = $midiInstrument
		 }
		 \new Lyrics \with {
			 alignBelowContext = $name
		 } \lyricsto $name $lyrics
	 >>
 #})

\score {
	\new ChoirStaff <<
		\new Staff \with {
			instrumentName = "Soprán"
			shortInstrumentName = "S"
		} <<
			\new Voice = "soprano" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \soprano }
		>>

		\new Lyrics = "ls" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "soprano" \vsoprano

		\new Staff \with {
			instrumentName = "Alt"
			shortInstrumentName = "A"
		} <<
			\new Voice = "altoI" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \voiceOne \altoI }
			\new Voice = "altoII" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \voiceTwo \altoII }
		>>

		\new Lyrics = "la" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "altoI" \valto

		\new Staff \with {
			instrumentName = "Tenor"
			shortInstrumentName = "T"
		} <<
			\clef "treble_8"
			\new Voice = "tenor" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \tenor }
		>>

		\new Lyrics = "lt" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "tenor" \vtenor

		\new Staff \with {
			instrumentName = "Bas"
			shortInstrumentName = "B"
		} <<
			\clef bass
			\new Voice = "bass1" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \voiceOne \bassI }
			\new Voice = "bass2" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \voiceTwo \bassII }
		>>

		\new Lyrics = "lb" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "bass1" \vbass

		\new Staff \new Voice \lining
	>>
	\layout { \context { \RemoveEmptyStaffContext \override VerticalAxisGroup #'remove-first = ##t }}
}

\score {
	\new ChoirStaff <<
		\new Staff \with {
			midiInstrument = "violin"
			instrumentName = "Soprán"
			shortInstrumentName = "S"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} <<
			\new Voice = "soprano" { \unfoldRepeats \soprano }
		>>

		\new Staff \with {
			midiInstrument = "viola"
			instrumentName = "Alt"
			shortInstrumentName = "A"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} <<
			\new Voice = "altoI" { \unfoldRepeats \altoI }
			\new Voice = "altoII" { \unfoldRepeats \altoII }
		>>

		\new Staff \with {
			midiInstrument = "cello"
			instrumentName = "Tenor"
			shortInstrumentName = "T"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} <<
			\clef "treble_8"
			\new Voice = "tenor" { \unfoldRepeats \tenor }
		>>

		\new Staff \with {
			midiInstrument = "contrabass"
			instrumentName = "Bas"
			shortInstrumentName = "B"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} <<
			\clef bass
			\new Voice = "bass1" { \unfoldRepeats \bassI }
			\new Voice = "bass2" { \unfoldRepeats \bassII }
		>>
	>>
	\midi { }
}
% Rehearsal MIDI files:
\book {
	\bookOutputSuffix "soprano"
	\score {
		\rehearsalMidi "soprano" "soprano sax" \vsoprano
		\midi { }
	}
}

\book {
	\bookOutputSuffix "altoI"
	\score {
		\rehearsalMidi "altoI" "soprano sax" \valto
		\midi { }
	}
}

\book {
	\bookOutputSuffix "altoII"
	\score {
		\rehearsalMidi "altoII" "soprano sax" \valto
		\midi { }
	}
}

\book {
	\bookOutputSuffix "tenor"
	\score {
		\rehearsalMidi "tenor" "tenor sax" \vtenor
		\midi { }
	}
}

\book {
	\bookOutputSuffix "bass1"
	\score {
		\rehearsalMidi "bass1" "tenor sax" \vbass
		\midi { }
	}
}

\book {
	\bookOutputSuffix "bass2"
	\score {
		\rehearsalMidi "bass2" "tenor sax" \vbass
		\midi { }
	}
}

\paper
{
}
