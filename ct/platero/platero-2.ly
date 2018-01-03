\version "2.18.0"
\language "deutsch"

\header {
	title = "VII — Melancholie"
%	subtitle = "(ze souboru „Platero a já“)"
	composer = "Mario Castelnuovo-Tedesco (1895 — 1968)"
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
flagsOn = \override NoteHead.style = #'harmonic-mixed
flagsOff = \revert NoteHead.style

cross = \override NoteHead.style = #'cross
norm = \revert NoteHead.style

ffXII = \markup{\tiny XII}
ffVII = \markup{\tiny VII}
ffV = \markup{\tiny V}
ffIV = \markup{\tiny IX}
ffIX = \markup{\tiny IX}

osm = \set Staff.ottavation = #"8"

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
	\override TupletBracket.bracket-visibility = #'if-no-beam
	\override Staff.TimeSignature.break-visibility = ##(#f #t #t)
%	\set fontSize = #1
}

lining = {
	\global

	\repeat unfold 7 { s2. | \noBreak } s |\break
	\repeat unfold 7 { s2. | \noBreak } s |\break
	\repeat unfold 7 { s2. | \noBreak } s |\break
	\repeat unfold 7 { s2. | \noBreak } s |\break
	\repeat unfold 7 { s2. | \noBreak } s |\break
	\repeat unfold 7 { s2. | \noBreak } s |\break
	\repeat unfold 6 { s2. | \noBreak } s |\break
	\repeat unfold 5 { s2. | \noBreak } s |\break
	\repeat unfold 5 { s2. | \noBreak } s |\break

	\time 15/8 s1... |\noBreak s |\noBreak \time 9/8 s1 s8 |\break
	\time 6/8
	\repeat unfold 4 { s2. | \noBreak } s |\break
	\repeat unfold 4 { s2. | \noBreak } s |\break
}

