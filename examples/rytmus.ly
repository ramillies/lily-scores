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
	\time 2/4
	\key a \minor
	\globalstyle
}

rytmus = {
	\global

	\times 2/3 { c8-> 8 8 } \times 2/3 { 8-> 8 8 } |
	\times 4/6 { 8->[ 8] 8->[ 8] 8->[ 8] } |
}

\paper
{
	page-breaking = #ly:one-line-breaking
}

\score {
	\new RhythmicStaff { \new Voice { \clef "percussion" \rytmus } }

	\layout
	{
		\context
		{
			\override VerticalAxisGroup.remove-first = ##t

%			\displayControlPoints
		}
	}
}
