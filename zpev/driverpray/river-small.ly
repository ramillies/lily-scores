\version "2.18.0"
\language "deutsch"

\header {
	title = "Down in the river to pray"
	copyright = ""
	tagline = ""
}

global = {
	\key as \major
	\numericTimeSignature
	\time 2/4
	\partial 4
	\magnifyStaff #.5
	\override Score.BarNumber.font-size = #-6

}

lining = {
	\global

	s4|
	\repeat unfold 8 { s2 |\noBreak } s |\break
	\repeat unfold 11 { s2 |\noBreak } s |\break
	\repeat unfold 10 { s2 |\noBreak } s |\break
	\repeat unfold 10 { s2 |\noBreak } s |\break
	\repeat unfold 10 { s2 |\noBreak } s |\break

	\repeat unfold 10 { s2 |\noBreak } s |\break
	\repeat unfold 10 { s2 |\noBreak } s |\break
	\repeat unfold 10 { s2 |\noBreak } s |\break
	\repeat unfold 10 { s2 |\noBreak } s |\break

	\repeat unfold 10 { s2 |\noBreak } s |\break
	\repeat unfold 10 { s2 |\noBreak } s |\break
	\repeat unfold 10 { s2 |\noBreak } s |\break

	\repeat unfold 7 { s2 |\noBreak } s |\break
	\repeat unfold 8 { s2 |\noBreak } s |\break
	\repeat unfold 11 { s2 |\noBreak } s |\break
	\repeat unfold 7 { s2 |\noBreak } s |\break

	\repeat unfold 6 { s2 |\noBreak } s |\break
	\repeat unfold 7 { s2 |\noBreak } s |\break
}

soprano = \transpose c c'{
	\global
	% Music follows here.
	s4 | \repeat unfold 49 { s2| }
	b2~ | b4 as | c'2 | b8 as4.~ | as2~ | as~ | as~ | as | b~ | b4 as | c'2 | b8 as4. | as4 as8 as | as as r4 | r2 | r2 |
	s2 | s2 | as4 as8 as | as as as4 | as r | b8 b b c' | b4 as |

	c'4 b8( as) | as4 f8( es) | es4 c | es4. f8 | as4 c' | c'8( b) as4 | b2 |
	as8 as4 f8 | es2~ | es4 r | b2 | b4 as | c' es' | b8( as4.) |
	c'4 b | as2 | as8 as4. | f8( es4.) | b2 | b4 as | c' es' |

	b8( as4.) | c'4 b8 as | as as f( es) | es2~ | es | r4 es | es f |
	as as8 as | as as as4 | as r | b8 b b c' | b4 as | c' b8( as) | as4 f8( es) |
	es4 c | es4. f8 | as4 c' | c'8( b) as4 | b2 | as8 as4 f8 | es2~ | es4 r |
	
	b2 | b4 as | c' es' | b8( as4.) | c'8 b4. | as4 as8 f | as as as4 | f8( es4.) |
	b8 b4. | b4 as | c' es' | b8( as4.) | c'4 b8 as | as as f( es) | es2~ | es |

	R2*17 |
	b2~\( | b4 as | c'2\) | b8\( as4.~ | as2\) | as~ | as | as |
	b2~\( | b4 as | c'2\) | b8( as4.) | as4 as8 as | as as f( es) | \repeat unfold 5 { es2~ | } es |
}

alto = \transpose c c' {
	\global
	% Music follows here.
	s4 | \repeat unfold 49 { s2| }
	g2~ | g4 f | as2 | f8 es4.~ | es2~ | es~ | es~ | es | g~ | g4 f | as2 | f8 es4. | es4 es8 es | es es r4 | r2 | r2 |
	r4 es | es f | es es8 es | es es es4 | es r | f8 f f as | f4 es

	as4 f8( es) | es4 des | c as, | c4. des8 | es4 as | as8( f) es4 | f2 |
	f8 f4 f8 | es2~ | es4 r | es2 | es4 es | as as | es2 |
	as4 f f2 | f8 f4. | c2 | es | es4 es | as as |

	es2 | as4 f8 es | es es des4 | es2~ | es | r4 es | es f |
	es es8 es | es es es4 | es r | f8 f f as | f4 es | as f8( es) | es4 des |
	c c | c4. des8 | es4 as | as8( f) es4 | f2 | f8 f4 des8 | c2~ | c4 r |

	es2 | es4 es | as as | es2 | as8 f4. | f4 f8 f | f f f4 | c2 |
	es8 es4. | es4 es | as as | es2 | as4 f8 es | es es des4 | c2~ | c |

	R2*17 |
	g2~\( | g4 f | as2\) | f8\( es4.~ | es2\) | es~ | es | es |
	g2~\( | g4 f | as2\) | f8( es4.) | es4 es8 es | es es es4 | \repeat unfold 5 { es2~ | } es |
}

