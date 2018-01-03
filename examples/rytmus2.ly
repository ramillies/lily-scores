\include "custom.ly"

\header {
	title = ""
	subtitle = ""
	composer = ""
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\time 1/4
	\key a \minor
	\globalstyle
}

rytmusA = {
	\global

	\times 2/3 { c8 16 \crossOn 16 \crossOff 8 } |
	\times 4/5 { c16 16 32 \crossOn 32 \crossOff 16 16 } |
	\times 4/7 { c16 16 16 32 \crossOn 32 \crossOff 16 16 16 } |
}

rytmusB = {
	\global

	c8 8 |
	8 8 |
	8 8 |
}

\paper
{
	page-breaking = #ly:one-line-breaking
}

\score {
	\new StaffGroup
	<<
		\new RhythmicStaff { \new Voice { \clef "percussion" \rytmusA } }
		\new RhythmicStaff { \new Voice { \clef "percussion" \rytmusB } }
	>>

	\layout
	{
		\context
		{
			\override VerticalAxisGroup.remove-first = ##t

%			\displayControlPoints
		}
	}
}
