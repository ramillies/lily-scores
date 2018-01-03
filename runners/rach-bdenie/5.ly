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

}

lining = {
	\global

	s1*3 | \time 2/4 s2 | \time 4/4 s1*2 | \break
	s1*7 | \break
	s1*2 | \time 6/4 s1.*4 | \break
	\time 4/4 s1 | \time 3/4 s2. | \time 6/4 s1. \time 4/4 s1*2 | \break
	s1*6 | \break
	\repeat unfold 3 { s1 | \noBreak } \time 6/4 \repeat unfold 2 { s1. | \noBreak }
}

sopranoI = \transpose c c'{
	\global

	\tempo\markup\main-tempo "Largo."
	\tempo 4 = 50

	s1*3
	\time 2/4 s2 |
	\time 4/4 s1*11 |
	\time 6/4 s1.*4 |
	\time 4/4 s1 |
	\voiceOne
	\time 3/4 f'4\f\< f' ges' |
	\time 6/4 as'2\ff ges' f' |
	\time 4/4 f'1\p~ | f' | es'4\mf 8 8 8 8 8 f' | des'2.--(\> c'4)\! | b1 | 
	s1*6 |
	\time 6/4 s1.*3 \bar "|."
}

sopranoII = \transpose c c'{
	\global

	\override Tie.layer = #-2
	\override Staff.TimeSignature.layer = #-1
	\override Staff.TimeSignature.whiteout = ##t
	R1*3 |
	\time 2/4 R2 |
	\time 4/4 R1*6 |
	des'8\p 8 8 es' f'2~ |
	8 es'8 8 8 4 8 f' |
	des'2. c'4 |
	b1 |
	1~ |
	\time 6/4 1.~ |
	b~ |
	b~ |
	4 r b\mf a b8\<( c') des'4 |
	\time 4/4 es' des' es'8( f') ges'4\! |
	\voiceTwo
	\time 3/4 f' f' des'8( es') |
	\time 6/4 f'4( es'2) des' c'4 |
	\time 4/4 des'1~ | 1( | ces')( | b)~ | b4 r2. | 
	\oneVoice
	des'4--\pp( b) des'--( b) |
	des'--( b) des'--( b) |
	c'--( b) c'--( b) |
	b--( as b-- as) |
	b--( as) b--( ges |
	b-- f) b--( es) |
	\time 6/4 des4 r r1 |
	R1. |
	R^\fermata \bar "|."
}

altoI = \transpose c c' {
	\global

	b4--(\ppp as) b--( as)  |
	\repeat unfold 2 { b4--( as) b--( as) } |
	\time 2/4 b4--( as) |
	\time 4/4 b4--( as) b--( as)  |
	b--( as) b--( c') |
	des'--( b) des'--( b) |
	c'--( as) c'--( as) |
	\repeat unfold 2 { b--( as) b--( as) | }
	b( as) b(\< as8 b) |
	ces'4--(\! b\> ces'-- b)\! |

	b4( as) b( as) |
	b4--( as) b--( ges) |
	b--( f) b--( es) |
	\time 6/4 b( as) ges( f) es( des |
	b1.) |
	r1 b,4\mf as, |
	b,8(\< c) des4\! c c b,\< ges\! |
	\time 4/4 ges\< g ges es |
	\time 3/4 des'\f c' b |
	\time 6/4 as8(\< b ces'2)\ff b4 b--(\> a)\! |
	\time 4/4 R1 |
	des'4\p c' b as |
	ces' b as ges |
	b--( f b-- es) |
	b--\>( des es f)\! |
	es--( f) es--( f) |
	es--( f) es--( f) |
	ges--( des) ges--( des) |
	des1 |
	f4--( des) f--( ces |
	f-- b,) des--( c) |
	\time 6/4 b,1.~ |
	b,~ |
	b,\ppp^\fermata \bar "|."

}

altoII = \transpose c c' {
	\global

	\override MultiMeasureRest.staff-position = #-4
	ges4--( f) ges--( f) |
	ges--( f) f2 |
	ges4--( f) ges--( f) |
	\time 2/4 ges--( f) |
	\time 4/4 ges--( f) ges--( es) |
	ges--( f) ges--( as) |
	b--( f) b--( f) |
	as--( es) as--( es) |
	ges--( f) ges--( es) |
	ges--( f) ges--( f) |
	f( des) f( des) |
	as--( des ges des) |
	f( des) f( es |
	ges) r2. |
	R1 |
	\time 6/4 R1.*2 |
	r1 b,4 as, |
	b,8( c) des4 c c b, ges |
	\time 4/4 ges g ges es |
	\time 3/4 des' c' b |
	\time 6/4 as8( b ces'2) b4 b--( a) |
	\time 4/4 R1 |
	b4 f ges des |
	as ges fes es |
	ges( f2 es4) |
	es( des c b,) |
	es--( f) es--( f) |
	es--( f) es--( f) |
	ges--( des) ges--( des) |
	des4--( b, des-- b,) |
	des2 des4( ces |
	b, des2) ces4 |
	\time 6/4 b,1.~ |
	b,~ |
	b,_\fermata \bar "|."
}

