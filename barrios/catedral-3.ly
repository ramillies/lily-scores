\version "2.18.0"
\language "deutsch"

\header {
	%dedication = \markup \raise #3 \italic "Věnováno Andrésu Segoviovi"
	title = \markup \fontsize #4 \sans \bold "La Catedral"
	subtitle = \markup \fontsize #3 \sans \bold "III"
	composer = "Agustín Barrios Mangoré"
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
patnact = \set Staff.ottavation = \markup{\override #'(word-space . 0) \line{\large\sans\bold "15" \small\raise #1 \underline"ma"}}

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
	\time 6/8
	\key h \minor
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\override Glissando.minimum-length = #6
	\override Glissando.springs-and-rods = #ly:spanner::set-spacing-rods
	\set Score.tempoHideNote = ##t
	\override TupletBracket.bracket-visibility = ##t
	\override Staff.TimeSignature.break-visibility = ##(#f #t #t)
%	\set fontSize = #1
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)

	\magnifyStaff #0.85
}

liningI = {
	\global

}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\sans\bold "Allegro solemne"
	\repeat volta 2
	{
		\repeat volta 2 { h,16 fis eis( fis) g fis h fis d' fis h fis } |
		\repeat volta 2 { h, g fis( g) a g h g d' g h g } |
		\repeat volta 2 { cis a gis( a) h a cis' a e' a cis' a } |
		
		d a gis( a) fis' a cis g fis( g) e' g |
		h, fis eis( fis) d' fis e, e dis( e) cis' e |
	}
	\alternative
	{
		{
			eis, f e( f) h f fis, cis fis cis b fis |
			cis' b e' cis' g'( e') cis' b fis g e cis |
		}
		{
			eis, f e( f) h f fis, cis his,( cis) h b |
			h fis d h, ais,( h,) d fis h cis' d'( e') |
		}
	}

	fis' d' h fis fis' d' e' cis' b g e' cis' |
	d' h g e, fis,( g,) a,( h,) cis( d) e( eis) |
	fis h d' e' fis' a' g'( fis') e' d' cis' h |
	a cis' h e' g cis' e cis' h a' f g' |
	fis b cis' eis' fis' g' e' cis' b( g) fis( e) |
	d h d''( cis'') h' a' g'( fis') e' d' cis' h \bar "||"

	\segno
	cis a a'( e') cis a h, g g'( d') h, g |
	a, d fis' d' g'( fis') e' d' cis' h a g |
	fis d a, d fis d e cis a, cis e cis |
	a,( d) fis a d' fis' d'4.^\fermata

	\repeat volta 2 { d16 fis fis' fis cis fis d fis fis' fis h, fis  } |
	\repeat volta 2 { cis e e' e h, e cis e e' e a, e } |
	\repeat volta 2 { h, d d' d a, d h, d d' d g, d } |
	\repeat volta 2 { a, cis cis' cis g, cis a, cis cis' cis fis, cis } |
	g, h, h h, fis, h, g, h, g h, e, h, |
	g, h, h h, fis, h, g, h, g h, f, h, |
	fis, cis b cis fis, cis b, e cis' e b, e |
	cis g e' g cis g f h g' h f h |
	fis b fis' b fis, b e b fis' b fis, b |
	d b fis' b fis, b cis b fis' b fis, b_\markup{\right-align\line{\small\italic{D. C. al} \tiny\musicglyph #"scripts.segno" \italic "senza 1. volta" \small\italic{e poi}\fontsize #-5 \musicglyph #"scripts.varsegno"}} |
}

bassesI = {
	\global
	\voiceTwo
	\slurUp
	
	\repeat volta 2
	{
		\repeat volta 2 { h,2. } |
		\repeat volta 2 { h, } |
		\repeat volta 2 { cis } |
		
		d4. cis |
		h, e, |
	}
	\alternative
	{
		{
			eis, fis,~ |
			fis, r |
		}
		{
			eis, fis, |
			s2. |
		}
	}

	s | s | s | 
	a4 g8 e4 f8 |
	fis4. s |
	d r \bar "||"

	cis4 cis8 h,4 h,8 |
	a,2. |
	s |
	s4. d' |


	\repeat volta 2 { d4 cis8 d4 h,8 } |
	\repeat volta 2 { cis4 h,8 cis4 a,8 } |
	\repeat volta 2 { h,4 a,8 h,4 g,8 } |
	\repeat volta 2 { a,4 g,8 a,4 fis,8 } |
	g,4 fis,8 g,4 e,8 |
	g,4 fis,8 g,4 f,8 |
	fis,4 fis,8 b,4 b,8 |
	cis4 cis8 f4 f8 |
	fis4 fis,8 e4 fis,8 |
	d4 fis,8 cis4 fis,8 |

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
		ragged-last = ##t
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
			tempoWholesPerMinute = #(ly:make-moment 110 4)
		}
	}
}
