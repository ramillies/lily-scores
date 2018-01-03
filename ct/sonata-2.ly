\include "custom.ly"

\header {
	title = ""
	dedication = ""
	composer = ""
	arranger = ""
	subtitle = \markup \fill-line { \line{\fontsize #4.5 \sans \bold "II"} }
	poet = \markup\center-column{\line{\concat{"5" \small\raise #1 \underline "a"} "= G"} \line{\concat{"6" \small\raise #1 \underline "a"} "= D"}}
	tagline = ""
}

global = {
	\globalstyle
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)
	\time 6/8
	\key g \minor
}

liningII = {
	\global

	\partial 4 s4 |
	s2.*4 | \break
	s2.*5 | \break
	s2.*4 | \break
	s2.*5 | \break
	s2.*6 | \break
	s2.*6 | \break
	s2.*6 | \break
	s2.*6 | \break

	s2.*6 | \break
	s2.*5 | \break
	s2.*4 | \break
	s2.*5 | \break
	s2.*6 | \break
	s2.*5 | \break
	s1 s8 s2.*4 | \break
}

melodyII = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\main-tempo "Andantino, quasi Canzone."
	\partial 4 d8_\markup{\dynamic "p" \italic "dolce e tranquillo"} g |
	b8. a16 b8 <g c'>4 g8 |
	<b d'>4. r8 g' f' |
	\transpose c c'
	{
		e8.\> d16 c8 c\< d e |

		\slurUp f16(\> e) \slurDown d4\! r8 g f |
		e8.\> d16 c8 c\< d\! e |
		f16(\> e) d4\! g16( f) es4 |
		a4.~\strum\mf a16_\markup{\dynamic "p" \italic "subito"} g f d c(\> d)\! |
		c a, g,( a,) g, f, d,(\< f,) g, a, c d\! |
		g4.~_\markup\italic "dolce" g16\< a16 b( c')\> a b\! |
		g( f) es f g b d'8_\markup{\dynamic "mp" \italic "espr."} r c' |
		
		f4._\markup{\dynamic "p" \italic "dolce"} r16\< g as( b)\> g as\! |
		f es des es\< f as c'8->\!_\markup\italic "espr." r b |
		es4.~_\markup{\dynamic "p" \italic "dolce"} es16\> f g( as) f g |

		\slurUp es(\< f) g( as) f g es\!( f) g( as) b c' \slurDown |
		es'4\mf c'8 f'4.~ |
		f'8. es'16 des'8 as8. f16 g8 |
		<gis, cis gis>4\< e8\! <e, cis a>4 r8 |

		r8. gis16 fis8 cis8. a,16 h,8 |
		<g, cis>4\p\> a,8 <f, d>4.\! |
		<g, cis>4 a,8 <f, d>4 a8 |
		e2.-> |
		s |
		
		e'4._\markup\italic "molto espr." f'4.~ |
		f'8. e'16 d'8 c'8. as16 b8 |
		c'4. d'~ |
		d'8. c'16 b8 as8. e16 f8 |
		<c g>4. <c g a> |

		<c f g>4. <c es a> |
		<d f c'>2.-> |
		\flag h4\laissezVibrer s2 |
		<f d'>4. <ges es'~> |
		es'8. d'16 c'8 b8. ges16 as8 |

		b4. c'8 r4 |
		r8. b16 as8 ges8. d16 es8 |
		<b, f>4 r8 <b, g>4 r8 |
		f4 r8 <c g>4 r8 |
		<c g a>4. fis4 r8 |

		fis8. e16 fis8 <c g>4\strum c8 |
		<c g a>4. fis |
		fis8. e16 fis8 <c g>4\strum c8 |
		\tempo\markup\sans\bold "Esitando" gis4 cis8 a d g |
		\a-tempo b8. a16 b8 c'4 g8 |
		d'4 r d8 g |

		b8. a16 b8 c'4 g8 |
		<f d'>4 r g'8 f' |
		e'8. d'16 c'8 c' d' e' |
		f'16( e') d'4 r8 g'8 f' |
		e'8. d'16 c'8 c' d' e' |

		f'16( e') d'4 e'16( d') cis'4 |
		f16( e) d4 e16( d) cis4 |
		\tempo\markup\main-tempo "Più mosso" \tempo 4 = 65 r2. |
		<b, d e>8 q q r4. |

		r2. |
		<as, c d>8 q q r4. |
		\tempo\markup\main-tempo "Allegretto malincolico." \tempo 4 = 75 d4.~ d16 es f( g) es f |
		d4.~ d16 es f( g) es f |
		
		\priraz{d32 es} d16 c b,( c) d f b4-- as8 |
		g2 r4 |
		r8 <h, f g>8 q q r4 |

		r2 \rit q8 r |
		r <b, e g>8 q r <b, es g> q |
		r <ces f g>8 q r <ces des f> q |
		\override TextSpanner.bound-details.left.text = "riprendendo il"
		r8 g\startTextSpan as des d g, |
		as, des,( d,) r8 h, e\stopTextSpan  |

		\tempo-primo \tempo 4 = 50
		<h, g>8. fis16 q8 <c a>4 e8 |
		<h, h>8 r4. d8 g |
		<d b>8. a16 q8 <es c'>4 g8 |
		<b, g d'>4 a8\rest b,4. |
		r8 <g, d> r r <g, e> r |

		r <b, f> <b, fis> <b, g> r r |
		r <c g> r2 |
		r4 <b, fis>8 <b, g> r4 |
		r8 <c g> r r <c gis>4 |

		\time 9/8
		r4 <c a>8 r4 <f c'>8 r4. |
		\time 6/8
		\flag f'4 r8 \flag g'4 r8 |
		r8. f'16 d'8 b8. f16 g8 |
		<fis, d a>4. h4 r8 |

		r8. a16 fis8 d8. a,16 h,8 |
		<es, g, c>4. <g, cis> |
		<es, g, c> <g, cis> |
		<d fis>2. |
		\flag <d' fis'>^\ffVII \bar "|."
	}
}

middleII = {
	\global
	\voiceTwo
	\slurDown

	\partial 4 s4 |
	s2. |
	f8\rest d g b8. a16 b8 |
	c'4 g8 g\rest d' c' |
	
	b8. a16 g8 g a b |
	\shiftOn \tinystems #'(10) c'16( b) g4 g8\rest \tinystems #'(3) d' c' \normstems |
	b8. a16 g8 b8. a16 g8 \shiftOff |
	s2. |

	s |
	<b es'>4 q8 q4 r8 |
	s2. |

	es'4 d'8 des' a4\rest |
	s2. |
	des'4 des'8 c'4 r8 |

	s4. c'4 r8 |
	<c' g'>4 r8 <des' as'>4 r8 |
	s2.*7 |

	<c' g'>4 q8 <c' as'>4 r8 |
	s2. |
	s4. <as f'>4 r8 |
	s2. |
	s |
	
	s2.*8 |
	b4 a8 s4. |
	s2.*9 |
	<e' g'>4 q8 q8 f' e' |
	d'8. c'16 b8 b c' d' |
	e'4 g'8 g' f' e' |

	s2.*6 |
	<as c'>8 q q q g4\rest |
	q8 q q q g4\rest |
	s2.*11 |

	f8\rest d8 g b4. |
	s2.*5 |

	\time 9/8
	s1 s8 |
	\time 6/8
	b4 s2 |
	s2.*7 \bar "|."
}

bassesII = {
	\global
	\voiceFour
	\slurUp

	\partial 4 s4 |
	<g, d>4 q8 <g, e>4. |
	g,4. <g, d> |
	<g, e>4 r8 q4 r8 |

	<g, d>4 q8 q4 r8 |
	\shiftOff <g, e>4. q4 r8 |
	<g, d>4 g,8\rest <es, es>4 r8 \shiftOn |
	<d, a, fis a d'>4\strum <d, fis a d'>8 <d, f a d'>4 d,8 |

	d,4 d,8 d,4 r8 |
	d4 d8 c8 r4 |
	r4. <a es'>8 ges f |

	<b, f>4 q8 q8 c4\rest |
	r4. <g des'>8 fes es |
	as,4 as,8 as, r4 |

	<as ces'>8 r4 as,8 r4 |
	g,4. r8 des f |
	as des' f' r4. |
	e,4 r8 r e, cis |

	e8 a h cis'4. |
	<es, a,>4.-> r8 d,-. a,-. |
	q4.-> r8 d,-. a,-. |
	r8 a, e\< a cis' e'\! |
	a' a\< c' e' a' c''\! |

	g,4 g,8 g, g as |
	c' d' f' as' r4 |
	<g, g e'>4\mp\< q8 r\! g,-. d-. |
	f as c' f'4 r8 |
	r e g, r es g, |

	r8 d <g, h> r fis g, |
	r g, d \flagOn g_\ffXII d'_\ffXII g'_\ffXII |
	h'_\ffXII \flagOff g( h) \flagOn d'_\ffXII g'_\ffXII h'_\ffXII \flagOff | 
	<f b>4 <f b f'>8 c' f ges |
	b c' es' ges' r4 |

	<f, f d'>4 q8 <b ges'> f, c |
	es ges c' es' r4 |
	r8 d f, r cis e, |
	r c es, a, es g |
	r d, a, d a d' |
	
	r4. <a es a, es,>4\strum r8 |
	r d, a, d a d' |
	r4. <a es a, es,>4\strum r8 |
	r2. |
	<g, d' g'>4 q8 <g, e' g'>4 r8 |
	<g, b g'>8 d g b8. a16 b8 |

	<b, d' f'>4 q8 <b, e' g'>4 r8 |
	b,8 f b d'8. c'16 d'8 |
	b,4. b, |
	b, r |
	b, b, |

	r4 <b, f d'>8 r4 <a, e cis'>8 |
	r4 <g, d b>8 r4 <fis, cis ais>8 |
	f16( e) d8 f16( e) d8 f16( e) d8 |
	r4. gis,4->( a,8) |

	\repeat unfold 3 { es16( d) c8 } |
	r4. fis,4->( g,8) |
	\repeat unfold 3 { r8 d d, r d d, | }

	r8 <d h f'> <d, h f'> g,16 as, b,( c) as, b, |
	g,4.~ g,16 as, b,( c) as, b, |

	g,( f,) es,( f,) g, b, es4 des8 |
	c4. des |
	g, as, |
	s2. |
	r4. g, |

	<g, e>4 q8 <g, fis>4 r8 |
	g, h, e g8. fis16 g8 |
	<g, g>4 q8 q4 r8 |
	g,4 r8 r d, g, |
	b,8. a,16 b,8 c4 g,8 |

	d4. r8 g f |
	e8.( d16) c8 c d e |
	f16( e) d4 r8 g f |
	e8.( d16) c8 c d e |

	f16( e) d4 c16( b,) a,4 g,16( f,) e,4 |
	r8 d,-. b,-. f-. b-. d'-. |
	f'4 r2 |
	r8 d,-. a,-. fis-. a-. d'-. |
	fis'-. r4 r4. |
	\repeat unfold 2 { r8 d, a, e a, d, | }
	r8 \ottava #1 \arm-osm \flagOn d a fis' a' d'' |
	r4. \ottava#0 \flagOff <d, a, fis a>4.\bar "|."
}

dynamics = {
	\global
	\partial 4 s4 |
	s2.*27 |

	s8 s\< s s s s\! |
	s8 s\< s s s s\! |
	s\< s2 s8\! |
	s2.*6 |

	s8 s\< s s s s\! |
	s4._\markup\italic "espr." s4\< s8\! |
	s8 s\< s s s s\! |
	s2 s8 s\> |
	s4.\! s |
	s2._\markup\italic "dolcissimo" |
	s4 s8\< s4 s8\! |

	s4.\< s\! |
	s4.\< s\! |
	s4.\> s\< |
	s4.\> s\< |
	s2.\! |

	s2._\markup\italic "movendo un poco" |
	s |
	s_\markup\italic "ironico" |
	s4. s4\p\> s8 |

	s8\< s s\! s4. |
	s4. s4\p\> s8\! |
	s4. s16\<_\markup{\dynamic "p" \italic "espr."} s s s\> s s\! |
	s4. s16\< s s s\> s s |

	s\< s s s s\! s s4. |
	s4. s8._\markup{\dynamic "p" \italic "espr."} s16\> s s |
	s4.\! s16\< s s s\> s s |

	s\< s s4 s4.\> |
	s\!_\markup\italic "espr." s\< |
	s s\! |
	s2._\markup\italic "movendo (a piacere)" |
	s4.\> s\! |

	s2. |
	s8\< s s\! s8. s16\< s8 |
	s4\mp\< s8 s4\! s8 |
	s4 s4\p s4_\markup\italic "molto espr."

	s2.\pp |
	s4.\< s\! |
	s\> s\< |
	s\! s |
	s\> s\< |

	\time 9/8
	s\! s\> s8 s4\! |
	\time 6/8
	s2._\markup{\dynamic "mp" \italic "espr."} |
	s8. s_\markup\italic "dolce" s4.\< |
	s\! s |

	s8. s\> s\< s |
	s4._\markup\italic "molto dolce" s\> |
	s\< s\> |
	s2.\pp |
	s }

\paper
{
}

\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = "Kytara"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \melodyII }
			\new Voice { \clef "treble_8" \middleII }
			\new Voice { \clef "treble_8" \bassesII }
			\new Voice { \clef "treble_8" \liningII }
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
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyII }
			\new Voice { \clef "treble_8" \unfoldRepeats \middleII }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesII }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 50 4)
		}
	}
}
