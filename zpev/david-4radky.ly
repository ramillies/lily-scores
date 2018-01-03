\include "custom.ly"

\header
{
	title = "Little David, play on your harp"
	tagline = ""
	copyright = ""
}

global = {
	\key f \major
	\time 2/4
}

sopran = {
	\global

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
		{ f8\repeatTie a16 a f8 a | }
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

alt = {
	\global

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
		{ c8\repeatTie f16 f c8 f | }
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

tenor = {
	\global

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
	\alternative { { a8\repeatTie c'16 c' a8 c' | } { a2\repeatTie } }
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

bas = {
	\global

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
	\alternative { { f8 f16 f f8 f | } { f2\repeatTie } }
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

\score {
	\new ChoirStaff <<
		\new Staff \with {
			midiInstrument = "violin"
			instrumentName = "Soprán"
			shortInstrumentName = "S"
		} <<
			\new Voice = "soprano" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \transpose c c' { \sopran } }
		>>
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "soprano" \slokaI
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "soprano" \slokaII

		\new Staff \with {
			midiInstrument = "violin"
			instrumentName = "Alt"
			shortInstrumentName = "A"
		} <<
			\new Voice = "alto" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \transpose c c' { \alt } }
		>>
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "alto" \slokaI
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "alto" \slokaII

		\new Staff \with {
			midiInstrument = "cello"
			instrumentName = "Tenor"
			shortInstrumentName = "T"
		} <<
			\clef "treble_8"
			\new Voice = "tenor" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \tenor }
		>>
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "tenor" \slokaI
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "tenor" \slokaII

		\new Staff \with {
			midiInstrument = "contrabass"
			instrumentName = "Bas"
			shortInstrumentName = "B"
		} <<
			\clef bass
			\new Voice = "bass1" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \bas }
		>>

%		\new Staff \new Voice \lining
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
	\new ChoirStaff <<
		\new Staff \with {
			midiInstrument = "violin"
		} <<
			\new Voice = "soprano" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \transpose c c' { \unfoldRepeats \sopran } }
		>>
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "soprano" \slokaI
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "soprano" \slokaII

		\new Staff \with {
			midiInstrument = "violin"
		} <<
			\new Voice = "alto" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \transpose c c' { \unfoldRepeats \alt } }
		>>
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "alto" \slokaI
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "alto" \slokaII

		\new Staff \with {
			midiInstrument = "cello"
		} <<
			\clef "treble_8"
			\new Voice = "tenor" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \unfoldRepeats \tenor }
		>>
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "tenor" \slokaI
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "tenor" \slokaII

		\new Staff \with {
			midiInstrument = "contrabass"
		} <<
			\clef bass
			\new Voice = "bass1" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \unfoldRepeats \bas }
		>>

%		\new Staff \new Voice \lining
	>>
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 70 4)
		}
	}
}
