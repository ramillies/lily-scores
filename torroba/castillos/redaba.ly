\version "2.18.0"
\language "deutsch"

\header {
	title = "Redaba"
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
	\key e \major
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
				e8. fis16 h8. fis16 e8. h,16 |
				cis8. gis16 fis8. cis16 dis4~ |
				<dis a,> <e gis,>8. gis16 gis8. fis16 |

				fis8. e16 e8. cis'16 cis'8. h16 |
				h8. a16 e8. h16 a4 |
				a8. gis16 dis8. a16 gis4~ |
		}
		\alternative
		{
			{
				gis8 fis16[ gis fis e dis cis h, a, gis, fis,] |
				e,8 r <e h, gis,  e, h,, gis,,> r h,8. cis16 |
				\repeat unfold 2 { dis8. cis16 h,8. cis16 dis8. h,16 | }
				h,4\rest << { dis4( cis) } \\ { b,2_\markup\italic "cediendo" } >> |
				
				h,4\rest << { cis4( c) } \\ { a,2_\markup\italic "dim." } >> |
				r8. e16 fis8. e16 h8. a16 |
				g8. fis16 e8. d16 cis8. h,16 |
				cis2.~ |
				cis |
				
				<< { fis2.~ | fis } \\ { h,,~ | h,, } >>
			}
			{
				gis8 fis16[ gis fis e dis cis h, a, gis, fis,] |
				e,8 r <e h, gis,  e, h,, gis,,> r4.
				\key c \major
				r8. e,16\( f,8. g,16 f,8. e,16 |
				d8.\) c16 d4( a8) r |
				r8. h,16\( c8. d16 c8. h,16 |

				h,8.\) a,16 e4( a8) r |
				r8. g16 a8. h16 a8. g16 |
				r8. e16 fis8. g16 fis8. e16 |
				\key e \major
				r8. d16 e8. fis16 e8. d16 |

				r8. cis16 dis8. f16 dis8. cis16 |
				r8. cis16 dis8. e16 dis8. cis16 |
				r8. c16 cis8. dis16 cis8. c16 |
				b8. gis16 f8. dis16 c8._\markup\italic "dim." gis,16 |

				r4 <cis g,>2-^ |
				r8. c16 cis8. dis16 cis8. c16 |
				r8. dis16 e8. fis16 e8. dis16 |
				cis'8.[ h16 a8. gis16 fis8. f16 |

				gis8. fis16 \priraz{e16 fis} e8. dis16 cis8. dis16] |
			}
			{
				r8 fis16[ gis a gis fis e dis cis h, a,] |
				\transpose c c,
				{
					r8_\markup\italic "(pesante)" <cis' gis e>-> r <e' cis' gis>-> r <fis' dis' a>-> |
					r16 gis([ a h cis' h cis' dis' e' fis' gis' a')] |
				}
				h2.~ |
				<h gis e>2.~ |
				q4.^\fermata r \bar "|."
			}
		}
	}
}

basses = {
	\global
	\voiceTwo
	\shiftOn

	\repeat volta 3
	{
		<h gis h, e,>4 r gis, |
		<e a,> r <a h,> |
		<h, e,> r <dis' c> |

		<gis cis> r <f' d' gis> |
		<cis' fis> r2 |
		<c' gis>4 r2 |
	}
	\alternative
	{
		{
			<dis' a h,>8 r4. r4 |
			s2. |
			gis,4 dis g |
			fis, dis f |
			<< { fis'2.-^ | fis'-^ | } \\ { e2. | d | } >> |
			<h g cis>2 r4 |
			R2. |
			r4 <e h, fis,> q |
			r <b e fis,> q |
			a\rest <cis' a e> q |
			a\rest q <dis' a fis> |
		}
		{
			<dis' a h,>8 r4. r4 |
			s2. |
			\key c \major
			c |
			<a f,>2~ q8 s |
			<f g,>2. |

			<e c>2~ q8 s |
			<h d>2. |
			<h g cis> |
			\key e \major
			<a fis c> |

			<b cis> |
			<a fis cis> |
			<gis dis> |
			s |

			fis2( dis4) |
			<fis gis,>2. |
			<a h,> |
			R2.*2 |

		}
		{
			<cis' a e a,>4 r2 |
			h,4-> h,-> h,-> |
			<h, e,> r2 |
			r4 <gis' e' h e> q |
			<e' h e>2.~ |
			\override TextScript.extra-offset = #'(.5 . -6)
			q4._\fermata r_\markup\tiny "15. X. 2015" |
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
			tempoWholesPerMinute = #(ly:make-moment 120 4)
		}
	}
}