solo = {
	\global

	R1*1 |
	des'8 8 8\< es' f'2\>( |
	es'8)\! 8 8 8 4 8 8 |
	\time 2/4 4.\< f'8 |
	\time 4/4 des'2.--\>( c'4)\! |
	b1 |
	es'4\< f'\! ges' f' |
	es' es'8( des') c'( des' es'4) |
	des'2.\mf\>( c'4)\! |
	b1 |
	f'4\mf 4 4\< 8 ges'\! |
	as'2 ges'4\> 4\! |
	f'1 |
	des'8(\< es')\! f'2-- es'4--~ |
	4 des'2-- c'4\> |
	\time 6/4 b1.\! |
	R1.*3 |
	\time 4/4 R1 |
	\time 3/4 R2. |
	\time 6/4 R1. |
	\time 4/4 R1*6 |
	es'4\mf( f') ges'\> f' |
	es'8\p( des') f'2 des'8( c') |
	b1 |
	des'4\< f'2\!( es'4~ |
	4 des'2) c'4\> |
	\time 6/4 b1.\! |
	R1. |
	R1.^\fermata \bar "|."
}

tenorI = {
	\global

	des'4--(\ppp b) des'--( b) |
	des'4--( b) des'--( b) |
	es'--( b) es'--( b) |
	\time 2/4 es'--( b) |
	\time 4/4 des'--( b) des'--( as) |
	des'--( b) des'--( es') |
	ges'--( des') ges'--( des') |
	f'--( c') f'--( c') |
	des'--( b) des'--( as) |
	des'--( b) des'--( b) |
	des'--( b) des'--( b) |
	es'--( b es'-- b) |
	des'( b) des'( b) |
	ges'--( des') ges'--( ces') |
	ges'--( b) ges'--( as) |
	\time 6/4 ges'( des') es'( b) ces'( ges8 as |
	b1.~ |
	b) |
	es'4\mf des' es'8( f') ges'4 f' es'8( des') |
	\time 4/4 es'4(\< des') es'8( f' ges'4) |
	\time 3/4 f'\f\< 4 ges' |
	\time 6/4 as'2\ff ges' f' |
	\time 4/4 R1*2 |
	as'4\p es' fes' ces' |
	ges'--( b) ges'--(\> as)\! |
	ges'--( ges) r2 |
	b2--\pp b-- |
	b-- b-- |
	b-- b |
	b1 |
	b4--( as) b--( ces' |
	b-- f) b( c') |
	\time 6/4 b1.~ |
	b~ |
	b^\fermata\ppp \bar "|."
}

tenorII = {
	\global

	\override MultiMeasureRest.staff-position = #-4
	R1*3 |
	\time 2/4 R2 |
	\times 4/4 R1 |
	b1_\markup\italic "(Tenor II: Hm...)" |
	R1*3 |
	b1~_\markup\italic "(Tenor II: Hm...)" |
	1~ |
	1~ |
	1 |
	R1*2 |
	\time 6/4 R1.*2 |
	f4\mf es f8(\< ges) as4 ges\> f\! |
	ges f c' c' b b |
	\time 4/4 ces'( b) ces'( c') |
	\time 3/4 des' c' des'8( es') |
	\time 6/4 f'4( es'2) des' c'4 |
	\time 4/4 R1*5 |
	b2-- b-- |
	b-- b-- |
	b4(-- f) b--( f) |
	b(-- as b-- as) |
	b2 4--( ges |
	b2) ges4( f) |
	\time 6/4 b( as ges f es des |
	b1.~) |
	b_\fermata \bar "|."
}

tenorTopAligner = {
	\global

	s1*3 |
	\time 2/4 s2 |
	\time 4/4 s1*11 |
	\time 6/4 ges'4( des') es'( b) ces'( ges8 as |
	b1.~ |
	b) |
	es'4\mf des' es'8( f') ges'4 f' es'8( des') |
	\time 4/4 s1 | \time 3/4 s2. | \time 6/4 as'2 ges' f' |

}

