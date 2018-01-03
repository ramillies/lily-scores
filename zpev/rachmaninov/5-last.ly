\include "custom.ly"

\header {
	title = ""
	subtitle = ""
	instrument = ""
	composer = ""
	arranger = ""
	copyright = ""
	tagline = ""
}

global = {
	\globalstyle
	\key b \minor
	\time 4/4

	\magnifyStaff #.75
}

lining = {
	\global

}

sopranoI = \transpose c c'{
	\global

	s1*2 |
	\time 6/4 s1.*3 \bar "|."
}

sopranoII = \transpose c c'{
	\global

	\override Tie.layer = #-2
	\override Staff.TimeSignature.layer = #-1
	\override Staff.TimeSignature.whiteout = ##t
	b4--( as) b--( ges |
	b-- f) b--( es) |
	\time 6/4 des4 r r1 |
	R1. |
	R^\fermata \bar "|."
}

altoI = \transpose c c' {
	\global

	f4--( des) f--( ces |
	f-- b,) des--( c) |
	\time 6/4 b,1.~ |
	b,~ |
	b,\ppp^\fermata \bar "|."

}

altoII = \transpose c c' {
	\global

	\override MultiMeasureRest.staff-position = #-4
	des2 des4( ces |
	b, des2) ces4 |
	\time 6/4 b,1.~ |
	b,~ |
	b,_\fermata \bar "|."
}

solo = {
	\global

	des'4\< f'2\!( es'4~ |
	4 des'2) c'4\> |
	\time 6/4 b1.\! |
	R1. |
	R1.^\fermata \bar "|."
}

tenorI = {
	\global

	b4--( as) b--( ces' |
	b-- f) b( c') |
	\time 6/4 b1.~ |
	b~ |
	b^\fermata\ppp \bar "|."
}

tenorII = {
	\global

	\override MultiMeasureRest.staff-position = #-4
	b2 4--( ges |
	b2) ges4( f) |
	\time 6/4 b( as ges f es des |
	b1.~) |
	b_\fermata \bar "|."
}

tenorMainAligner = {
	\global

	b4--( as) b--( ces' |
	b-- f) b( c') |
	\time 6/4 b1.~ |
	b~ |
	b^\fermata\ppp \bar "|."
}

bassI = {
	\global

	f2-- 4--( es |
	f-- des) es( f) |
	\time 6/4 ges(\pp des es b, ces ges,8 as, |
	b,1.)~ |
	b,^\fermata \bar "|."
}

bassII = {
	\global

	f4--( b,) f( as, |
	f as,) b,( c) |
	\time 6/4 b,1.~ |
	b,1.~ |
	b,_\fermata\ppp \bar "|."
}

bassIII = \transpose c c, {
	\global

	\magnifyStaff #1
	\override Staff.BarLine.thick-thickness = #4.4
	\override Staff.BarLine.kern = #2.4
	\override Staff.BarLine.hair-thickness = #1.5

	b4--( f) b--( es |
	b-- des) es( f) |
	\time 6/4 b1.~\pp |
	b4( as ges f es des8 c |
	b,1.)_\fermata\ppp \bar "|."
}

vsoprano = \lyricmode {
	\set fontSize = #-2
	Из -- ра -- и -- ля.
}

valto = \lyricmode {
	\set fontSize = #-2
	Из -- ра -- и -- ля. __
}

vsolo = \lyricmode {
	\set fontSize = #-2
	Из -- ра -- и -- ля. __
}

vtenor = \lyricmode {
	\set fontSize = #-2
	Из -- ра -- и -- ля. __
}

vbassII = \lyricmode {
	\set fontSize = #-2
	Из -- ра -- и -- ля. __
}

vbassIII = \lyricmode {
	Из -- ра -- и -- ля. __
}

\score {
	\new StaffGroup <<
		\new Staff \with {
			instrumentName = "Soprán"
			shortInstrumentName = "S"
		} <<
			\new Voice = "sopranoI" { \sopranoI }
			\new Voice = "sopranoII" { \oneVoice \sopranoII }
		>>

		\new Lyrics = "ls2" \with { \override VerticalAxisGroup #'staff-affinity = #UP } \lyricsto "sopranoII" \vsoprano

		\new Staff \with {
			instrumentName = "Alt"
			shortInstrumentName = "A"
		} <<
			\new Voice = "altoI" { \voiceOne \altoI }
			\new Voice = "altoII" { \voiceTwo \altoII }
		>>

		\new Lyrics = "la" \with { \override VerticalAxisGroup #'staff-affinity = #UP } \lyricsto "altoI" \valto

		\new Staff \with {
			instrumentName = "Tenor solo"
			shortInstrumentName = "Solo"
		} <<
			\clef "treble_8"
			\new Voice = "solo" { \oneVoice \solo }
		>>

		\new Lyrics = "lsolo" \with { \override VerticalAxisGroup #'staff-affinity = #UP } \lyricsto "solo" \vsolo


		\new Staff \with {
			instrumentName = "Tenor"
			shortInstrumentName = "T"
		} <<
			\clef "treble_8"
			\new Voice = "tenorI" { \voiceOne \tenorI }
			\new Voice = "tenorII" { \voiceTwo \tenorII }

			\new NullVoice = "tenorMainAligner" \tenorMainAligner
		>>

		\new Lyrics = "lt" \with { \override VerticalAxisGroup #'staff-affinity = #UP } \lyricsto "tenorMainAligner" \vtenor


		\new Staff \with {
			instrumentName = "Baryton"
			shortInstrumentName = "Bar."
		} <<
			\clef bass
			\new Voice = "bass1" { \voiceOne \bassI }
			\new Voice = "bass2" { \voiceTwo \bassII }
		>>

		\new Lyrics = "lb2" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "bass2" \vbassII

		\new Staff \with {
			instrumentName = "Bas"
			shortInstrumentName = "B"
		} <<
			\clef bass
			\new Voice = "bass3" { \oneVoice \bassIII }
		>>

		\new Lyrics = "lb3" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "bass3" \vbassIII
	>>
	\layout { \context { \Staff \RemoveEmptyStaves \override VerticalAxisGroup.remove-first = ##t }}
}

\paper
{
	left-margin = #15
	page-breaking = #ly:one-line-breaking
}
