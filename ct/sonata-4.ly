\include "custom.ly"

\header {
	title = ""
	dedication = ""
	composer = ""
	arranger = ""
	subtitle = \markup \fill-line { \line{\fontsize #4.5 \sans \bold "IV"} }
	poet = \markup\center-column{\line{\concat{"6" \small\raise #1 \underline "a"} "= D"}}
	tagline = ""
}

global = {
	\globalstyle
	\set Score.voltaSpannerDuration = #(ly:make-moment 6/4)
	\time 2/4
	\key d \major
}

liningIV = {
	\global

	s2*6 | \break
	s2*7 | \break
	s2*7 | \break
	s2*6 | \break

	s2*7 | \break
	s2*7 | \break
	s2*6 | \break
	s2*6 | \break
	s2*6 | \break
	s2*6 | \break
	s2*6 | \break
	s2*8 | \break
	s2*8 | \break
	s2*7 | \break
	s2*6 | \break

	s2*7 | \break
	s2*7 | \break
	s2*7 | \break
	s2*6 | \break
	s2*6 | \break
	s2*6 | \break
	s2*6 | \break

	s2*12 | \break
	s2*12 | \break
	s2*9 | \break
	s2*7 | \break
	s2*7 | \break
	s2*7 | \break
	s2*7 | \break
	\repeat unfold 7 { s2 | \noBreak } s | \break

}

melodyIV = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\main-tempo "Vivo ed energico."
	\tempo 4 = 120

	\repeat volta 2 { d,16\(( a d' fis') e'( d' b g,)\) | }
	r8 <c' a'> <d' b'> <b g'> |
	<c' a'> <a fis'> <b g'> <c' a'> |

	\repeat volta 2 { d,16\(( a d' fis') e'( d' b g,)\) | }
	r8 <a fis'> <b g'> <g e'> |
	<a fis'> <fis d'> <g e'> <a fis'> |
	<fis d'>8 r16 d8 d d16~ |
	
	d16 d8 d d d16~ |
	d16 d8 d d d16~ |
	d16 d8 d d d16 |
	r8 es es es |
	<<
		{ s8 c' c'16( d') es'8 | c' d' es' c' | d' c' h d' }
		{ es8-> \repeat unfold 3 es8 | es8 es es16 s es8 \repeat unfold 4 es8-- }
	>>
	r8 es es es |
	<<
		{ s8 c' c'16( d') es'8 | c' d' es' c' | d' es' f' g' }
		{ es8-> \repeat unfold 3 es8 | es8 es es16 s es8 \repeat unfold 4 es8-- }
	>>

	\repeat volta 2 { d,16\(( a d' fis') eis'( b as d)\) | }
	r8 <b g'>-- <c' as'>-- <as f'>-- |
	<b g'>-- <as f'>-- <g e'>-- <b g'>-- |

	\repeat volta 2 { d,16\(( b d' g') f'( h d g,)\) | }
	r8 <b g'>-- <c' as'>-- <as f'>-- |
	<b g'>-- <as f'>-- <g e'>-- <b g'>-- |
	<as f'>-- <b g'>-- <c' as'>-- <as f'>-- |
	<b g'>-- <c' as'>-- <d' b'>-- <es' c''>-- |
	<fis' d''>4 r |
	\flag d''2-\ffVII \bar "||"

	\transpose c c'
	{
		e4-> e-> |
		e-> fis-> |
		e-> fis-> |
		g-> fis-> |
		e2-> |

		e8. fis16 d8. fis16 |
		e2-- |
		e4 e |
		e e |
		e fis |

		e fis |
		a fis |
		e2 |
		e8. fis16 d8. fis16 |
		e2 |

		e8. fis16 d8. fis16 |
		e2 |
		e4 d |
		cis h, |
		a, cis |

		e2 |
		e4 d |
		cis h, |
		a, cis |

		e4 d |
		g fis |
		<< { h2 } \\ { d,,2 } >> |
		h4 a |

		gis h |
		a gis |
		h r8 a |
		fis2 |
		s |
		s |

		h |
		h4 a |
		gis h |
		a gis |
		h r8 a |
		
		fis4 r |
		s2 |
		s |
	}
	<f a>2~ |
	4 <es g> |
	<d fis> <f a> |
	<es g> <d fis> |

	a8 g e c |
	a,( g,) \once\override TextSpanner.bound-details.left.text = "Pizzicato" \textSpannerDown d,\startTextSpan  e, |
	g, a, c d |
	e g a c'\stopTextSpan |
	b8 b  b b^\markup\italic "Simile" |
	\repeat unfold 3 { \repeat tremolo 4 { b8 } | }

	b r4. |
	g,8( f,) \once\override TextSpanner.bound-details.left.text = "Pizzicato" \textSpannerDown d,\startTextSpan  f, |
	g, b, c d |
	f g b d'\stopTextSpan |

	\transpose c c'
	{
		cis4 cis |
		cis h, |
		e e |
		e fis |
		cis h, |

		e fis |
		cis h, |
		e fis |
	}

	\tempo-primo
	\repeat volta 2 { d,16\(( a d' fis') e'( d' b g,)\) | }
	r8 <a fis'>-- <b g'>-- <g e'>-- |
	<a fis'> <fis d'> <g e'> <a fis'> |

	\repeat volta 2 { d,16\((a d' a') gis'( h f\=1( d\=1))\) }
	\transpose c c'
	{
		r8 <c a>-- <d h>-- <h, gis> |
		<c a>-- <d h>-- <es c'>-- <f d'>-- |
		\tempo\markup\main-tempo "Alla marcia risoluto."
		<g es'>4-- <g, es>8.-- 16-- |
		<b, g>4~-- 8.-- 16-- |
		<as, f>8.-- <b, g>16-- <c as>8.-- <as, f>16-- |
		<b, g>4 <g, es> |

		r <b, g>8.-- 16-- |
		<d b>4--~ 8. 16-- |
		<c as>8.-- <d b>16-- <es c'>8.-- <c as>16-- |
		<d b>4-- <b, g>-- |
		r <c as>8.-- 16-- |
		<fis es'>4-> <as, c>8 r |

		q4 <c as>8. 16 |
		<fis es'>4-> <as, c>8 r |
		q \once\override TextSpanner.bound-details.left.text = "Pizzicato" \textSpannerDown c'\startTextSpan b as |
		g f es d |
	}
	c' b as( g)\stopTextSpan |
	<as, f>4 <g, es> |
	<fis, d d>8 r16 d8 d d16~ |
	\repeat unfold 2 { 16 8 8 8 16~ | }
	16 8 8 8 16 |

	\transpose c c'
	{
		r4 e-- |
		e-- fis-- |
		e-- fis-- |
		a-- fis-- |
		e e |

		e8. fis16-- d8.-- fis16-- |
		e4-- e-- |
		e e |
		r g |

		g as-- |
		g-- as-- |
		h-- as-- |
		g-- g-- |
		g8. as16 f?8. as16 |
		g4 g |

		g8. as16 f?8. as16 |
		\repeat volta 2
		{
			h2\laissezVibrer |
			r4 a |
			gis f |
			e gis |
		}

		h-- a-- |

		\key g \minor
		d'-- c'-- |
		es'8 8 8 8 |
		es8 8 8 8 |
		es,8 8 8 8 |
		es,,8 8 8 8 |
	}
	<as c'>2~ |
	4 <ges b> |

	<f a> <as c'> |
	<ges b> <f a> |
	\repeat tremolo 4 { es''8 } |
	\repeat tremolo 4 { es'8 } |
	\repeat tremolo 4 { es8 } |
	\repeat tremolo 4 { es,8 } |
	<ces' es'>2~ |

	4 <heses des'> |
	<as c'> <ces' es'> |
	<heses des'> <as c'> |
	\repeat tremolo 4 { es''8 } |
	\repeat tremolo 4 { es'8 } |
	\repeat tremolo 4 { es8 } |
	\repeat tremolo 4 { es,8 } |

	\key d \major
	<h dis'>2~ |
	4 <fis cis'> |
	<dis h> <h dis'> |
	<fis cis'> <dis h> |
	<h dis'>2~ |
	4 <fis cis'> |
	<dis h> <h dis'> |
	<fis cis'> <dis h> |
	<fis h dis'>8 cis'( h) \once\override TextSpanner.bound-details.left.text = "Pizzicato" \textSpannerDown fis8\startTextSpan |

	dis cis h, cis |
	dis fis h cis' |
	dis' fis' h'\stopTextSpan r |
	\repeat volta 2
	{
		<f' a'>4-> <h dis'>8 r |
		q8 r q8. 16 |
	}

	<f' a'>8 <h dis'> <f a> <h dis'> |
	<f' a'>8 <h dis'> <f a> <h dis'> |
	<f' a'>8 <h dis'> <f a> <h, dis> |
	<f, a,> <h, dis> <f a> <h dis'> |
	\mark\markup \musicglyph #"scripts.ufermata"
	\tempo-primo

	\repeat volta 2 { d,16\(( a d' fis') e'( d' b g,)\) | }
	r8 <a fis'>-- <b g'>-- <g e'>-- |
	<a fis'> <fis d'> <g e'> <a fis'> |
	\repeat volta 2 { d,16\((a d' a') gis'( h f\=1( d\=1))\) }
	r8 <c' a'> <d' h'> <h gis'> |
	
	<c' a'> <a fis'> <h g'> <c' a'> |
	<h g'> <h d'> <c' es'> <a c'> |
	<h d'> <g h> <a c'> <h d'> |
	<g h> q <a c'> <fis a> |

	<g h> <e g> <fis a> <g h> |
	<e g> <fis a> <g h> <e g> |
	<fis a> <g h> <a cis'> <h d'> |
	\transpose c c'
	{
		<cis e> <d fis> <e g> <fis a> |
		<g h> <a cis'> <h d'> <cis' e'> |
		
		\tempo\markup\main-tempo "Alla marcia risoluto."
		<a d' fis'>4\strum_\markup\italic "Rasgueado" <fis, d>8. q16 |
		<a, fis>4~ 8. 16 |
		<g, e>8. <a, fis>16 <b, g>8. <g, e>16 |
		<a, fis>4 <fis, d> |
		r <a, fis>8. 16 |
		<c a>4~ 8. 16 |
		<h, gis>8. <c a>16 <d h>8. <h, gis>16 |

		<c a>4 <a, fis> |
		r <c a>8. 16 |
		\repeat volta 2
		{
			<fis es'>4 <a, c>8 r |
			q r <c a>8. 16 |
		}
	}

	\repeat volta 2
	{
		<fis' es''>8-^ <c' a'> <fis es'> <c a> |
		<d, a,>\strum <c a> <fis es'> <c' a'> |
	}

	<fis' es''>8 r <fis es'>4-> |
	q-> q-> |
	<f d'>4-> q-> |
	q-> <e d'>-> |
	q-> q-> |
	<fis d'>2->^\fermata \bar "|."
}

bassesIV = {
	\global
	\voiceTwo
	\slurUp

	\repeat volta 2 { d,4. r8 | }
	d,8\laissezVibrer r16 d8 d d16~ |
	d d8 d d d16 |

	\repeat volta 2 { d,4. r8 | }
	d,8 r16 d,8 d, d,16~ |
	d, d,8 d, d, d,16 |
	r8 a, b, g, |

	a, fis, g, a, |
	fis, fis, g, e, |
	fis, d, e, fis, |
	d,8 g16 d, g d, g d, |
	\override Beam.gap-count = #2 \override Beam.gap = #.67
	\repeat unfold 3 { \repeat tremolo 4 { g16 d, } } |
	d,8 \repeat tremolo 3 { g16 d, } |
	\repeat unfold 3 { \repeat tremolo 4 { g16 d, } } |
	\revert Beam.gap-count \revert Beam.gap

	\repeat volta 2 { d,4. r8 | }
	d,8\laissezVibrer r16 d8 d d16~ |
	d d8 d d d16 |
	\repeat volta 2 { d,4. r8 | }
	d,8\laissezVibrer r16 d8 d d16~ |
	d d8 d d d16~ |
	d d8 d d d16~ |
	d d8 d d d16 |

	\slurDown r8 d,16( d f gis h d' |
	\hideNotes d''4) \unHideNotes <d, a, d>4->\slurUp  |

	e'16( h g a,) e'( h g a,) |
	e'( h g a,) fis'( h g a,) |
	e'( h g a,) fis'( h g a,) |
	g'( h g a,) fis'( h g a,) |
	e'\(( h g d) a,( d g h\)) |

	\set fontSize = #-4 e'\(( h g d) a,( d g h\)) \set fontSize = #0 |
	e'\(( h g d) a,( d g h\)) |
	e'( h g a,) e'( h g a,) |
	e'( b g a,) e'( b g a,) |
	e'( b g a,) fis'( b g a,) |

	e'( b g a,) fis'( b g a,) |
	a'( b g a,) fis'( b g a,) |

	\repeat unfold 4 { e'\(( b g d) a,( d g b)\) | }
	e'\(( h fis a,) d,( a, fis h)\) |
	e'( h fis a,) d'( a f a,) |
	cis'( gis e a,) h( g d a,) |
	a( g cis a,) cis'( gis eis a,) |

	e'\(( h fis a,) d,( a, fis h)\) |
	e'( h fis a,) d'( a f a,) |
	cis'( gis e a,) h( g d a,) |
	a( g cis a,) cis'( gis eis a,) |

	e'( h fis a,) d'( a fis a,) |
	g'( d' h a,) fis'( d' a a,) |
	h'\(( f' h gis) d( gis h f')\) |
	h'( f' h d) a'( f' g d) |

	gis'( f' h d) h'( f' h d) |
	a'( f' h d) gis'( f' h d) |
	r8 d,16 a, d fis a' d' |
	h8( a) fis-. d-. |
	h,( a,) d,-. e,-. |
	fis,-. a,-. h,-. d-. |

	h'16\(( f' h gis) d( gis h f')\) |
	h'( f' h d) a'( f' g d) |
	gis'( f' h d) h'( f' h d) |
	a'( f' h d) gis'( f' h d) |
	r8 d,16 d fis c' a' d' |

	h8 a fis d |
	h,( a,) \once\override TextSpanner.bound-details.left.text = "Pizzicato" \textSpannerDown d,\startTextSpan  e, |
	fis, a, h, d\stopTextSpan |
	c8-. c-. c-. c-._\markup\italic "Simile" |
	\repeat unfold 3 { \repeat tremolo 4 { c8-. } | }

	<c e>4 r |
	s2 |
	s |
	s |
	<es g>2~ |
	4 <des f> |
	<c e> <es g> |
	<des f> <c e> |
	<d g>8( f) d b, |
	s2*3 |

	cis'16( g d a,) cis'( g d a,) |
	cis'( g d a,) h( g d a,) |
	e'( h g a,) e'( h g a,) |
	e'( h g a,) fis'( h g a,) |
	cis'( g d a,) h( g d a,) |

	e'( h g a,) fis'( h g a,) |
	cis'( g d a,) h( g d a,) |
	e'( b g a,) fis'( b g a,) |
	\repeat volta 2 { s2 | }

	d,8 r16 d,8 8 16~ |
	16 8 8 8 16 |
	\repeat volta 2 { s2 | }
	d,8 r16 d8 8 16~ |
	16 8 8 8 16 |
	r8 d8 8 8 |
	\repeat unfold 3 { d8 8 8 8 | }

	d,8 d8 8 8 |
	\repeat unfold 3 { d8 8 8 8 | }
	d, d r4 |
	r4 r16 d d, d |

	r8 d, r4 |
	r r16 d d, d |
	s2*3 |
	d8 d d d |

	s a, b, g, |
	a, fis, g, a, |
	fis, fis, g, e, |
	fis, d, e, fis, |

	d,16\(( d g h) e'( h g d)\) |
	e'( h g d) fis'( cis' ais d) |
	e'( h g d) fis'( cis' ais d) |
	a'( d' h d) fis'( cis' ais d) |
	e'( h g d) e'( h g d) |

	e'( h g d) d'( h g d) |
	e'( h g d) e'( h g d) |
	e'( h g d) e'( h g d) |
	d,\(( d h f') g'( f' h d)\) |
	g'( f' h d) as'( fis' c' d) |

	g'( f' h d) as'( fis' c' d) |
	h'( g' d' d) as'( fis' c' d) |
	g'( f' h d) g'( f' h d) |
	\set fontSize = #-4 g'( f' h d) f'( d' h d) \set fontSize = #0 |
	g'( f' h d) g'( f' h d) |

	\set fontSize = #-4 g'( f' h d) f'( d' h d) \set fontSize = #0 |
	\repeat volta 2
	{
		r16 d,( fis c' d' c' fis d,) |
		d'( c' fis d,) a'( d' c' d,) |
		gis'( h gis d) f'( h gis d) |
		e'( h gis d) gis'( h gis d) |
	}
	h'( fis' c' d,) a'( fis' c' d,) |

	d''( es' c' d,) c''( es' c' d,) |
	s2*4 |
	es8 8 8 8 |
	\repeat unfold 3 { \repeat tremolo 4 { es8 } | }

	s2*4 |
	\repeat unfold 4 { \repeat tremolo 4 { es8 } | }
	s2*4 |

	a,8 8 8 8 |
	\repeat unfold 6 { \repeat tremolo 4 { a,8 } | }
	a, a, a,4 |
	a, r |

	s2*3 |
	\repeat volta 2
	{
		r4 r16 a a, a |
		s2 |
	}
	s2*4
	\repeat volta 2 { s2 | }

	d,8 r16 d,8 8 16~ |
	16 8 8 8 16 |
	\repeat volta 2 { s2 | }
	d,8 r16 d8 8 16~ |
	\repeat unfold 3 { 16 8 8 8 16~ | }
	16 d,8 8 8 16~ |

	\repeat unfold 4 { 16 8 8 8 16~ | }
	16 8 8 8 16 |

	<d, a d>4\strum d,8 d, |
	<d, d>8 8 8 8_\markup\italic "Simile" |
	\repeat unfold 7 { \repeat tremolo 4 { q8 } | }

	\repeat volta 2
	{
		r4 r16 d d, d |
		s2 |
	}
	\repeat volta 2 { s2 | s | } |
	r4 <d, c>-> |
	q-> q-> |
	<d, h,>-> q-> |
	q-> <d, b,>-> |
	q-> q-> |
	<d, a,>2-> \bar "|."
}

