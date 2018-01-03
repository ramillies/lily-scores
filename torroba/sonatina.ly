\version "2.18.0"
\language "deutsch"

\header {
	dedication = \markup \raise #3 \italic "Věnováno Andrésu Segoviovi"
	title = \markup \fontsize #5 \sans \bold "SONATINA"
	subtitle = "Napsáno pro kytaru"
	composer = "Federico Moreno Torroba"
	arranger = "Prstoklady: A. Segovia (zatím — z větší části)"
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

tkI = {
	\time 3/4
	\key a \major
}

tkII = {
	\time 4/4
	\key d \major
}

tkIII = {
	\time 3/8
	\key a \major
	\magnifyStaff 0.9
}

liningI = {
	\tkI

	\repeat unfold 3 { s2. | \noBreak } s | \break
	\repeat unfold 4 { s2. | \noBreak } s | \break
	\repeat unfold 4 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 4 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break

	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break

}

melodyI = {	
	\global
	\tkI
	\voiceOne
	\tupletUp
	\slurDown

	\tempo \markup \sans \bold "Allegretto"

	r8^\markup V <cis''-3>16 q q8 <d''-4>16( <cis''-3>) <h'-1 fis'-1 d'-1>8 <cis''-1 gis'-1 e'-1> |

	\repeat volta 2
	{
		\segno g8\rest e16-3( fis-4) e8 e16( fis) e4 |
		r8 cis''16-3 cis'' cis''8 d''16-4( cis'') <d'-3 h'-4>8 <a'-1 cis'-2> |
		g8\rest fis16-3( gis-4) fis8 fis16( gis) fis4 |
		s8 e''16-1 fis''-3 \priraz{e'' fis''} e''8 d''16-3 cis''-2 d''8-3 e''-1 |
		<cis''-1 e'-1> a' <c''-1>^\markup{VIII} d''-4 h'-4 c''16-4( h') |
		\repeat unfold 2 { g8\rest e16-3( fis-4) e8 e16( fis) e4 | }
		r8 <e'-0 h-0>16( <cis'-3 g-2>) <e' h>8\< fis'16 e' d'8 cis'\! | 
		d'4 s2 |
		r8 <e'-0 h-0>16(\> <cis'-3 g-2>) <e' h>8 fis'16 e' d'8 cis'\! | 
		d'4 s4. d''8~ |
		d''^\markup{VII} d''16 d'' d''8 e''16-4( d''-2) <cis''-1 e'-1>8 <h'-1 d'-1> |
		<cis''-1 e'-1> a' <c''-1>^\markup{VIII} d''-4 h'-4 c''16-4( h') |
		g8\rest e16-3( fis-4) e8 e16( fis) e4 |
		s2. |

		\barre "II" { \coda cis'8[^\markup\italic "Un poco mosso" fis' e' cis'] } dis'-4 h |
		\barre "II" { cis'8[ fis' e' cis'] } dis'-4 h |
		\barre "II" { \times 6/9 { cis'8\< dis' e' fis' gis' a' gis'( fis') a' } } |
		cis''8.\f-4 h'16-2 cis''2-4 |
		<< { <h' dis' h fis>2 <a' cis' a e>4 } \\ { \stemUp fis4 s2 } >> |
		<< { <h' dis' h fis>2 <a' cis' a e>4 } \\ { \stemUp fis4 s2 } >> |
		<< { <cis' a>4 s2 } \new Voice { \barre "II" { \stemUp \shiftOff fis'4. gis'8-3 \priraz{fis'16-1 gis'-3} fis'8 e'-4 } } >> |
		cis'8-1(_\markup\italic "gallardo" dis'-1) e'-2 fis'-4 \priraz{dis'16-1 e'-2} dis'8-1 h |
		d8\rest \stemDown h,-2[ e-3 h,] \stemUp \fright <a-1 f-2 dis-4> c'-4 |
		d8\rest \stemDown h,-2[ e-3 h,] \stemUp <a-1 f-2 dis-4> \fleft c'-4 |
		\repeat unfold 2 { \priraz{e'16-0 f'-2} <e' h gis-1>8 d'-4 e' f'-2 a'-4 g'-2 | }
	}
	\alternative
	{
		{
			\priraz{e'16-0 f'-2} e'8. d'16 e'4 \flag\stemDown e''4^\ffXII \stemUp |
			d8\f_\markup\italic "marcato" fis-3 \priraz{e16-1 fis-3} e8 cis-3 d-4 h,-1 |
			r8 cis''16-3 cis'' cis''8 d''16-4( cis'') <h'-1 fis'-1 d'-1>8 <cis''-1 gis'-1 e'-1> |
		}
		{
			\priraz{e'16-0 f'-2} e'8. d'16 e'4 \stemDown e''4~ \stemUp |
		}
	}

	\key g \major
	\barre "VIII" { e''8 d''-4 c''-1 h'-4 } a'-2 h' |
	g'2-2-> f'4-2-> |
	g'2-2 f'8-2 g'16(-3 f') |
	e'2. |
	e'8-4( g'-4) fis'-3 e'-1 fis' g' |
	<a'-4 e'-2 c'-3>4 r2 |
	r8 e'-3 g'-2 h'-1 d''-4( h') |
	e'8-4 g'16-2 g' g'8 a'16(-4 g') e'8-0 fis' |
	d'2.-2 |
	<d''-4 d'-1>4 r2 |
	s2. |

	\barre "I" { r8 f'16 f' f'8 g'16-4( f') } e'8 f' |
	r8 d'16-3 d' d'8 e'16-4( d') c'8-1 d' |
	<< { h2. | h2. } \\ { a,4\rest g,2-2~ |g, a,4\rest } >> |
	\key a \major
	<< { gis'4.-1 h'8-4 a'-2( gis'-1) } \\ { h,4 s2 } >> |
	<< { cis''4.-4 h'8-4 a'-2( gis'-1) } \\ { h,4 s2 } >> |
	\barre "II" { \stemUp \shiftOff fis'4. gis'8-3 \priraz{fis'16-1 gis'-3} fis'8 e'-4 } |
	cis'8-1(_\markup\italic "gallardo" dis'-1) e'-2 fis'-4 \priraz{dis'16-1 e'-2} dis'8-1 h |
	d8\rest \stemDown h,-2[ e-3 h,] \stemUp \fright <a-1 f-2 dis-4> c'-4 |
	d8\rest \stemDown h,-2[ e-3 h,] \stemUp <a-1 f-2 dis-4> \fleft c'-4 |
	e'2. |
	<fis' d' a>8^\markup{II} a'-4 \priraz{gis'16 a'} gis'8-3 e'-4 fis'-1 d'-2 |
	s2. |
	<fis' d' a>8^\markup{II} a'-4 \priraz{gis'16 a'} gis'8-3 e'-4 fis'-1 d'-2 |
	s2. |
	s2. |
	d8 fis-3 \priraz{e16-1 fis-3} e8 cis-3 d-4 h,-1 |
	r8 <cis''-3>16 q q8 <d''-4>16( <cis''-3>) <h'-1 fis'-1 d'-1>8 <cis''-1 gis'-1 e'-1>_\markup{\raise #0.5 \musicglyph #"scripts.segno" "—" \raise #0.5 \musicglyph #"scripts.coda"} |

	\coda <fis-1>8 h a-2 fis-4 gis-1 e-2 |
	<fis-1>8 h a-2 fis-4 gis-1 e-2 |
	\times 6/9 { fis-1\< gis-1 a-2 h-4 cis'-1 d'-2 e'-4 fis'-2 gis'-4 } |
	h'8.-4\f a'16-2 h'2-4 |
	<< { <e'' gis' e'>2 } \\ { h4 s } >> <d'' fis' d' a>4 |

	<< { <e'' gis' e'>2 } \\ { h4 s } >> <d'' fis' d' a>4 |
	<< { <fis' d'>4 s2 } \new Voice { \barre "VII" { \stemUp\shiftOff h'4. cis''8-3 \priraz{h'16-1 cis''-3} h'8-1 a'-4 } } >> |
	fis'8-1 gis'-1 a'-2 h'-4 \priraz{gis'16-1 a'-2} gis'8-1  e'-0 |
	\barre "II" { r8 e a e } d'-1^"III"( f'-4) |

	\barre "II" { r8 e a e } d'-1^"III"( f'-4) |
	\barre "V" { \priraz{a'16 b'} <a' e' cis'>8 g'-4 a' b'-3 } <d''-4 gis'> c''-2 |
	\barre "V" { \priraz{a'16 b'} <a' e' cis'>8 g'-4 a' b'-3 } cis''-1 e''-4 |

	\ottava #1 \osm <a''-4 a'-1>8^\fermata \ottava #0 r8 r2 |
	a'2.-4 |
	<a' e' cis'>8\strum^"V" e'16-2 e' e'8 fis'16-4( e') d'8 e' |
	cis'8-1 e'16-2 e' e'8 fis'16-4( e') d'8 e' |

	cis'4-3 s2 |
	s2. | s |
	r8 e16-1_\markup\italic "con gracia" e e8 fis16-3( e) d8 e |
	cis8-3 a, cis d h,-1 cis16-3( h,) |
	r8 e-1 a-1 cis'-1 e'-0 fis'-3 |
	\barre "V" { a'8-1 r <a' cis'> r q r |
	q r r2 } \bar "|."
}

