\version "2.18.0"
\language "deutsch"

\header {
	title = "Manzanares del Real"
	subtitle = "(„Pro krásnou dívku“)"
	composer = \markup\column{\line{"Federico Moreno Torroba, " \tiny "prstoklady A. Segovia"} \raise #2 \fontsize #-6 "(dokud jsem jich většinu pro nelogičnost a nedostatek místa nevyházel)"}
	%arranger = \markup\tiny "prstoklady A. Segovia"
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
	\key c \major
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
	\set Score.voltaSpannerDuration = #(ly:make-moment 12/8)
}

lining = {
	\global

	\repeat unfold 6 { s2. | \noBreak } s | \break
	\repeat unfold 7 { s2. | \noBreak } s | \break
	\repeat unfold 6 { s2. | \noBreak } s | \break
	\repeat unfold 8 { s2. | \noBreak } s | \break

}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\set tupletSpannerDuration = #(ly:make-moment 3 4)
	\override TextSpanner.bound-details.left.stencil-align-dir-y = #UP

	\tempo\markup\sans\bold "Allegretto vivace"
	r8 \barre "VII" { <a'-4 d'-1 a-1> q r q q |
	r q q } r4. |
	r8 \barre "VII" { <a' d' a> q r q q |
	r q q } r4. | 

	\override TextSpanner.extra-offset = #'(-1 . -1)
	\barre "IV" { r8 <as'-1 f'-4 cis'-3> q } r \barre "VI" { <b' g' es'> q } |
	\barre "IV" { r8 <as' f' cis'> q } r \barre "VI" { <b' g' es'> q } |
	r8 \barre "I" { <f' c' a> q } r <e' c' f> q |
	\barre "III" { r <e' c' f> q r <e'-4 h-2 f-1> q } |

	\revert TextSpanner.bound-details.left.stencil-align-dir-y
	\revert TextSpanner.extra-offset

	\repeat volta 2
	{
		r8 c'-1 d'-4 g'-4 g' f'-1 |
		\priraz{e'16-0 f'-1} e'8 d'-4 c'-1 << { d'4.-4 } \\ { g4\rest g8 } >> |
		r8 <c' g> d'-4 g'-4 g' f'-2 |
		\barre "V" { \priraz{e'16 f'} e'8 d' c' } \barre "VII" { << { \fleft <a'-4>4.-> } \\ { c'8\rest <e' a> d' } >> } |
		\barre "V" { c'8\rest <d' g> cis'-2 c'\rest <d' g> c' } |
		r8 << { gis'-3 f'-4 } \\ { h4 } >> e'8-3[ d'-1 c'-4 |

		h-3 a-1 gis-1 f-3( e-2) d] |
		\barre "II" { d8\rest e-2 f-1 d\rest e f |
		d\rest <b e> a } r <e' a-2 f-3> d'-4 |
	}
	\alternative
	{
		{
			\barre "III" { r8 << { g' f' } \\ { d'4 } >> } h'8 as' c'' |
			r <e''-4 a'-2>[ <c''-4 f'-3> \barre "V" { <a'-1 e'-1> <g'-4 c'-1> <e'-1 a-3> |
			\once\override TextScript.extra-offset = #'(-2 . 2)
			<c'-1 g-1>_\markup\italic "(poco rit.)" } <a e-1> <g-0 c-3>] r << { <e' h> d'-4 } \\ { <a f>4 } >> |
		}
		{
			r8 <g-0 e-2>[ a-1 c'-1 d'-3 e'-1 |
			g'-1 a'-3] <c''-1 g'-1>[ a' q a'] |
			<d'' a' f'>^"X" r4. <e''-4 a'-3 f'-2>8 d''-4 |
			r8 \barre "V" { << { c'8-1 d'-2 } \\ {g-1} >> g'8-4 g' f'-2 |
			\priraz{e'16 f'} e'8-1 d'-3 c'-1 <a' f' c'>4. } |

			<< { \fleft <h' g' d'>2.~^"VII" | q4. <h'-4 f'-2 d'-3> } \\ { e2.~ | e } >> |
			<c'' g' e'>4. r |
			\oneVoice
			\priraz{e16-1 f-2} e8-1_\markup\italic "(acc. poco)" d c d e g |
			a c' d' e' g' a' |
			c''4.-4 s^\fermata \bar "|."
		}
	}
}

basses = {
	\global
	\voiceTwo

	\repeat unfold 2 { g4.-3 g | g d8 g, d | }
	\repeat unfold 2 { g4.-2 f | }
	g,-3 a, |
	as,-2_\markup\italic "(cediendo poco)" g, |

	\repeat volta 2
	{
		c-3 h,-2_\markup\italic "(a tempo)" |

		a, h,-2 |
		c-3 h,-3 |
		a, <f-2>->|
		<< { a'-> a'-> } \\ { e-> es-> } >> 
		e, e, |
		
		s2. |
		<< { a4.-> h-> | cis'-> s } \\ { a, gis, | g, f, } >> |
	}
	\alternative
	{
		{
			as,4. g8-0 f as |
			g4. r |
			s g, |
		}
		{
			g,-3 s |
			s s |
			c'8 h-1 a h4.-1 |
			c4.-3 h,-3 |
			a, f-4 |

			r8 e, e, e,4. |
			e, g-1 |
			r8 c-1 d-3 g-4 g f-2 |
			s2. |
			s |
			r4. <e'-0 c'-1 g-0 e-2 c-3>-\tweak extra-offset #'(0 . 2)_\fermata-\tweak extra-offset #'(-2 . -3)_\markup\tiny "9. X. 2015 D." \bar "|."
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
		#(set-paper-size "a5" 'landscape)

		system-system-spacing #'basic-distance = #20
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
			tempoWholesPerMinute = #(ly:make-moment 110 4)
		}
	}
}
