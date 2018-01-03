\include "custom.ly"

\header
{
	copyright = ""
	tagline = ""
}

globI = {
	\key f \major
	\time 2/4

	\magnifyStaff #.9
}

liningI = {
	\globI

	\repeat unfold 8 { s2 |\noBreak } s | \break
	\repeat unfold 9 { s2 |\noBreak } s | \break
}

sopranI = {
	\globI

	\tempo\markup\main-tempo "Vivace."

	r8 a16 a f8 a |
	\repeat volta 2
	{
		\segno f f4 d8 |
		c f4 g8 |
		a c'4 d'8 |
		c' a16 a f8 a |
		f f4 d8 |
		c f4 g8 |
		f2~ |
	}
	\alternative
	{
		{ f8 a16 a f8 a | }
		{ f2\repeatTie | }
	}

	\repeat volta 2
	{
		c'4 d' |
		c'4. a8 |
		c' d' c'4~ |
		c'4. c'8 |
		f'8 f' d'4 |
		c'8 c' a4 |
		g16 g f8 f4~ |
	}
	\alternative
	{
		{ f4. r8 | }
		{ f\repeatTie a16 a f8 a | }
	}

	\bar "|."
}

altI = {
	\globI

	r8 f16 f c8 f |
	\repeat volta 2
	{
		c c4 d8 |
		c c4 e8 |
		c f4 f8 |
		f f16 f c8 f |
		c c4 d8 |
		c c4 e8 |
		c2~ |
	}
	\alternative
	{
		{ c8 f16 f c8 f | }
		{ c2\repeatTie | }
	}

	\repeat volta 2
	{
		f4 f |
		f4. f8 |
		f f f4~ |
		f4. f8 |
		b8 b f4 |
		f8 f f4 |
		e16 e c8 c4~ |
	}
	\alternative
	{
		{ c4. r8 | }
		{ c\repeatTie f16 f c8 f | }
	}

}

