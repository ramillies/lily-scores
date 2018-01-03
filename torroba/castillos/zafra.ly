\version "2.18.0"
\language "deutsch"

\header {
	title = "Zafra"
	subtitle = "(„Přízraky“)"
	composer = \markup\line{"Federico Moreno Torroba"}  %," \teeny "revise a prstoklady: Darek (V/2015)"}
	arranger = ""
	poet = ""
	meter = ""
	tagline = ""
}

barre = #(define-music-function (parser location barre music) (string? ly:music?) 
              (let ((elts (extract-named-music music '(NoteEvent EventChord RestEvent))))
                   (if (pair? elts)
                       (let ((first-element (first elts))
                             (last-element (last elts)))
                         (set! (ly:music-property first-element 'articulations)
                               (cons (make-music 'TextSpanEvent 'span-direction -1)
                                     (ly:music-property first-element 'articulations)))
                         (set! (ly:music-property last-element 'articulations)
                               (cons (make-music 'TextSpanEvent 'span-direction 1)
                                     (ly:music-property last-element 'articulations))))))
           #{
               \override TextSpanner.bound-details.left.text = \markup { \upright { #barre } }
	       \override TextSpanner.bound-details.right.text = \markup { \draw-line #'(0 . -0.5) }
	       \override TextSpanner.bound-details.right.padding = #-2
               \override TextSpanner.style = #'line
               #music
       #} )
   
specbarre = #(define-music-function (parser location barre music) (markup? ly:music?) 
              (let ((elts (extract-named-music music '(NoteEvent EventChord RestEvent))))
                   (if (pair? elts)
                       (let ((first-element (first elts))
                             (last-element (last elts)))
                         (set! (ly:music-property first-element 'articulations)
                               (cons (make-music 'TextSpanEvent 'span-direction -1)
                                     (ly:music-property first-element 'articulations)))
                         (set! (ly:music-property last-element 'articulations)
                               (cons (make-music 'TextSpanEvent 'span-direction 1)
                                     (ly:music-property last-element 'articulations))))))
           #{
               \override TextSpanner.bound-details.left.text = #barre
	       \override TextSpanner.bound-details.right.text = \markup { \draw-line #'(0 . -0.5) }
	       \override TextSpanner.bound-details.right.padding = #-1
               \override TextSpanner.style = #'line
               #music
       #} )
tinystems = #(define-music-function (parser location how) (list?) #{ \override Stem.details.beamed-lengths = #how #} )
sp = #(define-music-function (parser location how) (pair?) #{ \override Arpeggio.positions = #how #} )
priraz = #(define-music-function (parser location music) (ly:music?) #{ \acciaccatura #music #} )
normstems = \revert Stem.details
extStrum = \override Arpeggio.positions = #'(-4 . 4)
normStrum = \revert Arpeggio.positions
empty = { \once \hide NoteHead \once \override NoteHead.no-ledgers = ##t }
vacuum = { \hide NoteHead \override NoteHead.no-ledgers = ##t }
visible = { \undo \hide NoteHead \revert NoteHead.no-ledgers }
tamb = \markup { T }
coda = \mark\markup\musicglyph #"scripts.coda"
segno = \mark\markup\musicglyph #"scripts.segno"
flag = \once \override NoteHead.style = #'harmonic-mixed
flagOn = \override NoteHead.style = #'harmonic-mixed
flagOff = \revert NoteHead.style

cross = \override NoteHead.style = #'cross
norm = \revert NoteHead.style

ffXII = \markup{\tiny XII}
ffVII = \markup{\tiny VII}
ffV = \markup{\tiny V}
ffIV = \markup{\tiny IX}
ffIX = \markup{\tiny IX}

osm = \set Staff.ottavation = \markup{\large\sans\bold "8"}
patnact = \set Staff.ottavation = \markup{\large\sans\bold "15"}

fO = \markup { \italic o }
fA = \markup { \italic a }
fM = \markup { \italic m }
fI = \markup { \italic i }
fP = \markup { \italic p }

sup = \arpeggioArrowUp
sdown = \arpeggioArrowDown
strum = \arpeggio

fleft = \set fingeringOrientations = #'(left)
fright = \set fingeringOrientations = #'(right)
fdown = \set fingeringOrientations = #'(down)
fup = \set fingeringOrientations = #'(up)

global = {
	\key d \minor
	\time 2/4
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\set Score.tempoHideNote = ##t
	\override TupletBracket.bracket-visibility = ##t
	\override Staff.TimeSignature.break-visibility = ##(#f #t #t)
%	\set fontSize = #1
	\set Score.voltaSpannerDuration = #(ly:make-moment 1/1)
}

lining = {
	\global

	\repeat unfold 3 { \repeat unfold 5 { s2 | \noBreak } s |\break \repeat unfold 5 { s | \noBreak } s |\break \repeat unfold 6 { s | \noBreak } s | \break } 
	\repeat unfold 5 { s2 | \noBreak } s |\break \repeat unfold 5 { s | \noBreak } s |\break
	\repeat unfold 4 { \repeat unfold 5 { s2 | \noBreak } s |\break } 
}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\set tupletSpannerDuration = #(ly:make-moment 3 4)

	\tempo \markup \sans \bold "Allegretto vivace"
	\transpose c c'
	{
		\repeat volta 2
		{
			r16 \repeat unfold 7 d16 | 
			r16^\markup\italic "Simile" \repeat tremolo 3 f r \repeat tremolo 3 d |
			r8 es16 es r \repeat tremolo 3 es |
			r \repeat tremolo 3 es r \repeat tremolo 3 es |

			r16 \repeat tremolo 7 d16 | 
			r16 \repeat tremolo 3 f r \repeat tremolo 3 d |
			r8 g16 g r \repeat tremolo 3 g |
			\coda r \repeat tremolo 3 g r \repeat tremolo 3 g |

			r16 \repeat tremolo 7 d16 | 
			r16 \repeat tremolo 3 f r \repeat tremolo 3 d |
			r8 b16 b r \repeat tremolo 3 b |
			r \repeat tremolo 3 b r \repeat tremolo 3 b |
			
		}
		\alternative
		{
			{
				r8 cis'16 cis' r \repeat tremolo 3 cis' |
				\repeat unfold 3 { r \repeat tremolo 3 cis' r \repeat tremolo 3 cis' | } 

				\repeat unfold 2 { r8 h16 h r \repeat tremolo 3 h |
				r \repeat tremolo 3 h r \repeat tremolo 3 h | }

				\repeat unfold 2 { r h f d r h f d | }
				\repeat unfold 2 { r c' fis es r c' fis es | }

				r e' a f r8 <e' a f> |
				r <f c> <f a,> r |
				\repeat unfold 2 { r16 \repeat tremolo 3 c r \repeat tremolo 3 c | }

				\repeat unfold 2 { r16 \repeat tremolo 3 g r \repeat tremolo 3 g | }
				\repeat unfold 2 { r16 \repeat tremolo 3 a r \repeat tremolo 3 a | }

				r b g d r8 <b g d> |
				r q r q |
				r16 \repeat tremolo 7 a, |
				r \repeat tremolo 3 c r \repeat tremolo 3 a, |

				\repeat unfold 2 { r16 \repeat tremolo 3 b, r4 | }
				r16 \repeat tremolo 7 a, |
				r \repeat tremolo 3 c r \repeat tremolo 3 a, |

				r g es b, r fis d a, |
				r f des as, r e c as, |
				r es c es g es a es |
				g f es d c b, a, g, |

				r f d f as f b f |
				as g f es d c b, as, |
				r b, e, f, g, a, b, c |
				d e f g a b c' d' |
				
				e'2-> |
				e'-> |
				e'-> |
				\transpose c c,
				{
					g16 a g f e d c b, |
					r8 <f' h gis>4 <e' h gis>8-> |
				}

				r <g d a,>4 <f d a,>8 | 
				r <a d b,>4 <g d b,>8 |
				r8 <f cis g,>4 <e cis g,>8 |
				r <e d f,>4 r8 |
				r <f es h,>4 r8 |

				\repeat unfold 2 { r <gis e b,>4 r8 | }
				r8 <as e h,>4 r8 |
				\transpose c c, { as, g,16( as, ces8) b,16( ces |
				d8) cis16 d f8 f16 e | }

				r8 <g c a,>4 q8 |
				r << { a4 c'8 } \\ { <es c>4. } >> |
			}
			{
				r16 a( f a) r g( e g) |
				r f( d f) r g( e g) |
				r a( f a) r g( e g) |
				r f( d f) r8 <e cis g,>-^ |
			}
		}
		
		\mark\markup\large{\magnify #2 \musicglyph #"scripts.coda" \lower #.6 \italic "Coda"}
		\repeat unfold 2 { r16 \repeat tremolo 3 f r \repeat tremolo 3 g |
		r \repeat tremolo 3 a r d d g | }
		\repeat unfold 2 { r \repeat tremolo 3 f r \repeat tremolo 3 e | }
		r8 b16 b b a g f |

		e f g a b a g f |
		e d c b, a, g, e, f, |
		d,2 |
		f,4 d, |
		r b,,-. |

		es,-. g,-. |
		b,-. es-. |
		g-. b-. |
		es' r |
		R2 |
		<a e cis g,>4 r |
		R2 |

		r16 d( e f g a b c' |
		d' e' d' c' b a g f |
		e d c b, a, g, f, e,) |
		r4 <d' a f a,> |
		q r \bar "|."
	}
}

basses = {
	\global
	\voiceTwo
	\shiftOn

	\repeat volta 2
	{
		d2 |
		d4 d |
		<g cis> b, |
		g, cis |

		d2 |
		d4 d |
		<cis' f> b, |
		f g |

		d2 |
		d4 d |
		<e' g> d |
		g, d |
	}
	\alternative
	{
		{
			<f' a> g, |
			h, cis |
			d e |
			f g |
			
			<f' d'> e' |
			f' d' |
			<f' h> a |
			g f |

			a g |
			a g |
			b a |
			b a |

			c' d |
			g r8 g, |
			c4 h |
			fis a |

			g cis' |
			f cis' |
			e cis' |
			g b |

			a g |
			f e |
			a,2 |
			a,4 a, |
			
			<d e,> f,8 g, |
			<d b,>4 e,8 g, |
			a,2 |
			a,4 a, |

			d d |
			d d |
			d r |
			r2 |

			as,4 r |
			r2 |
			g,4 r |
			r2 |

			\repeat unfold 3 { r8 << { <b' f'>4 r8 } \\ { a[ e g] } >> | } 
			s2 |
			\repeat unfold 4 { a,4 a, | }

			b,4. f,16( g, |
			as,4.) es8 |

			fis,4. b,16( h,) |
			cis4. gis8 |
			d4. cis16 d |
			s2 |
			s |

			es4. r8 |
			g2 |
		}
		{
			\repeat unfold 3 { <d a,>4 <d b,> | }
			<d a,> a,_\markup{ \tiny "D. C. al" \raise #.8 \musicglyph #"scripts.coda" } |
		}
	}

	<<
		{
			\stemDown\shiftOn 
			\repeat unfold 2 { a4 b | h b | }
			gis gis | gis gis |

		}
		\\
		{
			d2~ | d | d | d | d | d |
		}
	>>

	<cis' g d>4 r |
	s2 | s |
	r4 f, |
	g, a, |
	<b es g,>2 |
	\repeat unfold 5 { s | }
	a,4 r |
	s2 |
	d4 r |
	s2 | s |
	d~ |
	d4 r_\markup\tiny "17. X. 2015 D." |
}


\paper
{
		#(define fonts
			(set-global-fonts
				#:music "ross"
				#:brace "ross"
				#:roman "EB Garamond"
				#:sans "Linux Libertine O"
				#:typewriter "monospace"
				#:factor (/ staff-height pt 20)
			)
		)
		%#(set-paper-size "a5" 'landscape)

		system-system-spacing #'basic-distance = #20
		indent = #12
		left-margin = #5
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

		page-count = #2
		print-page-number = ##t

}

\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = "Kytara"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \melody }
			\new Voice { \clef "treble_8" \basses }
			\new Voice { \clef "treble_8" \lining }
		>>
	}
	\layout {  }
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melody }
			\new Voice { \clef "treble_8" \unfoldRepeats \basses }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 140 4)
		}
	}
}