trebles = {
	\voiceOne
	\stemUp
	\slurUp

	\repeat unfold 2
	{
		e'4. c' |
		a h |
		c'4 e'8 g'4 f'8 |
		e'4 s s |
	}

	e'4. c'' |
	h'~ h'8 a' g' |
	fis'4. c'' |
	h'~ h'8 h' h' |
	h' h' h' h' \priraz { c''16 h' } ais'8 h' |

	d''4. c'' |
	h' a' |
	g' f' |
	e'4 d'8 c'4 h8 |
	
	e'4. c' |
	a h |
	c'4 e'8 g'4 f'8 |

	e'4. s |
	e' c' |
	a h |
	c'4 e'8 g'4 f'8 |
	
	e'4. s |
	e' c'' |
	h'~ h'8 a' g' |

	fis'4. c'' |
	h'~ h'8 a' g' |
	e' e' e' e' \priraz{f'16 e'} dis'8 e' |

	g'4. f' |
	e' d' |
	e'~ e'8 c' d' |

	e' e' e' e' \priraz{f'16 e'} dis'8 e' |
	g'4. f' |
	e' d' |

	e' f' |
	e' dis' |
	e'4 d'8 c'4 h8 |
	
	r <e' c'>( a) r q( a) |
	r q( a) r <e' d'>( a) |
	r <e' c'>( a) r q( a) |

	r q( a) r q( a) |
	r q( b) r q( b) |
	r q( b) r q( b) |
	r q b r <e' d'> cis' |

	r <e' c'>( b) c e' fis' |
	g' g' g' g' \priraz{a'16 g'} fis'8 g' |
	h'4. r8 g' a' |
	h' h' h' h' \priraz{c''16 h'} ais'8 h' |

	d''4. r8 h' cis'' |
	d'' d'' d'' d'' \priraz{e''16 d''} cis''8 d'' |
	f''( d'' h') d''( h' gis') |
	h'( gis' f') gis'( f' d') |
	
	e''4. cis'' |
	a' h' |
	cis''4 e''8 gis''4 fis''8 |
	e''4. s |

	e'' cis'' |
	a' h' |
	cis''4 eis''8 gis''4 fis''8 |
	f''4. s |

	r <f' h gis>8 r4 |
	r4. <f' h a d>8 r4 |
	r4. <f' h gis>8 r4 |
	r4. <f' h a d g,>8 r4 |

	r4. <f' h gis d gis,>8 r4 |
	\time 15/8 s1... |
	s |

	\time 9/8 s1 s8 |
	\time 6/8 s2. |

	\repeat unfold 9 s |

}

melody = {	
	\global
	\voiceTwo
	\tupletUp
	\stemDown
	\slurUp

	\tempo\markup\line{"Andantino" \teeny "elegiaco"}

	\override Slur.extra-offset = #'(0.7 . -0.3)
	e'8( c' a) c'( a f) |
	\once\override Beam.positions = #'(-2.2 . -4) a( f d) h( g e) | 
	c'( a f) g'( d' h) |
	e'( c' a) as( f d) |

	e'8( c' a) c'( a f) |
	\once\override Beam.positions = #'(-2.2 . -4) a( f d) h( g e) | 
	c'( a f) g'( d' h) |
	e'( c' a) as( f des) |

	e'( c' a) c''( f' c') |
	h'-\shape #'((0 . -0.25) (0 . 0) (0 . 0) (0 . 0)) ( h a) fis a4\rest |
	fis'8( c' a) c''( e' c') |
	h'-\shape #'((0 . -0.25) (0 . 0) (0 . 0) (0 . 0)) ( h a) fis a4\rest |
	<h gis d>2.\strum |

	d''8( e' d') c''( e' d') |
	h'( e' h) a'( e' a) |
	g'( c' a) f'( c' a) |
	\once\override Beam.positions = #'(-1 . -2) e'( c' a) c'( as f) |

	e'( c' a) c'( a f) |
	\once\override Beam.positions = #'(-2.2 . -4) a( f d) h( g e) |
	c'( a f) g'( d' h) |

	e'( c' a) as( f d) |
	e'( c' a) c'( as f) |
	a( f d) h( g e) |
	\once\override Beam.positions = #'(-1.75 . -3.5) c'( a f) g'( h as) |

	e'( c' a) as( f d) |
	e'( a e) c''( e' d') |
	h'-\shape #'((0 . -0.25) (0 . 0) (0 . 0) (0 . 0)) ( e' h) \stemUp e \stemDown h4\rest |

	fis'8( c' a) c''( e' c') |
	h'-\shape #'((0 . -0.25) (0 . 0) (0 . 0) (0 . 0)) ( dis' h) a h4\rest |
	<b g>2.\strum |

	g'8( c' a) f'( c' a) |
	e'( as f) d( as f) |
	e'-\shape #'((0 . -0.25) (0 . 0) (0 . 0) (0 . 0)) ( c' g) e r4 |
	
	<b g>4. s |
	\once \override Beam.positions = #'(-1 . -2.5) g'8( c' a) f'( c' a) |
	\once\override Beam.positions = #'(-0.75 . -2)  e'( c' a) \once\override Beam.positions = #'(-0.45 . -1.7) d'( h a) |

	\override Beam.positions = #'(-0.75 . -2)
	e'( c' a) f'( c' a) |
	e'( c' a) \once\override Beam.positions = #'(-0.45 . -1.7) dis'( h a) |
	e'( c' a) \revert Beam.positions c'( as e) \bar "||"

	\repeat unfold 15 s2. \bar "||"
	\key a \major
	\once\override Beam.positions = #'(1.5 . .5) e''8( cis'' a') cis''( a' fis') |
	\once\override Beam.positions = #'(1 . -.5) a'( fis' d') h'( gis' e') |
	cis''( a' e') gis''( dis'' c'') |
	e''( cis'' a') gis'( f' d') |

	e''( cis'' a') cis''( a' fis') |
	\once\override Beam.positions = #'(1.5 . 0) a'( fis' d') h'( a' f') |
	cis''( gis' f') gis''( dis'' c'') |
	f''( cis'' a') gis' f g |

	gis gis gis cis \priraz{a16 gis} fisis8 gis |
	h4. s8 f g |
	gis gis gis cis \priraz{a16 gis} fisis8 gis |
	h4. s8 f g |

	gis gis gis s gis ais |
	\time 15/8
	h h h r4. r16  \stemUp c'( a f \stemDown e[ cis a,)] \stemUp e'([ cis' a] \stemDown gis[ f cis)] \stemUp gis'([ f' cis'] \stemDown c'[ a)] |

	f8 r4 <fes d e,>8 r4 \stemUp r16 c''( a' f' \stemDown e'[ cis' a)] \stemUp e''([ cis'' a'] \stemDown gis'[ f' cis')] \stemUp gis''([ f'' cis''] \stemDown c''[ a')] |
	\time 9/8 \stemDown f'8 r4 <e' d' gis e>8 r4. \stemUp a'8 h' |
	\time 6/8 cis'' cis'' cis'' cis'' \priraz{d''16 cis''} his'8 cis'' |
	e''4. r8 a' h' |

	cis'' cis'' cis'' cis'' \priraz{d''16 cis''} his'8 cis'' |
	gis''4. r8 a' h' |
	cis'' cis'' cis'' cis'' \priraz{d''16 cis''} his'8 cis'' |
	a''4. s |

	s2. |
	s |
	s
	\override TextScript.extra-offset = #'(0 . -.5)
	<cis' a e a, e,>2.^\fermata_\markup\tiny{"11. IV. 2015 D."} \bar "|."
}

basses = {
	\global
	\voiceTwo
	\stemDown
	\slurUp
	
	a,2. |
	a, |
	a,4. d |
	a,2. |

	a, |
	a, |
	a,4. g,4. |
	c2. |

	c4. d |
	dis2. |
	e |
	dis |
	e,\strum |

	a,4. b,|
	h, c |
	d dis |
	e e, |

	a,2. |
	a, |
	a,4. d |

	a,2. |
	a,4. as, |
	g,2. |
	c |

	c |
	c4. fis, |
	g, gis, |

	a, b, |
	h,2. |
	c |

	c|
	c|
	c|

	c4. cis |
	d dis |
	e f |

	e es |
	e f |
	e e, |

	e c |
	a, h, |
	c4 e8 g4 f8 |

	e2. |
	g4. e |
	c d |
	e4 g8 b4 a8 |

	g4. s |
	r <b g cis>\strum |
	r <h g d>\strum |
	r <h g dis>\strum |

	r <h g e>\strum |
	r <h g eis>\strum |
	s2. |
	s |

	<e cis'>2. |
	<h d> |
	<e a,> |
	q |

	<cis' a>4. s |
	<cis' fis> <a d> |
	<gis cis>2. |
	q4. s |

	\repeat unfold 5 s2. |

	\time 15/8 s1... | s |
	\time 9/8 s1 s8 |
	\time 6/8 <f' cis'>2.  |
	r16 cis e a cis' e a'8) r4 |

	<g' cis' a>2.\strum |
	r16 cis g cis' f' gis' cis''8) r4 |
	<es' a f>2.\strum |
	r16 a,( e a cis' e' a') e( a cis' e' a |

	cis'') a( cis' e' a' cis'' e'') cis'( e' a' cis'' e'' |
	a''4)\laissezVibrer r8 <cis'' a'>4\laissezVibrer r8 |
	<a cis'>4\laissezVibrer r8 f,4\laissezVibrer r8 |
	s2. |
}

\paper
{
		#(define fonts (make-pango-font-tree "Georgia" "Arial" "Courier New" 1 ) )
		system-system-spacing #'basic-distance = #10
		indent = #12
		left-margin = #5
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

		page-count = #1

}

\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = "Kytara"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \trebles } 
			\new Voice { \clef "treble_8" \melody }
			\new Voice { \clef "treble_8" \basses }
			\new Voice { \clef "treble_8" \lining }
		>>
	}
	\layout { #(layout-set-staff-size 17)  }
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \trebles } 
			\new Voice { \clef "treble_8" \unfoldRepeats \melody }
			\new Voice { \clef "treble_8" \unfoldRepeats \basses }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 90 4)
		}
	}
}
