\version "2.18.0"
\language "deutsch"

\header {
	title = "Calatrava"
	subtitle = "(„Slavnost“)"
	composer = \markup\line{"Federico Moreno Torroba"}  %," \teeny "revise a prstoklady: Darek (V/2015)"}
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
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
	\key a \major
	\time 3/4
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
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)
}

lining = {
	\global
	
}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\set tupletSpannerDuration = #(ly:make-moment 3 4)

	\tempo \markup \sans \bold "Allegretto"
	\transpose c c'
	{
		\repeat volta 3
		{
			\repeat unfold 2 { r8 <h fis d a,>[ r <gis d a,>] <a cis>16( gis fis8) | }
			r <gis d a,>[ r <e h, gis,>] fis16( e d8) |

			<e a, gis, cis,>2 r4 |
			r8 <d a, fis,>[ r <e h, gis,>] fis16( d fis8) |
			r <gis cis a,> e gis a16( fis a8) |
			r <h e gis,> gis h cis'16( a cis'8) |

			r <h fis d a,>[ r <gis d a>] a16 gis fis8 |
			\repeat unfold 2 { <e d gis,>4 r <fis a,>8 r | }
			r <gis d h, e,>[ q q] a16 gis fis8 |

			<< { gis2. } \\ { e, } >> |
		}
		\alternative
		{
			{
				\repeat unfold 2 { r8 <e h, g,>[ q q] <fis cis>16 e d8 | }
				\repeat unfold 2 { r <h g d>[ q q] <cis' fis d>16 h a8 | }
				<a fis cis>2 \times 4/5 { h16( cis' h a gis) } |
				\repeat unfold 2 { q2 \times 4/5 { gis16( a gis fis e) } | }

				<< { d2 \times 4/5 { d16( e d cis e) } } \\ { b,2 s4 } >> |
				<d h, fis,>2 <g d h,>4 |
				<f c a,>2 <b f d>4 |
				\repeat unfold 2 { <c' g e>8 r4. r4 | }

				<d' b f>4 r2 | 
				<b f d>4 r2 |
				a,8 e e e fis16 e d8 |

				a,8 e e e fis16 e d fis |
				e2~ e8 fis |
				gis16( fis e d) e4 cis8 d|
				\priraz{ h,16 cis } h4\trill \priraz{a,16 h,} cis4. a8 |

				r cis \priraz{d16 e} d4\trill \priraz{cis16 d} <e h, gis,>4 |
				r8 <e b, gis,>[ r <dis b, g,> r <dis gis, dis,> |
				r <dis as, f,> r q] g16 f e d |

				<e a, f, e,,>2 gis4 |
				r8 <cis a, e,>[ r <h, g,>] cis16 h, a,8 |
				r <e c g,>[ r <d h,>] <e g,>16 d c8 |
				r <g es b,>[ r <f cis es>] g16 f e8 |

				a16 g f8 h16 a gis8 cis'16 h a8 |
				<d' a fis>8[ cis'16 h a gis fis e d cis h, a,] |
				gis,[ fis, gis, a, h, cis d e fis gis a a] |

				h4. gis8 <a cis>16 gis fis8 |
			}
			{
				r8 <a e cis>[ r q] h16 a g8 |
				q r4. <e d>4 |
				r8 <a e cis>[ r q] h16 a g8 |
				q r4. r4 |
				d2 c16 h, a,8 |
				<d b, f,>8 r4. r4 |

				r8 <h, g,>[ q q] d h, |
				r g,16[ a, h, c d es f g a h] |
				c'2 c'16 b a8 |

				c' r4. r4 |
				d2. |
				d |

				\repeat unfold 2 { fis2 c16 h, a,8 | }
				f4. e16[ d c h, a, g, |

				f, e,] f,[ g, a, h, c d e f g a] |
				\repeat unfold 2 { h4. h8 c'16 h a8 | }

				h4 <h f>\strum q\strum |
				q\strum q\strum q\strum |
				q_\markup\italic "(rit.)"\strum q\strum q_\markup\italic "(a tempo)"\strum |
			}
			{
				\repeat unfold 2 { r8 <a e cis>[ r q] h16 a gis8 | }
				\repeat unfold 2 { r <h fis d>[ r q] cis'16 h a8 | }

				<d' a fis>16-^ cis' d'8 <e' h gis>16 d' e'8 fis'16 e' fis'8 |
				r fis'16[ e' d' cis' h a gis fis e d |
				cis h, a, gis, fis, e,] dis,[ e, fis, gis, a, h,] |
				\repeat unfold 2 { a,8 e a e f16 e d8 | }

				<e c>4->\strum q->\strum q->\strum |
				<e d gis,>8 r4. r4 |
				a <a e cis>-> q-> |
				q-> r2 \bar "|."
			}
		}
	}
}

basses = {
	\global
	\voiceTwo

	\repeat volta 3
	{
		\repeat unfold 2 { e4 e <e a,>8 r | }
		e4 cis <a fis h,>8 r |

		r e,[ e, fis, gis, a,] |
		h,4 cis <h a d>8 r |
		e4 r <d' a a,> |
		cis r <fis' a d>8 r |

		e4 e h |
		\repeat unfold 2 { r8 h,[ h, h,] cis16 h, a,8 | }
		h,4. r8 fis16 e d8 |

		h\rest <e' d'>[ q q q q] |
	}
	\alternative
	{
		{
			a,2 <a d>8 r |
			e2 <cis' fis>8 r |
			g4. r8 a r |
			g4. r8 a4 |
			r8 d[ d d] a,4 |
			\repeat unfold 2 { r8 d[ d d] <es cis'> r | }

			r8 <a f>[ q q] <g h,> r |
			r a,[ a, a,] e a, |
			r a,[ a, a,] gis d |
			\repeat unfold 2 { c g g g a16 g fis8 | }

			r8 d'[ d' d'] e'16 d' c'8 |
			r d'[ d' f'] e'16 d' c' b |
			<d a, e,>2 <gis d>4 |

			<d a, e,>2 <gis cis>8 r |
			a,8 e a d' cis'4 |
			h gis8 fis16 gis a8 fis |
			e4( a,8) e d cis |

			fis4 <a h,> gis,16 a, h,8 |
			cis4 cis h, |
			b, a, <d' a h,> |

			r8 d[ d d c h,] |
			a,4 e, <e a,>8 r |
			c4 gis, c8 r |
			es4 as, <b es>8 r |
			<f' c' es>[ r <d' e> r <fis' a>] r |
			h, r4. r4 |
			s2. |
			r8 <fis' d' a e> q r <e a,> r |
		}
		{
			<e a,>4 q <d' g> |
			<e a,>8 a16 a d'8 d' b g |
			<e a,>4 q <d' g> |

			<e a,>8 a16 cis' e'8 e' d' cis' |
			r8 b,16 d f8 b <c f,>4 |
			b,8 f,16[ g, a,8 b, c d] |

			f2 g4 |
			es4 s2 |
			r4 <es' b g> <d' fis> |
		
			<es' b g>8 a,16[ b, c d es f g a b c'] |
			\repeat unfold 2 { r8 << { b[ b b ] a16 b a8 } \\ { g,[ g, g,] f,4 } >> | }

			\repeat unfold 2 { r8 <d' a h,>[ q q] r4 | }
			r8 q q r4. |

			s2. |
			\repeat unfold 2 { r8 <f' h e a, e,>[ q] r4. | }

			r2 h4\strum |
			<h e>\strum q\strum <h e a,>\strum |
			q\strum <h e a, e,>\strum q\strum |
		}
		{
			\repeat unfold 2 { <e a,>4 q <d' f>8 r | }
			\repeat unfold 2 { gis4 gis a8 r | }
			h4-> cis'-> d'-> |
			<d' h e>8 r4. r4 |

			s2. |
			\repeat unfold 2 { <e a,>4 r b | }
			<g c>\strum q\strum q\strum |
			h,8[ e16 fis gis a h cis' d' e' fis' gis'] |
			r2 a4-> |
			<a e a,>-> r2_\markup\lower #3 \tiny "20. X. 2015 D." |
		}
	}
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
		print-page-number = ##f

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
			tempoWholesPerMinute = #(ly:make-moment 120 4)
		}
	}
}
