\version "2.18.0"
\language "deutsch"

\header {
	title = "Cataluña"
	subtitle = ""
	composer = \markup\line{"Isaac Albeniz"}  %," \teeny "revise a prstoklady: Darek (V/2015)"}
	arranger = \markup\raise #4 "upr.: Jean-François Delcamp"
	poet = \markup{\override #'(word-space . 0) \line{"5" \small\raise #1 \underline"a"} "muta in G"}
	meter = \markup\raise #4 {\override #'(word-space . 0) \line{"6" \small\raise #1 \underline"a"} "muta in D"}
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
	\key g \minor
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
	\set Score.voltaSpannerDuration = #(ly:make-moment 1/1)
	\magnifyStaff 0.8
}

lining = {
	\global

	\repeat unfold 6 { s2. | \noBreak } s | \break
	\repeat unfold 7 { s2. | \noBreak } s | \break
	\repeat unfold 6 { s2. | \noBreak } s | \break
	\repeat unfold 6 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 3 { s2. | \noBreak } s | \break
	\repeat unfold 3 { s2. | \noBreak } s | \break
	\repeat unfold 4 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 4 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\set tupletSpannerDuration = #(ly:make-moment 3 4)

	\tempo\markup\sans\bold "Allegro"

	<<
		{ \shiftOn \flagOn d'2.^\ffVII~ | d'~ | \hide Stem d'~ | d'4. \flagOff \undo\hide Stem d'8. d'16 d'8 } \\
		{ \shiftOff \tieUp f4.\rest cis' | \shape #'((1 . -1) (.5 . -1) (-.5 . -1) (-.3 . -.8)) Tie c'2.~ | \stemUp \shape #'((1.3 . -1) (0 . -.7) (0 . -.7) (0 . -1)) Tie c'~ | c'4. s } \\
		{ \shiftOff \stemDown \tieDown s2. | a,4.\rest \shape #'((0 . 0) (0 . 0) (0 . 0) (-1 . 1)) Tie a~ | \tieUp \stemUp \shape #'((1.3 . -1) (0 . -.9) (0 . -.9) (0 . -1)) Tie a2.~ | a4. s } \\
		{ \shiftOff s2. | s | fis4. d | \priraz f8 es4. d }
	>> |

	\transpose c c'
	{
		\repeat volta 2
		{
			\inStaffSegno <g d b,>4 a8 <b fis c>4 a8 |
			\barre "III" { <g d b,>4 g8 <d c a,>8. d16 d8 |
			<g d b,>4 a8 } <b fis c>4 a8 |
			\barre "III" { <g d b,>4 g8 } <d b,>8. d16 d8 |
			<f b,>4 \barre "I" { f8 <f a,>4 } d8 |
			b,4 b,8 <b, g,>8. b,16 c8 |

			<d b, f,>4.^"III" <b, ges,>8. b,16 c8 |
			\barre "III" { <d b, f,>4 f8 <g es>4 f8 |
			<d b, f,>4 c8 } <b, g,>8. b,16 <c g,>8 |
			<d fis,>2.~ |
			q4. d8. d16 d8 |
		}

		<f h, gis,>4 g8 \priraz b <as d>4 g8 |
		<f h, gis,>4 f8 <h, gis, f,>8. <c es,>16 <d d,>8 |
		<f h, gis,>4 g8 \priraz b <as d>4 g8 |
		<f h, gis,>4 f8 <g f g,>8. \barre "III" { <g f ais,>16 <g f h,>8 } |
		<g' c' g>4 \barre "VIII" { es'8 es'8. d'16 c'8 } |
		<d' as>8. f16 g8 \barre "III" { \priraz b as8. g16 } f8 |

		es8. <es ges>16^"II" <es g>8^"III" \barre "VIII" { <es' g es>8. <d' g>16 <c' g>8 } |
		<d' as>8. f16 g8 \barre "III" { \priraz b as8. g16 } f8 |
		es8. <es ges>16 g8 <g d>8. g16 d8 |

		\shiftOn <g c>8. g16 c8 \priraz{a16 b} <a fis c>8.^"V" g16 a8 |
		d8. g16 d8 <b e>8.g16 d8 |
		f8. d16 a,8 a8. b16 a8 |

		<d' fis>4. r8. d16 d8 |
		es8. g16 b8 d'8. c'16 g8 |
		a8. b16 a8 <c' fis es>8. <b fis d>16 <a fis c>8 |
		<g d b,>8.^"III" <a es c>16^"IV" <g d b,>8^"III" <f c a,>8.^"I" \barre "III" { <g d b,>16 <es b, g,>8 } |

		<d a,>4. r8. \transpose c c, { d16 d8( |
		es8.) g16 b8 <d' g es>8. c'16 g8 |
		a8. b16 a8 <c' fis es>8. <b fis d>16 <a fis c>8 |
		<g d b,>8. <a es c>16 <g d b,>8 <f c a>8. <g d b,>16 <es b, g,>8  | }

		d16( cis) d( cis) d( cis) es( d) cis d es( d) |
		g( fis) f( fes) es d cis( d) es fes f ges |
		g( fis) g d cis d~ d d cis d es( d) |
		g( fis) f( fes) es d cis( d) es fes f ges |
		g( fis) g d cis d~ d d cis d es( d) |
		d cis d cis d b, es d es c f es |
		d cis d cis d b, b,, a,( b,) es g es |
		d, e( f) cis d b, b,, a,( b,) es ges es |
		d, a,( b,) cis d b, g, h, c( d) es a, |
		d, a,( b,) cis d b, b,, a,( b,) c es a, |
		d cis d gis, b,( a,) f,( fis,) cis,( d,) gis,,( a,,) |
		r4. d8. d16 d8 |

		<f h, gis,>4 g8 \priraz b <as d>4 g8 |
		<f h, gis,>4 f8 <h, gis, f,>8. <c es,>16 <d d,>8 |
		<f h, gis,>4 g8 \priraz b <as d>4 g8 |
		<f h, gis,>4 f8 <g f g,>8. \barre "III" { <g f ais,>16 <g f h,>8 } |

		<g' c' g>4. b\rest |
		es'4. <a g>8.^"V" <b g>16^"VII" \barre "VIII" { <c' g>8 |
		es'4. c'8. } \barre "X" { d'16 es'8 } |
		\ottava #1 \osm <a' es'>4.^\fermata \ottava #0 <g es>8. a16 g8 |

		<d' g b,>4. r8. d16 d8 |
		es8. g16 a8 \barre "VIII" { c'8. d'16 es'8 } |
		<d' g b,>4. g8. c'16 b8 |
		<as c>8. c'16 g8 \priraz { fis16 g } fis8. e16 fis8 |

		d,8. es,16 d,8 <d c>8. d16 d8 | \inStaffSegno

		<< { \barre "III" { g4 a8 } } \\ { <d b,>8. es16 d8 } >>  b4 a8 |
		<< { \barre "III" { g4 g8 <d c>8. d16 d8 } } \\ { <d b,>8. es16 d8 s4. } >> |
		<< { g4 a8 } \\ { <d b,>8.[ es16 d8] } >> \barre "V" { \priraz c'8 b4 a8 } |

		<g d b,>8^"III" r4. r4 | s2. | s |
		a16( b) fis( g) a( b) cis'( d') a( b) cis'( d') |
		g'4. <d' fis c> |
		<b g d> <fis d c>^"VII" |
		<g d b,>2. |
		<g' b>2.^\fermata->\strum \bar "|."
	}

}

basses = {
	\global
	\voiceTwo
	\shiftOn
	\slurUp
	
	s2. | s | s | s |
	\repeat volta 2
	{
		g,4. g, |

		g, g, |
		g, g, |
		g, ges, |
		<< { \stemDown d es } \\ { f,2. } >> |
		<d b,>4. es, |

		b, es, |
		b, f | 
		b, es,4 a,8 |
		<a, d,>2.~ |
		q |
	}

	g,2. | g, | g, |
	g,4. \priraz g,8 g,4. |
	c4 <g' es' c'>8 q8. <g' c'>16 q8 |
	c'8. c'16 <d' c'>8 q8. q16 c'8 |

	c'8. c'16 c'8 c'8. c'16 c'8 |
	c'8. c'16 <d' c'>8 q8. q16 c'8 |
	c'4 r8 << { d''4. } \\ { b, } >> |
	<< { c'' s | b' d''4 s8 | a'4. s } \\ { a, d | g,2. | a,4 a8~ <g' cis' a>4. } >> |

	d8. cis16 d8 d4. |
	<g d>8. cis16 d8 <g' es' d>4. |
	<fis' c' d>8. cis16 d8 d4. |
	d8. d16 d8 d4. |
	
	<fis d,>8. es16 d8 d4. |
	<g, d,>8. d,16 d,8 d,4. |
	<fis c d,>8. d,16 d,8 d,4. |
	d,8. d,16 d,8 d,4. |

	<d d,> d8. d16 d8 |
	<<
		{ \stemDown
			\override Stem.details.lengths = #'(4.5 . 2.5)
			g4 a8 b4 a8 |
			g4 g8 d8. d16 d8 |
			g4 a8 b4 a8 |
			g4 g8 d8. d16 d8 |
			f4 f8 f4 d8 |
			\revert Stem.details.lengths
		}
		\\
		{
			g,2. | g, | g, | g,4. ges,4. | f, f, |
		}
	>>

	b,4 b,8 b,8. b,16 c8 |
	d4. b,8. b,16 c8 |
	d4 f8 g4 f8 |
	d4 c8 b,8. b,16 c8 |
	<d d,>4. a,\rest |
	d,2. |

	g, | g, | g, | g,4. \priraz g,8 g,4. |
	\shape #'((0 . 0) (-1.5 . 2.7) (1 . 2.7) (.5 . 0)) PhrasingSlur
	\phrasingSlurUp c16\( g, c es g c' es' g c' es' g' c''\) |
	g4.\rest es8. es16 es8 |
	<g' es'>4. <a' g'>8. q16 q8 |
	c''4._\fermata a |

	d8. cis16 d8 d4. |
	<g d>4 d8 <g' es' d>4. |
	d8. cis16 d8 es4. |
	as,8 r4 <c' d>4. |
	<< { <g' b>4. } \\ { g, } >> d |

	g,4. <fis' c' d> |
	g, d |
	g, d |
	g,8 fis,16( g,) a,( b,) cis( d) a,( b,) cis( d) |
	\slurDown
	\stemUp fis( g) cis( d) fis( g) a( b) fis( g) a( b) |
	cis'( d') a( b) cis'( d') fis'( g') cis'( d') fis'( g') |
	s2. \stemDown |

	r4. d, | g, d, | g,2. | <g d, g,>2.\strum_\fermata |
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

		bookTitleMarkup = \markup\column {
			\fill-line
			{
				\fromproperty #'header:poet
				\fontsize #5 \fromproperty #'header:title
				\fromproperty #'header:composer
			}
			\fill-line
			{
				\fromproperty #'header:meter
				\fromproperty #'header:arranger
			}
		}

		page-count = #1
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
			tempoWholesPerMinute = #(ly:make-moment 120 4)
		}
	}
}
