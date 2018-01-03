\version "2.18.0"
\language "deutsch"

\header {
	title = "Un sueño en la floresta"
	subtitle = "(„Lesní snění“)"
	composer = "Agustín Barrios Mangoré (1885 - 1944)"
	poet = \markup\column{"6a muta in D" "5a muta in G"}
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
   
tinystems = #(define-music-function (parser location how) (list?) #{ \override Stem.details.beamed-lengths = #how #} )
priraz = #(define-music-function (parser location music) (ly:music?) #{ \acciaccatura #music #} )
trem = #(define-music-function (parser location music) (ly:music?) #{ r32 \repeat tremolo 3 { #music } #} )
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
ffXII = \markup{\tiny XII}
ffVII = \markup{\tiny VII}
ffV = \markup{\tiny V}
ffIV = \markup{\tiny IX}
ffIX = \markup{\tiny IX}

osm = \set Staff.ottavation = #"8"

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

global = {
	\key g \major
	\time 4/4
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\set Score.tempoHideNote = ##t
	\override TupletBracket.bracket-visibility = ##t
	\override Beam.breakable = ##t
	\set Staff.extraNatural = ##f
	\override Staff.Stem.stemlet-length = #2
	\set Staff.explicitKeySignatureVisibility = #begin-of-line-visible
	\override Staff.TimeSignature.break-visibility = ##(#f #t #t)
	\override Staff.KeyCancellation.break-visibility = ##(#f #t #t)
}

lining = {
	\global
	\repeat unfold 6 { s1 \noBreak | } s \break |
	\repeat unfold 5 { s1 \noBreak | } s \break |
	\repeat unfold 3 { s1 \noBreak | } \time 3/4 \repeat unfold 2 { s2.\noBreak | } s \break |
	\repeat unfold 3 { s2. \noBreak | } s \break |
	s \noBreak | s \break |
	\repeat unfold 12 { s \noBreak | s \noBreak | s \break | }
	s\noBreak | s\noBreak | s2 \noBreak | s\noBreak | s\noBreak | s \break | \grace s
	\repeat unfold 5 { s \noBreak | } \grace s s \noBreak | s \break |
	s \noBreak | \grace s s \noBreak | s \noBreak | s \noBreak | s \noBreak |\grace s s \noBreak | s \break |
	s \noBreak | s \noBreak | s2. \noBreak | s \break | 
	s \noBreak | s1 s \break | 
	\repeat unfold 3 { s2. \noBreak | } s \break |
	\repeat unfold 17 { s \noBreak | s \noBreak | s \break | }
	s \noBreak | s \noBreak | s \noBreak | s \break 

}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	
	\repeat volta 2
	{
		<g'-4 h-1 d-0>2. <g' h d>4 | <g'-4> <fis'-3> <c''-4> <h'-3> | <a'-4> <g'-1> <d''-4> d'' | \barre "V" { <d''-4> <c''-1> } <h'-3>8 <a'-1> <fis''-4> <e''-2> | <a'-1 fis'-3 c'-1>1 | <b'-2 fis'-3 c'-1> |
	}
	\alternative { { \extStrum <h'-4>\strum | } { <h'-4>^\markup{IV}\strum | } }

	<h'-1>4 h'\glissando <e''-4> e'' | <d''-1> d'' <h'-1> h' | <g'-1> g'\glissando \priraz a'8-4 c''4 c'' | c'' c'' <e''-4 g'-3>2 | <a'-1>4 a' <h'-4> <a'-3> | <d''-4> d'' <g'-1 e'-3> <c''-4 e'-1 c'-1>^\markup{V} | 
	<h'-2 g'-3 d'-1>2 <a'-1 fis'-2 c'-1> | <g'-1 d'-1 h-2>^\fermata^\markup{III} r8[ <d'-3> d' d'] \bar "||"

	\time 3/4
	<d'-3>[ <c'-1> d' <es'-4> c' d' | <b-1> <c'-3> <a-1> <b-2> <g-1> <a-2> | <f-1> <g-3> <es-1> <d-0> <fis-1> <a-4>] | d4-0 \flag d'2_\ffXII | <g,-0>8[ <g'-2> <h-3> g' <d'-1> g' | g, g' h g' d' g'] |

	\repeat volta 2
	{
		\barre "VII" { g,32 <h'-1> h' h' g'32 h' h' h' h32 h' h' h' g'32 h' h' h' } \barre "VI" { d'32 ais' ais' ais' } \barre "VII" { g'32 h' h' h' } |
		g,32 <e''-4> e'' e'' h'32 e'' e'' e'' d'32 e'' e'' e'' h'32 e'' e'' e'' g'32 <d''-1> d'' d'' h'32 d'' d'' d''^\markup{\small\italic "simile"} |
		\hide Rest
		\trem <d''-1> \repeat unfold 3 \trem d'' \trem <cis''-1> \trem d'' | \barre "V" { \trem <a'-1> \trem a' \trem a' \trem a' \trem a' \trem a' } | \trem <c''-4> \repeat unfold 3 \trem c'' \trem <h'-4> \trem c'' |
		\repeat unfold 4 \trem fis'' \trem e'' \trem e'' | \repeat unfold 4 \trem e'' \trem cis'' \trem d'' | \barre "VII" { \trem <h'-1> \trem h' \trem h' \trem h' \trem h' \trem h' } |
		\trem <d''-1> \repeat unfold 3 \trem d'' \trem cis'' \trem d'' | \barre "XII" { \trem <a''-4> \trem a'' \trem a'' \trem a'' \trem g'' \trem g'' } |
		\barre "X" { \trem <g''-4> \trem g'' \trem g'' \trem g'' \trem g'' \trem g'' } | \barre "V" { \trem <a'-1> \trem a' \trem a' \trem a' \trem a' \trem a' } |
		\barre "VI" { \trem <d''-4> \trem d'' \trem d'' \trem d'' \trem d'' \trem d'' | \trem <e''-4> \trem e'' \trem e'' \trem e'' \trem d'' \trem d'' } |
		\barre "VII" { \trem <d''-4> \trem d'' \trem d'' \trem d'' \trem <cis''-3> \trem d'' } | \trem <fis''-4> \repeat unfold 3 \trem fis'' \trem <g''-4> \trem g'' |
	}
	\alternative
	{
		{
			\trem <e''-4> \repeat unfold 5 \trem e'' | \trem <d''-4> \repeat unfold 3 \trem d'' \trem <e''-4> \trem e'' |
			\barre "X" { \trem <d''-1> \trem d'' } \barre "VIII" { \trem <c''-1> \trem c'' } \barre "VII" { \trem <h'-1> \trem h' } |
			\barre "V" { \trem <a'-1> \trem a' \trem a' \trem a' \trem <b'-2> \trem b' } |
		}
		{
			\trem <e''-4> \repeat unfold 3 \trem e'' \barre "VII" { \trem <c''-1> \trem c'' } | \barre "V" { \trem <a'-1> \trem a' \trem a' \trem a' \trem <b'-2> \trem b' } |
			\barre "IV" { \trem <h'-4> \trem h' \trem h' \trem h' \trem h' \trem h' } |
		}
	}

	\override TextSpanner.bound-details.left.stencil-align-dir-y = #UP
	\barre "VII" { \trem <h'-1> \trem h' \trem h' \trem h' } \trem ais' \trem h' | \trem <c''-1> \repeat unfold 3 \trem c'' \trem <h'-1> \trem h' | \barre "VI" { \trem <b'-1> \repeat unfold 5 \trem b' |
	\trem b' \trem b' \trem b' \trem b' \trem b' \trem b' } | \barre "V" { \trem <a'-1> \trem a' \trem a' \trem a' } \barre "IV" { \trem gis' \trem <a'-2> } | 
	\barre "II" { \trem <g'-2> \trem g' \trem <fis'-1> \trem fis' \trem g' \trem g' | \trem <fis'-1> \trem fis' \trem fis' \trem fis' \trem fis' \trem fis' } |
	\trem <fis'-4> \trem fis' \trem <g'-2> \trem g' \trem <a'-4> \trem a' | \barre "VII" { \trem <h'-1> \trem h' \trem h' \trem h' } \barre "VI" { \trem <ais'-1> } \barre "VII" { \trem <h'-1> } |
	\barre "VIII" { \trem <e''-4> \trem e'' \trem e'' \trem e'' \trem <fis''-4> \trem fis'' } | \barre "IX" { \trem <e''-4> \trem e'' \trem e'' \trem e'' \trem <d''-2> \trem d'' } |
	\barre "VI" { \trem <d''-4> \trem d'' \trem d'' \trem d'' \trem <e''-4> \trem e'' } | \barre "VII" { \trem <d''-4> \trem d'' \trem d'' \trem d'' \trem <c''-2> \trem c'' } |
	\barre "V" { \trem <a'-1> \trem a' \trem a' \trem a' \trem <h'-4> \trem h' } \bar "||"
	\revert TextSpanner.bound-details.left.stencil-align-dir-y

	\override Accidental.font-size = #-2 \undo\hide Rest
	<a'-1 fis'-3 c'-1>4^\markup{V} <as'-1 f'-3 ces'-1>8^\markup{IV} <ais'-1 fisis'-3 cis'-1>^\markup{VI} <a'-1 fis'-3 c'-1>4^\markup{V} |
	<ais'-1 fisis'-3 cis'-1>4^\markup{VI} <a'-1 fis'-3 c'-1>8^\markup{V} \barre "VI" { <c''-4 fisis'-3 cis'-1>8 <a'-1 fisis' cis'>4} |
	\revert Accidental.font-size <c''-1 a'-2 es'-1>4.^\markup{VIII} <d''-1 h'-3 f'-1>^\markup{X} | <fis''-4 c''-3>2.^\fermata \bar "||"

	\time 2/4
	r8 \flagOn <h' g'>8^\ffXII~ q q^\ffXII~ | q q^\ffXII~ q q^\ffXII \flagOff |
	\repeat volta 2
	{
		s <d''-1 h'-3>~ <d'' h'> q | r <h'-3 g'-4> \barre "III" { r <g'-1 d'-1> } | \barre "VIII" { r <c''-1 g'-1>~ <c'' g'> q } | \barre "X" { r <d''-1 a'-1> } \barre "VIII" { r <c''-1 g'-1> } |
		r <fis'-4 c'-1>~ <fis' c'> q | <a-1>32[( a <h-1> <d'-1>]) <c'-2>4.^\fermata | r8 <g'-2 d'-1>8~ <g' d'> q | r <d'-1 h-2>~ <d' h> q | \barre "XII" { r <e''-1 h'-3>~ <e'' h'> q } |
		s <e''-4 b'-3> r <a'-3 e'-1> | r <cis''-3 fis'-1>~ <cis'' fis'> q | \barre "VII" { <h'-1 fis'-1>4 r } |
	}
	\alternative
	{
		{ r8 <b'-3 e'-0>~ <b' e'> q | <gis-4>4 \priraz gis8 <d'-4>^\fermata <cis'-3>^\fermata | \grace <h-3> \barre "VII" { r <h' fis' d'>~ q q } | r <d''-1 c''-4 fis'-2>~ <d'' c'' fis'> q | }
		{ r <f'-2 h-0>~ <f' h> q | r q r q | }
	}

	\time 6/8
	\barre "II" { fis,16 <fis-3> <a-1> <dis'-4> a fis a, fis a dis' a fis } |
	\barre "V" { c <a-3> <c'-1> <fis'-4> c' a } \barre "VIII" { dis <c'-3> <dis'-1> <c''-4> dis' c' } | \barre "XI" { fis <dis'-3> <fis'-1> <c''-4> <dis''-1> c'' fis' dis' fis' c'' dis'' <fis''-4>( } |
	\bar "||" \once\hide TimeSignature \time 2/1
	a''4^\fermata) <a''-4>8 
	\once\override Beam #'positions = #'(10 . 3)
	\times 18/27 { a''16-4[ g''-2 fis''-1 g'' a'' g'' fis'' es''-2 d''-1 f''-4 es'' d'' c''-4 b'-2 a'-1 g'-3 fis'-2( es'-2) d'-1 c'-4 b-2 a-1 g-0 fis-4 d-0( es-1 d)] } <b-2 d-0>4 <a-1 fis-3 c-4 d,> \bar "||"

	\times 6/8 \key g \minor \barre "III" { s2. | s | \hide Rest
	\trem <d'-1>32 \trem d' \trem <es'-2> \trem es' \trem <fis'-4> \trem fis' | \trem <g'-1> \trem g' \trem <a'-3> \trem a' \trem <b'-4> \trem b' } |
	\barre "V" { \trem <c''-4> \trem c'' \trem c'' \trem c'' \trem a' \trem a' | \trem <g'-4> \trem g' \trem g' \trem g' \trem <fis'-3> \trem fis'} |
	\barre "III" { \trem <d'-1> \trem d' \trem <es'-2> \trem es' \trem <fis'-4> \trem fis' | \trem <g'-1> \trem g' \trem <a'-3> \trem a' \trem <b'-4> \trem b' } |
	\barre "VII" { \trem <es''-4> \trem es'' \trem es'' \trem es'' \trem es'' \trem es'' } | \barre "VIII" { \trem <d''-4> \trem d'' \trem d'' \trem d'' \trem d'' \trem d'' |
	\trem c'' \trem c'' \trem <d''-3> \trem d'' \trem <es''-4> \trem es'' } | \trem <f''-4> \repeat unfold 5 \trem f'' | \barre "VIII" { \trem <c''-1> \trem c'' \trem <d''-2> \trem d'' \trem <es''-4> \trem es'' } |
	\barre "IX" { \trem <g''-4> \trem q \trem q \trem q \trem q \trem q } | \barre "X" { \trem <f''-4> \trem q \trem d'' \trem d'' } \barre "VI" { \trem b' \trem b' } |
	\barre "V" { \trem <a'-4> \trem q \trem q \trem q \trem q \trem q | \trem q \trem q \trem q \trem q \trem q \trem q } | \trem q \trem q \trem q \trem q \trem q \trem q |
	\trem <c''-1> \trem q \trem q \trem q \trem q \trem q | \trem <e''-1> \trem q \trem q \trem q \trem q \trem q |
	\trem <a''-4>^\markup{\tiny{\circle\number 1 " — XVII" }} \trem q \trem q \trem q \trem q \trem q | \trem <c'''-4>^\markup{\tiny XX} \trem q \trem q \trem q \trem q \trem q |
	\trem q \trem q \trem q \trem q \trem <h''-4>^\markup{\tiny XIX} \trem q | \trem <a''-4>^\markup{\tiny XVII} \trem q \trem q \trem q \trem <g''-4>^\markup{\tiny XV} \trem q |
	\trem <fis''-3> \trem q \trem q \trem q \trem q \trem q | 
	\barre "IX" { \trem <e''-3> \trem q \trem q \trem q \trem q \trem q } | \barre "X" { \trem <d''-1> \trem q \trem q \trem q \trem q \trem q } | \barre "VIII" { \trem <c''-1> \trem q \trem q \trem q \trem q \trem q } |

	\key g \major
	\repeat volta 2
	{
		\barre "VII" { \trem <h'> \trem q \trem q \trem q \trem q \trem q } | \trem <c''-2> \trem q \trem q \trem <d''-2> \trem <e''-4> \trem d'' | \barre "V" { \trem <a'-1> \trem q \trem q } \trem <h'-4> \trem <c''-2> \trem h' |
		\trem <ais'-4> \trem q \trem <h'-4> \trem q \trem <g'-2> \trem q |
	}
	\barre "VII" { \trem <h'> \trem q \trem q \trem q \trem q \trem q } | \trem <h'-4> \repeat unfold 5 { \trem q } | \barre "VIII" { \trem <c''-1> \trem q \trem q \trem q \trem q \trem q } | 
	\trem <cis''-4> \repeat unfold 5 { \trem q } | \barre "VII" { \trem <d''-4> \trem q \trem q \trem q \trem q \trem q } | \trem <d''-4> \repeat unfold 5 { \trem q } | \repeat unfold 6 { \trem q } |
	\trem <d''-1> \trem q \trem q \trem <e''-4> \trem <fis''-4> \trem d'' | \barre "VII" { \trem <e''-4> \trem q \trem <d''-4> \trem q \trem q \trem q } |
	\barre "V" { \trem <a'-1> \trem q \trem <h'-2> \trem q \trem <c''-4> \trem q } | \barre "VII" { \trem <h'-1> \trem q \trem q \trem q \trem q \trem q } | \trem <d''-1> \trem q \trem q \trem <e''-4> \trem <fis''-4> \trem q |
	\barre "XI" { \trem <g''-4> \trem q \trem <fis''-4> \trem q \trem <e''-3> \trem e'' } | \barre "VII" { \trem <d''-4> \trem q \trem q } \trem <e''-4> \trem <fis''-4> \trem <d''-4> |
	\barre "V" { \trem <c''-4> \trem q \trem <h'-3> \trem h' \trem <a'-1> \trem q } | \trem <e''-4> \repeat unfold 3 { \trem q } \barre "III" { \trem <g'-1> \trem q } | \trem <h'-4> \repeat unfold 3 { \trem q } \trem <a'-4> \trem q |
	\trem <g'-1> \repeat unfold 4 { \trem q } \trem <a'-4> | \barre "V" { \trem <h'-4> \trem q \trem q \trem q \trem <a'-1> \trem q } | \barre "III" { \trem <g'-1> \trem q \trem q \trem q \trem <a'-4> \trem q |
	\trem <g'-1> \trem q \trem q \trem q \trem <a'-4> \trem q } | \barre "VII" { \trem <h'-1> \trem q \trem q \trem q \trem q \trem q | \trem <d''-4> \trem q \trem q \trem q \trem q \trem q } |
	\override TextScript.outside-staff-priority = #250
	\barre "XII" { \trem <g''-4>^\markup{\tiny XV} \trem q \trem q \trem q \trem q \trem q\glissando | \trem <h''-4>^\markup{\tiny XIX} \trem q \trem q \trem q \trem q \trem q | \trem q \trem q \trem q \trem q \trem q \trem q |
	<h''-4 h'-1 d'-1>4.^\fermata } <g'-1 d'-1 h-2>\strum^\fermata \bar "|."
}

basses = {
	\global
	\voiceTwo
	\stemDown
	\slurUp

	\repeat volta 2
	{
		<g,-0>2. g,4 | <c'-1 d-0 a,-2>2 a,\rest | <d'-1 g-0 h,-2> a,\rest | <e'-1 g-1 c-1> a,\rest | \barre "V" { a,4\rest <d-0> d d | a,\rest \flagOn d'_\ffXII d'_\ffXII d'_\ffXII \flagOff} |
	}
	\alternative { { <h-0 g-0 d-0 g,-0>1 | } { <dis'-1 fis-1 h,-1> | } } 

	<g'-2 e'-3>2 r | <h'-3 fis'> <g'-2 e'-3> | <e'-3 h-2> r | <e'-1 a-3> <c'-1>4 <cis'-2> | <fis' d'-3>2 <des'-2>4 <c'-2> | <g'-1 h-2>2 <e-2>4 <a,-2> | <d-0>2 <d,-0> | <g,-0>_\fermata a,\rest |

	\time 3/4
	s2. | s | s | s | g, | g, | 

	\repeat volta 2
	{
		<g,-0>8[ <g'-2> <h-3> g' <d'-2> g'] | <g,-0>8 <h'-3> <d'-2> h' g' h'] | <d,-0>[ <c''-4> d' c'' <fis'-2> c''] | d,[ <fis'-3> <c'-1> <cis'-2> <e'-4> <d'-3>] | d,[ <fis'-3> <a-2> fis' <d'-2> fis'] |
		d,[ <c''-3> <d'-2> <c''-3>] <fis'-1> <c''-3> | <g,-0>[ <h'-3> <d'-4> h'] <g'-2> h' | <g,-0>[ <g'-2> <h-3> g' <d'-1> g'] | g,[ <h'-3> <d'-2> h' <g'-2> h'] |
		g,[ <h'-1> <d'-1> h'] <g'-1>[ <h'-1>] | <c-1>[ <a'-1> <e'-3> a' <g'-2> a'] | <c-1>[ <e'-1> <a'-3> e' <c'-1> e'] | <gis,-1>[ <f'-3> <h-2> f' h f'] | <gis,-1>[ <f'-3> <h-2> f'] h[ f'] | 
		<a,-1>[ <fis'-1> <c'-3> fis' <d'-1> fis'] | d,[ <c''-3> <d'-2> c'' <fis'-1> c''] |
	}
	\alternative
	{
		{ d,[ <g'-3> <c'-1> g' <e'-1> g'] | d,[ <gis'-2> <f'-3> gis'] g' b' | <fis'-2>[ <a'-1>] <e'-2>[ <g'-1>] <d'-1>[ <g'-2>] | <d'-3>[ <fis'-4> <cis'-2> fis' <c'-1> <d-0>] | }
		{ d,[ <g'-3> <c'-1> g'] <e'-2> <g'-1> | <d-0>[ <fis'-3> <c'-1> fis' c' fis'] | <h,-1>[ <dis'-1> <fis-1> dis' <h-1> dis'] | }
	}

	<e-3>[ <g'-2> <h-4> g'] <e'-4> g' | <e-3>[ <g'-2> <h-4> g'] <e'-3> g' | <e-4>[ <fis'-2> <b-3> fis' <cis'-1> fis' | <e'-4> fis' cis' fis' b fis'] | <dis-3>[ <h-4> <a-2> h] <dis'-1> <h-1> |
	<e-1>[ <h-3>] <a,-1>[ <c'-4>] <b,-2>[ <cis'-1>] | <h,-2>[ <dis'-4> <fis-3> dis' fis dis'] | <dis,-1>[ <a-3>] <e,-1>[ <h-2>] <fis,-1>[ <c'-3>] | <g,-0>[ <g'-2> <h-3> g' <d'-2> g'] |
	<b,-1>[ <g'-3> <cis'-2> g'] cis' g' | <h,-1>[ <h-1> <fis'-3> h] fis' h | <gis,-1>[ <h-2> <f'-3> h] f' h | <a,-1>[ <a-1> <e'-3> a] e' a | d,[ <d-0> <c'-1> d] c' d |

	\hide Rest
	<d-0>16[ \repeat unfold 11 d | \repeat unfold 11 d d] | r[ \repeat unfold 5 d, r \repeat unfold 4 d, d,] | <fis-1 d'-2>2._\fermata \bar "||" \undo\hide Rest

	\time 2/4
	\flag g2_\ffXII~ | \flag g
	\repeat volta 2
	{
		<< {\stemDown\fleft <g,-0>} \\ {\stemDown\fleft <g'-2>4 s} >> |  \priraz g'8-2 <d'-2>4 \priraz d'8-2 <h-2>4 |  \priraz h8-2 <e'-2 g,-0>2 |  \priraz e'8-2 <fis'-2>4 <e'-2> | <a-3 d,>2 |
		r8 r4._\fermata | <h-3 g,-0>2 | \priraz h8-3 <g-3>2 | <g'-2> | <fis'-2>4 \priraz fis'8-2 <cis'-2>4 |  \priraz cis'8-2 <e'-2>2 | \times 2/3 { <d'-1>8( <e'-3> d') } <cis'-4>16 <d'-1> <e'-2>( <fis'-2>) |
	}
	\alternative
	{
		{ <fis'-2>2 | r_\fermata | <h-3> | <d,-0 d-0> | }
		{ cis' | <d'-4>4 <cis'-3> | }
	}

	\time 6/8
	<fis,-2>4. <a,-1> | <c-1> <dis-1> | <fis-1>2. |
	\once\hide TimeSignature \time 2/1 r1 r |

	\time 6/8 \key g \minor
	<g,-0>8[ <d-0> <b-1> d b d | g, d b d b d] |
	<g,-0>8[ <d-0>] <b-1>[ d] b[ d] | g,[ d] b[ d] b[ d] | <c-1>[ <g-1> <es'-3> g] es'[ g] | d,[ <d-0> <c'-1> d] c'[ d] | <g,-0>8[ <d-0>] <b-1>[ d] b[ d] | <g,-0>8[ <d-0>] <b-1>[ d] b[ d] |
	<a,-1>[ <f-2> <c'-3> f c' f] | <b,-1>[ <f-3> <b-1> f b f] | <es-1>[ <c'-2>] <g'-1>[ c'] g'[ c'] | <d-0>[ <h-1> <d'-2> <as'-2> d' h] | <e-1>[ <c'-2>] <g'-1>[ c'] g'[ c'] |
	<e-1>[ <cis'-2> <e'-1> <b-3> e' cis'] | <f-1>[ <d'-1>] <f'-1>[ <b'-2>] <d'-2>[ <f'-1>] | <c-1>[ <g-1> <es'-4> g es' g | <cis-2> <a-4> <e'-1> a e' a | d, <a-3> <fis'-4> a fis' a] | d,[ <c'-3> <a'-4> c' a' c'] |
	d,[ <e'-3> <c''-2> e' c' e'] | d,[ <e'-3> <c''-2> e' c' e'] | d,[ <fis'-1> <c''-2> fis' c'' fis' | d, fis' c'' fis'] <c''-2> <fis'-1> | d,[ <fis'-2> <c''-3> fis'] c'' fis' | <d-0>[ <d''-4> <a'-2> d'' a' d''] |
	<e-1>[ <c''-4> <e'-1> c'' e' c''] | <f-1>[ <h'-4> <f'-1> h' f' h'] | <fis-3>[ <a'-2> <fis'-4> a' fis' a'] |

	\key g \major
	\repeat volta 2
	{
		<g,-0>[ <d'-1> d, <e'-3> <fis'-4> d'] | <a,-1>[ <e'-3> d,] <fis'-3> <g'-3> fis' | d,[ <c'-1> d] <d'-3> <e'-3> d' | <fis,-1>[ <cis'-3>] <d-0>[ <d'-3>] d,[ h] |
	}
	<g,-0>[ <d'-1> d, <e'-2> <fis'-4> d' | <d'-3> <f'-2> <h-1> f' <g-1> f'] | <c'-3>[ <g'-1> <e'-2> <a'-4> g' e'] | e'[ g' <cis'-1> g' <a-1> g'] |
	\once\override Beam.positions = #'(-8 . -7)
	<d,-0>[ <d'-1> <fis'-1> d' fis' d' | d, <e'-1> <g'-2> e' g' e' |
	d, <f'-1> <gis'-2> f' <a'-2> <fis'-2> | <g,-0> <g'-2> <h'-3>] g' h' g' | d,[ <d'-1>] <fis'-1>[ d' fis' d'] | d,[ d] <c'-1>[ d] c'[ d] | <g,-0>[ <h-3> <d'-1> <g'-2> d' h] | <g,-0>[ <g'-2> <h'-3>] g' h' g' | 
	<cis'-1>[ <g'-2>] <b'-1>[ g'] b'[ g'] | <h-3>[ <d'-1> <fis'-1>] <e'-1> <fis'-1> <d'-1> | <c-1>[ <c'-1>] <e'-1>[ c'] e'[ c'] | <cis-1>[ <b'-2> <g'-3> b'] <h,-2>[ h] | d,[ <d-0> <d'-2> d] <c'-3>[ d] |
	<g,-0>[ <d-0> <h-2> d h] d | d,[ <c'-1> <e'-1> eis' <fis'-3> c'] | <g,-0>[ <d-0> <h-2> d] <c'-3>[ d] | g,[ d h d] c'[ d] | \repeat unfold 2 { <g,-0>[ <h-3> <d'-1> <g'-2> d' h] | } 
	\repeat unfold 3 { <g,-0>[ <d'-1> <g'-1> <h'-1> g' d'] | } 
	<g,-0>4._\fermata <d-0 g,-0>_\fermata |
}

\paper
{
		#(define fonts (make-pango-font-tree "Georgia" "Arial" "Courier New" 1 ) )
		system-system-spacing #'basic-distance = #20
		indent = #10
		left-margin = #5
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

		page-count = #5
}

\score {
	\new Staff \with {
		instrumentName = "Kytara"
	} {
		<<
%			\new Voice { \clef "treble_8" \unfoldRepeats \melody }
%			\new Voice { \clef "treble_8" \unfoldRepeats \basses }
%			\new Voice { \clef "treble_8" \unfoldRepeats \lining }
			\new Voice { \clef "treble_8" \melody }
			\new Voice { \clef "treble_8" \basses }
			\new Voice { \clef "treble_8" \lining }
		>>
	}
	\layout { }
 	\midi {
 		\context {
 			\Score
 			tempoWholesPerMinute = #(ly:make-moment 100 4)
 			\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
 		}
 	}
}