dynamics = {
	\global

	s4\f\< s\> |
	s2\! |
	s2*5 |
	s8\mf s\< s s |
	s\! s s\> s |
	s2\! |
	s\p |
	s8-\tweak extra-offset #'(-2 . 4) _\markup\italic "Simile" s\mf s\< s\! |
	s2*2 |
	s2\p |
	s2*4 |
	s8\< s\! s s |
	s2 |
	s8_\markup{\italic "più" \dynamic "f"}\< s s\> s |
	s2\! |
	s |
	s4 s\< |
	s s\! |
	s\f\< s |
	s\! s |

	s2_\markup{\dynamic "mf" \italic "espr."} |
	s8 s\< s s |
	s2\! |
	s8 s\> s s |
	s2\! |
	s4\> s\< |
	s2\! |
	s2 |
	s2\p |
	s8 s\< s s |
	s2\! |
	s8 s\> s s |
	s2\! |
	s8\> s s\< s |
	s2\! |
	s8\> s s\< s |
	s2\p_\markup\italic "dolce, espr." |
	s8 s\> s s |
	s2\! |
	s\< |
	s\! |
	s8 s\> s s |
	s2\! |
	s4\< s\! |
	s2\< |
	s |
	s\!_\markup{\dynamic "mf" \italic "espr."} |
	s2\> |
	s8\! s\< s s\! |
	s s\> s s\! |
	s2 |
	s4 s\> |
	s s8\! s\< |
	s2 |
	s\mf_\markup\italic "più intenso" |
	s16 s\> s s s4\! |
	s16 s\< s s s4\! |
	s4\> s\! |
	s2 |
	s\> |
	s\! |
	s |
	s\p |
	s\> |
	s8\! s\< s s |
	s\! s\> s s\! |

	s4 s\> |
	s s\! |
	s s\< |
	s8 s s\! s |
	s2 |
	s4 s\> |
	s\! s\< |
	s\! s\> |
	s2\! |
	s4 s\< |
	s2 |
	s\! |
	s\p_\markup\italic "cresc. poco a poco" |
	s2*3 |
	s4\> s16\! s8. |
	s4\< s16\! s8. |
	s2 |
	\tempo\markup\sans\bold "Tratt."
	s16 s\< s8 s4\! |
	s4\< s\> |
	s2\! |
	s |
	s4\< s\> |
	s2\! |
	s\< |
	s8\! s\f s4 |
	s2 |
	s8\< s s s\> |
	s s\! s s |
	s s s\< s |
	s2\! |
	s4 s\< |
	s\! s\> |
	s\! s\ff\< |
	s2\! |
	s4 s\< |
	s2\! |
	s |
	s\> |
	s |
	s\mf\> |
	s8 s\p s\> s |
	s s s\! s |
	s2 |
	s4 s\> |

	s4\p\<_\markup\italic "dolce ed affettuoso" s\! |
	s\< s\! |
	s\> s\! |
	s2*5 |
	s8. s16\mp s4_\markup\italic "più intenso" |
	s2 |
	s4 s\< |
	s\! s\> |
	s2\! |
	s2*2 |
	s8. s16\< s4 |
	s2\!_\markup{\dynamic "mf" \italic "espr."} |
	s4 s16 s8.\> |
	s2\! |
	s8 s\< s s\! |
	s2\< |
	s8 s\! s s |
	s2 |
	s8 s4.\> |
	s2 |
	s\p |
	s_\markup{\dynamic "mp" \italic "espr."} |
	s\> |
	s8\< s s s\! |
	s\> s s s\! |
	s2\f\> |
	s\mf\> |
	s\mp\> |
	s\p |
	s_\markup{\dynamic "mf" \italic "più intenso"} |
	s4 s\> |
	s\! s\< |
	s2\> |
	s\f\> |
	s\mf\> |
	s\mp\> |
	s\p |
	s_\markup\italic "quasi fantasia" |
	s\> |
	s\< |
	s |
	s\! |
	s\> |
	s\! |
	s2*5 |

	s2\f |
	s4 s\< |
	s\> s\< |
	s\> s\< |
	s8\> s s s\! |
	\tempo\markup\sans\bold "Un poco tratt."
	s\< s s s\! |
	s4\< s\> |
	s2\f |
	s4\< s\> |
	s2\! |
	s2\! |
	s |
	s\mf |
	s8 s\> s s |
	s2\mp |
	s4 s\> |
	s2\p\< |
	s2*2 |
	s2\! |
	s2\f |
	s |
	s4\< s\> |
	s2 |
	s2\! |
	s |
	s\< |
	s\> |
	s8 s\ff\< s s |
	s2\! |
	s4 s\< |
	s2\!_\markup{\dynamic "f" \italic "stringendo"} |
	s\< |
	s4 s\fff_\markup\italic{"sostenendo"} |


}

\paper
{
	page-count = #4
}

\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = "Kytara"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \melodyIV }
			\new Voice { \clef "treble_8" \bassesIV }
			\new Voice { \clef "treble_8" \liningIV }
			\new Dynamics { \dynamics }
		>>
	}

	\layout { }
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
		midiMinimumVolume = 1
		midiMaximumVolume = 1
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyIV }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesIV }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 85 4)
		}
	}
}
