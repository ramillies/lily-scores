\version "2.18.0"
\language "deutsch"

\header {
	title = "Mallorca"
	subtitle = "(Barkarola)"
	composer = \markup\line{"Isaac Albeniz"}  %," \teeny "revise a prstoklady: Darek (V/2015)"}
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
	\key a \minor
	\time 6/8
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

}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\set tupletSpannerDuration = #(ly:make-moment 3 4)

	\tempo\markup\sans\bold "Andantino"

	\repeat unfold 2 { r8 f'8( e') r \priraz gis' f' e' | }
	r8 <e' c'>4. <c' a>4 |
	r8 <e' c'>4. a8 c' |
	\repeat unfold 2 { e'4.. h16 d' e' g' f' | }

	\transpose c c'
	{
		e16\prall d c( d) e f <h, gis,>\prall ais, h,( c) d h, |
		c\prall h, a, h, f,4 \priraz gis,8 f, e, |
		\repeat unfold 2 { e4.. h,16 d e g f | }

		e4.. d16 c b, as, c |
		g,4. <c' g e> |
		g4.. e16 g a h g |
		f g as f <c as,> d g,8 c d |

		\repeat unfold 2 { e4. c16( h,) c e g f | }
		<e c> f( e) d c d e4 c8 |
		\slurUp <h, a,>4. h,16( c) h, ais, h, f \slurDown |
		gis,(_\markup\italic "(rit.)" a,) h, d f a gis f d h, gis, f, |
		e4.._\markup\italic "a tempo" h,16 d e g f |

		e4.. h,16 d e g f |
		e16\prall d c( d) e f <h, gis,>\prall ais, h,( c) d h, |
		c\prall h, a, h, f,4 \priraz gis,8 f, e, |
		a4.. d16 f a c' b |

		a4. d |
		r4 gis,8 <a, e,>8. r |
		r4 <h, f,>8 <c e,>4. |
		<c a,>4 q8 h,4 g8 |

		<f a,> r d <c a,>4 <f a,>8 |
		f,16\strum b, d es g f d f c'( b) g( f) |
		d( c) b, g, f, d, f,4. |
		gis,,16 h,, d,( e,) f, gis, <h, gis,> d e f gis h gis f d h, gis, f, r4.^\fermata

	}

}

basses = {
	\global
	\voiceTwo
	\shiftOn
	\slurUp

	\repeat unfold 2 { r8 <c' e>4 \flag h8^\ffVII d4 | }
	\repeat unfold 2 { r4 dis8 e4. | }
	\repeat unfold 2 { a,4 <a e c>8 <gis d>4. | }

	g4\rest e8 d4 e8 |
	a,4. h, |
	\repeat unfold 2 { a,4 <a e c>8 <gis d>4. | }

	r4 <c' g e>8 f4. |
	r4 <c' e>8 g\rest c' e' |
	h4\rest <h g f>8 r4. |
	a4\rest <as f>8 s4. |

	\repeat unfold 2 { h,16 gis, d e g f <e a,>4. | }
	<g c>4 <as f>8 <g c>4. |

	d16 e d cis d e <a f>4 d8 |
	eis4. e\rest |
	\repeat unfold 2 { a,4 <a e c>8 <gis d>4. | }

	g4\rest e8 d4 e8 |
	a,4. h, |
	h4\rest e'8 s4. |

	h4\rest <cis' a>8 g4.\rest |
	e4 d8 c16 h,( c) e g f |
	e4 gis,8 a,16 gis, a, c e a |
	f,4 c8 g16 fis, g, c dis( e) |

	d a, d( e) g f <e a,>4 es8 |
	<d b,>4.\strum r |
	s s |
	s <d e,> |
	e, \flag e^\ffXII^\fermata |
}

ostinato = {
	\global
	\voiceFour
	\shiftOff

	a,2. | a, | a, | a, | s |
	s | a, | s | s |
	s | c4. s | c c | c <c'g e> | c <g e> |
	s2. | s | s |
	s | e, | s |

	s | a, | s | cis4. d4 <f' a>8 |
	e,4. f,16 a, d e g f | s2. | s | s |
	s | s | b, | s |
	s |
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

		%page-count = #1
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
			\new Voice { \clef "treble_8" \ostinato }
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
			\new Voice { \clef "treble_8" \unfoldRepeats \ostinato }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 60 4)
		}
	}
}