tenorOne = {
	\global
	s4 | \repeat unfold 65 { s2 | } r | r |
	c'4 c'8 c' | c' c' c'4 | c'4 r | des'8 des' des' es' | des'4 c' |

	es'4 des'8( c') | c'4 b8( as) | as4 f | as4. b8 | c'4 es' | es'8( des') c'4 | des'2 |
	des'8 des'4 des'8 | c'2~ | c'4 r | b2 | b4 c' | es' es' | des'8( c'4.) |
	es'4 des' | des'2 | des'8 des'4. | as2 | b | b4 c' | es' es' |

	des'8( c'4.) | es'4 des'8 des' | des' des' des'4 | es'2~ | es' | r | r |
	c'4 c'8 c' | c' c' c'4 | c' r | des'8 des' des' es' | des'4 c' | es' des'8( c') | c'4 b8( as) | 
	as4 as | as4. b8 | c'4 es' | es'8( des') c'4 | des'2 | des'8 des'4 as8 | as2~ | as4 r |

	b2 | b4 c' | es' es' | des'8( c'4.) | es'8 des'4. | des'4 des'8 des' | des' des' des'4 | as2 |
	b8 b4. | b4 c' | es' es' | des'8( c'4.) | es'4 des'8 des' | des' des' b( as) | as2~ | as |

	R2*2 | \repeat unfold 6 { es'2~ | } es' | \repeat unfold 7 { f'2~ | } f' |

	es'~\( | es'4 des' | c'2\) | c'~ | c' | des'~ | des' | des' |
	es'~\( | es'4 des' | c'2\) | c'~ | c'4 b8 as | as as as4 | \repeat unfold 5 { as2~ | } as |
}

tenorTwo = {
	\global
	% Music follows here.
	
	s4 | \repeat unfold 32 { s2 | }
	r4 es | es f | as as8 as | as as as4 | as2 | b8 b b c' | b4 as | c' b8( as) | as4 f8( es) | es4 c | es4. f8 | as4 f |
	as c' | b2 | as8 as4 f8 | es2~ | es4 r4 | b2 | b4 as | c' es' | b8( as4.) | c'4 b | as2 | as8 as4. | f2 | b8 b4. |
	b4 as | c' es' | b8( as4.) | c'4 b8 as | as as f( es) | es2~ | es | r | r |

	s2*31  | r2 | r |

	as4 as8 as | as as as4 | as r | 8 b b c' b4 as | c' b8( as) | as4 f8( es) |
	es4 c | es4. f8 | as4 c' | c'8( b) as4 | b2 | as8 as4 f8 | es2~ | es4 r |
	
	g2 | g4 as | c' c' | as2 | c'8 b4. | as4 as8 f | as as as4 | f8( es4.) |
	g8 g4. | g4 as | c' c' | as2 | c'4 b8 as | as as f( es) | es2~ | es |

	\repeat unfold 8 { es2~ | } es | \repeat unfold 7 { des2~ | } des |

	es2~ | es~ | es | es~ | es | f~ | f | f | es~ | es~ | es | es | es4 des8 des | des des des4 | \repeat unfold 5 { des2~ | } des |
}

rytmus = {
	s4 | \repeat unfold 32 { s2 | }
	r4 es | es f | as as8 as | as as as4 | as2 | b8 b b c' | b4 as | c' b8( as) | as4 f8( es) | es4 c | es4. f8 | as4 f |
	as c' | b2 | as8 as4 f8 | es2~ | es4 r4 | b2 | b4 as | c' es' | b8( as4.) | c'4 b | as2 | as8 as4. | f2 | b8 b4. |
	b4 as | c' es' | b8( as4.) | c'4 b8 as | as as f( es) | es2~ | es |
	r2 | r2 

	c'4 c'8 c' | c' c' c'4 | c'4 r | des'8 des' des' es' | des'4 c' |
	es'4 des'8( c') | c'4 b8( as) | as4 f | as4. b8 | c'4 es' | es'8( des') c'4 | des'2 |
	des'8 des'4 des'8 | c'2~ | c'4 r | b2 | b4 c' | es' es' | des'8( c'4.) |
	es'4 des' | des'2 | des'8 des'4. | as2 | b | b4 c' | es' es' |
	des'8( c'4.) | es'4 des'8 des' | des' des' des'4 | es'2~ | es' | r | r |
	c'4 c'8 c' | c' c' c'4 | c' r | des'8 des' des' es' | des'4 c' | es' des'8( c') | c'4 b8( as) | 
	as4 as | as4. b8 | c'4 es' | es'8( des') c'4 | des'2 | des'8 des'4 as8 | as2~ | as4 r |
	g2 | g4 as | c' c' | as2 | c'8 b4. | as4 as8 f | as as as4 | f8( es4.) |
	g8 g4. | g4 as | c' c' | as2 | c'4 b8 as | as as f( es) | es2~ | es |
	\repeat unfold 19 { es~ | } es | 
	es~ | es | f~ | f | f | es~ | es~ | es | es | es4 des8 des | des des des4 | \repeat unfold 5 { des2~ | } des |
}