tenorI = {
	\globI

	r8 c'16 c' a8 c' 
	\repeat volta 2
	{
		a a4 f8 |
		a a4 b8 |
		a a4 b8 |
		a c'16 c' a8 c' |
		a a4 f8 |
		a a4 b8 |
		a2~ |
	}
	\alternative { { a8 c'16 c' a8 c' | } { a2\repeatTie } }
	\repeat volta 2
	{
		a4 b |
		a4. c'8 |
		a b a4~ |
		a4. a8 |
		d'8 d' b4 |
		a8 a c'4 |
		b16 b a8 a4~ |
	}
	\alternative { { a4. r8 | } { a8\repeatTie c'16 c' a8 c' } }
}

basI = {
	\globI

	r8 f16 f f8 f |
	\repeat volta 2
	{
		f8 f4 b,8 |
		f f4 c8 |
		f f4 b,8 |
		f f16 f f8 f |
		f f4 b,8 |
		f f4 c8 |
		f2~ |
	}
	\alternative { { f8 f16 f f8 f | } { f2\repeatTie_\fine } }
	\repeat volta 2
	{
		R2*3 |
		r4. f8 |
		b,8 b, b,4 |
		f8 f f4 |
		c16 c c8 f4~ |

	}
	\alternative { { f4. r8 } { f8\repeatTie f16 f f8 f8_\ds-fine } }
}

globII = {
	\time 4/4
	\key d \minor

	\magnifyStaff #.9
}

liningII = {
	\globII
	\repeat unfold 5 { s1 | \noBreak } s | \break
	\repeat unfold 5 { s1 | \noBreak } s | \break
	\repeat unfold 4 { s1 | \noBreak } s | \break
}

sopranII = {
	\globII
	\repeat volta 2
	{
		\tempo\markup\main-tempo "Andante cantabile."
		a8 g a f d2 |
		r8 f4 d8 f4 d |
		a8 g a f d2 |
		r8 d'4 cis'8 d'4 a |
		a8 g a f d2 |
		f4. d8 f f4^\fermata g8 |
		a8 a a a g g g g |
	}
	\alternative { { f2 a^\fermata | } { f2. r4 | } }
	\tempo\markup\main-tempo "Più mosso"
	c'8 c'4 c' c'8 a a |
	c' c'4 c'8~ c'2 |
	a8 a a a c' a c' a |
	g2. c'4 |
	f' d' c'8 c' a a |
	d' c'4 c'8 a4( f)^\fermata |
	a8 a a a g g g g |
	f2. a4^\fermata \bar "|."
}

altII = {
	\globII
	\repeat volta 2
	{
		f8 e f d d2 |
		r8 d4 d8 d4 d |
		f8 e f d d2 |
		r8 f4 e8 f4 f |
		f8 e f d d2 |
		f4. d8 f f4_\fermata f8 |
		f f f f e e e e |
	}
	\alternative { { f2 e_\fermata | } { c4( d c) r | } }
	a8 a4 a a8 f f |
	a a4 a8~ a2 |
	f8 f f f a e a e |
	e2. e4 |
	f f f f8 f |
	f f4 f8 f2_\fermata |
	f8 f f f e e e e |
	c4( d c) e_\fermata \bar "|."
}

tenorII = {
	\globII
	\repeat volta 2
	{
		a8 a a a a2 |
		r8 a4 a8 a4 a |
		a8 a a a a2 |
		r8 a4 b8 a4 a4 |
		a8 a a a a2 |
		a4. a8 b h4^\fermata h8 |
		c' c' c' c' b b b b |
	}
	\alternative { { a2 cis'^\fermata | } { a4( b a) r | } }
	R1*2 |
	c'8 c' c' c' e' c' e' c' |
	b2. c'4 |
	c' b a c'8 c' |
	a4 a a a8( g)^\fermata |
	c'8 c' c' c' b b b b |
	a4( g a) cis'^\fermata \bar "|."
}

basII = {
	\globII
	\repeat volta 2
	{
		d8 d d d f2 |
		r8 d4 f8 d4 f |
		d8 d d d f2 |
		r8 d4 d8 d4 d |
		d8 d d d f2 |
		d4. f8 d des4_\fermata des8 |
		c c c c c c c c |
	}
	\alternative { { f2 a,_\fermata | } { f2. r4_\fine | } } 
	R1*2 |
	f8 f f f a, a, a, a, |
	c2. c'4 |
	a g f d8 d |
	c c4 c8 d4( des)_\fermata |
	c8 c c c c c c c |
	f2. a,4_\fermata_\dc-fine \bar "|."
}

slokaI = \lyricmode {
	Lit -- tle Dav -- id, play on your harp, Hal -- le -- lu, Hal -- le -- lu; lit -- tle Dav -- id, play on your harp, Hal -- le -- lu. __ 
	Lit -- tle Dav -- id, "_" 
	Dav -- id was a shep -- herd boy, __ he kill'd __ _ Go -- li -- ath and shou -- ted for joy. __
	"_" Lit -- tle Dav -- id
}

slokaII = \lyricmode {
	\repeat unfold 30 { \skip 1 } 
	Josh -- ua was the son of Nun; __ he nev -- er would quit 'till his work __ _ was done. __
	"_"
}

slokaIII = \lyricmode {
	\override LyricText.font-size = #.5
	Lis -- ten to the lambs, all a -- cry -- in'; lis -- ten to the lambs, all a -- cry -- in'; lis -- ten to the lambs, all a -- cry -- in', I wan -- na go to heav -- en when I die. O, die. __ 
	Come on, sis -- ter, with your ups and downs, wan -- na go to heav -- en when I die. __ The an -- gel's wait -- in' for to give you a crown, __ wan -- na go to heav -- en when I die. O,
}

slokaIV = \lyricmode {
	\override LyricText.font-size = #.5
	\repeat unfold 39 { \skip 1 } 
	Mind out, bro -- ther, how you walk the cross, \repeat unfold 9 { \skip 1 } Your foot might slip __ _ and your soul get a -- lost, __
}

\paper
{
	indent = #0
}

\score {
	\header { piece = "Little David, Play on Your Harp" }

	\new PianoStaff \with {
		\remove "Keep_alive_together_engraver"
	} <<
		\new Staff \with {
			midiInstrument = "violin"
		} \new Voice <<
			\new Voice = "soprano" { \voiceOne \transpose c c' { \sopranI } }
			\\
			{ \transpose c c' { \altI } }
		>>
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "soprano" \slokaI
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "soprano" \slokaII

		\new Staff \with {
			midiInstrument = "cello"
		} \new Voice <<
			\clef bass
			{ \tenorI }
			\\
			{ \basI }
		>>

		\new Staff \new Voice \liningI
	>>
	\layout { \context { \RemoveEmptyStaffContext \override VerticalAxisGroup #'remove-first = ##t }}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 70 4)
		}
	}
}

\score {
	\header { piece = "Listen to the Lambs" }

	\new PianoStaff \with {
		\remove "Keep_alive_together_engraver"
	} <<
		\new Staff \with {
			midiInstrument = "violin"
		} \new Voice <<
			\new Voice = "soprano" { \voiceOne \transpose c c' { \sopranII } }
			\\
			{ \transpose c c' { \altII } }
		>>
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "soprano" \slokaIII
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "soprano" \slokaIV

		\new Staff \with {
			midiInstrument = "cello"
		} \new Voice <<
			\clef bass
			{ \tenorII }
			\\
			{ \basII }
		>>

		\new Staff \new Voice \liningII
	>>
	\layout { \context { \RemoveEmptyStaffContext \override VerticalAxisGroup #'remove-first = ##t }}
}

\score {
	\header { piece = "Listen to the Lambs" }

	\new StaffGroup
	<<
		\new Staff \with {
			midiInstrument = "violin"
			midiMinimumVolume = #.3
			midiMaximumVolume = #.3
		} \new Voice = "soprano" { \voiceOne \transpose c c' { \sopranII } }
		\new Staff \with {
			midiInstrument = "violin"
			midiMinimumVolume = #.3
			midiMaximumVolume = #.3
		} \new Voice = "soprano" { \voiceOne \transpose c c' { \altII } }

		\new Staff \with {
			midiInstrument = "cello"
			midiMinimumVolume = #.3
			midiMaximumVolume = #.3
		} \new Voice { \tenorII }

		\new Staff \with {
			midiInstrument = "contrabass"
		} \new Voice { \basII }

	>>
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 90 4)
		}
	}
}