tenorMainAligner = {
	\global

	des'4--(\ppp b) des'--( b) |
	des'4--( b) des'--( b) |
	es'--( b) es'--( b) |
	\time 2/4 es'--( b) |
	\time 4/4 des'--( b) des'--( as) |
	des'--( b) des'--( es') |
	ges'--( des') ges'--( des') |
	f'--( c') f'--( c') |
	des'--( b) des'--( as) |
	des'--( b) des'--( b) |
	des'--( b) des'--( b) |
	es'--( b es'-- b) |
	des'( b) des'( b) |
	ges'--( des') ges'--( ces') |
	ges'--( b) ges'--( as) |
	\time 6/4 ges'( des') es'( b) ces'( ges8 as) |
	s1. |
	f4\mf es f8(\< ges) as4 ges\> f\! |
	es'4\mf des' es'8( f') ges'4 f' es'8( des') |
	\time 4/4 es'4(\< des') es'8( f' ges'4) |
	\time 3/4 f'\f\< 4 ges' |
	\time 6/4 f'4( es'2) des'2 c'4 |
	\time 4/4 R1*2 |
	as'4\p es' fes' ces' |
	ges'--( b) ges'--(\> as)\! |
	ges'--( ges) r2 |
	b2--\pp b-- |
	b-- b-- |
	b-- b |
	b1 |
	b4--( as) b--( ces' |
	b-- f) b( c') |
	\time 6/4 b1.~ |
	b~ |
	b^\fermata\ppp \bar "|."
}

