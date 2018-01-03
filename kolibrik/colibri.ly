\version "2.18.0"
\language "deutsch"

\header {
	title = "El Colibri,"
	subtitle = "imitacion al vuelo del picaflor."
	composer = "Julio Salvador Sagreras (1879—1942)"
	arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
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
movetext = #(define-music-function (parser location how) (pair?) #{ \override TextScript.extra-offset = #how #} )
freezetext = \movetext #'(0 . 0)
sp = #(define-music-function (parser location how) (pair?) #{ \override Arpeggio.positions = #how #} )
priraz = #(define-music-function (parser location music) (ly:music?) #{ \acciaccatura #music #} )
normstems = \revert Stem.details
extStrum = \override Arpeggio.positions = #'(-4 . 4)
normStrum = \revert Arpeggio.positions
empty = { \once \hide NoteHead \once \override NoteHead.no-ledgers = ##t }
vacuum = { \hide NoteHead \override NoteHead.no-ledgers = ##t }
visible = { \undo \hide NoteHead \revert NoteHead.no-ledgers }
tamb = \markup { T }
coda = \mark\markup\fontsize #4 \musicglyph #"scripts.coda"
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

osm = \set Staff.ottavation = \markup{\override #'(word-space . 0) \line{\large\sans\bold "8" \small\raise #1 \underline"a"}}
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
	\time 2/4
	\key e \minor
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\override Glissando.minimum-length = #4
	\override Glissando.springs-and-rods = #ly:spanner::set-spacing-rods
	\set Score.tempoHideNote = ##t
	\override TupletBracket.bracket-visibility = ##t
	\override Staff.TimeSignature.break-visibility = ##(#f #t #t)
%	\set fontSize = #1
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)
}

liningI = {
	\global
	\repeat unfold 4 { s2 | \noBreak } s | \break
	\repeat unfold 5 { s2 | \noBreak } s | \break


}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\repeat volta 2
	{
		h,16-2( e-2) \repeat unfold 6 { e } |
		fis-4( e-2) dis-1 e-1 fis-3( g-4) a-1 b-2 |
		h-3( e'-3) \repeat tremolo 6 { e' } |

		dis'-2 h-0 g-0 e'-0 d'-2 h g e' |
		cis'-2 h g e' c'-2 h g e' |
		h-2 h g e' ais-2 h g e' |

		ais-2 h g e' h-2 h g e' |
		b-2 e'-3 fis'-1 e' \repeat tremolo 4 cis'' |
		\barre "IX" { e''16-4( dis''-3) dis'' dis'' dis''-3( cis''-1) cis'' cis'' } |
		cis''-4( h'-2) \repeat tremolo 6 h' |
		\barre "IX" { e''16-4( dis''-3) dis'' dis'' dis''-3( cis''-1) cis'' cis'' } |
	}
	\alternative
	{
		{
			cis''-4( h'-2) \repeat tremolo 6 h' | 
			\ottava #1 \osm
			h'16-2( h''-2) \repeat tremolo 6 h'' |
			h''16-2( h'-2) \repeat tremolo 6 h' |
			\ottava #0
			h'16-2( h-0) \repeat tremolo 6 h |
			\coda h16 h,-2 \repeat tremolo 6 h, |
		}
		{
			cis''-4( h'-2) h' h' h'( c''-4) c'' c'' |
			\barre "V" { c''-4( a'-1) a' a' a'( h'-4) h' h' } |
			\barre "III" { h'-4( g') g'g' g'( a') a' a' } |
			\barre "II" { a'-4( fis'-1) fis' fis' fis'( g') g' g' } |
			fis'-2( e') \repeat tremolo 6 e' |
			\transpose c c'
			{
				e dis e fis \barre "VII" { g gis a h |
				\repeat tremolo 6 c'-2 d'-4( c'-2) } |
				\repeat tremolo 6 h-2 c'-3( h-2) |
				\barre "IV" { \repeat tremolo 6 a-2 h-4( a-2) } |

				\repeat tremolo 6 g-2 a-4( g) |
				\repeat tremolo 6 fis-2 g-4( fis) |
				\repeat tremolo 6 e fis-2( e) |
				dis-4( h,) \repeat tremolo 6 h, |
			}
			h b a as g fis f e |
			\repeat tremolo 8 es |
			es-1 des-4 c-3 h,-2 b,-1 a, as,-3 g,-2 
			\repeat tremolo 8 fis,-1 |

			fis,-1( h,) \repeat tremolo 6 h, |
			c-2( h,-1) h, h, cis-3( h,-1) h, h, |
			dis-( h,-1) \repeat tremolo 6 h, |
			c-3( h,-2) h, h, h,( ais,)_\markup{"D. C. al" \raise #.7 \small\musicglyph #"scripts.coda"} ais, ais, \bar "||"
		}
	}

	\mark\markup\large{\magnify #2 \musicglyph #"scripts.coda" \lower #.6 \italic "Coda"}
	\transpose c c'
	{
		h, cis dis e \once\override TextSpanner.extra-offset = #'(-.2 . -.3) \barre "VII" { fis g a h |
		d'-4( c'-2) c' c' } \once\override TextSpanner.extra-offset = #'(.1 . -3) \barre "V" { c'-4( h-3) h h } |
		\barre "IV" { h-4( a-2) a a } \once\override TextSpanner.extra-offset = #'(.1 . -2.3) \barre "II" { a-4( g-2) g g } |
		g-2( fis-1) fis fis fis( e) e e | 

		e-4( dis) dis dis 
	}
		c'-1( h) h h |
	\repeat percent 6 { c'( h) h h } |
	<cis'-4>2 |

	r16 b,( cis) e g( b) cis' e' |
	g' g( b) cis' e' g' b' cis'' |
	\ottava #1 \osm e'' e' b' cis'' g'' e' b' cis'' |
	b''2 \ottava #0 |

	r8 h'16-3 h' c''-4( a'-1) a' a' |
	h'-4( g') g' g' a'-4( fis'-1) fis' fis' |
	e'8-4 h16-3 h c'16( a-1) a a |
	h( g) g g a( fis) fis fis |
	e8 h,16 h, c( a,) a, a, |

	h,( g,) g, g, a,( fis,) fis, fis, |
	e,( g,) h, e g h e' g' |
	h' g h \ottava #1 \osm e' \barre "XII" { g' h' e'' g''|
	h''4-4} \flagOn <h'' fis'' a'>^"VII" |
	<e''' h'' g''>2^"V" \bar "|."
	

}

bassesI = {
	\global
	\voiceTwo

	\repeat volta 2
	{
		e,2 | s | s |
		dis'4 d' | cis' c' | h ais |
		ais h | b h\rest |
		fis-1 fis |
		h,2-1 |
		fis4-1 fis |
	}
	\alternative
	{
		{
			h,2-1 |
			s | s | s | s | 
		}
		{
			h,2-1 |
			a, | g, | fis, | <c'-1 g e,> |
			s | e'4-3 a-1 | d' g | dis' fis |
			e' e | d' d | c' c | h,2 |
			s2*8 \bar "||"
		}
	}

	% Coda
	s2 | a4-1 g-1 | fis-1 e-1 | d c |
	h, a, | g, fis, | e, fis, | g, a, | <g e-3 b,-1>2 |
	s2*12 |
	r4 \flagOn h |
	e'2 \bar "|."
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
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyI }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesI }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 140 4)
		}
	}
}
