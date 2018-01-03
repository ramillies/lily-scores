\include "custom.ly"

\header {
	title = \markup \fontsize #3 \sans \bold "XIII"
	subtitle = \markup\tiny \raise #1 "(Preludium a fuga v G dur)"
	composer = "Mario Castelnuovo-Tedesco"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\override TextScript.outside-staff-priority = #200
	\globalstyle
	\override TextScript.whiteout = ##t
	\override TextScript.layer = #10
	\override TextSpanner.layer = #9
}

tkp = {
	\time 2/4
	\key g \major
	\magnifyStaff #.85
}

tkf = {
	\time 3/4
	\key g \major
	\magnifyStaff #.85
}

liningp = {
	\tkp
	s2*4 | \break
	s2*6 | \break
	s2*5 | \break
	\repeat unfold 3 { s2*4 | \break } \pageBreak
	\repeat unfold 3 { s2*4 | \break }
	s2*5 | \break
	s2*5 | \break
	s2*6 | \pageBreak
}

melodyIp = {	
	\global
	\tkp
	\oneVoice
	\tupletUp

	\tempo \markup \main-tempo "Allegretto — Moderato e grazioso"
	\tempo 4 = 72
	\transpose c c'
	{
		\override TupletBracket.extra-offset = #'(0 . 1)
		\override TupletNumber.extra-offset = #'(0 . 1)
		\times 8/12 { d'16(-1\mp\> h-4 g-3) h-1( g-2 e-3) g-1( e-4 c-3) e-0( c-1 a,-2) } |
		g,16.-.-0\p\< a,32-.-1 h,16.-.-3 c32-.-1 d4-3--~\! |
		d16 e-1 d-3 e c8-2 <e,-4 fis,-1 c-2>\strum-- |

       		c16-2 d-4 c d h,8-2 <d,-3 g,-4 h,-2>\strum-- |
		h,16-1 c-3 h, c a,8 <fis, a,>\strum-- |
		<dis,-2 fis,-1 h,-0>8\< fis-.\! r4 |
		<e, g, h,>16\strum_\markup{\italic "più" \dynamic p} c h, c a,8 <e, fis, a,>\strum-- |
		<dis, fis, h,>-.\< fis-.\! r4 |

		<c-2 e-4 g-1>8.\mf-- q32-. q-. q8.-- q32-. q-. |
		q16--\< <d-3 fis-4 a-1>-. <e-3 g-2 h-1>-.\> <d-3 fis-4 a-1> <c-3 e-4 g-1>8-.\! q-. |
		<a,-2 c-1 e-0>8.-- q32-. q-. q8.-- q32-. q-. |
		q16-.\< <h,-3 d-2 fis-1>-.<c-3 e-4 g-1>-.\> <h,-3 d-2 fis-1>-. <a,-2 c-1 e-0>8--\! q-. |

		<g,-3 h,-2 d-1>8.--\mp q32-. q-. q8.-- q32-. q-. |
		\once\override TextSpanner.bound-details.left-broken.text = ##f
		\once\override TextSpanner.bound-details.right-broken.text = ##f
		\once\override TextSpanner.bound-details.left.text = "appena rit."
		\once\override TextSpanner.bound-details.right.text = "a tempo"
		<g,-3 c-2 d-1>16--\<\startTextSpan e-.-4 fis-. e-.\> <c d>8-- q--\! |
		\times 8/12 { d'16(-1\p\>\stopTextSpan h-4 g-3) h-1( g-2 e-3) g-1( e-4 c-3) e-0( c-1 a,-2) } |
		<g, d>4--\laissezVibrer\! r |

		\times 8/12 { fis'16(-1\mf d'-2 h-3)\> d'-1( h-4 g-3) h( g e) g( e c) } |
		<h,-3 fis-1>4\laissezVibrer\! r |
		\times 8/12 { a'16(-1\mf fis'-2 d'-3) fis'-1(\> d'-2 h-3) d'( h g) h( g e) } |

		\times 8/12 { a-1( f-2 d-3) f-1( d-2 h,-3) d-1( h,-2 g,-3) h,-1( g,-3 e,-4) } |
		<c, g,>4\p\laissezVibrer-- r |
		<c, g, e>4\strum\laissezVibrer_\markup{\italic "più" \dynamic "p"}-- r |

		<e g>8.\<--_\markup{\dynamic "p" \italic "dolce ed espress."}( c'16-4) <d-3 f-2 h-4>8.\>( c'16) |
		<e g>8.--\<( c'16) <d-2 f-1 b-1>8.--^"½VI"\>( c'16) |
		<e g>8--\laissezVibrer\! r \times 4/6 { g16-1(\p\> e-4 c-3) d-1( b,-1 g,-2) } |

		\times 8/12 { b,\< g,( f,) g, b, d f-1( g) b-2 d'-1( e'-3) d'-1\mf } |
		<<
			{
				c'8^"VIII" s4. |
				s2 |
				s | 
				s |
			}
			\\
			{
				\tupletSpan 2
				\times 8/12
				{
					\slurUp
					g16(_\markup{\dynamic "p" \italic "subito"} e c) \barre "III" { e( b, g,) g16( e c) e( b, g,) |
					g( e c) d( b, g,) g( e c) d( b, g,) |
					g-1 es-2 c es-2 c-3( b,-1) c( b, g,) b,( g, f,) |
					g,( f,) es, f,(\< g,) b, c es f g b c'\! | }
				}
			}
		>> |
		<d fis a>8.--\mp\<( d'16) <e g a c'>8.--(\> d'16)\! |

		<d fis a>4--\laissezVibrer r |
		<fis c' d'>8.--\mp\<( g'16) <a c' f'>8.--(\> g'16)\! |
		<fis c' d'>4--\laissezVibrer r |

		\times 8/12 { d'16(-1\p\> h-4 g-3) h-1( g-2 e-3) g-1( e-4 c-3) e-0( c-1 a,-2) } |
		g,16.-.\< a,32 h,16-. c-.\! <g, h, d>4-- |
  		\once\override TupletBracket.extra-offset = #'(0 . 1.3)
  		\once\override TupletNumber.extra-offset = #'(0 . 1.3)
		\times 8/12 { fis'16(-1\mp d'-2 h-3)\> d'-1( h-4 g-3) h( g e) g( e c) } |

		h,16.-.\< cis32-. d16-. e-. <h,-3 d-1 fis-1>4^"½VII"~\! |
		q16 g-.-2_\markup{\dynamic "p" \italic "un poco malincolico"} fis-.-1 g-. <h,-4 cis-1 e-0>8-- q-- |
		q16-. fis-.-2 e-.-0 fis-. <h, d>8-- q-- |
		q16-. e-.-0 d-.-1 e-.-0 <h,-4 cis-1>8-- q-- |
		
		<h, d>8-.\< fis-.\! r4 |
		<c d>8--\mp\< a-- r4 |
		\barre "½V" { <c e a>8._\markup{\dynamic "mf" \italic "deciso"} q32-. q-. q8.-- q32-. q-. } |
		q16--\<^"½V" <d-1 fis-1 h-1>--^"½VII" <e-2 g-1 c'-1>--^"½VIII"\> <d fis h>--\! <c e a>8-- q-- |

		\barre "½X" { <fis-2 a-1 d'-1>8.\f-- q32-. q-. q8.-- q32-. q-.\< |
		q16-- } <g-1 h-1 e'-1>^"½XII"--\> <a-3 c'-2 fis'-4>-- <g h e'>^"½XII" <fis a d'>8-- q-- |
		\times 8/12 { d'16-1\mf( h-4 g-2)\> h( g e) g( e c) e( fis a,)\! } |

		g,16.-.\> a,32-. h,16-. c-. << { <h, d>4-- } \\ { g,8-. <fis, ais,>-. } >> |
		\times 8/12 { d'16\mf\>( h g) h( g e) g( e c) e( c a,)\! } |
		g,16.-.\< a,32-. h,16-. c-.\! << { <h, d>4-- } \\ { g,8-. <fis, ais,>-. } >> |

		\tempo\markup\italic "Un poco meno"
		\ottava #1 \arm-osm \flagOn d'8._\markup{\dynamic p \italic "dolcissimo"}( g'16) f'8.( g'16) |
		d'8.( g'16) f'8.( g'16) |
		d'4 \flagOff \ottava #0 <h d'>\laissezVibrer\pp^\markup\italic "perdendosi" |
		r q \bar "|."\pageBreak
	}

}

bassesIp = { \global \tkp \voiceTwo }

melodyIIp = {	
	\global
	\tkp
	\oneVoice
	\phrasingSlurDown

	<g, d>4--\laissezVibrer r |
	\override TupletBracket.extra-offset = #'(0 . 1)
	\override TupletNumber.extra-offset = #'(0 . 1)
	\times 8/12 { d'16-1(\mp\> h-2 g-3) h-0( g-0 e-1) g-0( e-1 c-2) e-1( c-2 a,-4) } |
	g,16.--\p\<-2 a,32-. h,16-.-1 c-.-2 d4---4 |

	g,16.-- a,32-. h,16-. c-. d4-- |
	g,16.-- a,32-. h,16-. c-. d8-.\! c-.\> |
	h,4--\! h,8-.\< fis-.\! |
	a,16.--_\markup{\italic "più" \dynamic "p"}\< h,32-. c16-. d-.\> e8-. c-. |
	h,4--\! h,8-.\< fis-. |

	<a, e>4--\laissezVibrer\! r |
	R2 |
	<c-2 e-1 g-0>8.\mf q32-. q-. q8.-- q32-. q-. |
	q16-.\< <d-4 fis-3 a-1>-. <e-1 g-0 h-0>-.\> <d-4 fis-3 a-1> <c-2 e-1 g-0>8--\! q-- |

	d4--\mp d8.-- d32-. d-. |
	d8.-- d32-. d-.\< d16-. e-. fis-.\> e-. |
	<g, d>4\laissezVibrer\! r |
	\times 8/12 { d'16-1(\p\> h-2 g-3) h( g e) g( e c) e( c a,)\! } |

	<h, fis>4--\laissezVibrer r |
	\times 8/12 { fis'16-1\mp\>( d'-2 h-3) d'-2( h-3 g-4) h-0( g-0 e-1) g-0( e-1 c-2)\! } |
	<d a>4 <e h>--\< |

	<f c'> <g d'>\! |
	\barre "III"
	{
	  	\override TupletBracket.extra-offset = #'(0 . -.1)
	  	\override TupletNumber.extra-offset = #'(0 . -.1)
		\tupletSpan 2
		\times 8/12
		{
			\repeat unfold 4 { g'16-1( e'-4 c'-3) d'-1( b-1 g-3) } 
			g'16\pp-1( e'-4 c'-3) d'-1( b-1 g-3)
			\repeat unfold 3 { g'16-1( e'-4 c'-3) d'-1( b-1 g-3) } 
		}

	  	\override TupletBracket.extra-offset = #'(0 . 1)
	  	\override TupletNumber.extra-offset = #'(0 . 1)
		\times 8/12 { g'16\p-1( e'-4 c'-3) d'-1( b-1 g-3) b(\> g e) f( d b,) } |
		\revert TupletBracket.extra-offset \revert TupletNumber.extra-offset
		\times 6/9 { d-3\< b,-4 g,-1 b, d f-1 g-3 b-1 d'-1 } f'8-4\mf |
		<c-1 g-3>8.--\mp\<( c'16-4) <d-3 f-1 b-1>8.-\>( c'16-4) |
		<c g>8.--\<( c'16) <d f b>8.--(\> c'16) |

		<es-4 g-3>8--\laissezVibrer r \times 4/6 { g'16-1( es'-2 c'-3) es'-2( c'-2 b-1) } |
		\times 6/9 { c'-3( b-1) g-3 b-1( c'-3) es'-2 f'-4 g'-1 b'-4 } c''8-4 |
	}
	\times 8/12
	{
		\barre "V" { a'16-1(\mp fis'-4 d'-3) e'-1( c'-1 a-3) a'( fis' d') e'( c' a) } |
		a'( fis' d') e'( c' a) c'-1( a-2 g-1) a-3( c'-1 e'-1) |
		a'(\p fis' d') e'( c' a) a'( f' d') e'( c' a) |
		a'( fis'\> d') e'( c' a) c'( a g) a( g e)\! |
	}

	<g, d>4--\p\laissezVibrer r |
  	\once\override TupletBracket.extra-offset = #'(0 . .6)
  	\once\override TupletNumber.extra-offset = #'(0 . .6)
	\times 8/12 { d'16-1(\p\> h-2 g-3) h-0( g-0 e-1) g-0( e-1 c-2) e-1( c-2 a,-4)\! } |
	<h, fis>4--\laissezVibrer r |

	\times 8/12 { fis'16(\mp\> d' h) d'( h g) h( g e) g( e cis) } |
	h,16.--\p\< cis32-. d16-. e-. fis4--\! |
	\repeat unfold 2 { h,16.-.\< cis32-. d16-. e-. fis4--\! | }

	h,16.-.\< cis32-. d16-. e-. fis8-. h-. |
	d16.-.\mp\< e32-. fis16-. g-. a8-. d'-. |
	<a, e g>8.--\!_\markup{\dynamic "mf" \italic "deciso"} q32 q q8.-- q32-. q-. |
	q16-- <h,-2 fis-3 a-1>-- <c-2 g h>-- <h, fis a>-- <a, e g>8-- q-- |

	<d a-2 c'-1>8.--\f q32-. q-. q8.-- q32-. q-. |
	q16-- <e h-2 d'-1>-- <fis c'-3 e-4>-- <e h d'>-- <d a c'>8-- q-- |
	<g, d>8.--_\markup{\dynamic "mf" \italic "marcato"} d32-. d-. <g, d>8. d32-. d-. |

	<g, d>16-.\< e-. fis-.\> e-. <g, d>8-.\! d-. |
	<g d'>8.--\mf d'32-. d'-. q8.-- d'32-. d'-. |
	<g d'>16\<-. <h e'>-. <h fis'>\>-. e'-. <g d'>8\!-. d'-. |

	\phrasingSlurUp
	<g' h'>8\p\>-.\( <ges' b'>-. <f' a'>-. <e' gis'>-. |
	<es' g'>-. <d' fis'>-. <des' f'>-. <c' e'>-. |
	<h d'>4\) <g d'>--\pp\laissezVibrer |
	r q-- \bar "|." \pageBreak
}

bassesIIp = {
	\global
	\tkp
	\voiceTwo
}

liningf = {
	\tkf
	s2.*7 | \break
	s2.*7 | \break
	s2.*6 | \break
	s2.*6 | \break
	s2.*7 | \break
	s2.*5 | \break
	s2.*6 | \pageBreak
	s2.*9 | \break
	s2.*10 | \break
	s2.*9 | \break
	\grace s8 s2.*6 | \break
	s2.*7 | \break
	s2.*6 | \break

}

melodyIf = {	
	\global
	\tkf
	\oneVoice
	\phrasingSlurDown

	\tempo \markup \typewriter \fontsize #5.5 "Grazioso, Tempo di Minuetto" \tempo 4 = 90

	h4-.-3\p\< h16(\( a-1) g-4 a h8-.-3\) c'-4-.\! |
	h4-. h16(\( a) g a h8-.\) c'-. |
	\transpose c c'
	{
		d8.---3 g16-.-4 fis8.---4 d16-.-3 e8.---1 fis16-.-3 |
		e4-.-1\> d2-.~\! |

		d8_\markup{\dynamic p \italic "leggero e staccato"}\< fis e\! d\> cis h, |
		a,\< d cis\> h, a, g, |
	}
	fis e d2\!--~ |
	d8\< e-. fis-. g-. a-. c'-. |

	<g h>4--\mf h16-3\((\< a-1) g-4 a-1\) <g-1 h-2>8-. c'-3\! |
	<g h>4-- h16\((\< a) g a\) <g h>8-. c'\! |
	<h-3 d'-1>8.-- g'16-.-2\! fis'8.---2 d'16-.-1 <cis'-3 e'-2>8. fis'16-4\> |
	<cis' e'>4-- <a d'~>2--\! |

	d'8_\markup{\dynamic p \italic "leggero e staccato"}\< fis' e' d'\> cis'\< h |
	a\< d' cis'\> h a g |
	fis\< h a\> g fis e |
	d\< e fis g a c' |

	<a h>4\!--\laissezVibrer r2 |
	<g h>4\p h16\((\< a) g a h8-.\) d' |
	<h-4 cis'-1>4\mp\laissezVibrer r2 |
	<a-2 cis'-1>4 cis'16-3\((\< h-1) a-4 h-1\) cis'8-.-3 e'-.-2 

	<c' d'>4\mf \barre "V" { <c' fis'-3>16\(( e'-1) d'-3 e'\< <c'-1 fis'-3>8-.\) <c' g'-3>-.|
	<c'-1 fis'-3>4--\! <c' fis'>16(\( e')\< d' e' <c' fis'>8-.\) <c' g'>-. |
	<a-1 fis'-3 a'-1>8.--\f } d''16-- <c'-3 g'-1 c''-1>8.--^"½VIII" a'16---4 h'8.---4 c''16-- |
	\transpose c c'
	{
		\barre "VII" { <c-4 d-1 h-1>4--\> <c d a>--\< } ais-- |

		<h,-4 g-2 h-1>4\strum\!_\markup{\dynamic "mf" \italic "espr."} h16(\(-1 c')-2 d'-4 c' h8\) <c-1 fis-3 a-1>8-.\strum | 
		<h, g h>4\strum-- h16(\( c') d' c' h8\) <h,-3 d-1 a-4>8-.\strum |
		<c-3 g-1>8.--\> d16-.-1 e8.-3\! <h, g>16-.\< <c fis>8.-. g16-. |
		<c-1 fis-3 a-1>4--\strum\! <h,-3 g-2 h-1>2--\strum |
		<g-3 h-4>4--\laissezVibrer_\markup{\dynamic "p" \italic "dolce"} r\> <fis-3 a-2>--\! |
		<e-3 g-2>--\laissezVibrer\< r <fis a>-- |
		<g-3 h-4>8-.\p\< e'-.-4 d'-.-1\> c'-.-4 <e-1 h-4>-. a-.-2 |
		<e-3 g-2>-.\< c'-.-1 <dis-2 h-1>-.\> a-.-4 g-.-2 fis-.-1 |

		<g-2 c'-4 e'-3>4--_\markup{\dynamic "mp" \italic "dolce ed espr."} e'16\((-3\< d'-1) c'-4 d'-1 q8\) g'---4 |
		<a-1 d'-3 fis'-2>8-.\> e'-. d'-. c'-. <d-1 fis-1 h-1>4--^"½VII"\! |
		<e-3 a-4 c'-2>4-- c'16-2\<\(( h-1) c'-4 h-1\) q8-. e'-.\! |
		<d g d'>8-.\> c'-. h-. a-. <h,-3 d-1 g-2>4-. |

		<c-3 e-2 a-4>4--\p a16\((-4 g-2) fis-1\< g-2 q8--\) <e-2 g-1 c'-1>-- |
		<c e a>4--\mp a16( g fis\< g q8--) <e g c'>-- |
		<c e a>8.--\mf <g-2 h-3 e'-4>16-. <fis-2 a-1 d'-1>8.-- <d-1 fis-1 h-1>16-.^"½VII" <e-2 g-1 c'-1>8.--^"½VIII" <fis-2 a-1 d'-1>16^"½X" |
		<e-2 g-1 c'-1>4--\>^"½VIII" <d-1 g-2 h-1>2--^"½VII"
	}
	<a,-0 g,-3>8.--_\markup{\dynamic "mp" \italic "espr."}\< e16-. d8.\!-. h,16-. c8.-. d16-. |
	c4--\> h,-- a, |
	<g, d>--\!\laissezVibrer_\markup{\dynamic "p" \italic "allontanandosi"} r r |
	<fis, dis>--\laissezVibrer r r \bar "||"

	\tempo\markup\main-tempo "Lo stesso tempo, ma un poco agitato."
	\mark\markup\sans\bold\huge "TRIO"
	<e, h,>4\laissezVibrer r r |
	<e h>--\laissezVibrer r r |
	<g d'>--\laissezVibrer_\markup{\dynamic "p" \italic "espr."}\< q2--\! |
	<gis dis'>4-- q2-- |
	<g d'>4-- q2--\> |
	<e h>4-- q2--\! |
	\repeat percent 4 { \repeat tremolo 3 { h16-0\pp( a-1 g-4 a-1)^\markup\italic "Simile" } }
	<h,-1 fis-3>4--_\markup{\dynamic "p" \italic "espr."} q2--\< |
	<c-1 g-0>4--\! q2-- |
	<h, fis>4-- q2-- |
	<as,-1 es-3>4-- q2-- |
	\repeat percent 13 { \repeat tremolo 3 { h16-0\pp( a-1 g-4 a-1)^\markup\italic "Simile" } }
	h16\(( a g\< a) h-0 c'-1 d'-3 e'-1 fis'-3 g'-4 a'-1 b'-2\)\! \bar "||"

	\tempo-primo
	\transpose c c'
	{
		\grace s8 <g-3 h-2>4_\markup{\dynamic "p" \italic "dolce e grazioso"} h16-3\(( a-1) g-3 a-1 h8-.-3\) c'-.-4 |
		h4---3 h16\(( a)\< g a h8-.\) c'-. |
		<h-3 d'-1>8.-- g'16-4\! <h-2 fis'-4>8.-- d'16-. e'8.-- fis'16-. |
		<g-3 e'-4>4--\> <g-3 d'-1~>2--\! |
		d'8\< g'-.\!_\markup{\dynamic "p" \italic "leggero e staccato"} fis'-.\> e'-.-3 d'-.-1 c'-.-4\! |
		h-3\< e'-4\! d'-1\> c'-4 h-3 a-1\! |
		g-3\< c'-4\! h-3 a-1\> g-3 e-1 |
		fis4---3 e2---1\! |
		<d-3 a-1>8-.\<_\markup{\dynamic "p" \italic "sempre leggero e staccato"} d'-4\! c'-2\> h-1 a-4 g-2\! |
		<d-1 fis-1>\< h-1\! a-4\> g-2 fis-1 e-3\! |
		<c-4 d-1>\< g-2\! fis-1\> e-3 d-1 c-4\! |
		h,-3 e-4 d-1 c-4 h,-3 a,-1 |

		<g,-4 d-1 g-2 h-1>4--^"VII"_\markup{\dynamic "mp" \italic "dolce ed espr."} h16-3\((\< a-1) g-3 a-1 h8-.\) c'-.-4 |
		<e-1 h-4>4--\! h16\(( a)\< g a <e h>8-.\) c'-.\! |
		<g d'>8.--_\markup{\dynamic "p" \italic "con spirito"} g'16-. fis'8.-- d'16-. e'8.--\> fis'16-.\! |
		<g h e'>4-- q-- r |
		<h,-2 g-1 d'-4>4--\strum_\markup{\dynamic "pp" \italic "dolcissimo"}\< q2--\strum |
		<his,-2 gis-1 dis'-4>4--\strum\! q2--\strum |
		<d-1 h-2 g'-4>2.\strum\laissezVibrer-- \bar "|."
	}
}

bassesIf = { \global \tkf \voiceTwo }

melodyIIf = {	
	\global
	\tkf
	\oneVoice

	R2.*4 |

	fis4--_\markup{\dynamic "mp" \italic "marcato"} fis16-3\(( e-1) d-4 e-1\< fis8-.-3\) g-4-. |
	fis4---3\! fis16( e\< d e fis8-.) g-. |
	a8.--\! d'16-. c'8.-- a16-. h8.--\> c'16-. |
	h4-. a2\!-- |

	<g,-3 d-0>4\laissezVibrer-- r <c-3 es-1> |
	<g, d>\laissezVibrer-- r <c es>-- |
	<h,-1 fis-3>4--\laissezVibrer r <a, g>-- |
	q <d fis>2-- |

	<h, fis>4\mp fis16-3\((\< e-1) d-4 e fis8-.\)\! <e-1 g-0> |
	<h, fis>4-- fis16\((\< e) d e fis8-.\) <e g> |
	<d a>8.--\! d'16-. c'8.-- a16-. h8.-- c'16-. |
	<g h>4-.\> <d a>2-- |

	dis4--\p dis16-3\(( cis-1)\< h,-4 cis dis8-2-.\) fis-1-. |
	e4---4\laissezVibrer\! r2 |
	eis4--\mp eis16-3\(( dis-1\<) cis-4 dis eis8-.-3\) gis-1-.\! |
	fis4--\laissezVibrer r2 |

	<<
		{
			fis16-3( e-1) d-4 e-1 fis8-. g-.\< a-. h-.\! |
			a16-1( g-0) fis-3 g a8-.\< h-. c'-. e'-.\! |
			\fleft <d'-2>4--\strum <e'-4>8.\strum--\p\< a'16---4 g'8.-2-- e'16---0\! |
			fis'8.--\strum g'16---4 fis'2---4\strum |
		}
		\\
		{
			\fleft
			d4-4\mf d2 |
			d4 d2 |
			<d-0 a-1>4\strum q2\strum |
			q4\strum q2\strum |
		}
	>>

	<g,-3 d-0>4--\laissezVibrer\mp r <g,-3 dis-1>-- |
	<g,-3 e-2>\laissezVibrer-- r <g, f>-- |
	<g, e>--\laissezVibrer r <g, es>-- |
	<g, d>--\laissezVibrer r <fis,-2 dis-1 a-3>\strum |

	<<
		{
			<e, e g h>4\strum_\markup{\dynamic "mp" \italic "marcato"} h16-0(\( c'-1) d'-3 c' h8-.-0\) a-. |
			h4-. h16(\(_\markup\italic "metallico" c') d' c' h8-.\) a-. |
			g8.-- d16-. e8.-- g16-. fis8.-- g16-. |
			<h, a>4-- <h, h>2-- |
		}
		\\
		{
			s4 r e-2 |
			e r dis |
			d r\< c |
			s4 s2\! |
		}
	>>

	h,8-.\p\< g-. c'-. e'-. g'\! r |
	<< { h4-- h16-3\(\<( a)-1 g-4 a-1 h8-3\) d'-.\! | c'-. h-.\> a-. g-. fis4--\! } \\ { h,_\markup{\dynamic "mp" \italic "espr."} s2 | h,4 s2 } >>
	<h, g>4-- g16\((-2\< fis-1) e-4 fis-1 g8\) h-.\! |
	<<
		{
			a8-.\> g-. fis-. e-. d4--\! |
			c'8-.\> h-. a-. g-. fis4-.\! |
			e'8\> d' c' h a4\! |
			a8.\< e'16_\markup\italic "espr." d'8. h16\> c'8. d'16\! |
		}
		\\
		{
			d4\p\laissezVibrer s2 |
			d4\mp\laissezVibrer s2 |
			d4\laissezVibrer s2 |
			<g, d>4\mf\laissezVibrer s2 |
		}
	>>

	c'4\>-- h-- a-- |
	g--\laissezVibrer\! r2 |
	<g h>4-- h16-3\((\p a)-1 g-4 a-1\) h8-3-. c'-.-4 |
	<a-1 h-0>4--_\markup{\italic "più" \dynamic "p"} h16\(( a) g a h8-.\) c'-. \bar "||"
	h16-0(_\markup{\dynamic "pp" \italic "uguale e misterioso"} a-1 g-4 a-1 h16 a g a h a g a)^\markup\italic "Simile"
	\repeat percent 5 { \repeat tremolo 3 { h16-0\pp( a-1 g-4 a-1) } }
	\barre "III" { <g,-1 d-3 h-2 d'-1>4--_\markup{\dynamic "mp" \italic "più espr. e sonoro"}\<\strum q2\strum } |
	\barre "IV" { <gis,-1 dis-3 his-2 dis'-1>4--\!\strum q2--\strum } |
	\barre "III" { <g,-1 d-3 h-2 d'-1>4--\strum q2\strum } |
	<e, h, e g h>4\strum q2\strum |
	\repeat percent 4 { \repeat tremolo 3 { h16-0\pp( a-1 g-4 a-1) } }
	<h,-1 fis-2 h-3 dis'-4>4--\strum_\markup{\dynamic "mp" \italic "più espr. e sonoro"}\< q2\strum |
	<his,-1 fisis-2 his-3 disis'-4>4\!--\strum q2\strum |
	<h,-1 fis-2 h-3 dis'-4>4--\strum q2\strum\> |
	\barre "IV" { <gis,-1 dis-3 gis-4 h-1>4\strum-- q2--\strum\! } |
	
	<c-1 g-2 c'-3 e'-4>4--\strum\mp\< q2--\strum |
	<cis-2 h-3 e'-4 g'-1>4\strum-- q2--\strum\! |
	\barre "V" { <d-1 d'-2 g'-4 h'-3>4--\strum\f q2--\strum\> |
	<dis-2 c'-1 fis'-3 a'-1>4\strum-- q2\strum-- } |
	<e-1 h-3 e'-4 g'-2>4--\strum\mf q2\strum--\> |
	<eis-3 g-0 h-0 e'-0>4--\strum q2--\strum |
	<fis-3 h-4 d'-2>4\strum\mp\>-- q2--\strum |
	<fis,-1 e-2 g-0 cis'-3>4\strum-- q2--\strum\! |
	<h,-4 d-2 fis-1 h-1>4^"IV"\p\strum\laissezVibrer r r |
	<a,-0 fis-2 c'-3 d'-4>\strum\laissezVibrer r r \bar "||"

	\priraz{<g,-1 d-3>8\strum} <g-4 d'-1>4^"III"_\markup{\dynamic "p" \italic "dolce ma sentito"} q2-- |
	<gis dis'>4-- q2-- |
	<g d'>4--\> q2-- |
	<e h>4--\! q2-- |
	<g, d g h>4--\strum_\markup{\dynamic "mp" \italic "dolce ma sonoro"} q2--\strum\< |
	\barre "I" { <gis,-4 dis-1 gis-1 his-1>4--\strum q2--\strum\! } 
	<g, d g h>4--\strum\> q2--\strum |
	<e, h, e g>4--\strum\! q2--\strum |
	<d fis>4--_\markup{\dynamic "mp" \italic "espr."} fis16-3\((\< e-1) d-4 e fis8-.\) g-.\! |
	<d fis>4-- fis16-3\((\< e-1) d-4 e fis8-.\) g-. |
	<d a>8.-. d'16-.\! c'8.-._\markup\italic "espr." a16-. h8.-. c'16-. |
	<d fis h>4--\> q2--\! |
	<< { h8\strum-.\< e'-. d'-.\! c'-.\> h-. a-.\! | g-.\< c'-. h-.\! a-. \> g-. e-.\! } \\ { <g, d f>4\strum s2 | c4 r cis } >> |
	<d g h>4\strum-- d'8.--\<_\markup{\dynamic "p" \italic "con spirito"}[ g'16-. fis'8.--\! d'16-. |
	e'8.-- fis'16-.] e'4-. <d-3 fis-2 c'-4 d'-1>4 |
	\override TextSpanner.whiteout = ##t
	\barre "III" { <g,-1 d-3 h-2>4\pp\strum-- q2--\strum } |
	\barre "I" { <f,-1 c-3 as-2>4--\strum q2--\strum } |
	<g,-1 d-3 h-2>2.--\strum\laissezVibrer^"III" \bar "|."
}

bassesIIf = {
	\global
	\tkf
	\voiceTwo
}

\include "skelet.ly"
