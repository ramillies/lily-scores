\include "custom.ly"

global = {
	\key as \major
	\time 4/4
	\globalstyle
}

solo = {
	\global
	\oneVoice

	\transpose c c'
	{
		\partial 4 f8 f |
		\times 2/3 { f4 c8 } \times 2/3 { c4 c8 } \times 2/3 { c4 c c } |
		\times 2/3 { c4 c8 } c2 c8 c |
		\times 2/3 { c4 c8 } c4 \times 2/3 { c4 c c } |
		c2. f4 |
		f4 c c8 c4. |
		c4 c c as,8. b,16 |
		\times 2/3 { c4 c8 } b,4 as, g, |
		f,2. r4 \bar "|."
	}
}

\paper
{
		oddFooterMarkup=##f
		oddHeaderMarkup=##f
		bookTitleMarkup=##f
		scoreTitleMarkup=##f
}

\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		midiInstrument = "viola"
		instrumentName = "Solo"
	} {
		\new Voice { \clef "treble_8" \solo }
	}
	\layout {  }
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 120 4)
		}
	}
}