bassOne = {
	\global
	es4 | es f | as as8 as | as as as4 | as2 | b8 b b c' |
	b4 as | c' b8( as) | as4 f8( es) | es4 c | es4. f8 |
	as4 f | as c' | b2 | as8 as4 f8 | es2~ | es4 r |
	b2 | b4 as | c' es' | b8( as4.) | c'4 b |
	as2 | as8 as4. | f8( es4.) | b2 | b4 as |
	c'4 es' | b8( as4.) | c'4 b8 as | as as f( es) | es2~ | es |
	r2 | r | \repeat unfold 26 { es2~ | } es2 | des4 des8 des | des des r4 |
	R2*37 |

	es4 es8 es | es es es4 | es r | f8 f f as | f4 es | as f8( es) | es4 des |
	c f | c4. des8 | es4 as | as8( f) es4 | f2 | f8 f4 des8 | c2~ | c4 r |

	es2 | es4 es | as as | f8( es4.) | as8 f4. | f4 f8 f | f f f4 | es2 |
	es8 es4. | es4 es | as as | f8( es4.) | as4 f8 f | f f des4 | c2~ | c |

	\set Staff.shortInstrumentName = "B1"
	r4  es | es f | as as8 as | as as as4 | as2 | b8 b b c' | b4 as | c' b8( as) |
	as4 f8( es) | es4 c | es4. f8 | as4 f | as c' | b2 | as8 as4 f8 | es2~ | es |
	b2 | b4 as | c' es' | b8( as4.) | c'4 b | as2 | as8 as4. | f8( es4.) |
	b2 | b4 as | c' es' | b8( as4.) | c'4 b8 as | as as f( es) | \repeat unfold 5 { es2~ | } es |

}

