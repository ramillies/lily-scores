\include "custom.ly"

\header {
	dedication = \markup \raise #3 \italic "Věnováno Andrésu Segoviovi"
	title = \markup \column { \fill-line { \fontsize #5 \sans \bold "SONÁTA" } \fill-line{\italic "In memoriam Boccherini" } }
	subtitle = \markup \lower #4 \fill-line { \line{\fontsize #4.5 \sans \bold "I"} } 
	composer = "Mario Castelnuovo-Tedesco"
	poet = \markup\line{\concat{"6" \small\raise #1 \underline "a"} "= D"}
	meter = ""
	tagline = ""
}

global = {
	\globalstyle
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)
	\time 2/4
	\key d \major
	\magnifyStaff #.95
}

liningI = {
	\global
}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\phrasingSlurDown

	\tempo\markup\main-tempo "Allegro con spirito."

	\transpose c c'
	{
		\partial 8 d'16(\f cis') |
		d'8-.\> <d fis a>-. q-.\< d'-. |
		d'-.\> <e gis h>-. q-.\< d'-. |
		d'-.\sf\> <d fis a>-. d'-.\sf\> <cis gis>-. |
		d'-. <c e g>-. q-. <h, dis fis>-.\! |
		<b, d f>4->_\markup\italic "deciso" q-> |

		<f d'>4.-> cis'16(\( d') |
		es'(\> d') c'( b) a( g) f( es)\)\! |
		cis8 <a, g>\< q\! d16( cis) |
		d8 <a, fis> q d |
		d <h, g>\< q\! d |
		d\> <a, fis>\! d <gis, eis> |

		d <g, e>\> q <f, d>\! \bar "||"
		\time 3/4 \key f \major
		f,4-- f,-- d-- |
		e,-- e,-- d-- |
		f,8\< g, a, b,\> a, f, |
		e,4--\< e,-- d-- |
		f,-- f,-- d--\! |

		fis, fis, d |
		g,8\(\< a, b, c\> b, g,\) |
		fis,\(\< g, b, c d e\! \bar "||"
		\time 2/4
		f4\) r |
		f r |
		f r |
		
		d8 b, b, d16( cis \bar "||"
		\key d \major
		fis4) r |
		g r |
		fis g |
		a r |
		cis8\> c16( h,) c8 h,16( ais,)\! |

		h,8 <h, f as>\f q b,16(\mf a,) |
		b,8\> a,16( gis,) a,8 gis,16( fisis,)\! |
		gis,8 <gis, d f>\f q g,16\mf( fis,) |
		g,8 fis,16( eis,) fis,8 f,16( e,) |
		f,8 d\< r f,[ |
		d]\! r f,\< d |

		r f,[ d] r\! |
		f,\> d r\!^\fermata^\markup\tiny\italic "breve" a16(_\markup\italic "deciso" gis) |
		a4--\< <e, a, cis>--\! |
		fis4. fis8 |
		dis16\(( e) gis( fis) e( d) cis( h,)\) |
		cis8\> a,\! a,\< cis\! |

		d8\> a,\! a,\< d\! |
		cis a, d\< <c fis> |
		a\! gis16( fis) e4 |
		r8 cis\sf d f |
		gis,8\< a,16( h,) c8 es\! |
		fis,\p g,16\sf( a,) b,8\< des |

		e,\p f,16\sf\<( g,) as,4~\! |
		as,8 g,16( as,) b,( as,) g,(\< f,)\! |
		e,2 |
		fis, |
		<cis, a,>4 <d, h,> |
		<e, cis>2 |

		q |
		<f, d> |
		<e, cis>4 <d, h,> |
		<cis, a,>2 |
		<d, g, h,> |
		<e, a,> |
		<d, g, h,> |
		<e, a,> |

		\repeat unfold 5 { gis,8 cis cis gis, | }
		a, cis cis a, |
		\repeat unfold 6 { gis,8 cis cis gis, | }
		<g, h, e>2 |
		<a, cis fis> |
		q4 <h, d g> |
		<g, h, e>2 |

		<h, d g>2 |
		<cis e a> |
		q4 <d fis h> |
		<h, d g>4 r8 a16( gis) |
		a4 <g, cis e> |
		<d g> r8 a16( gis) |
		a8( e) e(\< g)\! |

		q4 r8 b16(\> a)\! |
		b4_\markup\italic "deciso" <f, b, d> |
		g4. r8 |
		e16\((\< f) a( g) f(\> es) d( c)\) |
		d8 b, b,\< d |
		es\> b, b,\< es |
		d\> b, es\< g\! |

		b8 a16( g) f4 |
		r8 a\mf[ b des'] |
		e8\< f16( g) as8 c'\! |
		d\< es16( f) ges8 b\! |
		c8\< des16( es)\! e4 |

		r8 dis(\> e gis)\! |
		ais,\< h,16( cis)\! d8 fis |
		gis,\< a,16( h,) c8 e\! |
		fis,\< g,16( a,)\! b,4~ |
		b,8\> a,16( b,) c( b,) a,( g,)\! |

		fis,2 |
		<es, g,> |
		q4 <fis, a,> |
		fis,2 |
		<fis, a,> |
		<g, b,> |
		q4 <a, c> |
		<fis, a,>2 |
	}

	r8 <d fis a>8\> q <des f as> |
	q <c e g> q <h, fis> |
	q\< <fis ais cis'> q\! <f a c'>\mp |
	q\> <e gis h> q <es g b>\! |
	\transpose c c'
	{
		q <as, c es>\< q <g, h, d> |
		q <h, dis fis> q <b, d f> |
		q <des f as> q <c e g>\! |

		q <es g b> q <d fis a> |
		q <f a c'> q <e gis h> |
		q <es g b> q <d fis a> |
		\tempo\markup\sans\bold "Un poco sostenuto." q-> d' <f a c'>->\< d'\! |
		<e gis h>-> d' <es g b>^\fermata^\markup\tiny\italic "breve" \a-tempo d'16( cis') |
		d'8\> <d fis a> q\< d' |

		d'\> <e gis h> q\< d' |
		d'\sf\> <d fis a> d'\sf\> <cis gis>\! |
		d' <c e g> q <h, dis fis> |
		<b, d f>4_\markup\italic "deciso" q\< \bar "||"
		\key b \major
		<f d'>4.\! cis'16 d' |
		f'\(( es') d'( c') b( a) g( f\))\! |

		d'8( e) <g, e>4 |
		f,\mf f, |
		<f, d>4. cis16 d |
		f\(( es) d( c) b,(\< a,) g,( f,\)) \! |
		d8 e, e,4 |
		f--_\markup\italic "più dolce" f |
		<f c'>4. h16( c')  |

		d'\(( c') b(\> a) g( f) e( d)\)\! |
		a8 h, h,4 \bar "||"
		\time 3/4 c4-- c-- <c a>-- |
		h,-- h,-- <h, a>-- |
		c8 d e f( e) c |

		h,4-- h,-- <h, a>-- |
		c-- c-- <c a>-- |
		cis-- cis-- <cis a>-- |
		d8 e f( g) f d |
		cis( d) c b, a,( g,) \bar "||"

		\time 2/4
		f2 |
		f |
		f |
		d8 b, b, d16( cis) \bar "||"
		\key d \major
		fis4 r |
		g r |
		fis g |

		a r8 fis16(\mp eis) |
		fis8\> f16( e) f8 e16( dis)\! |
		e8 <e b des'>\f q es16(\mf d) |
		es8\> d16( cis) d8 cis16( c)\! |
		cis8 <cis g b>\f q c16( h,) |

		c8\> h,16( ais,) h,8 ais,16( a,) |
		b,8\< g r b,[ |
		g] r b,\! g |
		r b, g r |
		b, g r^\fermata^\markup\tiny\italic "breve" d16(_\markup{\dynamic "mf" \italic "espr."} cis) |
		d4-- fis,-- |
		h,4.-- h,8 |

		gis,16\((\< a,) cis( h,) a,(\> g,) fis,( e,\)) |
		r8\! <c d> q r |
		r <h, d> r <b, d> |
		r <a, d> r4 |
		r e'16(_\markup\italic "grazioso" d') cis' h |

		a8\< h c' es' |
		fis g16( a) b8 d' |
		e f16( g) as8 c' |
		d es16( f) g4\! |
		r8 fis g <b e> |
		cis8\< d16( e)\! f8 a |

		h,\< c16( d) es8 g \bar "||"
		\key as \major |
		a,\< b,16( c)\! des4~ |
		des8 c16\(( des) es( des) c b, |
		f(\> es) des c des( c) b, as, |
		b,( as,) g, f, g,( f, es, des,\))\! |

		\repeat unfold 5 { r8 c c f, | }
		r <des f> q g, |
		\repeat unfold 2 { r8 c c f, | }

		r <des f> q g, |
		r8 c c f, |
		\tempo\markup\sans\bold "Un poco tratt." r <des f> q g, \bar "||"
		\key c \major
		a, cis f a |
		\a-tempo <fis, a,>2\pp |
		<g, b,> |
		<f, d>4 <g, e> |

		<a, fis>2 |
		<a, d fis> |
		<b, es g> |
		<a, d fis>4 <g, e> |
		<fis, d>2 |
		\repeat unfold 2 { <g, c e>\sfp | <fis, a, d> |}

		<b, des g>4_\markup\italic "dolce"\< <a, c fis> |
		<c es a> <h, d gis> |
		<d f h>2~\!_\markup\italic "perdendosi" |
		q2~ |
		q8 r4 d'16(_\markup{\dynamic "pp" \italic "con spirito"} cis') |
		d'8-. <d fis a>-. q-. d'-. |

		d'16( cis') d'8-. <cis eis gis>-. d'16( cis') |
		d'8-. <c e g>-. q-. d'-. |
		d'16( cis') d'8-. <h, dis fis>-. d'16( cis') |
		d'8-. <b, d f>-. r \once\override TextSpanner.bound-details.left.text = "Pizzicato" \textSpannerDown d8\startTextSpan |
		f, d, f,, d,,\stopTextSpan |
		\ottava #1 \arm-osm \flag <fis a'>2 \ottava #0 |
		<fis, a,>2\laissezVibrer_\markup{\dynamic "p" \italic "dolce"} \bar "|."
	}
}

