\include "custom.ly"

\header {
	title = "Mikulecká dědina"
	subtitle = ""
	instrument = ""
	composer = "Lidová píseň"
	arranger = "upr. Oldřich Halma"
	copyright = ""
	tagline = ""
}

global = {
	\globalstyle
	\key es \major
	\time 4/4
}

lining = {
	\global

}

soprano = \transpose c c'{
	\global

	\tempo\markup\main-tempo "Moderato."
	\tempo 4 = 70

	es8 g g g g f es4 |
	g8 b b b b as g4 |
	b8 as g4 f2 |

	c'8 b as4 g2 |
	R1*2 |

	g8 g b as g es f4 |
	es2( g4 b) |
	b8 b c' d' es' es' d' c' |

	b b a b d' c' b as |
	g g b as g es f( d') |
	es'1 |
	d'8 c' c' b as as b4 |
	g2. r4 \bar "|."
}

alto = \transpose c c' {
	\global
	es1 |
	es8 g g g g f es4 |
	g8 f es4 d2 |

	as8 g f4 es2 |
	b,8 b, c d es es d c |
	b, b, a, b, d c b, as, |

	es8 es g f es es es( d) |
	b,2( d4 g) |
	g8 g as b c' c' b as |

	es2( e4 c) |
	es8 es g f es es d( as) |
	g1 |
	b8 as as g f f g4 |
	es2. r4 \bar "|."
}

tenor = {
	\global
	
	es'4( d' c' h) |
	b( c' d' es') |
	c'8 c' b( a) b2 |

	d'8 d' c'( d') b2 |
	g8 g as b c' c' b as |
	g g fis g b as g f |

	b4 as f( b) |
	g2( b4 d') |
	es'1 |

	g8 g fis g b as g f |
	b4 c' a( as8 b) |
	c'1 |
	c'2 c'8 c' d'4 |
	b2. r4 \bar "|."
}

bassI = {
	\global
	\voiceOne

	R1*3 |
	f2( es) | es1 |
	es2( e4 c) |
	b,4 es c( b,) | b,1 |
	r2 as |
	g8 g fis g b as g f |
	b,4 es c \slurDown b,8( b  |
	c'1) |
	es4( e) f8 f as4 | es2. r4 \bar "|."
}

bassII = {
	\global
	\voiceTwo

	R1*3 |
	b,2( es,) | es2( as,)
	es2( e4 c) |
	b,4 as, f,( b,) | es,1 |
	r2 as |
	g8 g fis g b as g f |
	b,4 as, f,( b,) |
	c1 |
	as,4( g,) f,8 f, b,4 | es,2. r4 \bar "|."
}

vsoprano = \lyricmode {
	Mi -- ku -- lec -- ká dě -- di -- na, mi -- ku -- le -- cká dě -- di -- na, ma -- lo -- va -- ná, ma -- lo -- va -- ná. 
	fra -- já -- re -- čka sta -- ro -- dá -- vná, __ a "v ní" bý -- va mo -- ja mi -- lá, a "v ní" bý -- va mo -- ja mi -- lá, fra -- ja -- re -- čka sta -- ro -- dá -- vná, __ fra -- ja -- re -- čka sta -- ro -- dá -- vná.
}

valto = \lyricmode {
	Ej, mi -- ku -- le -- cká dě -- di -- na, ma -- lo -- va -- ná, ma -- lo -- va -- ná. 
	A "v ní" bý -- va mo -- ja mi -- lá, a "v ní" bý -- va mo -- ja mi -- lá, 
	fra -- já -- re -- čka sta -- ro -- dá -- vná, __ a "v ní" bý -- va mo -- ja mi -- lá, ej, __ fra -- ja -- re -- čka sta -- ro -- dá -- vná, __ fra -- ja -- re -- čka sta -- ro -- dá -- vná.
}

vtenor = \lyricmode {
	Ej, __ ej, __ ma -- lo -- va -- ná, ma -- lo -- va -- ná. 
	A "v ní" bý -- va mo -- ja mi -- lá, a "v ní" bý -- va mo -- ja mi -- lá, 
	sta -- ro -- dá -- vná, __ ej, __ 
	a "v ní" bý -- va mo -- ja mi -- lá, sta -- ro -- dá -- vná, 
	ej, __ sta -- ro -- dá -- vná.
}

vbass = \lyricmode {
	Ej! __ Hm. __ _ sta -- ro -- dá -- vná, __ ej, __ a "v ní" bý -- va mo -- ja mi -- lá, sta -- ro -- dá -- vná, __ ej, sta -- ro -- dá -- vná.
}

rehearsalMidi = #
(define-music-function
 (parser location name midiInstrument lyrics) (string? string? ly:music?)
 #{
	 \unfoldRepeats <<
		 \new Staff = "soprano" \new Voice = "soprano" { s1*0\f \soprano }
		 \new Staff = "alto" \new Voice = "alto" { s1*0\f \alto }
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
			\new Voice = "alto" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \alto }
		>>

		\new Lyrics = "la" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "alto" \valto

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
			\new Voice = "alto" { \unfoldRepeats \alto }
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
	\bookOutputSuffix "alto"
	\score {
		\rehearsalMidi "alto" "soprano sax" \valto
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
