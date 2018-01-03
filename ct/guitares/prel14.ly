\include "custom.ly"

\header {
	title = \markup \fontsize #3 \sans \bold "XIV"
	subtitle = \markup\tiny \raise #1 "(Preludium a fuga v d moll)"
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
	\key d \minor
}

tkf = {
	\time 4/4
	\key d \minor
}

liningp = {
	\tkp
	s1*4 | \break
	s | \break
	s1*6 | \break
	\repeat unfold 3 { s1*5 | \break }
	s1*6 | \break
	s1*5 | \break
	s1*6 | \break

}

melodyIp = {	
	\global
	\tkp
	\oneVoice

	\set Staff.instrumentName = \markup\center-column{"Kytara I" \line{\concat{"(6" \small\raise #1 \underline "a"} "= D)"}}
	\tempo \markup \main-tempo \line{ "Grave —" \fontsize #-1 "sostenuto e pomposo." }

	\ottava #1 \osm a''4.\f-> <d''-1 a'-1 f'-1>16^\markup{X}\>( <cis'' gis' e'>^\markup{IX} <d'' a' f'>4.--) \ottava #0 <a'-1 f'-2 d'-3>16( <gis' e' cis'> |
	<a' f' d'>4.--) <d'-3 a-1 f-2>16( <cis' gis e> <d' a f>4.--) d'16\((\p-2 cis') |
	d'4.--\) d'16\(( cis') d'4..--\)^\< d'16 |
	<f' h>2--^\f^\> d'4.\! d'16\((\mp cis') |

	d'4.--\) d'16( cis' d'4..--)^\< d'16 |
	<f' h>2--^\f^\> d'4. <f'-2 d'-3>16(\mf <e' cis'>\< |
	<f' d'>4.--) q16( <e' cis'> <f' d'>4..--) q16-- |
	<a'-1 d'-3>2--\! <f'-2 d'>-- |
	<<
		{
			\override TextSpanner.bound-details.left.text = "a piacere — quasi recitativo"
			<c''~ f'\laissezVibrer c'\laissezVibrer>--\strum\f\startTextSpan \slurDown c''8^\markup{V}( a'-1\> f'-2 <g'-4>)\! |
			
			\fleft <a'-1>\(( <f'-2> <c'-1> <e'-1>) f'( c' <a-3> <h-0>\)) |
			<cis'-2 a-3>2--\laissezVibrer\strum r |
			R1 |
			r2.. d''16-2\mp\stopTextSpan\(( cis''16) |
			d''4.-1--\)^\markup\column{\italic "a tempo (calmo)" "X"} d''16\(( cis'') d''4..--\)^"IX"\< d''16\! |

			\fright <f''-4>2--^"VIII"\strum\> \fleft <d''-4>4. a'16-2\(( gis'16-1) |
			<a'-1>4.--\)\p a'16-3\(( gis'-1) a'4..---3\) a'16\> |
			<c''-3>2--\strum <a'-1>4. d'16\((\!_\markup{\italic "più" \dynamic "p"} cis'16) |
			<d'-1>4.--\) d'16\(( cis')\> <d'-1>4..\)^"III" d'16 |
			<f'-1>2--\! <d'-4>-- |
		}
		\\
		{
			s1*5 |
			\fleft
			<a'-1 f'-1>2 <gis' e'> |
			\fright <g'-1 es'-1>\strum \fleft <f'-1 d'-2> |
			<e'-1 cis'-2> <es' c'> |
			<d'-1 b-2>\strum <c'-1 a-3> |
			<h-2 g-3> <ais-1 fis-2> |
			<a-2 f-3> <gis-1 e-2> |
		}
	>>

	\tempo \markup \sans \bold \tiny "(Un poco Andante)"
	<a' c' f>1--\laissezVibrer\strum |
	r4_\markup{\dynamic "mp" \italic "espr. cantando"} <a'-1 f'-2 c'-1>4--^"V"(\< <ais' fis' cis'>--^"VI" <c'' gis' dis'>--^"VIII" |
	<a' f' c'>2--^"V"\! <g' es' b>--^"III"\laissezVibrer) |
	r4\< <b' fis' cis'>--^"VI"( <c'' gis' dis'>--^"VIII" <des''-1 b'-3 f'-2>--\! |
	<ais' fis' cis'>2--^"VI"\> <a' f' c'>^"V")\laissezVibrer\!

	r4 <a' f' c'>--^"V"\(\< <ais' fis' cis'>--^"VI" <c'' gis' dis'>--^"VIII"\! |
	<dis'' h' fis'>2--^"XI"\> <des''-1 b'-3 f'-2>-- |
	<ais' fis' cis'>--^"VI" <c'' gis' dis'>^"VIII"-- |
	<a' f' c'>1^"V"\)\laissezVibrer\! |

	R |
	\ottava #1 \osm a''4.->_\markup{\dynamic "p" \italic "ma sentito"} d''16-2(\> cis''-1 d''4.--) \ottava #0 a'16-2( gis'-1 |
	a'4.)-- d'16(\! cis' d'4.--) r8 |
	\repeat unfold 2
	{
		\ottava #1 \osm a''4.-> d''16-2(\> cis''-1 d''4.--) \ottava #0 a'16-2( gis'-1 |
		a'4.)-- d'16(\! cis' d'4.--) r8 |
	}

	\override TextSpanner.bound-details.left.text = "a piacere — quasi recitativo"
	\ottava #1 \osm a''2~_\markup{\dynamic "p" \italic "dolcissimo"}\startTextSpan a''8\((\> e''-3 <c''-4> <d''-1>) |
	<e''-3>( <c''-4> <g'-3> <h'-4>) c''(\! g' e' fis'-1) \ottava #0 |

	gis'2\)~ gis'8\(( e' c'\> d') |
	e'( c' gis a) h( gis d f) |
	e4-- d--\! h,-- c--\)\stopTextSpan |

	\tempo-primo

	<a e c>2--_\markup{\dynamic "pp" \italic "dolce e grave"}\< <h g d>-- |
	<c' as es>--^"I" <cis' a e>--^"II" |
	<d' b f>--^"III"\! <dis' h fis>--^"IV" |
	<<
		{
			\fleft 
			\override TextScript.outside-staff-priority = #200
			<e' c' g>--^"V" <eis' cis' gis>4--\laissezVibrer^"VI"^\markup\italic "poco rit." r8 d'16(\mp cis' |
			d'4.)^\markup\italic "a tempo" d'16( cis' d'4..)\< d'16\! |
			f'2\> d'4 r8 a'16\p( gis' |
			a'4.) a'16( gis' a'4..) a'16 |
			c''2^"VIII"\> a'4 r8 d''16( cis''\! |
			<d''-1>4.--)_\markup{\italic "più" \dynamic "p"} d''16(\> cis'' d''4..-1) d''16 |
			\ottava #1 \osm <f''-4>2--^"X" <d''-2>--^"IX" |
			<a''-4 d''-2 f'-1>1--\laissezVibrer\strum\pp |
		}
		\\
		{
			\fleft
			s1 |
			<a f>2 <gis e> |
			<g es> <f d> |
			<f' d'> <e' cis'> |
			<es' c'> <d' h> |
			<b'-4 g'-3> <b'-3 fis'-2> |
			<a'-1 f'-1> <gis'-1 e'-1> |
			s1 |
		}
	>>

	R1 \bar "|." \pageBreak
}

bassesIp = { \global \tkp \voiceTwo }

melodyIIp = {	
	\global
	\tkp
	\voiceOne

	\set Staff.instrumentName = \markup\center-column{"Kytara II" \line{\concat{"(6" \small\raise #1 \underline "a"} "= D)"}}
	d,4.-> a,16(-1 b,-2 a,4.--) d16( es |
	d4.--) a16( b a4.--) r8 |
	<d'-1 b-1 g-3>2-- <c'-1 a-2 f-3>-- |
	<h-0 gis-1 e-2>-- <c' a f>-- |

	<b-1 g-3 es-4>\mp-- <a-1 f-2 d-4>-- |
	<as-1 f-3 des-4>-- <a-1 f-2 d-4>-- |
	<a-2 f-4 c-3>--\mf <a-2 f-3 h,-1>-- |
	<a-2 f-3 b,-1>1-- |
	<c' f a,>2\laissezVibrer\strum r |

	R1 |
	\phrasingSlurDown \slurDown
	<cis'-2~ g-1\laissezVibrer a,\laissezVibrer>2\strum^\mf cis'8\(( a-3 f-4 g-1)^\> |
	a-3( f-4 cis-1 d-2) e-4( cis g,-2 b,-4) |
	a,4--^\mp g,--^\> e,-- f,-- |
	d,1_-\)\laissezVibrer\!^\markup{\dynamic "p" \italic "ma sonoro"} |

	\repeat unfold 5 { d,\laissezVibrer | }
	
	\repeat unfold 4
	{
		f,4.--\< c16( h, c4.--) f16( e |
		f4.--) c'16( h c'4.--)\! r8 |
	}
	f,4.-- c16( h, c4.--) f16( e |

	f4) <a-1 f-3 c-2>--\(_\markup{\dynamic "mp" \italic "espr. cantando"} <b fis cis>-- <c' gis dis>-- |
	<a f c>2--\> <as f h,>\laissezVibrer--\)\! |
	r4 <h gis d>--(\< <c' gis e>-- <d' gis eis>--\! |
	<h e d>2--\> <a e c>--\!) |

	r4\< <c' a e>--( <d' a f>-- <e' a g>-- |
	<g' c' a d>2--\mf <f' c' a d>--\> |
	<d'-3 a-1 f-2 g,-4>2--\strum <e'-4 h-2 f-1 g,-3>--\strum\! |
	<c' g e c>1\laissezVibrer\strum) |
	R1 |

	<d' gis e h,>1\strum |
	R |
	r2.. a,16(_\markup{\dynamic "p" \italic "ma sentito"} gis, |
	a,4.--) a,16( gis, a,4..--)\< a,16 |
	c2--\!\> a,4.\! a,16( gis, |
	a,4.--) a,16( gis, a,4..--)\< a,16 |
	c2--\!\> a, |
	d,1_-\!_\markup{\dynamic "p" \italic "ma sonoro"} |
	\repeat unfold 5 { d,1\laissezVibrer | }

	d,4.-- a,16( gis, a,4.--) d16( cis |
	d4.--) a16( gis a2) \bar "|."
}

bassesIIp = {
	\global
	\tkp
	\voiceTwo

}

liningf = {
	\tkf
	s1*2 | \time 2/4 s2 | \time 4/4 s1*2 | \break
	s1*5 | \break
	\time 2/4 s2 | \time 4/4 s1*4 | \break
	s | \break |
	s1 | \time 2/4 s2 | \time 4/4 s1*2 | \break
	s | \time 2/4 s2 | \time 4/4 s1 | \break

	\repeat unfold 2 { s1*5 | \break }
	s1 | \time 2/4 s2 | \time 4/4 s1*2 | \break
	s1*4 | \break
	\time 2/4 s2 | \time 4/4 s1*3 | \break
}

melodyIf = {	
	\global
	\tkf
	\oneVoice

	\tempo\markup\main-tempo "Mosso e deciso."

	\set Staff.instrumentName = \markup\center-column{"Kytara I" \line{\concat{"(6" \small\raise #1 \underline "a"} "= D)"}}
	\ottava #1 \osm a''4.--_\markup{\dynamic "f" \italic "risoluto"} d''16( cis'' d''4.--) a'16(\> gis' |
	a'4.--) \ottava #0 d'16( cis' d'2--~) |
	\time 2/4 d'8-2\mf\> f'-1-. e'-4-. d'-2-. |
	\time 4/4 c'-2-. h-1-. a4.---4\! f'8-2-.\> e'-1-. d' -3-. |

	c'-1-. h-1-. a4.-4--\! c'8-2-.\> h-1-. a-4-. |
	g-2-. fis-1-. e4---4 dis---2\mp h,---2 |
	e---3\< d-- c-- h,-- |
	a,-- as,-- f,-- e,-- |

	d,8-- f'-.\mf e'-.\> d'-. c'-. h-. a4--~ |
	a8 f'-.\> e'-. d'-. c'-. h-. a4--~\! |
	\time 2/4 a8 f'-. e'-. d'-.\> |
	\time 4/4 c'16\(( d') c' h a4.\)\! f'8-.\> e'-. d'-. |

	c'16\(( d') c' h a4.\)\! f'8-.\> e'-. d'-. |
	g-. fis-. e4--\!\< h--\!\> h,-- |
	e8-. f-. e-. d-. cis-.\!\< a,-. h,-. cis-. |
	<d d,>->\!_\markup{\dynamic "ff" \italic "marcato"} a,16( gis, a,4.--) d16( cis d4--~) |

	d8\< a16( gis a4.--)\! d'16( cis' d'8--) d'16(\f cis' |
	d'8_\markup\italic "marcato e selvaggio") d'16( cis' d'8.\<) d'16( f'4--\!\> <d'-2>8)\! <f'-2 d'-1>16( <e' cis'> |
	<f' d'>8) q16( <e' cis'> <f' d'>8.)\< q16( <a' cis'>4--\!\> <f' d'>8\!) <d'' f' d'>-. |

	\new Voice << { c''8-3\f\> h' a'-1 g'-1\! s\< g' a' d''\! } { \repeat unfold 8 { <f' d'>8-. } } >> |
	\time 2/4 \new Voice << { c''\> h' a' g'\! } { \repeat unfold 4 { <f' d'>8-. } } >> |
	\time 4/4 <a' e' c'>4--\mf <g' d' h>\> <f' c' a>--\> <e' h gis>-- |
	<f' c' a>--\! <e' h gis>--\< <d' gis e>-- <c' a e>-- |

	r8\! \new Voice << { <a'-4>\f\> g' f'^"I"\!\< e' d' s d'\! } { <c'-1 a-2> \repeat unfold 6 { q-. } } >> |
	<e' cis' a>-._\markup{\italic "più" \dynamic "f"} <a' c' a>-. <g' c' a>-.\> <f' b a>-. <e' a>-. <d' b a>-.\! <cis' a>-.\< <d' b a>-. |
	\time 2/4 <e' cis' a>-. <f' d' a>-. <g' e' a>-.\! <a' g>-. |

	\time 4/4 \tempo\markup\sans\bold "Un poco più sostenuto."
	<d''-1 a'-1 f'-1>4.->^"X"\ff <a'-1 f'-1 d'-1>16 <gis' e' cis'> <a' f' d'>4.-- <f'-1 d'-3 a-2>16 <e' cis' gis> |
	<f' d' a>4.-- <d' a f>16\> <cis' gis e> <d' a f>2--\! |
	r8\f <a'-1 f'-2 a-3>-.\> <g'-2 e'-4 a-1>-. <f'-1 d'-3 h-4>-.\! <e'-0 c'-1 a-2>-.\< <f' d' a>-. <g' e' a>-. <a' f' a>-.\! |

	\new Voice << { <g' e'>\> <f' d'> <e' c'> cis'\!\< <d' b> <e' cis'> <f'-4 g-3>\! } { \repeat unfold 8 a8-. } >> |
	<d' b f>4.--_\markup{\dynamic "mf" \whiteout \italic "espr. e appassionato"}^\markup\italic "(stringendo un poco)" q8-- <c' g e>4.-- q8-- |
	<f' c' a>4.--\< q8-- <e' h gis>4.-- q8-- |
	<a' f' c'>4.--\f^"V" q8-- <g' d' b>4.--^"III" q8-- |

	<c''-1 g'-1 e'-2>4.--^"VIII"\< q8-- <b' f' d'>4.--^"VI" q8 |
	\ottava #1 \osm <d''-1 a'-1 f'-1>4->^"X"_\markup{\italic "più" \dynamic "f"}\! <cis''-3 g'-1 e'-2>-> <f''-1 cis''-3 a'-2>-> <e''-3 b'-1 g'-2>-> |
	<d''-1 a'-1 f'-1>4->^"X" <cis''-3 g'-1 e'-2>-> <f''-1 cis''-3 a'-2>-> <e''-3 b'-1 g'-2>-> |
	<f''-4 b'-2 f'-1>4.->\strum\ff\> <d''-1 a'-1 f'-1>16^"X"-. <cis'' gis' e'>^"IX" <d'' a' f'>4.-> \ottava #0 <a'-1 f'-2 d'-3>16-. <gis' e' cis'>-. |

	<a' f' d'>4.-> <d'-3 a-1 f-2>16-. <cis' gis e>-.\! <d' a f>4-> r8 <d''-1 f'-1 d'-3>8\ff |
	\time 2/4 \new Voice << { c''8\> h' a' g'\! } { \repeat unfold 4 <f' d'>8-- } >> |
	\time 4/4 \new Voice << { s\< g' a' d''\! c''\> h' a' g'\! } { \repeat unfold 8 q8-- } >> |

	<a' e' a>4-._\markup{\dynamic "f" \italic "marcato"} r8 a16( gis a4--) r8 a,16( gis, |
	a,4--\!) r2 <a' cis' g>8-> <d'' a' f'>16\ff <cis'' gis' e'> |
	\ottava #1 \osm <d'' a' f'>8--_\markup\italic "marcatissimi i due temi" q16-. <cis'' gis' e'> <d'' a' f'>8.--\< q16-. <f''-1 c''-1 a'-2>4--^"XIII"\!\> <d'' a' f'>8 <f'' c'' a'>16\! <e'' h' gis'> |

	<f'' c'' a'>8-- q16\< <e'' h' gis'> <f'' c'' a'>8. q16 <f'' c'' a' g'>4-- <f'' c'' a'>8 <f'' a' f'>\f-- |
	\new Voice << { e''8\> d'' c'' b' s\!\< h' c'' d''\! } { \repeat unfold 8 <a' f'>8-- } >> \ottava #0 |
	\time 2/4 \new Voice << { c''\> h' a' g'\! } { \repeat unfold 4 <f' d'>-- } >> |

	\time 4/4 <a' e' c'>8--\mf\<^"V" <b' f' d'>--^"VI" <c'' g' e'>--^\markup{\halign #-.1 "VIII"} <d'' a' f'>--^"X"\! <c'' g' e'>\>-- <b' f' d'>-- <a' e' c'>-- <g' d' b>--\!^"III" |
	<f' c' a>--\<^"I" <g' d' b>-- <a' e' c'>-- <b' f' d'>--\! <a' e' c'>--\> <g' d' b>-- <f' c' a>-- <e' b g>-- |
	<d'-4 a-2 f-3>--\!_\markup{\dynamic "mf" \italic "espr."} <e'-4 b-1 g-3>--\< <f'-1 c'-1 a-2>--^"I" <g'-3 d'-2 as-1>--\! <f'-1 des'-2 g-0>--\> <e'-0 c'-2 fis-1>-- <d' h fis>-- <c' b e>--\! |

	\override TextSpanner.bound-details.left.text = "rit."
	<a es>4--\<\startTextSpan <c' as d>-- <d' as e>-- <e' cis' g>--\!\stopTextSpan |
	\override TextSpanner.bound-details.left.text = "più lento — funebre"
	<d' a f>2..\startTextSpan q16-.\p <cis' gis e>-. |
	<d' a f>8-. q16-. <cis' gis e>-.\< <d' a f>8. q16 <f'-1 cis'-2 gis-1>2\f\>\stopTextSpan |
	\tempo\markup\main-tempo "Lento." <d'-3 a-1 f-2>--\p q--\pp \bar "|."
}

bassesIf = { \global \tkf \voiceTwo }

melodyIIf = {	
	\global
	\tkf
	\oneVoice
	\set Staff.instrumentName = \markup\center-column{"Kytara II" \line{\concat{"(6" \small\raise #1 \underline "a"} "= D)"}}

	R1*2 |
	\time 2/4 R2 |
	\time 4/4 \ottava #1 \osm e''4.--_\markup{\dynamic "f" \italic "risoluto" } a'16( gis' a'4.--)\> \ottava #0 e'16( dis' |

	e'4.--) a16( gis a2--~)\! |
	a4. c'8-.\mf\> h-. a-. g-. fis-. |
	g16-0\((\!\< a-2) g fis-4 e8-2\) f-4-. gis-1-. a-. h-. c'-. |
	d'16-1\((\!\> e'-3) d' c' h8-2\)\!\< c'-3-. d'-. e'-. fis'-. gis'-. |

	<a' d' f>4.--^"III"\strum\!_\markup{\dynamic "f" \italic "marcato"} d'16\>( cis' d'4.--) a16( gis |
	a4.--) d16( cis d4.--)\!\< f8-.\! |
	\time 2/4 e8-.\> d-. c-. h,-.\! |
	\time 4/4 a,4.--_\markup{\dynamic "f" \italic "marcato"} e16(\< d e4.--) a16( gis|

	a4.--) e'16( dis' e'2--~)\! |
	e'8\mf\> g'-. fis'-. e'-. dis'-.\! h-. cis'-.\< dis'-. |
	e'2-- <a' e' a>2--\f^"V" |
	<a' d' f>4.--_\markup{\dynamic "ff" \italic "marcato"} d'16( cis' d'4.--) a16( gis |

	a4.--\>) d16( cis d4.--)\! r8 |
	<b g>4--\f\> <a f>-- <g e>-- <f d>-- |
	<b g>4--\! <a f>-- <g e>-- <f d>-- |

	d,4.--_\markup{\dynamic "f" \italic "marcato"} a,16\<( gis, a,4.--) d16( cis |
	\time 2/4 d4.--)\! a,16( gis, |
	\time 4/4 a,8) a,16( gis, a,8.) a,16-1 c4---4 a,8 c16-4( h, |
	c8) c16( h, c8.) c16 e4---1 c8 <a, a> |

	\new Voice << { g f e d c d e a | g_\markup{\italic "più" \dynamic "f"}\> f e d\! cis\< d e a\! } { \repeat unfold 16 a,8-. } >> |
	\time 2/4 \new Voice << { g\> f e cis\! } { \repeat unfold 4 a,8-. } >> |

	\time 4/4 <d d,>->_\markup{\dynamic "ff" \italic "marcato"} d16( cis) <d d,>8.-> q16-> <f f,>4-> <d d,>8-> f16 e |
	<f f,>8-> f16 e q8.-> q16-> <a a,>4-> <f f,>8 <d' d>-. |
	<c' c>-. <h h,>-. <a a,>-. <gis gis,>-. << { \phrasingSlurDown \slurDown a16---1( h-2\() a g f8-.\) e-. } \\ { a,2-- } >> |

	<< { \slurDown d8 e f a g16-- a( g f e8) cis } \\ { a,2 a, } >> |
	r8 a16( gis a4--) r8 d16(\> cis d4--) |
	r8 a,16( gis, a,2--)\! d,4-- |
	r8 a16(\f\> gis a4--) r8 d16( cis d4--)\! |

	r8 a,16( gis, a,2--) d,4-- |
	r8 a16(_\markup{\italic "più" \dynamic "f"} gis a4--)\> r8 d16( cis d4--) |
	r8 a,16( gis, a,2--)\! d,4-- |
	<d, a, d>8-> a,16-. gis,-. a,4.-> d16\< cis d4~ |

	d8 a16 gis a4.\! d'16 cis' d'8 <h,-1 f-2 a-3> |
	\time 2/4 \new Voice << { c8 d e, d } { \repeat unfold 4 <a f>-- } >> |
	\time 4/4 \new Voice << { d c h, a, g, a, h, c } { \repeat unfold 8 <a f>-- } >> |

	<a e a,>8--_\markup{\dynamic "f" \italic "marcato"} e'16( dis' e'4--) r8\> e16( dis e4--) |
	r8 e,16( dis, e,4--) a,( <a e>8->\sf) r |
	<d a, d,>8-> a16-.\ff gis-. a4.-- d16-.\> cis-. d4--~ |

	d8 a,16-. gis,-. a,4.\! d,4 a16-.\f gis-. |
	a4.--\> d16-. cis-. d4.--\! a,16 gis, |
	\time 2/4 a4--( d,8) a,16(_\markup{\dynamic "f" \italic "marcato"} gis, |

	\time 4/4 a,8) a,16( gis, a8.--) a16 c4--\sf a,8 c16( h, |
	c8--) c16( h, c8.--) c16 e4--\sf c8 cis |
	d8--\mf cis-- c-- h,-- b,-- a,-- gis,-- e,-- |

	<<
		{
			\slurDown
			fis,4 f, e, a,8 a,16(_\markup{\dynamic "mp" \italic "espr."} b, |
			a,8) a,16( b, a,8.--) a,16 c4-- a,8 a,16( b, |
			a,8) a,16( b, a,8.) a,16 d2--\f |
			a,4. a,16-. b,-. s2
		}
		\\
		{
			s1 |
			d,1 |
			d,2 gis,8-. r d,-. r |
			<d d,>2--_\markup{\dynamic "p" \italic "ma marcato"}  <d a, d,>--
		}
	>> 

}

bassesIIf = {
	\global
	\tkf
	\voiceTwo
}

\include "skelet.ly"
