\version "2.18.0"
\language "deutsch"

\header {
	title = "Torrija"
	subtitle = "(„Žalozpěv“)"
	subsubtitle = ""
	composer = \markup\line{"Federico Moreno Torroba," \teeny "revise a prstoklady: Darek (V/2015)"}
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = \markup{\override #'(word-space . 0) \line{"6" \small\raise #1 \underline"a"} "muta in D"}
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
	\key d \major
	\time 4/4
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
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)
}

lining = {
	\global

	s4. |
	\repeat unfold 3 { s1 | \noBreak } s | \break
	\repeat unfold 4 { s1 | \noBreak } s | \break
	\repeat unfold 4 { s1 | \noBreak } s | \break
}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\set tupletSpannerDuration = #(ly:make-moment 3 4)

	\tempo \markup \sans \bold "Largo"
	
	\partial 4. s4. |
	\repeat volta 3
	{
		fis'2-2\laissezVibrer r8 h'-4 a'-4 d'-3 |
		fis'2-2~ fis'8 a-1 d'-3 e' |

		f'4.-3 e'8 d'4.-4 h8 |
		d'2~-2 d'8 fis'-2 g'-3 a'-3 |
		<h'-1 fis'-2 d'-1>4.^\markup{VII} <cis''-4 fis'-1 d'-1>8 <a'-2 e'-1 cis'-3>4^\markup{IX} q8 <g'-2 d'-1 h-3>8^\markup{VII} |

		<a' e' cis'>2~^\markup{IX} q8 d'-4[ d'-4 e']-0 |
		fis'4.-2 g'8-3 e'4. fis'8-3 |
		\once\override Score.VoltaBracket.extra-offset = #'(0 . -0.45)
	}
	\alternative
	{
		{
			<d'-2 fis-3>2 \flag a2^\ffXII  \bar "||"

			\override TextSpanner.bound-details.left.stencil-align-dir-y = #UP
			\override TextSpanner.extra-offset = #'(0 . -1)

			\key fis \major
			d'8\rest ais[-1 h dis'-4 cis'-2 eis'-1 fis'-2 ais']-4 |
			\barre "IX" { d'\rest gis-3 cis'-4 eis'-2 ais'-4 gis'-1 fis'-4 eis'-2 } |
			d'\rest eis'-1 fis'-2 cis''-4  d'\rest eis'-1 fis'-3 cis''-4  |

			d'\rest eis[-3 ais(-4 gis)-1 dis'(-4 cis')-1 fis'-2 eis']-1 |
			ais'2-1 s |
			\override TextSpanner.bound-details.left.stencil-align-dir-y = #DOWN
			\revert TextSpanner.extra-offset
			d'8\rest \barre "I" { <eis'-1 cis'-2 gis-1> q q } d'\rest <fis'-3 d'-4 gis-1> q q |

			\key d \major
			f'8\rest e'-0 fis'-2 e' a'-4 g'-2 fis'-1 e'-0 |
			<a'-4 cis'-2 g-0>2~ q8 a[-1 d'-2 e'] |
		}
		{
			<d'-2 fis-3>2\laissezVibrer r8 e' a'-4 g'-3 |
			fis'2-2 e'8 g'-3 a'-4 g'-3 |

			\override Staff.OttavaBracket.outside-staff-priority = #1000
			h'4.-4 g'8-1 d''4.-4 \ottava #1 \set Staff.ottavation = \markup\line{\tiny \italic "harm." \large\sans\bold "8"} \flagOn e''8^\ffXII |
			<fis'' d'' a'>1^\ffVII |
			<d'' d>^\ffXII_\markup{\with-color #white "a" \lower #2 \tiny "10. V. 2015 D."} \bar "|."
		}
	}
}

basses = {
	\global
	\voiceTwo

	\partial 4. a8-2 d'-3 e'-0 |
	\repeat volta 3
	{
		g8\rest a, d e-1 fis-2 g-2 fis-2 h,-1 |
		g\rest a, <e-1> d <fis-3 d,> r h,4-2 |

		a8\rest d-0 as4-2 a8\rest e-2 g4 |
		f8\rest a, d a, <fis-3> d e-1 fis-1 |
		g\rest fis-4 h-4 a-1 fis4-1 fis8 e-1 |

		r h,-1 h, h, <fis h,> r <gis-3 b,-1>4 |
		g8\rest gis-1 h4 g8\rest g cis'4-2 |
	}
	\alternative
	{
		{
			h,8\rest a, a, a, s2 |

			\key fis \major
			s8 fis4-3 g8\rest s2 |
			h,2~-1 h,8 d4.\rest |
			b,2-3 a,-2 |

			\override TextSpanner.bound-details.left.stencil-align-dir-y = #UP
			\override TextSpanner.extra-offset = #'(0 . -1)
			\barre "VI" { gis,-1 s |
			g8\rest fis-4 dis'-3 ais-2 } \fup <c'-3>4 <gis'-2> \fleft |
			cis2-4 h,-2 |

			g8\rest <d'-\tweak extra-offset #'(0 . -0.5) -3 g> q q s2 |
			c8\rest a, a, a, a, c4.\rest |
		}
		{
			\override Fingering.font-size = #-8 \fdown
			c8\rest a, a, a, <e-2 b,-1 fis,-4>4 a,\rest |
			g8\rest <d'-3 h,-1> q q <d'-2 g-0 b,-1>4 g\rest |
			\set fingeringOrientations = #'(up down)
			\override TextScript.outside-staff-priority = #1500 \override TextScript.extra-offset = #'(-2 . -1)
			g\rest <e'-3 h-2 d-0> g\rest <g'-3 d'-1 h-2 e-1>^\markup{VII} |
			\override TextScript.outside-staff-priority = #150
			\set Voice.middleCPosition = #1 d,1_\markup\tiny\italic "(loco)" |
			s |
		}
	}
	
}

ostinato = {
	\global
	\voiceFour

	\partial 4. s4. |
	\repeat volta 3
	{
		d,1 |
		d,2~ \hideNotes\shiftOff d,8 \undo\hideNotes\shiftOn s4. |

		b,4-1 a,\rest a, a,\rest |
		d,2~ d,8 s4. |
		h,4-3 s2. |

		fis2~-1 \hideNotes \shiftOff fis8 \undo \hideNotes \shiftOn s4. |
		a,2 a, |
	}
	\alternative
	{
		{
			d,1 |

			\key fis \major
			cis2-2 s |
			s1*3 |
			gis,2-1 r8 fis4.-1 |
			s1 |

			b,2-1 s |
			s1 |
		}
		{
			d,2 s |
			d, s |
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
			tempoWholesPerMinute = #(ly:make-moment 90 4)
		}
	}
}
