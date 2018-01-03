\paper
{
		indent = #17
		left-margin = #8
		right-margin = #5
		top-margin = #3
		bottom-margin = #6
}

\book
{
	\markup \fill-line { \line{\fontsize #4.5 \sans \bold "PRÆLUDIUM"} } 
	\score {
		\new StaffGroup
		<<
			\set StaffGroup.connectArpeggios = ##t
			\new Staff \with {
				\consists "Span_arpeggio_engraver"
				instrumentName = "Kytara I"
				shortInstrumentName = "I"
			} {
				\set Staff.connectArpeggios = ##t
				<<
					\new Voice { \clef "treble_8" \melodyIp }
					\new Voice { \clef "treble_8" \bassesIp }
					\new Voice { \clef "treble_8" \liningp }
				>>
			}
			\new Staff \with {
				\consists "Span_arpeggio_engraver"
				instrumentName = "Kytara II"
				shortInstrumentName = "II"
			} {
				\set Staff.connectArpeggios = ##t
				<<
					\new Voice { \clef "treble_8" \melodyIIp }
					\new Voice { \clef "treble_8" \bassesIIp }
				>>
			}
		>>
		\layout
		{
			\displayControlPoints
		}
	}

	\markup \fill-line { \line{\fontsize #4.5 \sans \bold "FUGA"} } 
	\score {
		\new StaffGroup
		<<
			\set StaffGroup.connectArpeggios = ##t
			\new Staff \with {
				\consists "Span_arpeggio_engraver"
				instrumentName = "Kytara I"
				shortInstrumentName = "I"
			} {
				\set Staff.connectArpeggios = ##t
				<<
					\new Voice { \clef "treble_8" \melodyIf }
					\new Voice { \clef "treble_8" \bassesIf }
					\new Voice { \clef "treble_8" \liningf }
				>>
			}
			\new Staff \with {
				\consists "Span_arpeggio_engraver"
				instrumentName = "Kytara II"
				shortInstrumentName = "II"
			} {
				\set Staff.connectArpeggios = ##t
				<<
					\new Voice { \clef "treble_8" \melodyIIf }
					\new Voice { \clef "treble_8" \bassesIIf }
				>>
			}
		>>
		\layout
		{
			\displayControlPoints
		}
	}
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats { \melodyIp \melodyIf } }
			\new Voice { \clef "treble_8" \unfoldRepeats { \melodyIIp \melodyIIf } }
		>>
	}
	\midi {
		\context {
			\Score
		}
		\context {
			\Voice
			\remove "Dynamic_performer"
		}
	}
}