bassTwo = {
	\global
	% Music follows here.
	s4 | \repeat unfold 16 { s2 | }
	\hideNotes \grace c, \undo\hideNotes g2 | g4 f | as c' | f8( es4.) | as4 f |
	f2 | es8 es4. | c2 | g2 | g4 f4 |
	as c' | f8( es4.) | f4 f8 es | es es des4 | es2~ | es |
	r2 | r | \repeat unfold 26 { as,2~ | } as, | as,4 as,8 as, | as, as, r4 |
	R2*37 |

	c4 c8 c | c c c4 | c r | des8 des des es | des4 c | es des8( c) | c4 b, |
	as, f, | as,4. b,8 | c4 es | es8( des) c4 | des2 | des8 des4 b,8 | as,2~ | as,4 r |

	b,2 | b,4 c | es as | as,2 | es8 des4. | des4 des8 des | des des des4 | c2 |
	b,8 b,4. | b,4 c | f as | as,2 | es4 des8 des | des des b,4 | as,2~ | as, |
}

subbass = {
	\global
	
	s4 |
	s2*131 | 

	\transpose c c,
	{
		\repeat unfold 19 { as2~ | } as | as~ | as | as~ | as | as | as~ | as~ | as | as | as4 as8 as | as as as4 | \repeat unfold 3 { as2~ | } as | r4 es | es f |
		\oneVoice
		as4 as8 as | as as as4 | as2 | b8 b b c' | b4 as | c' b8( as) | as4 f8( es) | es4 c | es4. f8 | as4 f | as c' | b2 | as8 as4 f8 | es2~ | es^\fermata \bar "|."
	}
}

vhigh = \lyricmode {
	\override LyricText.font-size = #-3
	\markup { Óó \italic { (či Hm) }} __ _ _ _ _ _ _ _ _ _ down in the ri -- ver
	As I went down in the ri -- ver to pray, stu -- dy -- in' a -- bout that good old __ way and __ who shall wear the star -- ry crown. __ Good Lord,
	show me the way. __ Oh, fa -- thers, let's go down, __ let's go down, __ come on down. __ Oh, fa -- thers, let's go down, __ down in the ri -- ver to __ pray. __ 
	As I went down in the ri -- ver to pray, stu -- dy -- in' a -- bout that good old __ way and __ who shall wear the robe and crown. __ Good Lord,
	show me the way. __ Oh, mo -- thers, let's go down, __ come on down, don't you wan -- na go down. __ Come on, mo -- thers, let's go down, __ down in the ri -- ver to __ pray. __ 
	Oh, __ _ _ down, __ _ down, __ down. Oh, __ _ _ down, __ down in the ri -- ver to pray. __ 
}

vmid = \lyricmode {
	\override LyricText.font-size = #-3
	As I went down in the riv -- er to pray, stud -- y -- in' a -- bout that good old __ way and __ who shall wear the robe and crown. Good Lord, show me the way. __
	Oh, bro -- thers, let's go down, __ let's go down, come on down. Come on, bro -- thers, let's go down, __ down in the ri -- ver to __ pray. __
	down in the ri -- ver to pray, stu -- dy -- in' a -- bout that good old __ way and __ who shall wear the star -- ry crown. __ Good Lord,
	show me the way. __ Oh, fa -- thers, let's go down, __ let's go down, come on down. Oh, fa -- thers, let's go down, __ down in the ri -- ver to pray. __
	down in the ri -- ver to pray, stu -- dy -- in' a -- bout that good old __ way and __ who shall wear the robe and crown. __ Good Lord,
	show me the way. __ Oh, mo -- thers, let's go down, __ come on down, don't you wan -- na go down. __ Come on, mo -- thers, let's go down, __ down in the ri -- ver to __ pray.

	\markup { Óó \italic { (či Hm) }, } __ down, __ down, __ down. Oh, __ down, __ down in the ri -- ver to pray. __ 
}

