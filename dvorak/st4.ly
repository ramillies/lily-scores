\include "custom.ly"

\header {
	title = "Slovanský tanec č. 4"
	%subtitle = "(z „Dobře temperovaných kytar“)"
	composer = "A. Dvořák"
	poet = ""
	tagline = ""
}

global = {
	\key f \major
	\time 3/4
	\override Score.VerticalAxisGroup #'remove-first = ##t

	\globalstyle
}

one = {	
	\global
	\tupletDown
	\slurUp
	\stemDown
	\oneVoice

	\transpose c c''
	{
		\repeat volta 2
		{
			R2.*4 |
			r8 f16( a c'8 f' c' a) |
			<c' a e>8^\staccato q^\staccato <a f d>2 |

			<a f>4 g8( a c' b) |
			a4( g f) |
		}
		\repeat volta 2
		{
			R2. |
			r4 \times 4/6 { c8( d e) e( f g) } |
			a a a2^\markup\line{\musicglyph #"scripts.trill" "(" \raise #.6 \magnify #0.6 \musicglyph #"accidentals.natural" ")"} |
			\priraz{gis16 a} h4^\trill c'8( g e d) |
			c8( g,16 c e8 g e c) |

			f f d4( b,) |
			a,\( g,8 a, c16( b,) f,\rest g, |
			g,4 f,\) r |
		}
	}
	\transpose c c'
	{
		r8_\mf\< <c' a>16( <d' b> <es' c'>8 <g' es'> <f' d'> <es' c'>) |
		<b' d'>8-.\f q-. <f' d'>4.->(\> <d' b>8\!) |
		r8_\pp <c' a>16( <d' b> <es' c'>8 <g' es'> <f' d'> <es' c'>) |
		<b' d'>8-. q-. <f' d'>4.( <d' b>8) |

		r8 <a fis>16( <b g> <c' a>8\< <es' c'> <d' b> <c' a>\!) |
		<g' h>8->\f q-> <d' h>4.( <h g>8) |
		r8 <a fis>16(\pp <h g> <c' a>8 <e' c'> <d' h> <c' a>) |
		<g' h>8 q <d' h>4.(\< <h g>8)\! |
		<g' b>8->\cresc q-> <d' b>4.( <b g>8) |
		<g' b>8->\f q-> <d' b>4.( <b g>8) |

		r8 g16\p^\markup{\italic "rit."}( a b8\> <d' b> <c' a> <b g>) |
		q4( a8\!) r4. |
	}
	\transpose c c''
	{
		r8 <a c'>16\mf^\markup{\italic "a tempo"}( <b d'> <c' es'>8\< <es' g'> <f' d'> <c' es'>) |
		\ottava #1 \osm 
		<b' d'>8-.->\f q-.-> <f' d'>4.->( <d' b>8) |
		r8 <c' a>16( <d' b> <es' c'>8 <g' es'> <f' d'> <es' c'>) |
		<b' d'>8-. q-. <f' d'>4.( <d' b>8) |

		r8 <a fis>16_\p( <b g> <c' a>8 <es' c'> <d' b> <c' a>) |
		<g' h>8-. q-. <d' h>4.( <h g>8) |
		r8 <a fis>16( <h g> <c' a>8\dim <e' c'> <d' h> <c' a>) |
		<g' h>8-.\pp q-. <d' h>4.( <h g>8) |
		<g' b>8-. q-. <d' b>4.(\< <b g>8) |
		<g' b>8-.\f q-. <d' b>4.( <b g>8) |
	
		\ottava #0
		<<
			{ 
				b8-. g16( a b8 d' b a) |
				b8-. g16( a b8 d' b a) |
				g8-. e16( f g8 b g f) |
				g8-. e16( f g8 b g f) |
			}
			\\
			{ 
				d4~\fz d8 r d4~\dim |
				d4~\p d8 r d4\dim |
				c4~\pp c8 r c4~\> |
				c4~ c8 r c4\! |
			}
		>>

		<g b,>8 <e c>16( <f d> <g e>8)\< q16( <a f> <b g>8) <g e>16( <a f> |
		<b g>8) <g e>16( <a f> <b g>8) q16( <c' a> <d' b>8) q16( e') |
		<f' c' a>8\ff f16( a c'8 f' c' a) |
		<c' a e>8-^ q-^ <a f d>2-^ |

		<< { a4 g8( a b a) } \\ { f2. } >> |
		<g e>4( f) r |
		r8 f16( a c'8 f' c' a) |
		<c' a e>8-> q-> <a f d>2-> |
		<c' a e>8-^ q-^ <a f d>2-^ |
		<c' a f>8-> r <d' b f>-> r <b g e>-> r |

		q8-^ q-^ <a f>2-^ 
		<c' a e>8-> q-> <a f d>2-> |
		<c' a e>8-^ q-^ <a f d>2-^ |
		\priraz{c'16 d' e'} <f' c' a>8-> r <d' b f>-> r <b f d>-> r |
		<g e c>8-^ q-^ <f c>2-^ |
		r8 d16(\p e f8 c' a f) |

		r8 d16( e f8 c' a f) |
		e( a\cresc f d c f |
		d b, a, d b, g,) |
		c-. c-. f2->\dim |
		c8-. c-. f2-> |
		r8 d16( e f8 c' a f) |

		a8\pp( c' a f a c' a f a c' a f) |
		a8( c' a f a c') |
		<f' c' a f>2.\pp |
		q |
		q-\fermata |

		\key b \major
		\repeat volta 2
		{
			\priraz e'8\p f'4 d'8-. d'-. es'-. c'-. |

			\priraz e'8 f'4 d'8-. d'-. es'-. c'-. |
			d'8-. b-. f2~ |
			f4. f8( b d') |
			f'8 r r2 |
			r \priraz e'8 f'4~\fz |
			f'4 d'8-.\< d'-. es'-. c'-. |
			d'-> b-> c'-> a-> b\f r |
		}
	}
	\transpose c c'
	{
		<d' b>4->\fz <b g>8-.\pp q-. a-. d-. | 
		<d' b>4->\fz <b g>8-. q-. a-. d-. | 
		\repeat unfold 2 { <f' d'>4-> <d' b>8-. q-. c'-. f-. | }
		d'8-> d' c' f d'->\< d' |
		c' f d'-> d\! c' f |
	}
	\transpose c c''
	{
		<d' b>8->\cresc f <c' a>-> f <d' b>-> f |
		<f a c'>2.\fermata\ff |
		r2 \priraz e'8 f'4\fz |
		r2 \priraz e'8 f'4\fz |
		d'8-.\p d'-. es'-. c'-. d'-. b-. |
		c'-. a-. b-. f( b d') |
	}
	\transpose c c'''
	{
		\ottava #1 \osm
		<f des>4->\mf <des b,>8-.\< q-. <es c>-. <c a,>-. |
		<f des>4-> <des b,>8-. q-. <es c>-. <c a,>-. |
		<as f>4->\f <f des>8-. q-. <ges es>-. <es c>-. |
		<as f>4-> <f des>8-. q-. <ges es>-. <es c>-. |
		\override Slur.extra-offset = #'(0 . -2)
		<f des>8-^ q-^ <as as,>(-^ f) f-. f-. |
		<as as,>-^( f) f-. f-. <a a,>(-^ f) |

		f-. f-. <a a,>-^( f) r4
		\ottava #0
		
		R2. |
		<< { \priraz e8 f4 d8-. d-. es-. c-. } \\ { f,2.\ff } >> |
		<< { \priraz e8 f4 d8-. d-. es-. c-. } \\ { f,2. } >> |
		\revert Slur.extra-offset

		<d f,>8-^ b,-^ f,2->~ |
		f,4. f,8( b, d) |

		\priraz e8 <f f,>4-^\fz <d b,>8-. q-. <es c>-. <c f,>-. |
		\priraz e8 <f f,>4-^\fz <d b,>8-. q-. <es c>-. <c f,>-. |
		<f d>8-^ <d b,> <es c>-^ <c a,> <d b,>-^ <b, f,> |
	}
	\transpose c c''
	{
		<c' a>-^ <a fis> <b g>-^ <g d> <as f>-^ <f d> |
		<g es>-^ <es b,> <f d>-^ <d h,> <es c>-^ <c a,> |
	}
	\transpose c c'
	{
		<des' b>-^ <b g> <c' as>-^ <as es> <b g>-^ <g es> |

		<es' c' as>4-^\fp <c' as>8 q\> <des' b> <b g> |
		<es' c' as>4-^\dim <c' as>8 q <des' b> <b g> |
		c'8-. as-. es2~-> |
		es4. es'8( as' c'') |
	}
	\transpose c c'''
	{
		es4\pp r \priraz d8 es4 |
		r2 \priraz d8 es4 |

		r2 \priraz d8 es4 |
		r2 \priraz d8 es4 |
		r2 \priraz dis8 e4 |
		r2 \priraz dis8 e4 |
		\ottava #1 \osm
		c8-. c-. c'-. c-. c-. c-. |
		c'-. c-. c-. c-. c'-. c-.
	}
	
	\bar "||"
	\key f \major
}

one_bass = {
	\global
	\slurDown
	\stemUp
	\oneVoice

	\transpose c c'
	{
		\repeat volta 2
		{
			r8 f16( a c'8 f' <a c'> <a f>) |
			<c' a e>_\staccato q_\staccato <a f>2 |
			q4( <f g>8 a b a)|
			g4( f) r |
			r8 f16( a c'8 f' <a c'> <a f>) |
			<c' a >_\staccato q_\staccato <a f>2 |
			<g f>4 g8( a <es' c'> <d' b>) |
			<c' a>4( <b g> <a f>) |
		}
		\repeat volta 2
		{
			R2.*3 |
			g8 r g2 |
			r4 <c' g>4. <g e>8 |
			f2. |
			c2~ <c b,>4 |
			<c~ b,> <c a,> r |
		}

		r4 a8-. r a-. r |
		r4 b8-. r b-. r |
		r4 a8-. r a-. r |
		r4 b8-. r b-. r |

		r4 fis8-. r fis-. r |
		r4 g8-. r g-. r |
		r4 fis8-. r fis-. r |
		r4 g8-. r g-. r |
		r4 g8-. r g-. r |
		r4 g8-. r g-. r |

		r8 d16( fis <g d>4 e) |
		e8( c <f c>) r4. |
		r8 <a c'>16( <b d'> <c' es'>8 <es' g'> <f' d'> <c' es'>) |
		<b' d'>8-.-> q-.-> <f' d'>4.->( <d' b>8) |
		r8 <c' a>16( <d' b> <es' c'>8 <g' es'> <f' d'> <es' c'>) |
		<b' d'>8-. q-. <f' d'>4.( <d' b>8) |

		r8 <a fis>16_( <b g> <c' a>8 <es' c'> <d' b> <c' a>) |
		<g' h>8-. q-. <d' h>4.( <h g>8) |
		r8 <a fis>16( <h g> <c' a>8 <e' c'> <d' h> <c' a>) |
		<g' h>8-. q-. <d' h>4.( <h g>8) |
		<g' b>8-. q-. <d' b>4.( <b g>8) |
		<g' b>8-. q-. <d' b>4.( <b g>8) |

		<<
			{ 
				b8-. g16( a b8 d' b a) |
				b8-. g16( a b8 d' b a) |
			}
			\\
			{ 
				d4~ d8 r d4~ |
				d4~ d8 r d4 |
			}
		>>
		<g e>8-. e16( f g8 b g f) |
		<g e>8-. e16( f g8 b g f) |

		<g e>8 <e c> <g e> <e c> <b g> <g e> |
		<b g> <g e> <b g> <g e> <d' b>8-. q16( e') |
		<f' c' a>8\ff f16( a c'8 f' c' a) |
		<c' a e>8-^ q-^ <a f>2-^ |

		<< { a4 g8( a b a) } \\ { f2. } >> |
		<g e>4( f) r |
		r8 f16( a c'8 f' c' a) |
		<c' a e>8-> q-> <a f d>2-> |
		<c' a e>8-^ q-^ <a f d>2-^ |
		<c' a f>8-> r <d' b f>-> r <b g e>-> r |

		q8-^ q-^ <a f>2-^ 
		<c' a e>8-> q-> <a f >2-> |
		<c' a e>8-^ q-^ <a f >2-^ |
		\priraz{c'16 d' e'} <f' c' a>8-> r <d' b f>-> r <b f d>-> r |
		<g e c>8-^ q-^ <f c>2-^ |
		R2.*2 |

		r8 a-. r a-. r f-. |
		r f-. r d-. r d-. |
		r d16( e f8 c' a f) |
		r d16( e f8 c' a f) |
		c'8-. c'-. <a f>4 c'8-. c'-. |

		q4 c'8-. c'-. q4 |
		c'8-. c'-. q4 c'8-. c'-. |
		q8( c' a f a c') |
		<c' a f>2.\pp |
		q |
		q-\fermata |

		\key b \major
		\repeat volta 2
		{
			\grace s8 r2 \priraz e'8 f'4\fz |

			r2 \priraz e'8 f'4\fz |
			d'8-. d'-. es'-. c'-. d'-. b-. |
			c'-. a-. b-. r4. |
			\priraz e'8\fz f'4 d'8-. d'-. es'-. c'-. |
			\priraz e'8\fz f'4 d'8-. d'-. es'-. c'-. |
			d'8-> b-> f2~\fz |
			f b8 r |
		}

		g4 r2 |
		g4 r2 |
		b4 r2 |
		b4 r2 |
		b8 b <a f> r b b |
		<a f> r b b <a f> r |

		<d' b>-> f <c' a>-> f <d' b>-> f |
		<c' a f>2.\fermata |
		\priraz e'8 f'4\fz d'8-.\p d'-. es'-. c'-. |
		\priraz e'8 f'4\fz d'8-. d'-. es'-. c'-. |
		d'-. b-. f2->~ |
		f4. f8( b d') 
		
		\transpose c c'
		{
			<f des>4-> <des b,>8-. q-. <es c>-. <c a,>-. |
			<f des>4-> <des b,>8-. q-. <es c>-. <c a,>-. |
			<as f>4-> <f des>8-. q-. <ges es>-. <es c>-. |
			<as f>4-> <f des>8-. q-. <ges es>-. <es c>-. |
		}
		r4 <f' des' as>->\fz r |
		q->\fz r <f' es' a>->\fz |

		r q->\fz a8-^ f-^ |
		a f-^ a-^ f-^ a-^ f-^ |
		b-^ f-^ b-^ f a f |
		b-^ f-^ b-^ f a f |
		b-> f b-> f a-> f |
		b-> f a-> f b-> f |

		\repeat unfold 2 { <d' b f>4-^ <d' b>8-. q-. <es' c'>-. <c' f>-. | }
		<f' d'>8-^ <d' b> <es' c'>-^ <c' a> <d' b>-^ <b f> |
		<c' a>-^ <a fis> <b g>-^ <g d> <as f>-^ <f d> |
		<g es>-^ r g-^ r es-^ r |
		es-^ r <es c>-^ r <des b,>-^ r |

		es4-^ r es8 r |
		es4-^ r es8 r |
		R2.*2 |
		\repeat unfold 2 { es'4-^ c'8-. c'-. des'-. b-. | }

		\repeat unfold 2 { as-. as-. c'-. as-. r4 | }
		\repeat unfold 2 { c'8-. c'-. e'-. c'-. r4 | }
		e'4-. r2 |
		R2. |

		\key f \major


	}
}

kytara = {
	\global
	\voiceOne
	\slurDown
	\override Staff.BarLine.thick-thickness = #4.4
	\override Staff.BarLine.kern = #2.4
	\override Staff.BarLine.hair-thickness = #1.5

	\repeat volta 2
	{
		r8 f16( a c'8 f' <a c'> <a f>) |
		<c' a e>8-\staccato q-\staccato <a f>2-\marcato |
		<a f~>4( <g f>8 a b a) |
		g4 f r |
		r8 f'16( a' c''8 f'' c'' a') |
		<c'' a' e'>8-\staccato q-\staccato <a' f' d'>2 |

		<a' f' d'>4 g'8( a' <c'' es' c'> <b' d' b>) |
		<c' a>4( <b g> <a f>) |
	}
	\repeat volta 2
	{
		R2. |
		r4 \times 4/6{ c'8( d' e') e'( f' g') } |
		a'8-\staccato a'-\staccato a'2^\markup\line{\musicglyph #"scripts.trill" "(" \raise #.6 \magnify #0.6 \musicglyph #"accidentals.natural" ")"} |
		\priraz{gis'16 a'} h'4^\trill c''8( g' e' d') |
		c'8 g16 c' e'8 g' e' c' |

		f'8-\staccato f'-\staccato d'4( b) |
		\phrasingSlurDown
		a\( g8 a c'16( b) r g |
		<g c~>4 <f c f,>\) r 
	}

	s2. |
	s4 <f' d'>2 |
	s2. |
	s4 <f' d'>2 |
	s2. |
	s4 <d' h>2 |
	s2. |
	s4 <d' h>2 |
	s4 <d' b>2 |
	s4 <d' b>2 |
	\slurUp
	r8 <g d>16( <a fis> b8 d' c' b) |
	<b g>4( a8) r4. |
	\slurDown
	\transpose c c''
	{
		r8 <c a, c,>16_\mf^\markup\italic "a tempo"( <d b, d,> <es c es,>8\< <g es g,> <f d f,> <es c es,>) |
		\ottava #1 \osm <b d>8->-.\f q->-. \ottava #0 <f d f,>2-> |
		r8 <c a, c,>16( <d b, d,> <es c es,>8\< <g es g,> <f d f,> <es c es,>) |
		\ottava #1 \osm <b d>8-.\f q-. \ottava #0 <f d f,>2 |
	}
	\transpose c c'
	{
		r8 <a fis a,>16\p( <b g b,> <c' a c>8 <es' c' es> <d' b d> <c' a c>)
		\ottava #1 \osm <g' h g>8-. q-. \ottava #0 <d' h d>2 |
		r8 <a fis a,>16( <h g h,> <c' a c>8\> <es' c' es> <d' h d> <c' a c>)
		\ottava #1 \osm <g' h g>8-.\pp q-. \ottava #0 <d' h d>2 |
		\ottava #1 \osm <g' b g>8-. q-. \ottava #0 <d' b d>2 |
		\ottava #1 \osm <g' b g>8-. q-. \ottava #0 <d' b d>2 |

		\repeat unfold 2 { b8-. g16( a b8 d' b a) | }
		\repeat unfold 2 { g8-. e16( f g8 b g f) | }
		g8[ <e c>16( <f d> <g e>8)\< q16( <a f> <b g>8) <g e>16( <a f> |
		<b g>8) <g e>16( <a f> <b g>8) q16( <c' a> <d' b>8) q16( e')] |
		<f' c' a>8\strum\ff \slurUp f16([ a c'8 f' c' a)] |

		<c' a e c>8\strum-^ q\strum-^ <a f d>2-^\strum |
		a4 g8( a b a) |
		<g e g, e,>4( <f f, f,,>) r |
		r8 f16[ a c'8 f' c' a] |
		\repeat unfold 2 { <c' a e c>8\strum-^ q\strum-^ <a f d f,>2-^\strum | }
		<c' a f>8[_\markup\italic "sempre marcato"\strum r <d' b f b,>\strum r <b g e>\strum] r |

		<b g e>\strum q\strum <a f d f,>2\strum |
		<c' a e c>8\strum q\strum <a f d f,>2\strum |
		<c' a e c>8\strum q\strum <a f d f,>2\strum |
		\slurDown
		\priraz{c'16 d' e'} <f' c' a>8[ r <d' b f> r <b f d>] r |
		<g c g,>8\strum q\strum <f c a>2\strum |
		r8\p d16( e f8 c' a f) |
		r8 d16( e f8 c' a f) |

		e([\< <a a,> f <d a,> c <f f,> |
		d <b, f,> a, <d d,> b, <g, d,>]) |
		c c f2\> |
		c8 c f2 |
		r8 d16( e f8 c' a f) |
		a8[(\p c' a f a c' |
		a f a c' a f |
		a c' a f a c']) |
		<f' c' a f>2.\strum\pp |
		<f' c' a f>2.\strum |
		<f' c' a f>2.\strum\fermata |
	}


	s2.*50 |
}

kytara_bass = {
	\global
	\voiceTwo

	\repeat volta 2
	{
		s2.*2 |
		f,2. |
		s |
		f, |
		a,8-\staccato a,-\staccato f,2-\accent |

		f,4 g r |
		s2. |
	}
	\repeat volta 2
	{
		s2. *3 |
		g8 r g2 |
		r4 <c' g>4. <g e>8 |
		f2. |
		c |
		s |
	}
	
	\slurUp
	r8 <c' g>16( <d' b> <es' c'>8 <g' es'> <f' d'> <es' c'>) |
	<b' d'>8-\staccato q-\staccato b-\staccato r b-\staccato r |
	r8 <c' g>16( <d' b> <es' c'>8 <g' es'> <f' d'> <es' c'>) |
	<b' d'>8-\staccato q-\staccato b-\staccato r b-\staccato r |
	r8 <a fis>16( <b g> <c' a fis>8\< <es' c'> <d' b fis> <c' a>) |
	<g' h>8\f-> q-> g8-. r g-. r |

	r8 <a fis>16(\p <h g> <c' a fis>8 <e' c'> <d' h fis> <c' a>) |
	<g' h>8 q\< g8-. r g-. r |
	<g' b>8-> q-> g8-. r g-. r |
	<g' b>8->\f q-> g8-. r g-. r |
	r4\p^\markup\italic "(rit.)" <g d>4\> e |
	e8 c <f c> r4.\! |
	s2. | \repeat unfold 9 { s | }

	<d' d>4.\fz r8 q4~\> |
	q4.\p r8 q4\> |
	<c' g e>4.\pp r8 q4~ |
	q4. r8 q4 |
	<b g e>4\laissezVibrer s2 | s2. |
	<a' f' c' f,>8\strum \slurDown f16([ a c'8 f' c' a)] |

	f,8\strum f,\strum f,2\strum |
	<f f,>2. |
	s | s |
	a,8\strum a,\strum <f, a,>2\strum |
	a,8\strum a,\strum <f, a,>2\strum |
	<f a, f,>8\strum[ r <b f,>\strum r <f a,>\strum] r |

	<e a,>8\strum q\strum <f a, f,>2\strum |
	e8\strum e\strum q2\strum |
	e8\strum e\strum q2\strum |
	d8[ r d r d] r |
	<g e c>\strum q\strum <f c f,>2\strum |
	s2. | s | s | s |

	\slurUp
	r8 d16( e f8 c' a f) |
	r8 d16( e f8 c' a f) |
	\repeat unfold 4 { s2. | }
	<f, a,>2.\strum |

	q\strum |
	q\strum_\fermata |
}

two = {
	\global
	\stemDown
	\slurUp
	\tupletDown
	\oneVoice

	\repeat volta 2
	{
		r8 <c' a f>4 q q8 |
		<c' a e>8^\staccato q^\staccato <d' a f>2 |
		c'4( b8 c' d' c') |
		<< { \once\override Slur.positions = #'(3 . 2.5) \voiceOne b4( \hideNotes \stemDown b b8 b16 a) } \\ { \voiceTwo e8 g <f a> c' a f16 a } >> |
		<c' a f>8 <f' c' a>4 q q8 |
		<e' c' g>8^\staccato q^\staccato <d' a f>2 |
		<a f>8( c' e f <fis es'> <d' g>) |
		<c' a>8( f <b e> g <a f> f) |
	}
	\repeat volta 2
	{
		r8
		\clef "treble" \transpose c c' { 
			c16( e g8 c' g <e c>) |
			<g h,>8-\staccato q-\staccato <e c>2 |
			q4\( <d h,>8 <e c> <f d a,> e |
			<d h,>4 c2~ |
			c8\) r c( e c g,) |
		}
		\clef "bass"
		<< { \voiceOne d'8-\staccato d'-\staccato b4( g) } \\ {\voiceFour f2. } >> |
		f4( e8 f g e) |
		e-\staccato c-\staccato f4 r |
	}

	\repeat unfold 2
	{
		<es' g'>8-\staccato q-\staccato <es' c'>4.( <c' a>8) |
		r <d' b>16( <c' es'> <d' b>8 <d' f'> <c' es'> <d' b>) |
	}

	<c' es'>8-. q-. <c' a>4.( <a fis>8) |
	r <h g>16( <a c'> <h g>8 <h d'> <c' a> <h g>) |
	<c' e'>8-. q-. <c' a>4.( <a fis>8) |
	r <h g>16( <a c'> <h g>8 <h d'> <c' a> <h g>) |
	\repeat unfold 2 { r <b g>16( <c' a> <b g>8 <d' b> <c' a> <b g>8) | }

	r8 b16( c' d'8 b a g) |
	g4( f8) r4. |

	\repeat unfold 2
	{
		<es' g'>8-\staccato q-\staccato <es' c'>4.( <c' a>8) |
		r <d' b>16( <c' es'> <d' b>8 <d' f'> <c' es'> <d' b>) |
	}

	<c' es'>8-. q-. <c' a>4.( <a fis>8) |
	r <h g>16( <a c'> <h g>8 <h d'> <c' a> <h g>) |
	<c' e'>8-. q-. <c' a>4.( <a fis>8) |
	r <h g>16( <a c'> <h g>8 <h d'> <c' a> <h g>) |
	\repeat unfold 2 { r <b g>16( <c' a> <b g>8 <d' b> <c' a> <b g>8) | }

	g8-. e16( fis g8 b g f) |
	g8-. e16( fis g8 b g f) |
	e8-. c16( d e8 g e d) |
	e8-. c16( d e8 g e d) |
	<g e>8 <b g e>4-> q-> q8~-> |

	q q4-> q-> <e' g e>8 |
	\set tupletSpannerDuration = #(ly:make-moment 3 4)
	\times 6/9
	{
		c8( f a c' a f c f a |
		e a c' d' a f d f a) |
		c'( a f b f c' d' f c' |
		b g e a f c a, c f) |

		c8( f a c' a f c f a |
		e a c' d' a f d f a) |
		e( a c' d' a f d f a) |
		f( a c' d f b e g b) |
		e( g b c f a c' a f) |

		e( a c' d' a f d f a) |
		e( a c' d' a f d f a) |
		a, gis, a, b, c d g, fis, g |
	}

	c16(-^ b, a, g,) f2-^ |
	\clef "treble" <g' e' c' b>8-. q-. <f' c' a>2-> |

	<g' e' c' b>8-. q-. <f' c' a>2-> |
	\clef "bass" <e' cis' a g>8-. q-. <d' a f>4-> <c' a f es>8-. q-. |
	<b f d>4-> <a fis d c>8-. q-. <g d b,>4-> |
	<b g c>8-. q-. <a f c>2-> |
	<b g c>8-. q-. <a f c>2 |
	<b g c>8-. q-. <a f c>2 |
	q2 q4~ |

	q q2 |
	q2. |
	a,8( f, a, c a, f, |
	a, c a, f, a, c) |
	f,2.-\fermata |

	\key b \major
	\repeat volta 2
	{
		\grace s8 r4 <d' b f>8-. q-. <es' a f> r |
		r4 <d' b f>8-. q-. <es' a f> r |

		r4 <es' a f>8-. q-. <d' b f> r |
		r4 <es' a f>8-. q-. <d' b f> r |
		r4 \clef "treble" <f' d'>8-. q-. <f' es'>-. r |
		r4 <f' d'>8-. q-. <f' es'>-. r |
		r4 d'8-. d'-. es'-. r |
		d'-. d'-. es'-. r <f' d'> r |
	}

	\clef "bass"
	\repeat unfold 2 { r4 <b g d>8-. q-. <c' a fis d> r | }
	\repeat unfold 2 { r4 <d' b f>8-. q-. <es' c' a f> r | }
	\repeat unfold 3 { <d' b f>8 r <c' a f> r } |

	<d' b>8-> f <c' a>-> f <d' b>-> f |
	<c' a f>2.\fermata |
	\repeat unfold 2 { r4 <d' b f>8-. q-. <es' a f>-. r | }
	r4 <es' a f>8-. q-. <d' b f> r |
	<es' a f>-. q-. <d' b f> r4. |

	\repeat unfold 2 { r4 <des' b f>8-. q-. <es' c' f>4 | }
	r4 \clef "treble" <f' des' as>8-. q-. <ges' es' as>4-> |
	r4 <f' des' as>8-. q-. <ges' es' as>4-> |
	r4 <f' des' as>4->\fz r |
	q-> r <f' e' a>4-> |
	r q-> r |
	R2. |

	\clef "bass" \repeat unfold 2 { r4 <d' b f>8 q <es' a f>4 | }
	\priraz e'8 <f' f>4-^ d'8-. d'-. es'-> c'-> |
	d'-> b-> <c' f>-> a-> <b f>-> r |
	\repeat unfold 2 { <d' b f>4-> q-> <es' c' f>-> | }

	<d' b f>8-> r <es' c' a>-> r <d' b f>-> r |
	<c' a fis>-> r <b g d>-> r <as f d>-> r |
	<g es b,>-> r <h g f d>-> r <c' g es>-> r |
	<b g es des>-> r <as es c>-> r <g es f b,>-> r |
	<as es c>-^ es as es g es |

	<as es c>-^ es as es g es |
	<es' c'>4 c'8-. c'-. des'-. b-. |
	c'-. as-. b-. g-. as-. r |
	\repeat unfold 2 { <as c>-. es-. as-. es-. <g b,>-. es-. | }

	<<
		{
			\repeat unfold 6 { as8-. es-. } |
			\repeat unfold 6 { b-. g-. } |
		}
		\\
		{
			\repeat unfold 4 { c4 r c } |
		}
	>>
	<b g c>4-. r2 |
	R2.

	\clef "treble" \key f \major
	\transpose c c'
	{
		r8_\p << { s8 c'\< f' c' a\! } \\ { f16~ <f a>~ q2 } >> |
		<e a c'>8-. q <d f a>2-> |
		q4 << { <e g>8(\> <f a> <g h> a) | <h, e g>4( <a, c f>2)\! | } \\ { d4 d8 c | s2. | } >>
		r8 << { s8 c'\< f' c' a\! } \\ { f16~ <f a>~ q2 } >> |
		<e a c'>8-.\< q <d f a>2->\! |

		<d f a>4 << { <e g>8( <f a> <fis c'> <g h>) } \\ { d4 es8 d } >> |
		<c f a>4(\> <h, e g> <a, c f>)\! |
		r8\mf << { c16\( e g8 c' g e\) } \\ { s16 e16~ e4. c8 } \\ { c8~ c2 } >> |
		<h, g>8-> q-> <c e>2-> |
		<a,~ c e>4\(\p <a, h, d>8 <c e> <a, d f> e |
		<d h, f,>4 <c g, e,>2~ |

		q8\) r c(\< e g e)\! |
	}
	\clef "bass" << { d'8-.\fz\> d' b( g)\! } \\ { f2. } >> |
	<f a>4_\markup\italic "dim." <e g>8( <f a> <g b> <e g>) |
	<c~ e g b>4\p( <c f a>) r |
	<es' g'>8-^\f q-^ <c' es'>4.( <a c'>8) |
	r8 <b d'>16( <c' es'> <b d'>8 <d' f'> <c' es'> <b d'>) |

	<es' g'>8-^ q-^ <c' es'>4.( <a c'>8) |
	r8 <b d'>16( <c' es'> <b d'>8 <d' f'> <c' es'> <b d'>) |
	<c' es'>8-.\p q-. <a c'>4.( <fis a>8) |
	r8 <g h>16( <a c'> <g h>8_\markup\italic "dim." <h d'> <a c'> <g h>) |
	<c' e'>8-.\pp q-. <a c>4.( <fis a>8) |

	r8 <g h>16( <a c'> <g h>8 <h d'> <a c'> <g h>) |
	r8 <g b>16(\< <a c'> <g b>8 <b d'> <a c'> <g b>) |
	r8\f <g b>16( <a c'> <g b>8 <b d'> <a c'> <g b>) |
	g8-.\fz e16( fis g8 b g f) |

	g8-._\markup\italic "dim." e16( fis g8 b g f) |
	e8-.\p c16( d e8 g e d) 
	e8-. c16( d e8 g e d) 
	<e g>8\< <e g b>4-> q-> q8->~ |
	q q4-> q-> <g b e'>8->\! |

	\tupletSpan 2.
	\times 6/9
	{
		c8\(\ff f a c' a f c f a |
		e a c' d' e f d f a\) |
		c'\( a f b\> f c' d' f c' |
		b g e\! a f c a, c f\) |
	}
}

two_bass = {
	\global
	\stemUp
	\slurDown
	\shiftOn
	\oneVoice

	\repeat volta 2
	{
		<f, f,,>2 q4 |
		<a, a,,> <d d,>2 |
		<< { \voiceOne r8 f4 f f8 } \\ { \voiceTwo c2. } >> |
		<c, c~>4 <c f,>4. r8 |
		<f, f,,>2 q4 |
		<a, a,,> <d d,>2 |
		<c c,>2( <a, a,,>8 <b, b,,>) |
		<c c,>2 <c f>4 |
	}
	\repeat volta 2
	{
		<c c,>8 r <c' g e>4. <e g>8 |
		<f d>8-\staccato q-\staccato <g c>2 |
		<< { \voiceOne <a a,>4 <a e> f, } \\ { \voiceFour a,2 s4 } >> |
		<< { \voiceOne f8 g <g e>2~ } \\ { \voiceFour g,8 r c r g, r } >> |
		<< { \voiceOne <g e>4 } \\ { \voiceFour c,8 r8  } >> r2 |
		<b, b,,>8 r q2 |

		<c c,> q4 |
		q f,8-\staccato c,-\staccato f,,-\staccato r |
	}

	f, r f r f r |
	<< { \voiceOne r4 b8 r b r } \\ { \voiceFour b,,2. } >> |
	f,8 r f r f r |
	b,, r b, r b, r |

	d, r d r d r |
	<< { \voiceOne r4 g,8 r g, r } \\ { \voiceFour g,,2. } >> |
	d,8 r d r d r |
	\repeat unfold 3 { << { \voiceOne r4 g, g, } \\ { \voiceFour g,,2. } >> | }

	r8 b,16( a, g,4 c) |
	<c c,>4( f,8) c,-. f,,-. r |

	<<
		{
			\mergeDifferentlyDottedOn
			\repeat unfold 2 { f,,4( f f) | b,,( f f) | }
			\repeat unfold 2 { d, d d | g, d d | }
			\repeat unfold 2 { g, d d | }
		}
		\\
		{
			\override NoteHead.stencil = #ly:text-interface::print
			\override NoteHead.text = \markup\musicglyph #"noteheads.s1"
			\repeat unfold 2 { f,,4. s | b,, s | }
			\repeat unfold 2 { d, s | g, s | }
			\repeat unfold 2 { g, s | }
			\revert NoteHead.stencil \revert NoteHead.text
		}
	>>
	
	b,8-. r b,2-> |
	b,8-. r b,2-> |
	g,8-. r g,2-> |
	g,8-. r g,2-> |
	<c c,>4 q q |

	q q q |
	<f, f,,>2 q4 |
	<a, a,,>8-> q-> <d d,>2-> |
	<c c,> q4 |
	q-> <f, f,,>2-> |

	q q4 |
	<a, a,,>8-> q-> <d d,>2-> |
	<a, a,,>8-> q-> <d d,>2-> |
	<a a,>8-> r <g g,>-> r <c c,>-> r |
	q8-^ q-^ <f, f,,>2-^ |
	
	<a, a,,>8-> q-> <d d,>2-> |
	<a, a,,>8-> q-> <d d,>2-> |
	\times 6/9 { a,,8 gis,, a,, b,, c, d, g,, fis,, g,, } |
	c,16(-^ b,, a,, g,,) f,,2-^ |
	r4 <c f,>-> r |

	r4 <c f,>-> r |
	g,8-. r d,-. r f-. r |
	b,,-. r d,-. r g,,-. r |
	c,4( f, f,,) |
	c,4( f, f,,) |
	c,4 <f, f,,>2 |
	q q4~ |

	q q2 |
	q2. |
	\transpose c c,
	{
		a,8( f, a, c a, f, |
		a, c a, f, a, c) |
		f,2.-\fermata |
	}
	
	\key b \major
	\repeat volta 2
	{
		\grace s8 b,-. r4. c8-. r |
		b,-. r4. c8-. r |

		b,8-. r c r b, r |
		c r b, r4. |
		b8-. r4. c'8-. r |
		b8-. r4. c'8-. r |
		b8 r b r c'-. r |
		b r c'-. r b r|
	}

	\repeat unfold 2 { <g, g,,>4 r2 | }
	\repeat unfold 2 { <b, b,,>4 r2 | }
	\repeat unfold 3 { q8 r f, r } |

	<b, b,,>4-> <f, f,,>-> <b, b,,>-> |
	<f, f,,>2.\fermata |
	\repeat unfold 2 { b,8-. r4. c8-. r | }
	b,8-. r c r b, r |
	c r b, r4. |

	\repeat unfold 2 { <b, b,,>4 r2 | }
	\repeat unfold 2 { <des des,>4 r2 | }
	r4 q-> r |
	q r <c c,>-> |
	r q r |
	R2. |

	\repeat unfold 2 { <b, b,,>4 r <c c,> | }
	<b, b,,>4 <f d b,>8 r <f es c> r |
	<f d b,> r <es c f,> r <d b,> r |
	\repeat unfold 2 { <b, b,,>-^ f, q-^ f <a, a,,>-^ f | }

	<b, b,,>8-> r <f f,>-> r <b, b,,>-> r |
	<d d,>-> r <g, g,,> r <b, b,,>-> r |
	<es, es,,>-> r <g, g,,>-> r <c, c,,>-> r |
	<es, es,,>-> r q-> r q-> r |
	\repeat unfold 2 { <as, as,,>4-^ r q8 r | }

	<<
		{
			as8-. es-. as-. es-. g-. es-. |
			as-. es-. des-. es-. c-. es-. |
		}
		\\
		{
			as,2 as,4 | as,2 as,4 |
		}
	>>
	\repeat unfold 4 { <as, as,,>4 r q | }

	\repeat unfold 2 { <g, g,,> r q | }
	q r2 |
	R2.

	\key f \major
	f,4 <c f a>4. q8 |
	a, r d2-> |
	<d, d>4 r g, |
	<c, c> f, f,, |
	f,4 <c f a>4. q8 |
	<a,, a,> r <d d,>2-> |

	<d, d>2 <a,, a,>8 <b,, b,> |
	<c, c>2 <a,, a,>4 |
	c,4 <e g>4. q8 |
	<d f>8-> q-> <c g>2-> |
	a,4 r f, |
	g,( e c,) |

	<c, c>8 r <c e g>2-> |
	<b,, b,>2.\f |
	<c, c>2 q4 |
	c,4 f,8-. c,-. f,,-. r |
	<< { \mergeDifferentlyHeadedOn \mergeDifferentlyDottedOn f,,4( f, f,) | b,,( f, f,) } \\ { f,,2. | b,, } >> |

	<<
		{
			\mergeDifferentlyHeadedOn \mergeDifferentlyDottedOn
			f,,4( f, f,) |
			b,,( f, f,) |
			d, d d |
			g, d d |
			d, d d |
			\repeat unfold 3 { g, d d | }
		}
		\\
		{
			f,,2. | b,, | d, | g, | d, | g, | g, | g, 
		}
	>> |
	b,8-. r b,2-> |

	b,8-. r b,2-> |
	g,8-. r g,2-> |
	g,8-. r g,2-> |
	<c, c>4 q q |
	q q q |
	<f,, f,>2 q4 |
	<a,, a,>8-> q-> <d, d>2-> |
	<c, c> q4 |
	q <f,, f,>2 |
	
}
\paper
{
}

\score {
	<<
		\new StaffGroup 
		<<
			\new PianoStaff \with {
				instrumentName = "I"
				\remove "Keep_alive_together_engraver"
			} {
				<<
					\new Voice { \magnifyStaff 0.75 \clef "treble" \one }
					\new Voice { \magnifyStaff 0.75 \clef "treble" \one_bass }
				>>
			}

			\new Staff \with {
				instrumentName = "Kytara"
				\consists "Span_arpeggio_engraver"
			} {
				\set Staff.connectArpeggios = ##t
				<<
					\new Voice { \clef "treble_8" \kytara }
					\new Voice { \clef "treble_8" \kytara_bass }
				>>
			}

			\new PianoStaff \with {
				instrumentName = "II"
			} {
				<<
					\new Voice { \magnifyStaff 0.75 \clef "bass" \two }
					\new Voice { \magnifyStaff 0.75 \clef "bass" \two_bass }
				>>
			}

		>>
	>>
	\layout
	{
		\context
		{
			\Score
			\override StaffGrouper.staff-staff-spacing.padding = #0
			\override StaffGrouper.staff-staff-spacing.basic-distance = #1
		}
	}
}

\score {
	\new StaffGroup 
	<<
		\new Staff \with {
			midiInstrument = "acoustic grand"
		} {
			<<
%				\new Voice { \clef "treble" \unfoldRepeats \one }
%				\new Voice { \clef "treble" \unfoldRepeats \one_bass }
			>>
		}

		\new Staff \with {
			midiInstrument = "acoustic guitar (steel)"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} {
			<<
				\new Voice { \clef "treble_8" \unfoldRepeats \kytara }
				\new Voice { \clef "treble_8" \unfoldRepeats \kytara_bass }
			>>
		}
		\new Staff \with {
			midiInstrument = "acoustic grand"
			midiMinimumVolume = 0.6
			midiMaximumVolume = 0.6
		} {
			<<
				\new Voice { \clef "bass" \unfoldRepeats \two }
				\new Voice { \clef "bass" \unfoldRepeats \two_bass }
			>>
		}
	>>

	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 90 4)
			\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
		}
	}
}