bassesI = {
	\global
	\voiceTwo
	\shiftOn

	\partial 8 s8 |
	s2*5 |

	r4 <d, f b>\strum |
	r2 |
	\repeat unfold 3 { r8 a,-. a,-. r | }
	r8 a, r a, |

	r a, a, r \bar "||"
	\time 3/4 \key f \major
	r d, b, d f4 |
	r8 d, b, d e4 |
	r8 d, b, d r4 |
	r8 d, b, d e4 |
	r8 d, b, d f4 |

	r8 d, h, d fis4 |
	es, r2 |
	<e, b,>4 r2 \bar "||"
	\time 2/4
	<<
		{
			\shiftOn
			b8 f f\< b\! |
			b\> g\! g\< b\! |
			b f g b |
		}
		\\
		{
			<f, d>4 r |
			<f, es> r |
			<f, d> <f, es> |
		}
	>>

	<f, d> r \bar "||"
	\key d \major
	<<
		{
			\shiftOn
			d'8\> a\! a\< d'\! |
			d'8\> h\! h\< d'\! |
			d'8\> a\! h\< d'\! |
			fis'8 d' d'\> cis'16( his)\! |
		}
		\\
		{
			a,4 r |
			a, r |
			a, a, |
			a, r |
		}
	>>
	s2 |

	r8 g, g, r |
	s2 |
	r8 e, e, r |
	s2 |
	r4 <h, d>8 r |
	r <b, d>4 r8 |

	<a, d> r4 <gis, d>8 |
	r4 <e, h,>8 r |
	r4 a, |
	<dis, a c'>4 <e, d gis h>8 r |
	r2 |
	r8 <a, g>[ q] r |

	r <a, fis> r <a, f> |
	r <a, e> r <a, dis> |
	r4 a8\> gis16( fis)\! |
	e4 r |
	s2 |
	s |

	s |
	<f, c>4 r |
	r8_\markup{\dynamic "p" \italic "espr."}\< e, e, a, |
	a, e, e, a, |
	cis e, d e,\! |
	a, e, e, a, |

	a, e, e, a, |
	a, d, d, a, |
	a, e, a, e, |
	cis e, e, a, |
	a,\sf\> d, d, a, |
	a,\p e, e, a, |
	a,\sf\> d, d, a, |
	a,\p e, e, a, |

	cis2--\pp\< |
	dis-- |
	e4-- fis-- |
	gis2-- |
	gis-- |
	a\>-- |
	gis4-- fis-- |
	e2-- |

	dis--\! |
	cis4-- r |
	dis2-- |
	cis4-- r |
	d8\mp a,\< a, d |
	d a, a, d |
	d a,\! a, d |
	d\> a, a, d\! |

	d_\markup{\dynamic "mf" \italic "cresc."} a, a, d |
	d a, a, d |
	d a, d\p a, |
	d a, a,4 |
	r a, |
	<b, e> e, |
	r <a, g cis'> |

	<b, e> e, |
	r b, |
	e, <fis, es a c'> |
	s2 |
	r4 <d f> |
	r <es g> |
	r8 <d f> r <es g b> |

	r4 b8\> a16( g) |
	f4\! r |
	s2 |
	s |
	r4. <cis gis>8 |
	q4 r |
	s2 |
	s2 |
	r4. <g, d>8 |
	q4 r |

	a,8_\markup{\dynamic "p" \italic "dolce"} d, d, a, |
	a,\< d, d, a, |
	a,\! d, a,\> d, |
	a,\! d, d, a, |
	\repeat unfold 4 { a, d, d, a, | }

	s2*17 \bar "||"
	\key b \major
	r4 <d, f b>4 |
	\repeat unfold 3 { s2 | r4 <d, b,> | }
	s2 |
	r4 <a, f c'> |

	s2 |
	r4 <g, f> \bar "||"
	\time 3/4
	r8 d,_\markup{\dynamic "mp" \italic "espr."} a,\< f a4\! |
	r8 d,\< a, f a4\! |
	r8\< d, a,\> f a4\! |
	\repeat unfold 3 { r8 d,\< a, f a4\! | }
	<d, d b>4\< r r |
	<es, b>\> r es'\! \bar "||"

	\time 2/4
	<<
		{
			\shiftOn
			b8\> f f\< b |
			b\> g g\< b |
			b f g b |
			s s s s |
			d'\< a a d' |
			d'\> h h\< d'\! |
			d' a h\< d' |
			fis'\! d' d' s |
		}
		\\
		{
			<f, d>4 r |
			<f, es> r |
			<f, d> <f, es> |
			<f, d> r |
			a, r |
			a, r |
			a, a, |
			a, r |
		}
	>>
	s2 |
	r8 c c r |
	s2 |
	r8 c c r |

	s2 |
	r4 <e g> |
	r8 <es g> r4 |
	<d g>8 r4 <cis g>8 |
	r4 <a, g>8 r |
	s2 |
	r4 <d f' gis'> |
	
	s2 |
	fis8 d\mf\< d fis |
	g\> d d\< g |
	fis\! d\< g( h) |
	e'16\>( d') cis'( h)\! a,4 |

	s2*3 |
	r4. <es b>8 |
	q r4 <cis g g>8 |
	s2*2 \bar "||"

	\key as \major
	r4. <b, f>8 |
	q r4. |
	s2*2 |

	c2--_\markup{\dynamic "p" \italic "espr."} |
	des-- |
	f4-- g-- |
	a2--\< |
	a-- |
	b--\! |
	a4--\> g-- |
	f2-- |

	<b, g>\sf\> |
	<f, c f>4\strum\! r |
	<b, g>2\sf\> \bar "||"
	\key c \major
	<a, f>4\! r |
	\repeat unfold 2 { a,8 d, d, a, | }
	a,\< d, a, d,\! |

	\repeat unfold 5 { a,8 d, d, a, | }
	d a, a, d |
	a, d, d, a, |
	d a, a, d |

	\repeat unfold 5 { a,8 d, d, a, | }
	a,8 r4. |
	s2*7 |
	<d, a,>2\laissezVibrer \bar "|."


}

\paper
{
	page-count = #3
}

\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = "Kytara"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \melodyI }
			\new Voice { \clef "treble_8" \bassesI }
			\new Voice { \clef "treble_8" \liningI }
		>>
	}
	\layout {  }
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
		midiMinimumVolume = 1
		midiMaximumVolume = 1
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyI }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesI }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130 4)
		}
	}
}
