\include "custom.ly"

\header {
	title = \markup \fontsize #3 \sans \bold "XVI"
	subtitle = \markup\tiny \raise #1 "(Preludium a fuga v e moll)"
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
	\time 3/8
	\key e \minor
	\magnifyStaff 0.8
}

tkf = {
	\time 2/2
	\key e \minor
}

liningp = {
	\tkp
	\repeat unfold 3 { s4.*4 | \break }
	\time 2/4
	\repeat unfold 2 { s2*5 | \break }
	\repeat unfold 2 { s2*4 | \break }
	\time 3/8
	\repeat unfold 2 { s4.*5 | \break }
	s4.*2 | \time 2/4 s2*2 | \break
	s2*7 | \break
}

melodyIp = {	
	\global
	\tkp
	\oneVoice

	\tempo\markup\main-tempo "Agitato e tempestoso."
	\tempo 4 = 90

	R4. |
	\set tupletSpannerDuration = #(ly:make-moment 3 8) \times 6/9
	{
		\override Fingering.extra-offset = #'(0 . 1) \once\override TupletBracket.positions = #'(2.5 . 2.5)
		g,16(\p-1 as,)-2 d-3 g,( as,) d g,(\< as,) d |
		\revert Fingering.extra-offset
		\repeat unfold 3 { h,( c) fis } |
		\repeat unfold 3 { d( es) a } |

		e( f h) f( fis c') fis( g cis') |
		g( b d') gis( a dis') a( b e') |
	}
	<f'-1 cis'-1 gis-1>4->\!_\markup{\dynamic "f" \italic "squillante"}^"VI" <gis'-1 e'-2 h-1>16.--^"½IV" <f' cis' gis>32--^"VI" |
	<dis'-1 h-1 fis-1>8->^"IV" <f'-1 cis'-1 gis-1>4->^"VI" |

	<dis' h fis>4->^"IV"\mf <fis' d'-2 a>16.--^"II" <dis' h fis>32--^"IV"\> |
	<cis' a e>8->^"II" <dis' h fis>4->^"IV" |
	<cis' a e>--^"II"\mp <e' c' g>16.--^"V" <cis' a e>32--^"II" |
	<h-0 g-0 d-0>8-- <cis' a e>4--^"II" \bar "||"
	
	\time 2/4
	<h g d>2~->_\markup\dynamic "pf" |
	q |
	\set tupletSpannerDuration = #(ly:make-moment 2 4) \times 8/12
	{
		\once\override TupletBracket.positions = #'(-7 . -6)
		\fdown <e-1>16\((\mp\< <f-2>) <h-0> <c'-1>( <des'-2>) <fis'-3> <g'-3>(\> <fis'-2>) <des'-1> <c'-1>( <h-0>) <f-2>\)\! \fleft|
		e16\((_\markup\italic "Simile" f) h c'( des') fis' g'( fis') des' c'( h) f\) |
		\repeat unfold 6 { e16\(( f) h c'( des') fis' g'( fis') des' c'( h) f\) | }
	}

	\transpose c c'
	{
		e,8 r <h-1 g-2 d-1>8.--^"VII"_\markup{\dynamic "mf" \italic "marcato"} q16-- |
		<a-1 fis-3 c-1>--^"V" <g-1 e-3 h,-2>-- <fis-2 d-3 a,-1>4.-- |

		r4 <d'-1 h-3 f-1>8.--^"X" q16-- |
		<c'-1 a-2 e-1>--^"IX" <h g-2 d>--^"VII" <a f-2 c-1>4.--^"V" |
		r4 \ottava #1 \osm <f'-1 d'-3 a-2>8.--\f q16-- |

		<e'-2 c'-3 g-1>-- <d' h f>--^"½X" <c' a e>8--^"½IX"\< <d' h f>--^"½X" <e' c' g>-- |
		<c' a e>2--\! \ottava #0 |
		<h a dis>8-> r \times 4/6 { <h,-3>16\( <fis-1>( <g-2>) <h-1> <fis'-3>( <g'-4>)\) } \bar "||"

		\time 3/8
		\set tupletSpannerDuration = #(ly:make-moment 3 8) \times 6/9
		{
			\ottava #1 \osm <g'-4>(\f\> <fis'-3> <c'-2>) \repeat unfold 2 { g'( fis' c') } \ottava #0 |
			\repeat unfold 3 { e'( dis' a) } |
			\repeat unfold 3 { c'( h fis) } |
			\repeat unfold 3 { a( gis d) } |

			f-4(\mf\> e-3 h,-2) e-4( dis-3 a,-1) es( d as,) |
			\once\override TupletBracket.positions = #'(5.5 . 4.5)
			d-3( cis-2 g,-0) cis-2( c-1 fis,-4) c-1( h,-0 f,-3) |
		}

		\key es \major
		<d b, f,>4--^"III"\mp <b, f, d,>16.--\< <d b, f,>32-- |
		<e c g,>8-- <f d b,>4-- |

		<g es b,>--\f\< <es b, g,>16.-- <g es b,>32-- |
		<a f c>8-- <b g es>4-- |
		<c' as es>--_\markup{\italic "più" \dynamic "f" }\! <as es c>16.--\< <c' as es>32-- |
		<d' b f>8-- <es' c' as>4-. \bar "||"

		\key e \minor \time 2/4
		\set tupletSpannerDuration = #(ly:make-moment 2 4) \times 8/12
		{
			\override Fingering.extra-offset = #'(-0.4 . 0.4)
			\fdown <d'-3>16\ff\>\( <h-2>( <ais-1>) <e-0> <h,-0> <ais,-2>\) <e,-1>\(\< <ais,-2> <h,-3> <e-0> <ais-1>( <h-2>)\) \fleft |
			\revert Fingering.extra-offset
			e'-3\>\( h( ais) e h,( ais,)\) e,\<\( ais,( h,) e ais( h) |
		}
		e'8\)\! r_\markup{\dynamic "ff" \italic "robusto e selvaggio"} <g e h,>8.-> q16 |

		\override Fingering.extra-offset = #'(0 . 1.3)
		<fis d a,>-- <e c g,> <dis h, fis,>8-- \phrasingSlurDown \times 4/6 { h,,16-1\( fis,-3 g,-0 h,-0 fis-1( g-2) } |
		\revert Fingering.extra-offset
		h8-4->\) r <h g d>8.-> q16-- |
		<a fis c>-- <g e h,>-- <fis dis a,>8-- \times 4/6 { h,,16\( fis, g, h, fis( g) } |
		h8->\) r <d' h f>8.->_\markup{\italic "sempre" \dynamic "ff"} q16-- |
		<c' a e>-- <h gis d>-- <a fis c>8 <h gis d> <c' a e> |
		<a fis c>4-> <g dis h,>-> |

		\phrasingSlurUp
		<e h, g,>8 r \once\override TupletBracket.positions = #'(-6.5 . -4.5) \times 4/6 { \fdown <e,-1>16\(\< <ais,-2>( <h,-3>) <e-0> <ais-1>( <h-2>)\) } |
		\times 8/12
		{
			\override Fingering.extra-offset = #'(-0.4 . 0.4)
			\once\override TupletBracket.positions = #'(-5.5 . -5.5)
			<e'-3>\( <h-2>( <ais-1>) <e-0> <h,-3>( <ais,-2>)\) <e,-1>\>\( ais,( h,) e ais( h)\) \fleft \revert Fingering.extra-offset |
			\once\override TupletBracket.positions = #'(-4.5 . -4.5)
			e'\(\!_\markup\italic "Simile" h( ais) e h,( ais,)\) e,\( ais,( h,) e ais( h) |
		}
		e'8\) r <e b, fis,>->\ff r |
		<e h, g,>-> r4. \bar "|." \pageBreak
	}
}

bassesIp = { \global \tkp \voiceTwo }

melodyIIp = {	
	\global
	\tkp
	\oneVoice

	\override TupletBracket.positions = #'(2.7 . 2.7) \set tupletSpannerDuration = #(ly:make-moment 3 8) \times 6/9
	{
		\repeat unfold 12 {  \repeat unfold 3 { e,16( f, h,) } | }
	}
	\revert TupletBracket.positions

	\bar "||"
	\time 2/4
	\set tupletSpannerDuration = #(ly:make-moment 4 8) \times 8/12
	{
		\override Fingering.extra-offset = #'(0 . 2)
		e,-0\((\< f,-1) h,-2 c-2( des-3) fis-4 g-4(\> fis-3) des-2 c-3( h,-2) f,-1\)\! |
		e,\((_\markup\italic "Simile" f,) h, c( des) fis g( fis) des c( h,) f,\) |
		\revert Fingering.extra-offset
	}
	e,8-. r <e h,>8.--_\markup{\dynamic "mf" \italic "marcato"} q16-- |

	<d a,>16-- <c g,> <h, fis,>4.-- |
	e,8-- r <g e h,>8.-- q16-- |
	<fis d a,>16-- <e c g,>-- <dis h, fis,>4.-- |

	e,8 r <h g e>8.\f q16-- |
	<a fis d>-- <g e c>-- <fis d h,>8-- <g e c>--\< <a fis d>-- |
	<h g e>4-> <d' h g>->\! |
	
	<c' a f>-> <h g d>-> |
	\times 8/12
	{
		\once\override TupletBracket.positions = #'(5.5 . 5.5)
		g,16\(\mp\<-1 cis-2( d-3) g-1( as-2) cis'-3 d'-3(\> cis'-2) as-1 g-1( d-0) cis-2\)\! |
		g,16\(_\markup\italic "Simile" cis( d) g( as) cis' d'( cis') as g( d) cis\) |
		\repeat unfold 5 { g,16\( cis( d) g( as) cis' d'( cis') as g( d) cis\) | }
	}

	\times 4/6 { <fis,-2>( <dis-1> <a-3> <as-3> <h-4> <fis'-1>) } g'4 \bar "||"
	
	\time 3/8
	\set tupletSpannerDuration = #(ly:make-moment 3 8) \times 6/9
	{
		\override TupletBracket.positions = #'(2.7 . 2.7)
		<e,-0>16( <f,-1> <h,-2>) \repeat unfold 2 { e,( f, h,) } |
		\repeat unfold 3 { \repeat unfold 3 { e,( f, h,) } | }
		e,16(_\markup{\italic "sempre" \dynamic "mf"} f, h,) \repeat unfold 2 { e,( f, h,) } |
		\repeat unfold 7 { \repeat unfold 3 { e,( f, h,) } | }
		\revert TupletBracket.positions
	}

	\bar "||"
	\time 2/4
	\set tupletSpannerDuration = #(ly:make-moment 4 8) \times 8/12
	{
		\once\override TupletBracket.positions = #'(4 . 4)
		e,16-0\(\f\< h,-1( c-2) des-2 fis-3( g-4) as-4(\> g-3) fis-2 des-3( c-2) h,-1\)\! |
		e,16\(_\markup\italic "Simile" h,( c) des fis( g) as( g) fis des( c) h,\) |
	}
	e,8-> r <g e h,>8.-> q16-- |

	<a fis c>8_\markup\italic "sempre tenuto" <h fis dis> h, e, |
	<g h, e,>-> r <g e h,>8.-> q16 |
	<a fis c>8 <h fis dis> h, e, |
	<g h, e,>-> r <gis e h,>8.-> q16 |
	<a fis c>16 <h gis d> <c' a e>8 <h gis d> <a fis c> |
	<c' a e>4-> <dis' h f>-> |

	\override Fingering.extra-offset = #'(0 . 1.2)
	<e' h g>8-> r \times 4/6 { g16-0\( fis-2( f-2) e-1 c-2( h,-1)\) } |
	\revert Fingering.extra-offset
	\times 8/12
	{
		\once\override TupletBracket.positions = #'(3.6 . 3.6)
		e,-0\( h,-1( c-2) e-1 eis-2( fis-3)\) g-0\( fis-3( eis-2) e-1 c-2( h,-1)\) |
		e,\( h,( c) e eis( fis)\) g\( fis( eis) e c( h,) |
	}
	e,8\) r <e c e,>-> r |
	<e h e,> r4. \bar "|."
}

bassesIIp = {
	\global
	\tkp
	\voiceTwo

}

liningf = {
	\tkf

	s1*6 | \break
	s1*7 | \break
	s | \break
	s1*2 | \time 1/2 s2 | \time 2/2 s1*3 | \break
	s1*5 | \break
	s1*4 | \break
	s1*6 | \break
	s1*4 | \time 1/2 s2 | \time 2/2 s1 | \break
	s1*6 | \break
	s1*7 | \break
}

melodyIf = {	
	\global
	\tkf
	\oneVoice

	\tempo\markup\main-tempo "Molto moderato (Cupo e mesto)."
	e4---1\(_\markup{\dynamic p \italic "espr."} f---2 h---3\< c'---4 |
	\transpose c c'
	{
		fis-1_\markup\italic "sempre tenuto" g-2 cis'-3 d'-4\! |
		es'4.-4\) es'8\> d'-3( c'-1) h4-1\! |
		c'4.-2 c'8-4\> h-3( a-1) g4-4\! |

		a4.-1_\markup{\italic "sempre" \dynamic p} a8-4 g-2( fis-1) e4-4 |
		fis4.-1 fis8-1 e-4( d-2) cis4-1 |
		d2-2 c\> |
		h, a,\! |

		<e g,>4 r e,\p\< f, |
		h, c fis g |
		<a-2 g-4 c-1>2 <h-4 g-3 d-2> |
		<c'-1 a-3 es-1>^"VIII" <d'-4 g-2 d-1>\! |

		<<
			{ es'4.-4 es'8 d'( c') h4 | c'4. c'8 h( a) gis4 | }
			\\
			{ \fleft <as-2 es-1>2_\markup{\dynamic "mp" \italic "espr."} <g d> | <g c>\> d\! | }
		>>
		<a e c> r8_\markup{\dynamic p \italic "leggero e staccato"} e'8-.-4[ r a-.-2 |
		r h-4 r e-1 r fis-4 r h,-1] |

		<es-1 c-2>2 <e c>\< |
		<f c as,> <g c g,>\! |
		r8 fis'-.-4_\markup{\italic "sempre" \dynamic p \italic ", staccato e leggero"}[ r h-.-2 r c'-.-4 r fis-.-2 |
		r fis r h,-1 r c-2 r fis,-1] |

		r fis'[ r h r c' r fis |
		r fis r h, r c r fis,] |
		\time 1/2 <e h, g,>2\laissezVibrer\fp |
		\time 2/2 g'4--^\markup{\italic "(Sempre tenuto e calmo)"}_\markup{\dynamic p \italic "espr."} fis'\> c' h |

		f e b, a,\! |
		<< { gis,4.\mp gis,8 a, h, c4 | h,4. h,8 c d e4 } \\ { e,2 fis, | gis, a, } >> |
		r8 h,,\p\<[-.-1 r fis,-.-3 r e,-.-1 r h,-.-3 |

		r a,-.-1 r e-.-3 r d-.-1 r a-.-4] |
		r\mf a-.-4^\markup\italic "sempre staccato" a g-2 f-4 e-3 d4---1 |
		r8 a a g f e d4-- |
		r8 <e'-4 e-1>\f q <d' d> <c' c> <h h,> <a a,>4-- |

		r8 <e' e> q <d' d> <c' c> <h h,> <a a,>4--|
		<b b,>8->\sf\strum f'-4[\mf\> r a-1 r b-4 r e-2 |
		r8 f-4 r a,-1 r b, r f,]\! |
		<dis-4 a,-1 fis,-3 h,,-1>4^"II"\sf\strum c,-1_\markup{\dynamic f \italic "marcato e tenuto"} fis,-2 g,-3 |

		cis-1 d-2 gis-3 a-4 \bar "||"\mark\markup\small\musicglyph #"scripts.ufermata"
		r2 <g' h>4--\p <fis' b>\>-- |
		<c' e>-- <h dis>-- <f a,>-- <e gis,>--\! |
		<< { dis4.-- dis8 e( fis) g4 | fis4.-- fis8 g( a) h4 } \\ { <h, a,>2 <h, g,> | <dis a,> <e h,> } >> |

		h,,4---1\mp\< c,---2 fis,---3 g,---4 |
		cis---1 d---2 gis---3 a---4\! |
		<<
			{
				\override TextSpanner.bound-details.left.text = "(sostenendo un poco"
				\override TextSpanner.bound-details.right.text = ")"
				\textSpannerUp
				h4.--\mf\startTextSpan h8\> a( g) fis4\! | g4.-- g8\> fis( e) dis4\!\stopTextSpan
			}
		\\ { <d h,>2 <e a,> | <e h,> h, } >>
		\time 1/2 <e h,>2--\mp |
		\time 2/2 \key a \minor
		r2 e,4--\<_\markup{\dynamic p \italic ", sempre tenuto"} f,-2 |
		h,-1 c-2 <e-3 h,-2> <f c>\! |

		<e h,>2 e,4\< f, |
		h, c <e h,> <f c>\! |
		<e a,>2 e,4\< f, |
		h, c e <f c>\! |

		<e-3 a,-1 f,-2>2 e,4\< f, |
		h, c <e h,> <f c a,>\! |
		\tempo\markup\sans\small\bold "(Quasi recitativo)"
		\key e \minor
		<e-0 h,-0 g,-0>1--~ | q |
	}
	
	<g h, e,>--\strum_\markup{\dynamic p \italic "ma sonoro"} |
	q--\strum |
	<h h, e,>--\strum |
	<g h, e,>--\strum^\fermata \bar "|."
}

bassesIf = { \global \tkf \voiceTwo }

melodyIIf = {	
	\global
	\tkf
	\oneVoice

	R1*4 |

	h,4---1_\markup{\dynamic p \italic "espr."} c---2\< fis---3 g---4 |
	cis'-1_\markup{\italic "sempre tenuto"} d'-2 gis'-3 a'-4\! |
	b'4.-4 b'8\> a'8-3( g'-1) fis'4-4\! |
	g'4.-4 g'8\> fis'-3( e'-1) dis'4-1\! |

	<< { <e' h g>4\laissezVibrer } \\ { e,4\p } >> f,\< h, c |
	fis g cis' d'\! |
	es'4._\markup{\dynamic "mp" \italic "espr."} es'8\> d'( c') h4\! |
	c'4. c'8\> h( a) g4\! |

	<c' fis>2 <h f> |
	<a dis> <e gis> |
	a,4_\markup{\dynamic "mp" \italic "espr."} b,\< e f |
	h c' fis' g' |

	as'4.\mf as'8\> g'( f') e'4 |
	f'4. f'8 e'( d') c'4\! |
	<h h,>_\markup{\dynamic "mp" \italic "espr."} c fis g |
	a, b, eis f |

	g,\< gis, dis e |
	fis, g, d dis\! |
	\time 1/2 <e h, e,>2\laissezVibrer
	\time 2/2 r8_\markup{\dynamic p \italic "leggero e staccato"} e,[\< r h, r a, r e |

	r d r a r g r d']\! |
	r e'-4\> e' d'-2 c'-2 h a4---4\! |
	r8 e' e' d' c' h a4--\! |
	<c''-1 a'-3 dis'-1>4-._\markup{\dynamic "mf" \italic "espr."} h'-. <f' dis' gis>-.\> e'-. |

	<b g cis>-- a-- <es cis fis,>\!-- d-- |
	<<
		{
			cis4.--\mf cis8\< d( e) f4\!
			e4.-- e8\< f( g) a4 |
			gis4.--\f gis8\< a( h) c'4\! |
			h4.-- h8 c'( d') e'4 |
		}
		\\
		{
			a,2 b, | cis d | e f | gis a |
		}
	>>
	<f' b d>4--\sf\strum e--_\markup{\dynamic f \italic "marcato e tenuto"} a b |
	e' fis' a' h' |
	<h' h>8\sf\strum-> fis''\mf\>[ r h' r c'' r fis' |

	r g' r d' r dis' r h]\! \bar "||"
	e,4_\p\< f, h, c |
	fis g cis' d'\! |
	es'4.-- es'8\> d'( c') h4\! |

	c'4.-- c'8\> h( a) g4\! |
	r2 <c'' e'>4--\mp\> <h' dis'>-- |
	<f' a>_\markup\italic "sempre tenuto" <e' gis> <b d> <a cis>\! |
	<< { h2 c'4. c'8 | h( a) g4 a4.-- a8 } \\ { <fis h,>2\mf <g c> | <g cis> dis } >> |

	\time 1/2 << { g8( fis) e4 } \\ { e2 } >> |
	\time 2/2 \key a \minor
	e,4\p\< f, h, c | e f e2\! |

	<< { d2\sf->\laissezVibrer } \\ { e,4 f, } >> h,\< c |
	e f e d\! |
	<< { c2\sf->\laissezVibrer } \\ { e,4 f, } >> h,\< c |
	e f e\> c\! |

	<< { a,2\sf->\laissezVibrer } \\ { e,4 f, } >> h,\< c |
	e f e\> c\! |
	\key e \minor
	e,\<_\markup{\dynamic p \italic "espr. e doloroso"} f, h, c |
	fis g cis' d'\! |

	e'4.--\mf e'8\> d'( c') h4 |
	c'4.--\mp c'8\> h( a) g4 |
	a4.--\p a8\> g( fis) e4 |
	fis4--\pp e2.--^\fermata \bar "|."
}

bassesIIf = {
	\global
	\tkf
	\voiceTwo
}

\include "skelet.ly"