vlow = \lyricmode {
	\override LyricText.font-size = #-3
	As I went down in the riv -- er to pray, stud -- y -- in' a -- bout that good old __ way and __ who shall wear the star -- ry crown. Good Lord, show me the way. __
	Oh, sis -- ters, let's go down, __ let's go down, come on down. __ Oh, sis -- ters, let's go down, __ down in the ri -- ver to __ pray. __  \markup { Hm \italic { (či Óó) } } __
	down in the ri -- ver
	down in the ri -- ver to pray, stu -- dy -- in' a -- bout that good old __ way and __ who shall wear the robe and crown. __ Good Lord,
	show me the way. __ Oh, mo -- thers, let's go down, __ come on down, don't you wan -- na go down. __ Come on, mo -- thers, let's go down, __ down in the ri -- ver to __ pray. __ 
	As I went down in the riv -- er to pray, stud -- y -- in' a -- bout that good old __ way and __ who shall wear the star -- ry crown. Good Lord, show me the way. __
	Oh, sin -- ners, let's go down, __ let's go down, come on down. __ Oh, sin -- ners, let's go down, __ down in the ri -- ver to __ pray. __

}

vcontra = \lyricmode {
	\override LyricText.font-size = #-3
	\markup { Óó \italic { (či Hm) }, } __ down, __ down, __ down. Oh, __ down, down in the ri -- ver to pray. __ 

	As I went down in the ri -- ver to pray, stu -- dy -- in' a -- bout that good old __ way and __ who shall wear the robe and crown. Good Lord, show me the way! __
}

\score {
	\new ChoirStaff <<
		\new Staff \with {
			midiInstrument = "violin"
			instrumentName = \markup \center-column { "Soprán" "Alt" }
			shortInstrumentName = \markup \center-column { "S" "A" }
		} <<
			\new Voice = "soprano" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \voiceOne \soprano }
			\new Voice = "alto" \with { \consists "Ambitus_engraver" } { \voiceTwo \alto }
		>>
		\new Lyrics \with {
			\override VerticalAxisGroup #'staff-affinity = #CENTER
		} \lyricsto "alto" \vhigh
		\new Staff \with {
			midiInstrument = "cello"
			instrumentName = \markup \center-column { "Tenor I" "Tenor II" }
			shortInstrumentName = \markup \center-column { "T1" "T2" }
		} <<
			\clef "treble_8"
			\new Voice = "tenor1" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \voiceOne \tenorOne }
			\new Voice = "tenor2" \with { \consists "Ambitus_engraver" } { \voiceTwo \tenorTwo }
			\new NullVoice = "rhytm" { \rytmus }
		>>
		\new Lyrics \with {
			\override VerticalAxisGroup #'staff-affinity = #CENTER
		} \lyricsto "rhytm" \vmid

		\new Staff \with {
			midiInstrument = "contrabass"
			instrumentName = \markup \center-column { "Baryton" "Bas" }
			shortInstrumentName = \markup \center-column { "B1" "B2" }
		} <<
			\clef bass
			\new Voice = "bass1" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \voiceOne \bassOne }
			\new Voice = "bass2" \with { \consists "Ambitus_engraver" } { \voiceTwo \bassTwo }
		>>

		\new Lyrics \with {
			\override VerticalAxisGroup #'staff-affinity = #CENTER
		} \lyricsto "bass1" \vlow

		\new Staff \with {
			midiInstrument = "contrabass"
			instrumentName = "Bas"
			shortInstrumentName = "B2"
		} \new Voice = "superbass" { \clef bass \subbass }

		\new Lyrics \with {
			\override VerticalAxisGroup #'staff-affinity = #CENTER
		} \lyricsto "superbass" \vcontra

		\new Staff \new Voice \lining
	>>
	\layout { \context { \RemoveEmptyStaffContext \override VerticalAxisGroup #'remove-first = ##t
		\override VerticalAxisGroup.staff-staff-spacing.basic-distance = #5
	}}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 72 2)
		}
	}
}

\paper
{
		#(define fonts
			(set-global-fonts
				#:music "ross"
				#:brace "ross"
				#:roman "EB Garamond"
				#:sans "Linux Libertine O"
				#:typewriter "monospace"
				#:factor (/ staff-height pt 20)
			)
		)
		%#(set-paper-size "a5" 'landscape)

		indent = #12
		left-margin = #10
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

		page-count = #2

		system-system-spacing.basic-distance = #1
		score-system-spacing.basic-distance = #1
}
