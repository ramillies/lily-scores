\include "custom.ly"

\header {
	title = "Down in the River to Pray"
	subtitle = "(podle King‘s Singers)"
	instrument = ""
	composer = "Tradicionál"
	arranger = "upravil Philip Lawson"
	copyright = ""
	tagline = ""
}

global = {
	\key as \major
	\numericTimeSignature
	\time 2/4
	\globalstyle

	\partial 4
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
	r4 | R2*49 |
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
	r4 | R2*49 |
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
	r4 | R2*16 | s2*33 |
	b2 | b4 as | c' es' | b8( as4.) | c'4 b | as2 | as8 as4. | f2 | b8 b4. |
	b4 as | c' es' | b8( as4.) | c'4 b8 as | as as f( es) | es2~ | es | r | r |
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
	
	r4 | R2*16 |
	b2 | b4 as | c' es' | b8( as4.) | c'4 b |
	as2 | as8 as4. | f8( es4.) | b2 | b4 as |
	c'4 es' | b8( as4.) | c'4 b8 as | as as f( es) | es2~ | es |
	r4 es | es f | as as8 as | as as as4 | as2 | b8 b b c' | b4 as | c' b8( as) | as4 f8( es) | es4 c | es4. f8 | as4 f |
	as c' | b2 | as8 as4 f8 | es2~ | es4 r4 | 

	s2*49 | r2 | r |

	as4 as8 as | as as as4 | as r | 8 b b c' b4 as | c' b8( as) | as4 f8( es) |
	es4 c | es4. f8 | as4 c' | c'8( b) as4 | b2 | as8 as4 f8 | es2~ | es4 r |
	
	g2 | g4 as | c' c' | as2 | c'8 b4. | as4 as8 f | as as as4 | f8( es4.) |
	g8 g4. | g4 as | c' c' | as2 | c'4 b8 as | as as f( es) | es2~ | es |

	\repeat unfold 8 { es2~ | } es | \repeat unfold 7 { des2~ | } des |

	es2~ | es~ | es | es~ | es | f~ | f | f | es~ | es~ | es | es | es4 des8 des | des des des4 | \repeat unfold 5 { des2~ | } des |
}

