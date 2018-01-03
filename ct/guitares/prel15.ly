\include "custom.ly"

\header {
	title = \markup \fontsize #3 \sans \bold "XV"
	subtitle = \markup\tiny \raise #1 "(Preludium a fuga v A dur)"
	composer = "Mario Castelnuovo-Tedesco"
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)
	\override TextScript.outside-staff-priority = #200
	\globalstyle
}

tkp = {
	\time 2/2
	\key a \major
	\magnifyStaff 0.8
}

tkf = {
	\time 4/4
	\key a \major
	\magnifyStaff 0.85
}

liningp = {
	\tkp

	\repeat unfold 2 { s1 | \noBreak } s | \break
	\repeat unfold 3 { s1 | \noBreak } s | \break
	\repeat unfold 2 { s1 | \noBreak } s | \break
	\repeat unfold 3 { s1 | \noBreak } s | \break
	\repeat unfold 6 { \repeat unfold 2 { s1 | \noBreak } s | \break }
	\repeat unfold 3 { s1 | \noBreak } s | \break
	\repeat unfold 3 { s1 | \noBreak } s | \break
	\repeat unfold 2 { s1 | \noBreak } s | \break
	\repeat unfold 3 { s1 | \noBreak } s | \break
}

melodyIp = {	
	\global
	\tkp
	\oneVoice
	\tupletUp

	\tempo \markup \main-tempo "Molto animato."
	\tempo 4 = 170
	\transpose c c'
	{
		\once\override TupletBracket.positions = #'(5.5 . 3)
		\times 8/12 { e8-3\>_\markup{\dynamic "f" \italic "chiaro e scintillante"} cis'-4 h-1 a-4 gis-3 fis-1 e8-3 cis' h a gis fis } |
		\times 8/12 { e8\mf\> cis' h a gis fis e8 cis' h a gis fis } |
		\times 8/12 { e8\mf cis' h a gis fis e8 cis' h a gis fis } |

		\repeat unfold 3 { \times 8/12 { e8 cis' h a gis fis e8 cis' h a gis fis } | }

		\once\override TupletBracket.positions = #'(7.1 . 5.6)
		\times 8/12 { e-3\mf c'-2 h-1 a-4 g-2 f-1 e-3 cis'-4 h-1 a-4 gis-3 fis-1 | }
		\times 8/12 { e c' h a g f e cis' h a gis fis | }
		\times 8/12 { e\< c' h a g f e cis' h a gis fis | }

		\times 4/6 { e\f cis'\> h a gis fis } \times 2/3 { e\! r4. e4-- } |
		<<
			{
				\times 4/6 { \fleft <a-2>2--\<_\markup{\dynamic "f" \italic "espr. cantando"} a4-- <h-4>-- a-- h--\! } |
				\barre "IX" { <cis'-1>8-- e'4.--( \times 2/3 { r2) e'4-- } |
				\times 2/3 { <cis'-1>2-- cis'4-- } } \times 2/3 { <h-4>4-- <cis'-1>-- h } |
			}
			\\
			{
				\fleft <e-1 cis-3>2 <fis-2 d-3> |
				<gis-1 e-1>2 <a-2 fis-3> |
				<gis-1 e-1> <fis-2 d-3> |
			}
		>> 

		<a-2 e-1 cis-3>2~ q8 r4 q8-. |
		<c'-4 f-1 d-3>2\f <a-2 e-1 cis-3>4--\laissezVibrer r8 q8--

		<c' f d>2\sf--\> <a e cis>4\laissezVibrer--\! r8 q-- | 
		<c' f d>2--\< <d'-1 h-3 f-2>-- |
		<e'-3 c'-2 g-1>\!~ \times 4/6 { q8 e'-3\mf d'-1 c'-4 h-3 a-1 } |

		\times 8/12 { g-3 es'-2 d'-1 c'-4 b-2 a-1 g-3 e'-4 d'-1 c'-4 h-3 a-1 } |
		\times 8/12 { g es' d' c' b a g e' d' c' h a } |
		\times 8/12 { g es' d' c' b a g-3 a-1\> g f es-1 d-1 } |
	}

	\times 8/12 { c'-4 d'-1 c' h-3 a-1 g f-4 g f\! e d c} |
	\times 8/12 { h,-2\mp g fis-4 e-2 d c-3 h, g fis e d c } |
	\times 8/12 { h, g fis e d c h, g fis e d c } |

	\times 8/12 { h, g fis e d c h, g fis e d c } |
	\times 6/9 { h, g fis e d c h,4 r8 } r8 <d' a f>--\mf |
	<f'-1 c'-1 a-2>2--\sf\>^"I" <d'-3 a-1 f-2>4--\laissezVibrer r8 q-- |

	<f' c' a>2--\sf\>^"I" <d' a f>4--\laissezVibrer r8 q-- |
	<f' c' a>2--^"I" <g'-1 d'-1 h-2>--^"III"\< |
	<a'-3 f'-2 c'-1>2--\!^"V"~ \times 2/3 { q8 r4. e'4--\f } |

	\times 4/6 { <a'-1 cis'-2>2--_\markup\italic "squillante (come una fanfara)" q4-- <h'-1 e'-3>-- <a' cis'>-- <h' e'>-- } |
	<cis''-1 a'-2>8-- <e''-4 h'-3>4.\laissezVibrer \times 2/3 { r2 q4-- } |
	\times 4/6 { <cis'' a'>2--\> q4-- <h' e'>-- <cis'' a'>-- <h' e'>--\! } |
	<a' cis'>2--~ \times 2/3 { q8 r4. e'4--_\markup{\italic "più" \dynamic "f" }\< } |

	\times 4/6 { <a' cis'>2-- q4-- <h' e'>-- <a' cis'>-- <h' e'>-- } |
	<cis''-1 a'-2>8--\! <e''-4 h'-3>4.\laissezVibrer \times 2/3 { r2 q4-- } |
	\times 4/6 { <cis'' a'>2--\> q4-- <h' f'>-- <cis'' a'>-- <h' f'>--\! } |

	<a' d'>2.-- r8 <a'-1 e'-1 cis'-2>8->\ff^"V"^\markup\italic "Più sostenuto e pomposo" |
	<c''-3 f'-1 d'-2>2->\> <a'-1 e'-1 cis'-2>4--\! r8 q8-> |
	<c'' f' d'>2->\> <a' e' cis'>4--\! r8 q8-. |
	<c'' f' d'>2->\> <d''-1 a'-1 f'-2>->^"X" |

	\tempo\markup\main-tempo "Molto mosso." 
	\times 8/12 { <e''-1 cis''-3 a'-2>8->\! cis''-1_\markup{\dynamic ff \italic brilantissimo} h'-4 a'-2 gis'-1 fis'-3 e' fis' e' d' cis' h } |
	\times 8/12 { \flag a_\ffXII fis''\> e'' d'' cis'' h' a' gis' a' gis' fis' e' } |
	\times 8/12 { cis'\f a' gis' fis' e' d' <cis' a> fis' e' d' cis' h } |

	\times 8/12 { <a-1 fis-3> f' e' d' cis' h <a f> d' cis' h a gis } |
	<a e>2--_\markup\italic "sostenuto molto" q-- |
	<a e a,>2->^\fermata~ q8 r4. \bar "|."
	\pageBreak
}

bassesIp = { \global \tkp \voiceTwo }

melodyIIp = {	
	\global
	\tkp
	\oneVoice
	\phrasingSlurDown

	<a, e>4\laissezVibrer\f-> r2. |
	<a, e-2 cis'-3>4->\strum\laissezVibrer r4 \times 2/3 { r2 <e-2>4--\(_\markup{\dynamic "f" \italic "marcato"} } |
	\times 4/6 { a2-- a4-- h-- a-- h-- } | \phrasingSlurUp

	<cis'-3>8-- e'4.--\)\laissezVibrer \times 2/3 { r2 e'4-.\( } |
	\times 4/6 { cis'2-- <cis'-3>4-- <h-1>-- cis'-- h-- } |
	a2.\) r8 <fis'-1 a-2>8--_\markup{\italic "piú" \dynamic "f"} |

	<g'-1 c'-3>2->\> <e' a>4\laissezVibrer\! r8 q\< |
	<g' c'>2->\>\! <e' a>4\laissezVibrer\! r8 q |
	<g' c'>2->\< <a'-1 d'-3>-> |

	<h'-1 e'-3>->\ff\> \times 4/6 { e'8-0 fis'-2 e' d'-3 cis'-3 h } |
	\times 8/12 { a-1\mf fis'-2 e'-0 d'-3 cis'-3 h-0 a fis' e' d' cis' h } |
	\repeat unfold 3 { \times 8/12 { a fis' e' d' cis' h a fis' e' d' cis' h } | }
	\times 8/12 { a-2 f'-1 e'-0 d'-4 c'-1 h-0 a-1 fis'-2 e' d'-3 cis'-2 h } |

	\times 8/12 { a f' e' d' c' h a fis' e' d' cis' h } |
	\times 8/12 { a f' e' d' c' h\> a h a g f e } |
	\times 4/6 { c\! a g f e d } c8 r4 <g c>8\f |

	\repeat unfold 2 { <ais dis>2--\sf <g c>4 r8 q | }
	<ais dis>2--\< <c' f>-- |

	<d' g>2--~ \times 2/3 { q8 r4. h4---2\<_\markup{\dynamic "mf" \italic "espr. cantando"} } |
	\times 4/6 { <e'-0 h-0 g-0>2-- q4-- <fis'-3 c'-1 a-2>-- <e' h g>-- <fis' c' a>-- } |
	<g'-1 d'-1 h-3>8--^"III"\! <h'-1 fis'-1 d'-1>4.--\laissezVibrer^"VII" \times 2/3 { r2 q4-- } |

	\times 4/6 { <g' d' h>2--^"III" q4--\> <fis'-3 c'-1 a-2>-- <g' d' h>-- <fis' c' a> } |
	<e' h g>2--\! \times 4/6 { h,8-2\> c-3 h, a,-0 g,-3 f,-1 } |
	\times 8/12 { e,-0\mp c h, a, g, f, e, c h, a, g, f, } |

	\repeat unfold 2 { \times 8/12 { e, c h, a, g, f, e, c h, a, g, f, } | }
	\times 8/12 { e,\< f, g, a, h, c d e f g a h\! } |

	<a e a,>8-> r4. \times 2/3 { r2 e4--_\markup{\dynamic f \italic "squillante (come una fanfara)" } } |
	\times 4/6 { <a-1 cis-3>2--\< q4-- <h-0 e-2>-- <a cis>-- <h e>--\! } |
	<cis' a>8-- <e' h>4.--\laissezVibrer \times 2/3 { r2 <e' h>4-- } |
	\times 4/6 { <cis' a>2-- q4--\> <h e>-- <cis' a>-- <h e>--\! } |
	\times 4/6 { <a-1 cis-3 a,-4>4\laissezVibrer r e--_\markup{\italic "più" \dynamic f } <a-1 cis-3>2--\< q4-- } |
	\times 2/3 { <h e>-- <a cis>-- <h e>-- } <cis' a>8-- <e' h>4.--\! | 
	\times 4/6 { <a-2 cis-4 f,-1>4-> r <e' h>-- <a cis'>2-- q4--\> } |
	
	\times 2/3 { <h f>4-- <cis' a>-- <h f>-- } <a d>-- r8 <a c e,>->\ff |
	<f h, e,>2-> <a cis e,>4-- r8 q-> |
	<f h, e,>2-> <a cis e,>4-- r8 q-> |
	<f h, e,>2-> q-> |

	<a e a,>8 r4. \times 4/6 { r8_\markup{\dynamic ff \italic brillantissimo} e, fis, g, a, h, } |
	\times 8/12 { cis\< a, h, cis d e fis e fis gis a h } |
	\times 8/12 { <cis' a> a,\f h, cis d e fis a, h, cis d e } |

	\times 8/12 { <fis d>-> a, h, cis d e d-- a, h, cis d e } |
	\times 4/6 { <d a,>2-> <a, e,>4->\<_\markup{\dynamic ff \italic "(quasi Tromboni)"} <h, fis,>-> <a, e,>-> <h, fis,>-> } |
	<cis a,>8->\! <h, e>2->_\fermata r4. \bar "|."
}

bassesIIp = {
	\global
	\tkp
	\voiceTwo
}

liningf = {
	\tkf

	\partial 2 s2 | \noBreak \repeat unfold 4 { s1 | \noBreak } s | \break
	\repeat unfold 5 { s1 | \noBreak } s | \break
	s1 | \noBreak s | \noBreak \time 2/4 s2 | \noBreak \time 4/4 s1 | \noBreak s | \break
	\repeat unfold 4 { s1 | \noBreak } s | \break
	\repeat unfold 4 { s1 | \noBreak } s | \break
	\repeat unfold 4 { s1 | \noBreak } s | \break
	\repeat unfold 4 { s1 | \noBreak } s | \break
	\repeat unfold 4 { s1 | \noBreak } s | \break
	\repeat unfold 4 { s1 | \noBreak } s | \break
	\repeat unfold 4 { s1 | \noBreak } s | \break
	\repeat unfold 5 { s1 | \noBreak } s | \break
	\repeat unfold 5 { s1 | \noBreak } s | \break
	\repeat unfold 5 { s1 | \noBreak } s | \break
}

melodyIf = {	
	\global
	\tkf
	\oneVoice

	\tempo \markup \typewriter \fontsize #5.5 "Tempo di Gavotta — Allegretto grazioso."
	\tempo 4 = 120
	\partial 2 h8-1\((\p\> cis'-3) a-4 gis-3\)\! |
	fis4---1 e---4\< a---1 h---3 |
	cis'4---3( e'-1) fis'8-1\mp\((\< gis'-3) a'-4 h'-4\) |
	e'2--\! d'8-1\(( e'-3) fis'-1 gis'-3\) |
	cis'2---1 h4..\p cis'16-2 |

	h4.. cis'16-3( h8-1) a-4(\> gis-3 fis-1)\! |
	gis4-.-3\< e---4 h2---1~\! |
	h8 a-4(\> gis fis) e2--~-4\!|
	e8 d-2\(( cis-1) h,-4\) a,4-2\p <cis' e> |
	h8(\>_\markup{\dynamic mp \italic espr.} cis' a gis)\! fis4-- e--\< |

	<a e a,>-- cis'-- <d' a d>2--\! |
	<e' a cis>8\p\<( fis' gis' a') <d' e h,>2-- |
	<cis' e a,>8(\< d' e' fis')\! << { c''2-- } \\ { g'8\>_\markup{\dynamic mp \italic espr.}( a' f' e')\! } >> |
	<< { c''2-- c'' } \\ { d'4-- c'-- f'-- g'-- } >> |
	\time 2/4 a'4-- c''-- |

	\time 4/4
	<<
		{
			h'1--~-4 | 
			h'2 c''-- | 
			h'1--~-4 | 
			h'2 cis''-- | 
		}
		\\
		{
			d'8(_\markup{\dynamic p \italic uguale} e'-1 f'-1 g'-1) d'( e' f' g') |
			d'(\< e' f' g') d'(_\markup\dynamic "pf"\!\> e' f' g')\! |
			d'( e' f' g') d'( e' f' g') |
			d'( e' f' g') d'( e' f' g') |
		}
	>>

	\ottava #1 \osm <cis''-1 e'-1>8_\markup{\dynamic p \italic "dolcissimo e fluido"}( d''-2 e''-4 fis''-4) h'-2( cis''-4\> d''-1 e''-4) |
	a'(-2 h'-4 cis''-1 d''-2) gis'-1( a'-2 h'-4 cis''-1)\! |
	\ottava #0 fis'-3( gis'-1 a'-2 h'-4) e'-1( fis'-3 gis'-1 a'-2) |
	d'-4( e'-1 fis'-3 gis'-1) cis'-2(_\markup{\dynamic mp \italic espr.}\< d'-4 e'-1 fis'-3)\! |

	<gis'-1 eis'-4 cis'-3>2--\sf cis'8\((\< d') e' fis'\) |
	q2--\sf <h' d'>8_\markup{\dynamic p \italic dolce}^\markup\italic "(poco rit."\>( cis'' a' gis') |
	<fis' cis'>4-- e'--\! a'--^\markup\italic "a tempo)" h'-- |
	<cis'' a' e'>-- e'' h8-1( cis')_\markup{\italic più \dynamic p} a-4( gis-3) | 
	fis4---1 e---4 a---1 h---3 |
	cis'---3 e'---1 fis'---3 h'---4 \bar "||"

	\tempo\markup\sans\bold "(quasi Musette I)"
	<a'-1 f'-1 c'-1>2--\laissezVibrer r |
	\transpose c c'
	{
		r d8(_\markup{\dynamic p \italic dolcissimo} c f g)\< |
		<a f c>4-- \ottava #1 \osm c'-- <d' b e>-- g'--\! |
		<f' a> <c' a> <d'-1 b-2>8( e'-3 f'-4 g'-4) \ottava #0 |

		<c'-3 a-2>2-- <b-1 g-3>8( c'-4 d'-1 e'-3) |
		<< { \fleft <a-1 f-2>2 } \\ { \fleft <d-3>8( c f g) } >> <a f>8_\markup{\dynamic pp \italic uguale}( b g f) |
		\repeat unfold 2 { <a f>8( b g f) } |
		<a e>8( h gis fis) <a d>4\laissezVibrer r |
		
		<a e>8( h gis fis) <a d>4\laissezVibrer r |
		<a cis>8( h gis fis) << { <a cis>4 s } \\ { e8_\markup{\dynamic p \italic espr.}( fis d cis) } >> |
	}
	h4-- a--\< <d' a>-- e'-- | 
	<fis' a>-- a'--\! e8( fis' d' cis') |
	h4-- a--\< <d' a>-- e'-- | 

	<f' a>4 a'\! <h'-1 d'-1>8_\markup{\dynamic p \italic espr.}( cis''-3 a' gis') \bar "||"
	fis'4---1 e'---3\< a'---4 h'-- |
	\ottava #1 \osm <cis''-1 a'-2 e'-1>-- e''---4 <fis''-1 d''-2>8( gis''-3 a''-4 h''-4)\! |
	\transpose c c'
	{
		<e'-4 a-2>2-- <d' gis>8(\< e' fis' gis')\! |
		<cis' a>2-- h8(\> cis' a gis)\! |
		\ottava #0

		fis4--\< e-- a-- h-- |
		\ottava #1 \osm
		<cis' a e>-- e'-- <f' d' a>8( g' a' h')\! |
		<e' a>2-- <h gis d>8\< cis' d' e'\! \ottava #0 |
		<a fis cis>4 \tempo\markup\sans\bold "(quasi Musette II)" r_\markup{\dynamic p \italic "dolce ed espr."} <a-1 cis'-2~>4 cis'8. d'16-3( |
		cis'4..--) d'16( <cis' gis>8\> h a gis)\! |

		<a-2 fis-3>4-- fis-- <d'-2 gis-1>8( e'-4 fis' gis') |
		<cis' a>2-- <h gis d>8(\< cis' d' e')\! |
		<a fis cis>2-- <c'-3~ f-1 d-2>4--_\markup{\dynamic mp \italic "più espr."} c'8. d'16-3( |
		c'4..---1) d'16( <c' f>8) h\> a g\! |

		<c' e>4-- g-- <a f>8(\< h c'd')\! |
		<g e>2 <f d>8\<( g a h)\!
		<e d gis,>2 \tempo-primo r |
		r h,8-1\>(_\markup{\dynamic p \italic "con spirito"} cis-3 a,-4 gis,)\! |

		fis,4---1 e,---4\< a,-- h,-- |
		<cis a,>-- e-- <fis-1 d>8( gis-3 a-4 h-4) |
		<e a,>4-- a---2 <h d>8\mf\>( cis'-3 a-4 gis-3)\! |
		<fis-2 cis-1>4--\mf\< e---4 <a-2 e-1 cis-3>-- h-- |
		<cis'-1 a-2 e-1>--\! e-- <fis'-2 d'-3 a-1>8( gis' a' h') |

		<e'~ a>4-- e'8._\markup{\dynamic p \italic "semplice e dolce"} fis'16( e'4..) fis'16 |
		<e' a fis>8\strum\>( d' cis' h) e'2-- |
		<a e>4--\! r2. |
		h8(\> cis' a gis fis4) <e a, f,>4--_\markup\italic "poco rit."\! <cis a, e,>-- r2. \bar "|."
	}
}

bassesIf = { \global \tkf \voiceTwo }

melodyIIf = {	
	\global
	\tkf
	\oneVoice

	\partial 2 r2 | R1*3 |
	r2 fis8-1\((\mp gis-3) e-4 dis\) |

	cis4---1 h,---3 e---4\< fis---4 |
	gis---1 h---4 d'8-1\(( e'-3) fis'-3 gis'-1\)\! |
	cis'2-- h8-1\((\< cis'-3) d'-3 e'\)\! |
	a2-- h'8-1_\markup{\dynamic mp \italic dolce}\>(  cis''-3 a'-4 gis'-3)\! |
	fis'4---1 e'---3 \ottava #1 \osm a'---4 <h' gis' d'>-- |

	<cis''-1 a'-2 e'-1>-- e''-- <fis''-2 d''-3 a'-1>8(\p\< gis'' a'' h'')\! |
	<e'' a'>2-- <d'' a'>8(\< e'' fis'' gis'')\! |
	<cis'' a'>2-- \ottava #0 a,4-.\p <c' f>-. |
	as,-. <c' f>-. e,-. <b c>-. |
	\time 2/4 f,-. <a c>-. |

	\time 4/4
	\repeat unfold 2
	{
		<a d f,>2\strum c8(\>_\markup{\dynamic mp \italic espr.} d h, a,) |
		g,4-- f,--\! <gis d e,>2\strum |
	}

	<a cis e,>4--\strum cis'-- d'8-1\((\p e'-3)\> cis'-4 h-2\) |
	a4---2 gis---1 fis---1\! e-- |
	d-- cis--\> h,-- a,-- |
	gis,-- fis,-- e,--\! r |

	cis8-4_\markup{\dynamic p \italic espr.}( dis-1 eis-3 fis-4) <gis-1 h,-2>2\sf |
	cis8-4(\< dis-1 eis-3 fis-4) <gis-1 h,-2>4\sf e,4-- |
	<cis' e a,>4\strum\laissezVibrer r4 h,8-2(_\markup{\dynamic p \italic espr.} cis-4) a, gis,-4 |
	fis,4-- e,--\< a,-- h,-- |
	cis-- e--\! r2 |
	R1 \bar "||"

	<<
		{
			c8-4_\markup{\dynamic pp \italic uguale} d( b, a,) c d( b, a,) |
			\repeat unfold 4 { c d( b, a,) c d( b, a,) | } 
		}
		\\
		{
			f,2-1 f, |
			\repeat unfold 4 { f, f, } |
		}
	>>

	<f, c>2 <d f,>8_\markup{\dynamic mp \italic espr.}( c-3 f-4 g) |
	<a-2 c-3 f,-1>4--\strum^"I" c'---1\< <d' f-3>-- f'---1 |
	<e' cis' e e,>4--\strum\! <cis' a>-- << { \slurDown\fleft <d'-2 h-3>8( e'-4 fis'-1 gis'-3) } \\ { e,4 r } >> |

	<cis' a e,>2-- <h d e,>8\strum( cis' d' e') |
	<a d a,>4--\laissezVibrer r <g a,>--\laissezVibrer r |
	<< { g8-2( a-4 fis-1 e-4) fis( g e d) } \\ { a,2\p a, } >> |
	<< { e8( fis d cis) r2 } \\ { a, r } >> | 
	<< { g8( a f e) f( g e d) } \\ { a,2\p a, } >> |

	<< { e8( f d cis) h,4 r } \\ { a,2 a,4 s } >> \bar "||"
	<<
		{
			\slurDown
			d'8^"II"\strum(_\markup{\dynamic p \italic espr.} e'-4 cis'-1\> h-3) a4---1 gis---1\! |
			fis---4 e-- a--\< h-- |
			cis'8-1\strum( d'-2 e'-4 fis'-1)\! h2--\strum |
			a8-1(\<\strum h-3 cis'-1 dis'-2)\! e'2---1 |

			d'8(\>\strum e' cis' h) a4-- gis-- |
			fis-- e--\! <a>--\strum\< h-- |
			cis'8( d' e' fis')\! <e h>2-- |
		}
		\\
		{
			<e a,>4\strum s2. |
			a,4 r a, r |
			q4\strum r q\strum r |
			q\strum s2. |

			q4\strum s2. |
			a,4 r <d f,>\strum r |
			<e e,> s2. |
		}
	>>

	<fis cis fis,>8\< gis( a h)\! <cis' fis>4\laissezVibrer r |
	r2 <d' fis>4\laissezVibrer r4 |

	<cis' fis>4\laissezVibrer r4 <fis h>8(_\markup{\dynamic mp \italic espr.} cis' a gis) |
	<< { \slurDown fis2-- h8( cis' a gis) | fis2 } \\ { cis4-. fis,-. d-. s | cis-. fis,-. } >> <a d g,>4\strum\laissezVibrer r4 |
	r2 <d' g>4\laissezVibrer r |
	
	<c' g c> r << { \slurDown a8( h g f) | e2-- a8( h g f) | e2 } \\ { c4 s | c-. g,-. c-. s | h,-. e,-. } >> 
	h,8(_\markup{\dynamic p \italic "con spirito"} cis a, gis,) |
	fis,4-- e,-- a,--\< h,-- |

	cis-- e-- fis8( gis a h)\! |
	e2-- d8(\< e fis h)\! |
	cis2-- <d' gis e h,>4\strum\laissezVibrer r |
	<<
		{
			h8\> cis' a gis fis4-- e--\! |
			a-- h-- c'2-- |
		}
		\\
		{
			<e a,>4 s2. |
			q4 s d dis |
		}
	>>

	<cis' e>4\laissezVibrer r2. |
	<d' h e>4\laissezVibrer\strum r2. |
	<cis' a>4-. r h,8-1( cis-3)\pp\> a,-4 gis,-3 |
	fis,4-1--\! e,--\< a,-- h,-- |
	a,--\! r2. \bar "|."
}

bassesIIf = {
	\global
	\tkf
	\voiceTwo
}

\include "skelet.ly"
