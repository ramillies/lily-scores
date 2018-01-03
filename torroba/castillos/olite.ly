\version "2.18.0"
\language "deutsch"

\header {
	title = "Olite"
	subtitle = ""
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
	\key a \major
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
	
	s4 | \noBreak | \repeat unfold 3 { s2 |\noBreak } s | \break \repeat unfold 5 { s | \noBreak } s | \break
	\repeat unfold 6 { \repeat unfold 4 { s2 |\noBreak } s | \break \repeat unfold 5 { s | \noBreak } s | \break }
	\repeat unfold 5 { s2 |\noBreak } s | \break \repeat unfold 5 { s | \noBreak } s | \break
	\repeat unfold 4 { s2 |\noBreak } s | \break \repeat unfold 3 { s | \noBreak } s | \break
}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\set tupletSpannerDuration = #(ly:make-moment 3 4)

	\tempo \markup \sans \bold "Vivace"
	\transpose c c'
	{
		\partial 4 e8 e |
		\segno <a e cis> a16 a gis8 fis |
		e e16 e d8 d16 d |
		cis8 h,16 cis d8 fis |

		e r e e |
		fis fis16 fis e8 d16 d |
		e8 e16 e cis8 cis |
		h,16[ h, cis d e fis gis a] |

		h4 d'8 cis' |
		<h gis> h16 h a8 <gis e> |
		a8 e16 e fis8 d |
		d16 cis h, cis d e fis gis |

		a4 r |
		r8 <d b, f,>-.-^ r4 |
		r8 q-.-^ r4 |
		\repeat unfold 2 { r16 fis-\shape #'((0 . 2) (-.5 . -1) (.5 . -1) (0 . 3)) ( e a, h4) | }

		\repeat unfold 2 { r16 fis-\shape #'((0 . 2) (-.5 . -1) (.5 . -1) (0 . 2)) ( c a, g4) | }
		r16 f-\shape #'((0 . 2) (-.5 . -1) (.5 . -1) (0 . 2)) ( c as, g4) |
		r16 fis-\shape #'((0 . 2) (-.5 . -1) (.5 . -1) (0 . 2)) ( cis a, gis4) |
		r16 g-\shape #'((0 . 2) (-.5 . -1) (.5 . -1) (0 . 2)) ( d b, a4)~ |

		a16 g b-\tweak positions #'(6 . 0.5) [ a g f e d |
		c b, a, g, f, e, d, cis,] |
		r4 c'8 c' |
		f' f'16 f' d'8 d' |

		c'8 c'16 c' b8 b16 b |
		a8 g16 a b8 d' |
		c' r c' c' |
		d' d'16 d' b8 b16 b |
		<c' f>8 c'16 c' <a f>8 q |

		g16 a b a g f e d |
		r8 <d b, f,> q r |
		r q q r |
		r q q r |
		r <f dis h,> q r |

		r q q r |
		r <e b, g,> q r |
		r <e d h,>-^ e,,-^ e,,-^ |
		<a e cis> \transpose c c, { a16 a gis8 fis |
		e e16 e d8 d16 d |

		cis8 h,16 cis d8 fis |
		e r } e e |
		fis fis16 fis d8 d16 d |
		e8 e16 e cis8 cis |
		h,16 h, cis d e fis gis a |

		h4 d'8 cis' |
		h h16 h a8 <gis e> |
		a e16 e fis8 d |
		d16 cis h, cis d e fis gis |
		
		a8 r a[ a |
		a a a a] |
		fis16 h h h gis cis' cis' cis' |
		a8 r a[ a |
		a a a a] |

		d16 fis fis fis f gis gis gis |
		fis gis a gis fis e d cis |
		h,8 r4. |
		a,16 cis cis cis fis, dis dis dis |

		d a[ gis fis e d cis h,] |
		a,8 r a, c |
		\key d \minor |
		f f16 f e8 d |
		c c16 c b,8 b,16 b, |
		a,8 g,16 a, b, c d e |

		c8 r c d |
		f f16 f g8 g16 g |
		<c' g e>8[ q q q] |
		<d' b f> d'16 d' <c' g e>8 <b f d> |
		<c' g e> r \tempo\markup\sans\bold "Lento" a, a, |

		c c16 c c8 d |
		es d16 es f8_\markup\italic "(rit.)" g |
		<a cis>2~ |
		q8 r \tempo\markup\sans\bold{\override #'(word-space . 0) \line{"Tempo I" \tiny\raise #1 \underline "o"}} e, e, |
		g, g,16 g, fis,8 fis,16 fis, |
		e,8 e, d, d, |

		e, e, fis, g, |
		a,2 |
		g,8 r4. |
		a,4 c8 c |
		f f16 f g8 g |
		<a f c>4 r |

		r2 |
		r8 a, d fis |
		\repeat unfold 2 { a16 fis d a, a8 d | }
		r16 a fis d r a fis d |

		r8 <e d a,>[ q q] |
		r q[ q q] |
		\key a \major
		r q[ <e d fis,>-^ <e d gis,>-^_\markup\column{\line{"Dal" \musicglyph #"scripts.segno"} \line{"al" \musicglyph #"scripts.coda"}}] |

		\mark\markup\large{\magnify #2 \musicglyph #"scripts.coda" \lower #.6 \italic "Coda"}
		a4-^ a-^ |
		a8 a16 c' b a g f |
		e4 e |
		e8 e16 g fis e d c |

		<< { r8 <fis d> r q } \\ { \stemUp h,4 h, } >> |
		<fis d h,>8 e,16 fis, gis, a, h, cis |
		d cis h, cis d e fis gis |
		a4 <a e cis>8 r |
		q r4. \bar "|."

	}
}

basses = {
	\global
	\voiceTwo
	\shiftOn

	\partial 4 r4 |
	<e a,>8 r4 <d' a d>8 |
	<a cis> r <a h,> r |
	<a e a,> r <a fis> r |

	<h gis d> r <a cis> r |
	<d' a h,> r <gis e> r |
	<a cis> r <a fis> r |
	<fis d> r4. |

	r8 <d' h e> r4 |
	<gis' e' d>8 r4 d8 |
	<a cis> r <a d> r |
	<gis d e,> r4. |

	r8 <e' cis' a> a, h, |
	a,4 a,8 h, |
	a,4 a,8 h, |
	c4 r8 g |
	cis4 r8 g |

	d4 r8 a, |
	d4 r8 a, |
	b,4 r8 es |
	h,4 r8 e |
	c4 r8 g, |

	c r4.|
	s2 |
	c8 r4. |
	a'8 r b r |

	a r g r |
	f r d' r |
	e' r4. |
	<b' f'>8 r <f' d'> r |
	a r d r |

	<d' b> r4. |
	c g,8 |
	c4. g,8 |
	c4. g,8 |
	gis,4. d8 |

	gis,4. cis8 |
	c4. g,8 |
	gis,4 s |
	<e a,>8 r4.|
	s2 |

	s | s |
	<d' a h,>4 <gis e> |
	<a cis>8 r <a fis> r |
	<fis d> r4. |

	r8 <d' h e> r4 |
	<gis' e' d>8 r4 d8 |
	<a cis> r <a d> r |
	<gis d e,> r4. |

	r8 e a[ gis |
	fis e d cis] |
	d4 e, |
	a,8 e a[ gis |
	fis e d cis] |

	h, r cis r |
	a, r4. |
	d16 e fis e d cis h, a, |
	e,2 |

	<d e,>4 r |
	<e a,> r |
	\key d \minor |
	<f a,>8 r <f b,> r |
	<f a,>8 r <f b,> r |
	<f c> r4. |

	<f a,>8 r4. |
	<c' a d>8 r <d' b e> r |
	a[ a a a] |
	g r a g |
	a r4. |

	<g es>4. <g b,>8 |
	<b g c>4 <c' a d>8 <cis' a es> |
	<g e>2~ |
	q8 r4. |
	s2 | s | s |

	r4 c8 c |
	f f16 f e8 d |
	c c b,4 |
	a, b, |
	d d8 e |
	f e16 d e8 f |
	e,2 |
	e, |
	e, |
	e,8 r d r |
	e2 h, |
	e, |

	% Dal Segno -- Coda:
	r8 <f' c' a es>[ r q] |
	r2 |
	r8 <c' f b,>[ r q] |
	r2 |

	r8 <d a, e,>[ r q] |
	q r4. |
	s2 |
	r4 <e a,>8 s |
	q s4._\markup\tiny\lower #10 "18. X. 2015 D." |
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
