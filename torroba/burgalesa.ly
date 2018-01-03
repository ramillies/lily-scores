\version "2.18.0"
\language "deutsch"

\header {
	title = "Burgalesa"
	subtitle = ""
	composer = \markup\line{"Federico Moreno Torroba," \teeny "úprava a prstoklady: Darek Cidlinský (II/2016)"}
	arranger = ""
	poet = \markup{\override #'(word-space . 0) \line{"6" \small\raise #1 \underline"a"} "muta in Fis"}
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
coda = \mark\markup\fontsize #2 \musicglyph #"scripts.coda"
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
	\key fis \major
	\time 3/4
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
	\override Arpeggio.padding = #-1
%	\set fontSize = #1
	\set Score.voltaSpannerDuration = #(ly:make-moment 1/1)
	\magnifyStaff #0.85
}

lining = {
	\global

}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\sans\bold "Largo"
	\repeat volta 2
	{
		fis'4.\rest h8-0 ais4-1 |
		\barre "IV" { cis'-4 h-1 cis'-4 } |
		ais-1 ais ais |
		ais-4 \priraz h8-4 ais4-4 gis-3 |
		fis'4.\rest h8-0 cis'4-1 |
		\barre "II" { d'4.-2 cis'8-1 h4-4 } |
		fis4.\rest <cis-3>8 <ais-2 fis-4>4 |
		q2. |

		\barre "IV" { dis'4.-1 fis'8-4 eis'4-3 |
		gis'-4\glissando fis'-4 eis'-3 } |
		cis'-1 cis' cis' |
		\barre "IV" { eis'-4\glissando fis'-4 dis'-1 } |
		h-4 h-4 ais-2 |
		fis'4\rest cis'-1( h-0) |
		s2. \coda |
		<fis'-1 cis'-1 ais-2>2.\strum |
	}

	\key d \major
	\transpose c c'
	{
		fis4.-2\strum g8-4 fis4-2\glissando |
		a\strum-2\glissando g\glissando a |
		fis4-2\strum fis8 fis fis fis |
		fis4-2\strum \priraz g8-3 fis4 e-0 |
		<fis-2 d-3 a,-1>4.(\strum g8-2 a4-2) |
		<b-3 cis-1>4. a8-1 g4-4 |
		<< { \override Arpeggio.padding = #-1 \fleft<a-1 fis-4 d-3>2.~\strum | q } \\ { \override Arpeggio.padding = #-1 \fleft <d,-0 a,,-0~>\strum | q } >> |

		\revert Arpeggio.padding
		\repeat percent 4 { <a-1 f-2 c-1 a,-3 f,-4>4\strum^"V" } <h-1 g-2 d-1 h,-3 g,-4>\strum^"VII" <g-1 es-2 c-4 g,-3 c,-1>\strum^"III" | 
		<< { \override Arpeggio.padding = #-1 \fleft<a-1 fis-4 d-3>2.~\strum | q } \\ { \override Arpeggio.padding = #-1 \fleft <d,-0 a,,-0~>\strum | q } >> |
		\repeat percent 4 { <a-1 f-2 c-1 a,-3 f,-4>4\strum^"V" } <h-1 g-2 d-1 h,-3 g,-4>\strum^"VII" <g-1 e-4 c-3 f,-1 c,-1>\strum^"III" |

		\barre "½II" { <fis-1 cis-1 ais,-2 fis,-4 cis,-3 fis,,-0>2.\strum |
		q\strum } |
		<g-2 e-4 h,-3 e,-1>4.\strum\glissando \fup<a-2 fis-4>8\glissando <h-1 g-2>4 |
		\priraz{h16 cis'} <h g>4\glissando <a-2 fis-4>\glissando \fleft<g e> |
		<a-4 fis,-2 d-1>4.\glissando <d' h,>8 q4 |
		\priraz{d'8-3 e'-4} <d'-3 h,-1>4\glissando <cis' a,>\glissando <h g,> |

		\tieDown a2.-2~ | a~ | a|\tieUp
		\repeat percent 4 { <a-1 f-2 c-1 a,-3 f,-4>4\strum^"V" } <h-1 g-2 d-1 h,-3 g,-4>\strum^"VII" <g-1 es-2 c-4 g,-3 c,-1>\strum^"III" |
		<< { \override Arpeggio.padding = #-1 \fleft<a-1 fis-4 d-3>2.~\strum | q } \\ { \override Arpeggio.padding = #-1 \fleft <d,-0 a,,-0~>\strum | q } >> |

		\repeat percent 4 { <a-2 fis-4 cis-3 fis,-1>4 } <h-4 fis-3 d-2 gis,-1> <d'-4 fis-1 d-1 h,-3>^"VII" |
		\key fis \major
		<cis'-1 h-4 eis-2 cis-3>2. |
		\times 6/8 { cis8 eis h cis'_\markup{ "D. C. al" \raise #.8 \huge \musicglyph #"scripts.coda" } cis' h eis cis } | 
		
		\mark\markup\large{\magnify #2 \musicglyph #"scripts.coda" \lower #.6 \italic "Coda"}
		<ais,-2 cis,-3 fis-1 cis-1 fis,-4 fis,,-0>2.\strum\glissando |
		<h,-1 dis,-3>4\glissando <ais, cis,>2\glissando |
		<gis, h,,>2. |
		\barre "½II" { fis,,8-0 cis,-3 fis,-4 ais,-2 cis-1 fis-1 |
		\flagOn fis,_\markup\italic "arm. artificos" cis fis ais \ottava #1 \osm cis' fis' |
		\ottava #2 \patnact cis''4.^\fermata_\markup\tiny "II+VII" fis''_\markup\tiny "II+V"^\fermata } \bar "|."
	}
}

basses = {
	\global
	\voiceTwo
	\shiftOn

	\repeat volta 2
	{
		<ais-1 gis-2 cis-4 fis,-0>2. |
		<fis-1 dis-3 h,-2> |
		<gis-2 cis-4 fis,-0> |
		<dis-2 h,-1> |
		<ais-2 cis-3 fis,-0> |
		<fis-3 h,-1> |
		<cis'-1 fis,-0>~ |
		q |

		<fis-1 h,-2>~ |
		q |
		<fis-4 ais,-3> |
		<gis-3 cis-1> |
		<fis-3 h,-1> |
		<h-4 eis-2 cis-3> |
		\barre "II" { <ais-2 fis-4 cis-3> |
		<ais fis-4 cis-3 fis,-0>\strum } |

	}

	\key d \major
	<d'-3 a-1 d-0 a,-0>2.\strum |
	<h-0 g-0 d-0 a,-0>\strum |
	<d' a d a,>\strum |
	<h g d a,>\strum |
	<d a,>\strum |
	<g'-4 d a,>\strum |
	g4.\rest fis,8-0 fis,4 |

	s2. | s | s | s4. fis,8-0 fis,4 | \repeat unfold 9 { s2. | }
	fis2-1 a,4-0 |
	d2-0 \flagOn a'4^\ffVII |
	<fis'' d''>2.^\ffVII^\fermata |
	s | s | \flagOff s4. fis,8-0 fis,4 |
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
	\layout { }
	%\layout { \context { \Score \override NonMusicalPaperColumn.line-break-permission = ##f }  }
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
			tempoWholesPerMinute = #(ly:make-moment 90 4)
		}
	}
}