bassesI = {
	\global
	\tkI
	\voiceTwo

	<e' cis' a e a,>4\strum r4. e,8 |

	\repeat volta 2
	{
		<< { <a' cis'>2. } \\ { \barre "V" {a,2 r8 e,} } >> |
		a,4 r4. e,8 |
		<< { <h' d'>2.~ | q8 s s2 } \\ { a,2 r8 e | e,2 r4 } >> |
		a,4 <es'-1 f-1> <d'-3 gis-1 e-2>8 r |
		<< { \shape #'((0 . 0) (0.5 . 2) (-0.5 . 2) (0 . 0)) Tie <a' cis'>2.~ | q } \\ { \barre "V" {a,2 r8 e, | a,2\p r8 e,} } >> |
		a,2. |
		r8 d16-0 fis-2 h-0 \barre "VII" { d'-1 fis'-1 h'-1 fis'8 a-1 } |
		a,2.\f |
		r8 d16-0 fis-2 h-0 \barre "VII" { d'-1 fis'-1 h'-1 fis'8 d''-4 } |
		<fis' d' a fis h,>4\strum s2 |
		a,4 <es'-1 f-1> <d'-3 gis-1 e-2>8 r |
		<< { \barre "V" { <a' cis'>2.~ | q8 r a' r4. } } \\ { a,2 r8 e | a,8 r <e' cis' a> r4. } >> |

		<a cis fis,>2\p <fis h,>4 |
		<a cis fis,>2\p <fis h,>4 |
		<fis, a>2. |
		<cis'-1>8. <h-2>16 <cis'-1>2 |
		<<
			{ \repeat unfold 2 { \barre "IV" { r8 gis,-1 dis-2 gis-3 } \barre "II" { r fis, } | } }
			\new Voice
			{
			       \once \override TextSpanner.bound-details.left.text = \markup \rotate #5 \italic "Pizzicato"
			       \once \override TextSpanner.bound-details.right.text = \markup { \draw-line #'(0 . 0.5) }
			       \once \override TextSpanner.bound-details.right.padding = #-1
			       \once \override TextSpanner.bound-details.right.Y = 2
			       \once \override TextSpanner.extra-offset = #'(-0.5 . 1)
			       \textSpannerDown
			       s8 \startTextSpan s8 s2 | s2 s8 s8 \stopTextSpan |
			}
		>>
		<< { \stemDown e8\rest e a4 f\rest } \new Voice { \shiftOff \stemDown h,2. } >> |
		s2. |
		\repeat unfold 2 { << { gis2->-1 s4 } \\ { e,2 s4 } >> | }
		\repeat unfold 2 { d2 <es'-3 a-1 c-2>4 | }
	}
	\alternative
	{
		{
			\once\hide Slur \priraz{s16 s16} <d'-4 gis-2 h,-3>4 s2 |
			s2. |
			a,2 r8 e, |
		}
		{
			\once\hide Slur \priraz{s16 s16} <d'-4 gis-2 h,-3>4 s2 |
		}
	}
	
	\key g \major
	<a'-3 f'-2 c>2 r4|
	r8 e-1 h-3 e'-4 <a c'>4 |
	r8 e-1 h-3 e'-4 <a c'>4 |
	r8 << { e8-2 g h d h } \\ { e4. d4 } >> |
	<cis-1 h g>4-1 r2 |
	r8 fis16-1 fis fis8 g16( fis) e8 fis |
	d2. |
	<cis h g>4 r2 |
	r8 c-3 d-0 fis-4 a-1 fis |
	r8 d16 d d8 e16( d) c8-2 d 
	h, g, h, c a, h,16( a,) |

	<< { \stemDown g4\rest <c' a> <h g> } \\ { g,2.-3 } >> |
	<a-1 f-2>2 <g-0 e-2>4 |
	<a f>4. <e g>8 <a f> <e g> |
	<a f>4 <e g> <a f> |
	\key a \major
	\barre "IV" { g8\rest e'-2 gis-3 } r4. |
	\barre "VI" { g8\rest f'-2 gis-3 } r4. |
	<< { \stemDown e8\rest e a4 f\rest } \new Voice { \shiftOff \stemDown h,2. } >> |
	s2. |
	\repeat unfold 2 { << { gis2->-1 s4 } \\ { e,2 s4 } >> | }
	<<
		{ \shiftOn \repeat unfold 2 { e,8 h,-2 e-3 gis h \flag e'~^\ffVII | \flag e'2 s4 | } e,8 h,-2 e-3 gis h \flag e'^\ffVII | \flag gis'2.^\ffIV | }
		\new Voice
		{
		       \override TextSpanner.bound-details.left.text = \markup \raise #0.5 \rotate #6 \italic "Pizzicato"
		       \override TextSpanner.bound-details.right.text = \markup { \draw-line #'(0 . 0.5) }
		       \override TextSpanner.bound-details.right.padding = #-1
		       \override TextSpanner.bound-details.right.Y = 2
		       \override TextSpanner.extra-offset = #'(-0.5 . 1)
		       \textSpannerDown
		       s8 \startTextSpan s4. s8 \stopTextSpan s8 | s2. |
		       s8 \startTextSpan s4. s8 \stopTextSpan s8 | s2. |
		       s8 \startTextSpan s4. s8 \stopTextSpan s8 | s2. |
		}
	>>

	s2.| a,2 r8 e, |

	%Coda
	<d-2 h,-4>4 r <h,-2 e,> |

	<d-2 h,-4>4 r <h,-2 e,> |
	<d h,>4 s2 |
	h8. a16 h2 |
	<<
		{ \repeat unfold 2 { \barre "IX" { r8 cis gis-2 cis'-3 } \barre "VII" { r h, } | } }
		\new Voice
		{
		       \once \override TextSpanner.bound-details.left.text = \markup \rotate #5 \italic "Pizzicato"
		       \once \override TextSpanner.bound-details.right.text = \markup { \draw-line #'(0 . 0.5) }
		       \once \override TextSpanner.bound-details.right.padding = #-1
		       \once \override TextSpanner.bound-details.right.Y = 2
		       \once \override TextSpanner.extra-offset = #'(-0.5 . 1)
		       \textSpannerDown
		       s8 \startTextSpan s8 s2 | s2 s8 s8 \stopTextSpan |
		}
	>>
	<< { \stemDown e2 s4 } \\ { a8\rest a d'4 s } >> |
	s2. |
	<< { cis'2 } \\ { a, } >> <b gis>4 |

	<< { cis'2 } \\ { a, } >> <b gis>4 |
	g2 <d'-1 f-2>4 |
	<cis' g>4 s2 |
	<<
		{ r8 fis,-1 a, d fis-3 a | r f,-1 a, es-1 f-2 a-1 }
		\new Voice
		{
		       \once \override TextSpanner.bound-details.left.text = \markup \rotate #5 \italic "Pizzicato"
		       \once \override TextSpanner.bound-details.right.text = \markup { \draw-line #'(0 . 0.5) }
		       \once \override TextSpanner.bound-details.right.padding = #-1
		       \once \override TextSpanner.bound-details.right.Y = 2
		       \once \override TextSpanner.extra-offset = #'(-0.5 . 1)
		       \textSpannerDown
		       s8 \startTextSpan s8 s2 | s2 s8 s8 \stopTextSpan |
		}
	>>
	<a e e,>8\strum s s2 |
	s2. |

	<<
		{ r8 \barre "IV" { gis, cis e gis cis' } e' gis-3 cis'-4 e'-2 gis'-1 cis''-1 }
		\new Voice
		{
		       \once \override TextSpanner.bound-details.left.text = \markup \rotate #5 \italic "Pizzicato"
		       \once \override TextSpanner.bound-details.right.text = \markup { \draw-line #'(0 . 0.5) }
		       \once \override TextSpanner.bound-details.right.padding = #-1
		       \once \override TextSpanner.bound-details.right.Y = 2
		       \once \override TextSpanner.extra-offset = #'(-0.5 . 1)
		       \textSpannerDown
		       s8 \startTextSpan s8 s2 | s2 s8 s8 \stopTextSpan |
		}
	>>
	\flag e''2.^\ffXII |
	s2. |

	s |
	a,2.~ |
	a,8 r <e a,>\p r q r |
	q r r2 |
}

liningII = {
	\tkII
}

melodyII = {	
	\global
	\tkII
	\voiceOne
	\tupletUp
	\slurDown


	\tempo \markup \sans \bold "Andante"
	\transpose c c'
	{
		\repeat volta 2
		{
			<fis-2 d-3 a,-1 d,-0>8\strum <g-1 e-3> <a-1 fis-2>4. <d'-2 fis-3>8\glissando <c' e> <h-1 d-1>^"½VII" |
			<c'-3 g-2 e-4>8 \times 2/3 { <h-1>16( c' h) } \barre "½V" { a2-1 g8-4 fis-4 } |

			\priraz{e16-0 fis-1} <e-0 b,-2 g,-3>8 d-2 e-0 fis-1 \times 4/6 { <g-1>(_\markup\italic "accel." <a-3> g <fis-1> e <d-3>) } |
			<e-0 cis-2 g,-0>4. \times 4/5{fis32( g fis e d)} <e cis g,>2 |

			\coda <fis d a,>8\strum <g-1 e-3> <a-1 fis-2>4 r8 cis'-4 h-3 a-2 |
			<fis-3 d-4>8 \fdown \times 2/3 { <gis-4>16( <fis-3> <e-0>) } fis4-3~ \times 4/6 { fis8 <gis-4>( <a-4>) <h-1>( <cis'-3> <d'-4>) } \fleft |
			\flag e'8\strum_\markup\italic "accel." fis'-4 d'-1( e'-3) \times 4/6 { \priraz{cis'16-1 d'-2} cis'8-1 h-3 a-2 <d'-4 g-2>8. h16-1 cis'8-4\glissando } |
			a1-4 |
		}

		\barre "½V" { <a-1 e-1 c-1>8 h-4 <e-1 c-1 a,-4>4 } <d-1 h,-0 g,-2>2 |
		\barre "½V" { <a-1 e-1 c-1>8 h-4 <e-1 c-1 a,-4>4 } <d-1 h,-0 g,-2>2 |
		\barre "½VIII" { <g-1 es-1>4 r } \barre "½VI" { \times 2/3 { c'8-4 b-1 c' } } a4-1 |
		\times 2/3 { b8-4 a-4 b } g4-1 \barre "III" { \times 2/3 { a8-3 g-1 a } } f4-4 |
		\barre "III" { \times 2/3 { a8 g a } } f4-4 s2 |
		\time 2/4 s |
		\time 4/4 <cis'-3 a-4>8\strum\fff d'-4 e'4-4 r8 a'\glissando \once\override Glissando.minimum-length = #5 fis'\glissando gis' |

		\times 4/6 { <e'-4 a-2>8( <d'-2> <e'-4>) cis'-2( h-1) a-3 } d'-4^"VII" \movetext #'(0.4 . -1.6) cis'-4^"VI" \freezetext h4-4 |
		<a-4 cis-1 a,-1>2 \barre "VII" { \times 2/3 { a8-4 g-3 a } } <e-1 d-2>4 |
		<a-1>4^"V" r \barre "VII" { \times 2/3 { a8-4 g-3 a } } <e-1 d-2>4 |
		\times 8/12 { r8 <h,-0 g,-0>( <cis-1 a,-1>^"II") <h, g,> <cis a,> <h, g,> <cis a,> <h, g,> <cis a,>_\markup{"D. C. al" \raise #0.5 \tiny\musicglyph #"scripts.coda"} <h, g,>  <cis a,>_\markup\italic "rall." <h, g,> } |

		\mark\markup\large{\magnify #2 \musicglyph #"scripts.coda" \lower #.6 \italic "Coda"}
		<fis-1 d-2>8 <g-1 e-3> <a-1 fis-2>4. d'8-2\glissando h-2\glissando a-2 |
		<fis-1 h,-0> \override Fingering.extra-offset = #'(0 . 1) \times 2/3 { e16-0( fis-1 e) } \revert Fingering.extra-offset d2-1 <d-1 h,-3>8 <e-4 b,-1> |
		<fis-1 cis-1 a,-1>^"II"\glissando <a-1 e-1 cis-2>^"V"\glissando <g d h,>^"III"\glissando <fis cis a,-1>^"II" <e-0 cis-1 g,-0>4. \times 2/3 { <e-0>16( <fis-1> e) } |
		<d-2 a,-1 fis,-3>4 s2. |
		<e-0 h,-0 g,-0>8 fis-1 cis4-1 \override Fingering.extra-offset = #'(0 . 1.5) \times 2/3 { cis8\rest h,-0( cis-1) } \revert Fingering.extra-offset h,( cis) |
		q8 fis cis4 \times 4/6 { d8\rest h,-0 a,-1 d-2 fis-1 a-4 } |
		\barre "VII" { \times 2/3 { d'8-4 cis'-4 d' } h4-1 \times 2/3 { d'8 cis' d' } h4 } |
		\times 2/3 { fis8-1 e-0 fis } <h,-4 h,-0>4. fis8 \priraz{e16 fis} e4 |
		<fis,-1 d,-3>8\glissando <g, e,>\glissando <a, fis,>4 <c-1 g,-0 es,-1>2\strum^^ |

		\phrasingSlurDown es8-1\( f-3\glissando g4-3 es8 f\glissando g8. a32-3( g)\) |
		fis1-1 |
		\flagOn \movetext #'(2 . -3.7) <a' fis' d'>^\markup{\override #'(baseline-skip . 1) \teeny\column{"III" "VII" "VII"}} |
		\movetext #'(2 . -5.3) <d a, d,>^\markup{\override #'(baseline-skip . 1.6) \tiny\column{"XII" "XII" "XII"}} \bar "|." 
	}
}

bassesII = {
	\global
	\tkII
	\voiceTwo
	\slurUp

	\repeat volta 2
	{
		<a,-0>4.\strum a,8 <fis-3> g4.\rest |
		g\rest e8-3 c'2-1 |
		s1 |
		c8\rest a, \flag a4_\ffXII c8\rest a8-1 \flag a'4-4^\ffVII |
		\tweak Rest.extra-offset #'(1.5 . 0) f8\rest f4\rest <e'-1 cis'-2>8 <d'-1 h-3>4 a\rest |
		<gis-1 h,-2>4. h,8 <d'-3 gis-1 e,-2>4 a\rest |
		\flag \movetext #'(2 . -9) <h' g' a>2.\strum <a,-0 h-3>4 |
		\freezetext
		r8 a,-0[_\markup\italic "rall." h,-1 d-0 g-0 a-1 d'-2 e'-3] |
	}

	e4.\rest_\markup\italic "dolce" e8-3 \override Fingering.extra-offset = #'(0 . -1) \times 2/3 { fis8-4( e-3 fis) } \revert Fingering.extra-offset e-3 d-0 |
	e4.\rest e8-3 \times 4/6 { fis8-4( e-3\< fis) d-0 g-0 h-0 } |
	\override Fingering.extra-offset = #'(0 . -1) \times 2/3 { d'8-4(\f c'-3) d' } \revert Fingering.extra-offset g-0 b-3 <f'-1 d'-3 a-2>4. d8-0 |
	<es'-1 c'-3 g-2>4. d8-0 <d'-1 b-1 f-1>4. d8-0 |
	<d'-1 h-2 f-1>4. d,8 \times 8/12 { a,16-0( h,-2) d-0 f-3 a-2 h-0 d'-3\p d-0( f-3)\< a-2 h-0 d'-2\glissando } |
	\time 2/4 \times 8/12 { f'-2 a'-1 h'-3 f' a' h' f'_\markup\italic "rall." a' h' f'^^ a'^^ h'^^ } |
	\time 4/4 <e'-3 a-1 e-1>8\strum^"VII"\! d'8-1 e'4-1 s8 a'\glissando fis'\glissando gis' |

	<cis'-3 e-1>4 a\rest <fis'-1 d'-1>8 <cis'-1> <d'-3 h-0 gis-1 e-2>8 \flag e'^\ffVII |
	<e-1>8 \flag e'^\markup\tiny "II+XII" s4 <d'-1 b-2 e-1>4 d8\rest b-3 |
	<e'-1 cis'-2 a-4>8 e-3 a,4 <d'-1 b-2 e-1> d8\rest b-3 |
	s1 |

	%Coda
	s4. a,8 fis4-3 s |
	<d-0 g,-3>2 \flag d'2-\ffXII |
	a, r8 a, a,4 |
	<d-4>8[ \flagOn a-\ffXII fis-\markup\tiny "IV+XII" d'-\ffXII a-\ffXII a'-\ffV fis'-\ffIX d'-\ffXII] \flagOff |
	a,4. a,8 <a, d, fis>2 |
	a,4. a,8 <a, d, fis>2 |

	<fis'-1 d'-1 h,-2>2 <g'-2 h-3 e-1> |
	<h-0 g-0 a,-0>4.  a,8 a,2 |
	s2 s8 \flagOn dis'^\markup\tiny "I+XII" dis'4 \flagOff |
	s1 |
	s8 \flagOn a^\ffXII[ d'-\ffXII fis'-\ffIX a'-\ffV d''-\ffV fis''-\ffVII a''-\markup\tiny "III"] \flagOff |
	s1 |
	s1 \bar "|."
}

ostinatoII = {
	\global
	\tkII
	\voiceFour

	\repeat volta 2
	{
		<d,-0>1\strum | d, | d, | d,2 d, | <d a, d,>1\strum | s | s | s |
	}

	d, | d, | \repeat unfold 3 { s | } \time 2/4 s2 |
	\time 4/4 s2 \movetext #'(-2.5 . 8.5) \flag <fis'' d'' a' e'>2_\markup{\override #'(baseline-skip . 1.5) \tiny\column{"VII" "VII" "VII" "VII"}} |
	\freezetext
	s1 |
	a,4 \flag a^\ffXII s2 |
	s1 |
	a, |

	% Coda
	d, |
	\repeat unfold 7 { s | }
	<< { \stemDown\tieDown d,4. d,4~ d,4.~ | d,1 } \\ { s2 a,\strum | s1 } >> |
	d, |
	s | s \bar "|."
}

liningIII = {
	\tkIII
}

melodyIII = {	
	\global
	\tkIII
	\voiceOne
	\tupletUp
	\slurDown

	\tempo \markup \sans \bold "Allegro"
	\transpose c c'
	{
		r8  e16 e e e |
		\repeat volta 3
		{
			a8^"V"\strum e16 e e e |
			a,8 e16 e e e |
			fis8-2 e-0 d-4 |
			cis^"II" \barre "V" { e16 e e e |

			a8\strum } e16 e e e |
			a,8 e16 e e e |
			fis8 d h, |
			a,8^"II" r a, |
			\barre "II" { d4 d8 } |
			cis( h,) a, |

			h,( a,) gis, |
			a, \barre "IX" { cis16 e a cis' } |
			d'4 d'8 |
			<c' g>( h) \barre "V" { a |
			\priraz h16 a8 g f } |
			e4 s8 |

			\repeat unfold 3 { s4. | }
			r8 e'16 e' e' e' |
			fis'8( e') d' |
			e'( d') cis' |

			\priraz e'16 <d' fis>8 <cis' e> <h d> |
			\barre "V" { <a cis>4 r8 } |
			<b d>4.~ |
			q |
			<a e cis>^"V"~ |
		}
		\alternative
		{
			{
				q8 e16 e e e |
				e8^"VI" d c |
				d c b, |
				a,4 e8 |
				<a g>4.^"V" |
				a8 d' cis' |
				e'( cis') d' |
				\priraz{h16 cis'} h8^"VII" a h |
				<c' fis d>8 d'4 |

				\barre "V" { \priraz{h16 c'} h8 a g } |
				a8 fis4 |
				d4.~ |
				d8 e16( d) cis( d) |
				e8 cis a, |
				a g4 |

				fis8 d4~ |
				d8 e16( d) cis( d) |
				e8( cis) a, |
				g( fis) e |
				d4.~ |
				d8 r4 |
				\barre "VII" { r16 d fis h fis d } |
				
				\barre "IX" { r e gis cis' gis e } |
				\barre "X" { r fis a d' a fis } |
				e'8\strum  h16 h h h |
				e'8 h16 h h h |
				e8 h,16 h, h, h, |
				s4. |
				r8 e16 e e e |
			}
			{
				<< { <a e cis>4. } \\ { a, } >> |
				\key es \major
				<b d> |
				<a cis> |

				\barre "I" { <as c>8 r4 } |
				s4. | s |
				\barre "I" { as,8 c f |
				as f, as, |
				c f as } |
				\barre "VI" { <c' f as,>4. |

				<d' g b,> |
				<c' f as,> |
				<d' g b,> } |
				<< { <f' c' as> } \\ { f, } >> |
				s | s | s | 

				\key c \major
				r8 <a, d,>( <h, f,>) |
				<a, d,>( <h, f,>) d |
				f a, h, |
				d f \flag d^\ffXII |
				\flag a^\ffVII \barre "III" { g16 g g g |

				a8 g f |
				e g16 g g g |
				a8 g f } |
				e \barre "VIII" { c'16 c' c' c' |
				d'8 c' b } |
				\barre "III" { a( g) f |

				f e d }
				<c g e> h,4\rest |
				<des f,>4. |
				<c e,>8 s4 |
				<cis' f>4. |
				<c' g e>4.^"VIII" |
				s |

				s | s |
				\barre "VIII" { c'16 g e c, e g } |
				\key as \major
				des' as f c, f as |
				es' b g c, g b |
				des' as f c, f as |

				c' g e c, e g |
				b f des g, des f |
				\barre "VI" { c' f des as, des f |
				des' f des b, des f |
				c' f des as, des f } |

				b f des g, b f |
				\barre "VIII" { as es c f, as es } |
				\barre "VI" { g des b, es, g des } |
				\barre "IV" { f ces as, des, f ces } |
				e8^"III" e16 e e e |

				g8( f) e |
				b( as) g |
				\priraz as16 g8 f e |
				\key fis \major
				\repeat unfold 2 { <eis h, gis,>4.^"IV" |
				<dis a, fis,> | }
				<< { <eis h,> } \\ { <gis, cis,> } >> |
				s | s | s | 
				fis8 \barre "IX" { cis'16 cis' cis' cis' |
				dis'8( cis') h |

				ais cis'16 cis' cis' cis' |
				dis'8( cis') h } |
				ais \barre "VII" { fis16 fis fis fis } |
				gis8( ais) fis |
				<h dis>8 fis16 fis fis fis |
				gis8( ais) fis |

				h h16 h h h |
				h8 <ais cis> <gis h,> |
				ais^"IV" <gis h,> <fis ais,> |
				\barre "IV" { gis fis eis } |
				\barre "II" { <fis ais, fis,>4. |
				<gis h, eis,> |
				<fis ais, fis,> |
				<gis h, eis,> } |
				<fis ais, fis,> |
				s | s | s |
				\key d \major
				r8 <cis g,>( <e h,>) |
				<cis g,> <e h,> <cis g,> |
				<e h,> <cis g,> <e h,> |
				<cis g,>( <e h,>) <cis g,> \bar "||"

				\tempo\markup\sans\bold "Andante" \time 4/4 \tempo 4 = 40
				<g d>8 <a cis> \flagOn <h d>4.^\ffXII \flagOff d'8 h cis' |
				\times 4/6 { a( g) a fis e d } g^"VII" <fis a,> e4^"V" \bar "||"
				\tempo\markup\sans\bold "Allegro" \tempo 4 = 110 \time 3/8
				<d a, fis,>8 h,4\rest |
				<es g,>8 h,4\rest |
				<d a, fis,>8 d'16 d' d'8 |

				\barre "VIII" { d'( c') a } |
				d'8 s4 |
				d4.~ |
				d8 h,4\rest |
				<es g, g,>4.~ |
				q8 e4\rest |

				\barre "VII" { r16 d fis h fis d } |
				\barre "IX" { r e gis cis' gis e } |
				\barre "X" { r fis a d' a fis } |
				e'8\strum  h16 h h h |
				e'8 h16 h h h |
				e8 h,16 h, h, h, |
				s4. |
				r8 e16 e e e |
				\key a \major
			}
			{
				<a e cis>4 s8 |
				<d' fis>4.~ |
				q | 
				<cis' gis eis>~ |
				q8 f4\rest |
				\barre "VII" { d8 fis d |
				a( fis) h } |
				e4. |
				<d gis,>8 fis4\rest |

				e8 a gis |
				h( gis) a |
				\barre "II" { \priraz{fis16 gis} fis8 e fis } |
				<g h,> \barre "II" { <a cis>4 |
				\priraz{fis16 g} fis8 e d } |
				e8 cis4 |
				a,4. |

				s | s | s | s |
				<a e cis a,>8\strum h16( a) gis( a) |
				h8( gis) e |

				<d' gis> <cis' gis> <h gis> |
				<a cis>8 f4\rest |
				\key f \major \barre "III" { a8( g) f |
				b( a) g } |
				\barre "VIII" { c'( b) a |
				d'( c') b |

				a c'16 c' c' c' |
				d'8( c') b |
				a8 c'16 c' c' c' |
				d'8( c') b |
				a4.~ |
				a } |

				\key a \major
				\flagOn <h a>4.~^\markup\tiny "XII,VII" |
				q |
				s | s | s |
				h4.~^\ffXII |

				<h gis>8^\ffIV \flagOff e16 e e e |
				<a e cis a,>8\strum e16 e e e |
				a,8 e16 e e e |
				fis8 e d |
				cis^"II" a16 a a a |

				<d' a fis>8 a16 a a a |
				<e' a e>8 f4\rest |
				h,8\rest a,16 a, a, a, |
				e8 f4\rest |
				h,8\rest \flagOn a,16-\ffXII a, a, a, |
				e8-\ffXII h,4\rest\flagOff |

				s4. | s | s | s | <a e cis a,>8\strum fis4\rest \bar "|."
			}
		}

	}
}

bassesIII = {
	\global
	\tkIII
	\voiceTwo
	\slurUp

	s4. |
	\repeat volta 3
	{
		<e' cis' a e a,>8\strum r4 |
		a8 r4 |
		<gis e a,>8 q q |
		<a e a,>8 r4 |

		<e' cis' a e a,>8\strum r4 |
		a8 r4 |
		<gis e a,>8 q q |
		<e cis a,>4 r8 |
		r8 <a fis h,>4 |
		<e e,>4. |

		d |
		<cis a,>8 r4 |
		r8 <a' f' h>4 |
		a r8 |
		<f' c' dis>4 r8 |
		<h gis e>8 e16 e e e |

		f8 e d |
		e d c |
		h, c d |
		\flag e4._\ffXII |
		<fis' h d>4 r8 |
		<a' cis' e,>4. |

		e, |
		a,8 a16 a a a |
		a8( g) e |
		a( g) e |
		r8 a e |
	}
	\alternative
	{
		{
			a,4. |
			<as f b,>4 s8 |
			s4. |
			r8 a,4 |
			<cis' a>4. |
			<fis' d' a,>4 s8 |
			s4. |
			<fis' d'> |
			r4 d8 |

			<d' g>4 r8 |
			<cis' a>4 a,8 |
			fis a a, |
			d4. |
			a, |
			r4 <cis' a a,>8 |

			d fis a |
			d4. |
			a, |
			<< { \shiftOn \stemDown a, | d4 a,8 } \\ { <d' h>8( a) <cis' g> | g\rest <a fis>4 } >> |
			d4. |
			e, | e, | e, |
			<gis' e' e,>8\strum h4\rest |
			s4. | s |
			e8 r h, |
			e,4 s8 |
		}
		{
			s8 a16 a a a |
			\key es \major
			a8( g) f |
			g( f) e |

			f( fes) es |
			d( es) fes |
			f( d f) |
			s4. | s | s |
			r8 b, b, |

			r b, b, |
			r b, b, |
			r b, b, |
			h\rest as16 as as as |
			b8 as g |
			f es d |

			c b, as, |
			\key c \major
			g,4.~ |
			g, |
			s | s | s |

			<h f c>8 q q |
			<g c>4. |
			<h f c>8 q q |
			<g c>4. |
			<e' b c>8 q q |
			<c' f>4. |

			<h g g,>8 q q |
			c8 c16 c c8 |
			c( b,) g, |
			c c'16 c' c'8 |
			c'( b) g |
			c' c( e) |
			g c' e' |

			g' e g |
			c' e'( g') |
			d8.\rest c~ |
			\key as \major
			c c~ |
			c c~ |
			c c~ |

			c c |
			d\rest g |
			f\rest as |
			f\rest b |
			f\rest as |

			b'4 b'8 |
			as'4 as'8 |
			g'4 g'8 |
			f'4 f'8 |
			<c' g c>8 e4\rest |

			s4. | s | s | \repeat unfold 4 { a,8\rest cis cis | } 

			s8 gis16 gis gis gis |
			h8( ais) gis |
			dis'( cis') h |
			\priraz cis'16 h8 ais gis |
			<cis' ais fis>4.
			<eis' h fis>4. |

			<cis' fis> |
			<eis' h fis> |
			<cis' fis> |
			<d' ais e> |
			h,8 e4\rest |
			<d' ais e>4. |

			<dis' h,> |
			<fis' d' gis>4 s8 |
			<cis' fis cis>4 s8 |
			<cis h> q q |
			r fis, fis, |
			\repeat unfold 3 { fis, fis, fis, | }

			r fis, fis, |
			\repeat unfold 2 { fis, fis, fis, | }
			fis,( fisis, gis,) |
			\key d \major
			a,4.~ |

			a, | a, | a, |
			\time 4/4 <d' h e>8 d4\rest a,8 << { \stemDown a,2 } \\ { s8 g'4. } >> |
			<d' fis a,>4 f\rest <d' h e>4 <cis' g e>8 a, |
			\time 3/8 d8 d16 d d8 |
			d( c) a, |
			d8 e4\rest |

			<g' es'>4. |
			<fis' d'>8 d16 d d d |
			<fis d>4.~ |
			q8 d16 d d d |
			d4.~ |
			d8 f4\rest |

			e,4. | e, | e, |
			<gis' e' e,>8\strum h4\rest |
			s4. | s |
			e8 r h, |
			e,4 s8 |
			\key a \major
		}
		{
			a,8 cis'16 cis' cis' cis' |
			cis'8( h) gis |
			cis'( h) gis |
			g\rest cis' gis |
			cis d4\rest |
			<a fis e,>4.~ |
			q | 
			<e' e'>8 e e,~ |
			e, e4\rest |

			<cis' a,>4.~ | 
			q |
			<cis' e a,~>4. |
			a,4 a,8 |
			<a d>4. |
			<gis e>4 e,8 |
			a, e e, |

			a,8 h,16( a,) gis,( a,) |
			h,8 gis, e, |
			e d4 |
			cis8 a,4 |
			<a e a,>8\strum e4\rest |
			e,4. |

			<gis' d' e>8 q q |
			a,8 e4\rest |
			\key f \major <c' f>4. |
			<d' f> |
			<es' f> |
			<e' f> |

			<f' f> |
			<e' f> |
			<f' f> |
			<e' f>|
			<f' f>~ |
			q |

			\key a \major
			\flagOn e'8_\ffVII h16_\ffVII h h h |
			e'8 h16 h h h |
			e8 h16 h h h |
			e'8 h e' |
			h e' h |
			<a' e'~>4._\ffVII |

			e'4 \flagOff s8 |
			<a e a,>8\strum e4\rest |
			a8 s4 |
			<gis e a,>8 q q |
			<a e a,>8 s4 |

			d8 s4 |
			cis8 e4\rest |
			s4. | s | s |

			s |
			h8\rest a,16 a, a, a, |
			e8 e16 e e e |
			d8 cis h, |
			a, d4\rest |
			<a e a,>8\strum e4\rest \bar "|."
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

		system-system-spacing #'basic-distance = #10
		indent = #12
		left-margin = #5
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

}

\book
{
	\bookpart
	{
		\header { subtitle = \markup \lower #2 \fill-line { \line{\fontsize #4.5 \sans \bold "I"} } }
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
	}
	\bookpart
	{
		\header {
			title = ""
			dedication = ""
			composer = ""
			arranger = ""
			subtitle = \markup \fill-line { \line{\fontsize #4.5 \sans \bold "II"} }
		}
		\score {
			\new Staff \with {
				\consists "Span_arpeggio_engraver"
				instrumentName = "Kytara"
			} {
				\set Staff.connectArpeggios = ##t
				<<
					\new Voice { \clef "treble_8" \melodyII }
					\new Voice { \clef "treble_8" \bassesII }
					\new Voice { \clef "treble_8" \ostinatoII }
					\new Voice { \clef "treble_8" \liningII }
				>>
			}
			\layout { \context { \Score \override NonMusicalPaperColumn.page-break-permission = ##f }  }
		}
	}
	\bookpart
	{
		\header {
			title = ""
			dedication = ""
			composer = ""
			arranger = ""
			subtitle = \markup \fill-line { \line{\fontsize #4.5 \sans \bold "III"} }
		}
		\score {
			\new Staff \with {
				\consists "Span_arpeggio_engraver"
				instrumentName = "Kytara"
			} {
				\set Staff.connectArpeggios = ##t
				<<
					\new Voice { \clef "treble_8" \melodyIII }
					\new Voice { \clef "treble_8" \bassesIII }
					\new Voice { \clef "treble_8" \liningIII }
				>>
			}
			\layout {  }
		}
	}
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

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
	} {
		<<
			\new Voice { \clef "treble_8" \melodyII }
			\new Voice { \clef "treble_8" \bassesII }
			\new Voice { \clef "treble_8" \ostinatoII }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 40 4)
		}
	}
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyIII }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesIII }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 110 4)
		}
	}
}