rytmus = {
	s4 | s2*16 |
	b2 | b4 as | c' es' | b8( as4.) | c'4 b |
	as2 | as8 as4. | f8( es4.) | b2 | b4 as |
	c'4 es' | b8( as4.) | c'4 b8 as | as as f( es) | es2~ | es |
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
	r4 es | es f |
	<<
		{
			\voiceOne
			as4 as8 as | as as as4 | as2 | b8 b b c' | b4 as | c' b8( as) | as4 f8( es) | es4 c | es4. f8 | as4 f |
			as c' | b2 | as8 as4 f8 |
			\repeat unfold 12 { es2~ | } es2 |
		}
		\\
		{
			\voiceTwo
			\repeat unfold 26 { es2~ | } es2 |
		}
	>>
	des4 des8 des | des des r4 |
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
	\voiceFour
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

basrytmus = {
	\global
	es4 | es f | as as8 as | as as as4 | as2 | b8 b b c' |
	b4 as | c' b8( as) | as4 f8( es) | es4 c | es4. f8 |
	as4 f | as c' | b2 | as8 as4 f8 | es2~ | es4 r |
	b2 | b4 as | c' es' | b8( as4.) | c'4 b |
	as2 | as8 as4. | f8( es4.) | b2 | b4 as |
	c'4 es' | b8( as4.) | c'4 b8 as | as as f( es) | es2~ | es |
	r2 | r | \repeat unfold 26 { as,2~ | } as, | as,4 as,8 as, | as, as, r4 |
	R2*37 |

	es4 es8 es | es es es4 | es r | f8 f f as | f4 es | as f8( es) | es4 des |
	c f | c4. des8 | es4 as | as8( f) es4 | f2 | f8 f4 des8 | c2~ | c4 r |

	es2 | es4 es | as as | f8( es4.) | as8 f4. | f4 f8 f | f f f4 | es2 |
	es8 es4. | es4 es | as as | f8( es4.) | as4 f8 f | f f des4 | c2~ | c |

	r4  es | es f | as as8 as | as as as4 | as2 | b8 b b c' | b4 as | c' b8( as) |
	as4 f8( es) | es4 c | es4. f8 | as4 f | as c' | b2 | as8 as4 f8 | es2~ | es |
	b2 | b4 as | c' es' | b8( as4.) | c'4 b | as2 | as8 as4. | f8( es4.) |
	b2 | b4 as | c' es' | b8( as4.) | c'4 b8 as | as as f( es) | \repeat unfold 5 { es2~ | } es |
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

midiBassTwo = {
	\global
	s4 | \repeat unfold 16 { s2 | }
	g2 | g4 f | as c' | f8( es4.) | as4 f |
	f2 | es8 es4. | c2 | g2 | g4 f4 |
	as c' | f8( es4.) | f4 f8 es | es es des4 | es2~ | es |
	r2 | r | \repeat unfold 26 { as,2~ | } as, | as,4 as,8 as, | as, as, r4 |
	R2*37 |

	c4 c8 c | c c c4 | c r | des8 des des es | des4 c | es des8( c) | c4 b, |
	as, f, | as,4. b,8 | c4 es | es8( des) c4 | des2 | des8 des4 b,8 | as,2~ | as,4 r |

	b,2 | b,4 c | es as | as,2 | es8 des4. | des4 des8 des | des des des4 | c2 |
	b,8 b,4. | b,4 c | f as | as,2 | es4 des8 des | des des b,4 | as,2~ | as, |
	\transpose c c,
	{
		\repeat unfold 19 { as2~ | } as | as~ | as | as~ | as | as | as~ | as~ | as | as | as4 as8 as | as as as4 | \repeat unfold 3 { as2~ | } as | r4 es | es f |
		\oneVoice
		as4 as8 as | as as as4 | as2 | b8 b b c' | b4 as | c' b8( as) | as4 f8( es) | es4 c | es4. f8 | as4 f | as c' | b2 | as8 as4 f8 | es2~ | es^\fermata \bar "|."
	}
}

vhigh = \lyricmode {
	\markup { Óó \italic { (či Hm) }} __ _ _ _ _ _ _ _ _ _ down in the ri -- ver
	As I went down in the ri -- ver to pray, stu -- dy -- in' a -- bout that good old __ way and __ who shall wear the star -- ry crown. __ Good Lord,
	show me the way. __ Oh, fa -- thers, let's go down, __ let's go down, __ come on down. __ Oh, fa -- thers, let's go down, __ down in the ri -- ver to __ pray. __ 
	As I went down in the ri -- ver to pray, stu -- dy -- in' a -- bout that good old __ way and __ who shall wear the robe and crown. __ Good Lord,
	show me the way. __ Oh, mo -- thers, let's go down, __ come on down, don't you wan -- na go down. __ Come on, mo -- thers, let's go down, __ down in the ri -- ver to __ pray. __ 
	Oh, __ _ _ down, __ _ down, __ down. Oh, __ _ _ down, __ down in the ri -- ver to pray. __ 
}

vmid = \lyricmode {
	Oh, sis -- ters, let's go down, __ let's go down, come on down. __ Oh, sis -- ters, let's go down, __ down in the ri -- ver to __ pray. __
	As I went down in the riv -- er to pray, stud -- y -- in' a -- bout that good old __ way and __ who shall wear the robe and crown. Good Lord, show me the way. __
	Oh, bro -- thers, let's go down, __ let's go down, come on down. Come on, bro -- thers, let's go down, __ down in the ri -- ver to __ pray. __
	down in the ri -- ver to pray, stu -- dy -- in' a -- bout that good old __ way and __ who shall wear the star -- ry crown. __ Good Lord,
	show me the way. __ Oh, fa -- thers, let's go down, __ let's go down, come on down. Oh, fa -- thers, let's go down, __ down in the ri -- ver to pray. __
	down in the ri -- ver to pray, stu -- dy -- in' a -- bout that good old __ way and __ who shall wear the robe and crown. __ Good Lord,
	show me the way. __ Oh, mo -- thers, let's go down, __ come on down, don't you wan -- na go down. __ Come on, mo -- thers, let's go down, __ down in the ri -- ver to __ pray.

	\markup { Óó \italic { (či Hm) }, } __ down, __ down, __ down. Oh, __ down, __ down in the ri -- ver to pray. __ 
}

vlow = \lyricmode {
	% Lyrics follow here.
	As I went down in the riv -- er to pray, stud -- y -- in' a -- bout that good old __ way and __ who shall wear the star -- ry crown. Good Lord, show me the way. __
	Oh, sis -- ters, let's go down, __ let's go down, come on down. __ Oh, sis -- ters, let's go down, __ down in the ri -- ver to __ pray. __  \markup { Hm \italic { (či Óó) } } __
	down in the ri -- ver
	down in the ri -- ver to pray, stu -- dy -- in' a -- bout that good old __ way and __ who shall wear the robe and crown. __ Good Lord,
	show me the way. __ Oh, mo -- thers, let's go down, __ come on down, don't you wan -- na go down. __ Come on, mo -- thers, let's go down, __ down in the ri -- ver to __ pray. __ 
	As I went down in the riv -- er to pray, stud -- y -- in' a -- bout that good old __ way and __ who shall wear the star -- ry crown. Good Lord, show me the way. __
	Oh, sin -- ners, let's go down, __ let's go down, come on down. __ Oh, sin -- ners, let's go down, __ down in the ri -- ver to __ pray. __

}

vcontra = \lyricmode {
	\markup { Óó \italic { (či Hm) }, } __ down, __ down, __ down. Oh, __ down, down in the ri -- ver to pray. __ 

	As I went down in the ri -- ver to pray, stu -- dy -- in' a -- bout that good old __ way and __ who shall wear the robe and crown. Good Lord, show me the way! __
}

rehearsalMidi = #
(define-music-function
 (parser location name midiInstrument lyrics) (string? string? ly:music?)
 #{
	 \unfoldRepeats <<
		 \new Staff = "soprano" \new Voice = "soprano" { s1*0\f \soprano }
		 \new Staff = "alto" \new Voice = "alto" { s1*0\f \alto }
		 \new Staff = "tenor1" \new Voice = "tenor1" { s1*0\f \tenorOne }
		 \new Staff = "tenor2" \new Voice = "tenor2" { s1*0\f \tenorTwo }
		 \new Staff = "bass1" \new Voice = "bass1" { s1*0\f \bassOne }
		 \new Staff = "bass2" \new Voice = "bass2" { s1*0\f \midiBassTwo }
		 \context Staff = $name {
			 \set Score.midiMinimumVolume = #0.5
			 \set Score.midiMaximumVolume = #0.5
			 \set Score.tempoWholesPerMinute = #(ly:make-moment 72 2)
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
			instrumentName = \markup \center-column { "Alt II" "Tenor" }
			shortInstrumentName = \markup \center-column { "A2" "T" }
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
			\new NullVoice = "bassrhythm" { \basrytmus }
		>>

		\new Lyrics \with {
			\override VerticalAxisGroup #'staff-affinity = #CENTER
		} \lyricsto "bassrhythm" \vlow

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
	\layout { \context { \RemoveEmptyStaffContext \override VerticalAxisGroup #'remove-first = ##t }}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 72 2)
		}
	}
}

% Rehearsal MIDI files:
\book {
	\bookOutputSuffix "soprano"
	\score {
		\rehearsalMidi "soprano" "soprano sax" \vhigh
		\midi { }
	}
}

\book {
	\bookOutputSuffix "alto"
	\score {
		\rehearsalMidi "alto" "soprano sax" \vhigh
		\midi { }
	}
}

\book {
	\bookOutputSuffix "tenor1"
	\score {
		\rehearsalMidi "tenor1" "tenor sax" \vmid
		\midi { }
	}
}

\book {
	\bookOutputSuffix "tenor2"
	\score {
		\rehearsalMidi "tenor2" "tenor sax" \vmid
		\midi { }
	}
}

\book {
	\bookOutputSuffix "bass1"
	\score {
		\rehearsalMidi "bass1" "tenor sax" \vlow
		\midi { }
	}
}

\book {
	\bookOutputSuffix "bass2"
	\score {
		\rehearsalMidi "bass2" "tenor sax" \vlow
		\midi { }
	}
}

\paper
{
		system-separator-markup = \slashSeparator
		left-margin = #8
		page-count = #4
}