bassI = {
	\global

	s1*3 |
	\time 2/4 s2 |
	\time 4/4 s1*11 |
	\time 6/4 s1.*2 |
	des4( c) b, r b\p as |
	b8( c') des'4--( ges) es des( b,) |
	\time 4/4 s1 | \time 3/4 s2. | \time 6/4 s1. | \time 4/4 s1*8 |
	f1 |
	f2-- 4--( es |
	f-- des) es( f) |
	\time 6/4 ges(\pp des es b, ces ges,8 as, |
	b,1.)~ |
	b,^\fermata \bar "|."
}

bassII = {
	\global

	R1 |
	\hideNotes \grace b,,4 \undo\hideNotes R1*2 |
	\time 2/4 R2 |
	\time 4/4 R1*11 |
	\time 6/4 R1. |
	\oneVoice
	es4\mf des\< es8( f) ges4\! f\> es |
	\voiceTwo
	des( c)\! b,1 |
	b,2 ges4 es des( b,) |
	\oneVoice
	\time 4/4 ces\< fes es as8( a) |
	\time 3/4 b4\f\< as b8\!( c') |
	\time 6/4 des'4\ff( as) ces'( ges) b\>( f)\! |
	\time 4/4 R1*5 |
	ges4--( des) ges--( des) |
	ges--( des) ges--( des) |
	es--( b,) es--( b,) |
	\voiceTwo
	f--( b, f-- b,) |
	f--( b,) f( as, |
	f as,) b,( c) |
	\time 6/4 b,1.~ |
	b,1.~ |
	b,_\fermata\ppp \bar "|."
}

bassIII = \transpose c c, {
	\global

	s1*3 |
	\time 2/4 s2 |
	\time 4/4 s1*11 |
	\time 6/4 s1.*4 |
	\time 4/4 s1 | \time 3/4 s2. | \time 6/4 s1. |
	\time 4/4 s1*8 |

	b4--( f b-- f) |
	b--( f) b--( es |
	b-- des) es( f) |
	\time 6/4 b1.~\pp |
	b4( as ges f es des8 c |
	b,1.)_\fermata\ppp \bar "|."
}

vsoprano = \lyricmode {
	Ны -- не от -- пу -- ща -- е -- ши ра -- ба __ Tво -- е -- го, __ Вла -- ды -- ко. __
	Е -- же е -- си у -- го -- то -- вал пред ли -- цем __ всех лю -- дей,
	свет __ 
	и __ сла -- ву лю -- дей Тво -- их __ Из -- ра -- и -- ля.
}

vsopranoTop = \lyricmode {
	пред ли -- цем __ всех лю -- дей,
	свет __ во от -- кро -- ве -- ни -- е я -- зы -- ков
}

valto = \lyricmode {
	Ны -- не __ от -- пу -- ща -- е -- ши __ ра -- ба __ Tво -- е -- го, __ Вла -- ды -- ко, по гла -- го -- лу Тво -- е -- му, __ с~ми -- ром, по гла -- го -- лу Тво -- е -- му. __
	Е -- же е -- си у -- го -- то -- вал, у -- го -- то -- вал пред ли -- цем всех __ лю -- дей,
	свет во от -- кро -- ве -- ни -- е я -- зы -- ков __ и сла -- ву лю -- дей Тво -- их __ Из -- ра -- и -- ля. __
}

vsolo = \lyricmode {
	Ны -- не от -- пу -- ща -- е -- ши ра -- ба Tво -- е -- го, __ Вла -- ды -- ко, __ по гла -- го -- лу Тво -- е -- му, __ с~ми -- ром. Я -- ко ви -- дес -- та о -- чи мо -- и спа -- се -- ни -- е Тво -- е. __
	И __ сла -- ву лю -- дей Тво -- их __ Из -- ра -- и -- ля. __
}

vtenorTop = \lyricmode {
	Тво -- е -- му. __ Е -- же е -- си у -- го
	всех __ лю -- дей,
}

vtenor = \lyricmode {
	Ны -- не __ от -- пу -- ща -- е -- ши __ ра -- ба __ Tво -- е -- го, __ Вла -- ды -- ко, по гла -- го -- лу Тво -- е -- му, __ с~ми -- ром, по гла -- го -- лу Тво -- е -- му.
	Е -- же е -- си у -- го -- то -- вал, е -- си у -- го -- то -- вал __ пред ли -- цем всех __ лю -- дей,
	свет во от -- кро -- ве -- ни -- е и сла -- ву лю -- дей Тво -- их __ Из -- ра -- и -- ля. __
}

vbassI = \lyricmode {
	то -- вал, е -- же е -- си, __ е -- си __
}

vbassII = \lyricmode {
	Е -- же е -- си у -- го -- то -- вал, __ е -- же е -- си __ у -- го -- то -- вал пред ли -- цем всех __ лю -- дей,__
	и сла -- ву лю -- дей Тво -- их __ Из -- ра -- и -- ля. __
}

\score {
	\new StaffGroup <<
		\new Lyrics = "ls1" \with { \override VerticalAxisGroup #'staff-affinity = #DOWN }

		\new Staff \with {
			instrumentName = "Soprán"
			shortInstrumentName = "S"
		} <<
			\new Voice = "sopranoI" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #4 \sopranoI }
			\new Voice = "sopranoII" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \sopranoII }
		>>

		\new Lyrics = "ls2" \with { \override VerticalAxisGroup #'staff-affinity = #UP } \lyricsto "sopranoII" \vsoprano

		\new Staff \with {
			instrumentName = "Alt"
			shortInstrumentName = "A"
		} <<
			\new Voice = "altoI" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #4 \voiceOne \altoI }
			\new Voice = "altoII" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \voiceTwo \altoII }
		>>

		\new Lyrics = "la" \with { \override VerticalAxisGroup #'staff-affinity = #UP } \lyricsto "altoI" \valto

		\new Staff \with {
			instrumentName = "Tenor solo"
			shortInstrumentName = "Solo"
		} <<
			\clef "treble_8"
			\new Voice = "solo" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \solo }
		>>

		\new Lyrics = "lsolo" \with { \override VerticalAxisGroup #'staff-affinity = #UP } \lyricsto "solo" \vsolo


		\new Lyrics = "ltTop" \with { \override VerticalAxisGroup #'staff-affinity = #DOWN } 
		\new Staff \with {
			instrumentName = "Tenor"
			shortInstrumentName = "T"
		} <<
			\clef "treble_8"
			\new Voice = "tenorI" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #4 \voiceOne \tenorI }
			\new Voice = "tenorII" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \voiceTwo \tenorII }

			\new NullVoice = "tenorTopAligner" \tenorTopAligner
			\new NullVoice = "tenorMainAligner" \tenorMainAligner
		>>

		\new Lyrics = "lt" \with { \override VerticalAxisGroup #'staff-affinity = #UP } \lyricsto "tenorMainAligner" \vtenor


		\new PianoStaff \with {
			instrumentName = "Bas"
			shortInstrumentName = "B"
			\remove "Keep_alive_together_engraver"
		} <<
			\new Lyrics = "lb1" \with { \override VerticalAxisGroup #'staff-affinity = #DOWN }
			\new Staff 
			 <<
				\clef bass
				\new Voice = "bass1" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #4 \voiceOne \bassI }
				\new Voice = "bass2" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \voiceTwo \bassII }
			>>

			\new Lyrics = "lb2" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "bass2" \vbassII

			\new Staff 
			<<
				\clef bass
				\new Voice = "bass3" { \oneVoice \bassIII }
			>>
		>>

		\new Staff \new Voice \lining

		\context Lyrics = "ls1" \lyricsto "sopranoI" \vsopranoTop
		\context Lyrics = "lb1" \lyricsto "bass1" \vbassI
		\context Lyrics = "ltTop" \lyricsto "tenorTopAligner" \vtenorTop
	>>
	\layout { \context { \Staff \RemoveEmptyStaves \override VerticalAxisGroup.remove-first = ##t }}
}

\paper
{
	indent = #10
	left-margin = #12
	page-breaking = #ly:one-page-breaking
}
