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

	\repeat volta 10 { \times 4/5 { c16-> 16 16-> 16 16 } \times 4/5 { c16-> 16 16-> 16 16 } | }
	4 \times 4/5 { c16-> 16 16-> 16 16 } |
	8 8 \times 4/5 { c16-> 16 16-> 16 16 } |
	\times 2/3 { 8 8 8 } \times 4/5 { c16-> 16 16-> 16 16 } |
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
