\version "2.18.0"
\language "deutsch"

\header {
	title = "Præludium"
	subtitle = ""
	composer = "Federico Moreno Torroba"
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
	\time 3/8
	\key e \major
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
	\set Score.voltaSpannerDuration = #(ly:make-moment 6/8)
}

liningI = {
	\global

	\partial 8 s8 | s4.*5 \break |
	s4.*6 \break
	s4.*9 \break
	s4.*7 \break
	s4.*9 \break
	s4.*9 \break
	s4.*10 \break
	s4.*10 \break

}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\tieDown

	\tempo\markup\sans\large\bold "Allegro moderato"
	\transpose c c'
	{
		\partial 8 h16( gis) |
	\repeat volta 2
	{
		\tempo 4 = 95
		\repeat volta 2
		{
			\segno e8\strum e16( gis) fis\strum( a) |
			gis8(\strum e) h16( gis) |
			e8\strum e16( gis) fis\strum( a) 
			gis8(\strum e) e'16->( cis') |

			h8( gis) e'16( cis') |
		}
		\alternative
		{
			{
				h8( gis) cis'16( a) |
				h e' gis( h) e( gis) |
				<fis dis>4^"II" h16( gis) |
			}
			{
				h8( gis) \barre "VII" { cis'16( a) } |
				<gis e>( h) fis( a) dis( fis) |
			}
		}

	}
	\alternative
	{
	{
		\once\override Score.RehearsalMark.extra-offset = #'(0.5 . -6) \coda <e h, gis,>4 h,8 |
		\key e \minor

		\tempo\markup\sans\large\bold "Meno mosso" \tempo 4 = 80
		\repeat volta 2
		{
			e4 fis8 |
			g8. fis16 e8 |
			<< { d8. s | fis4 d8 } \\ { e,,4.~ | e,, } >> |
			c4 d8
			e8. fis16 d8 |
			<< { h,8. s | fis4 h,8 } \\ { e,,4.~ | e,, } >> |
			e4 fis8 |
			\tieUp
		}
		\alternative
		{
			{
				g8. fis16 e8 |
				\barre "V" { h4. |
				b4 b8 } |
				e4 fis8 |
				g8. fis16 e8 |
				<< { dis8. s | h4 h,8 } \\ { e,,4.~ | e,, } >> |
			}
			{
				g8. fis16 e8 |
				h4.~ |
				h4 h8 |
			}
		}

		a4 h8 |
		e4 fis8 |
		<< { h,4. | e | h, | e~ } \\ { \stemUp s8 fis,4 | s8 d c | s8 fis,4 | s8 d c } >> |
		a4 <e d>8 |

		a4 <e d>8 |
		a h c' |
		\priraz{h16 c'} h8 a h |
		g4 d8 |
		g4 d8 |
		g4. |
		a |

		h~ |
		h4 h,,8 |
		r8 <e h, g,> r |
		r <g e h,> r |
		r <fis h,> a |
		\priraz{g16 a} g8 fis16 e fis d |
		r8 <e, b,>4 |

		r8 <e b,> r |
		r <a, dis> fis |
		\priraz{e16 fis} e8 dis16 cis dis h, |
		e4 fis8 |
		g8. fis16 e8 |
		h4.~ |
		h4 h8 |

		a4 h8 |
		e4 fis8 |
		<< { \tieUp \slurDown h,4. | e | h, | \shape #'((0 . 0) (0 . 1.5) (0 . 1.5) (0 . 0)) Tie e~ | <e c>4^\fermata h16( gis)_\markup{\raise #0.5 \musicglyph #"scripts.segno" "—" \raise #0.5 \musicglyph #"scripts.coda"}  } \\ { \stemUp s8 fis,4 | s8 d c | s8 fis,4 | s8 d c | s4. } >> |
	}
	{

		\key e \major
		\mark\markup\large{\magnify #2 \musicglyph #"scripts.coda" \lower #.6 \italic "Coda"}
		\repeat unfold 2 { << { e4 } \\ { e,, } >> cis16 a, | }
		e h gis h cis' a |
		<e' gis e>8\strum r4 \bar "|."
	}
	}
	}
}

bassesI = {
	\global
	\voiceTwo
	\slurUp

	\partial 8 r8 |
\repeat volta 2
{
	\repeat volta 2
	{
		<h gis e>4\strum\f <cis' a e>8\strum |
		<h gis e>4\strum r8 |
		<h gis e>4\strum\f <cis' a e>8\strum |
		<h gis e>4\strum <a' cis' a,>8 |
		<e' gis e,>4 <a' cis' a,>8 |
	}
	\alternative
	{
		{
			<e' gis e,>4 <dis' a e,>8 |
			<h gis e,>4 r8 |
			h8 h, r |
		}
		{
			<e' gis e,>4 <dis' e>8 |
			e r4 |
		}
	}
}
\alternative
{{
\set Score.repeatCommands = #'((volta #f))
	r8 e, r |

	\key e \minor
	\tempo 4 = 80
	\repeat volta 2
	{
		r8 <h g e> r |
		r <h g e,> r |
		e16\rest e( fis) a d' a |
		s4. |
		\repeat unfold 2 { r8 <e b> r | }
		e16\rest fis a h dis'( h) |
		e8\rest \flag h_\ffVII d\rest |
		r8 <h g e> r |
	}
	\alternative
	{
		{
			r8 <h g e,> r |
			e16\rest e g c' e' c' |
			r8 <e' c' g> r |
			\repeat unfold 2 { r <e b> r | }
			g16\rest fis a h fis' dis' |
			fis8\rest \flag h_\ffVII r |
		}
		{
			r8 <e b> r |
			e16\rest g h d' fis' d' |
			fis'8 r4 |
		}
	}

	r8 <es' a f> r |
	r <b g c> r |
	r e dis |
	r b4 |
	r8 e dis |
	r b4 |
	f,16 c f8 b |

	f,16 c f8 b |
	f g a |
	g f g |
	\repeat unfold 2 { c16 e g8 <a f> | }
	\barre "III" { f16\rest c e g c' e' } |
	\barre "V" { f\rest e fis a c' e' } |

	\barre "VII" { f\rest h, dis fis h fis } |
	dis'4. |
	e4 fis8 |
	g8. fis16 e8 |
	d4.~ |
	d |
	c4 d8 |

	e8. fis16 d8 |
	h,4. |
	g4 fis8 |
	r <g h e> r |
	r <e b> r |
	f16\rest g h d' fis' d' |
	fis'4 r8 |

	r <es' a f> r |
	r <b g c> r |
	r e dis |
	r b4 |
	r8 e dis |
	r b4~ |
	b r8 \bar "||"
}{
\set Score.repeatCommands = #'((volta #f))
	%Coda
	\key e \major
	\repeat unfold 2 { g16\rest h gis h e8 | }
	e,4 a,8 |
	<h gis e,>8\strum r4 |
}}


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
			tempoWholesPerMinute = #(ly:make-moment 95 4)
		}
	}
}
