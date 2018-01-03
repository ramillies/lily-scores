\version "2.18.0"
\language "deutsch"

\header {
  title = "Preludium g moll"
  subtitle = "(opus 5, č. 1)"
  composer = "Agustin Barrios Mangoré (1885 - 1944)"
  poet = "6tá na d"
  arranger = "přepsal Darek Cidlinský (13. IX. 2014)"
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
normstems = \revert Stem.details
extStrum = \override Arpeggio.positions = #'(-2 . 2)
normStrum = \revert Arpeggio.positions
empty = { \once \hide NoteHead \once \override NoteHead.no-ledgers = ##t }
vacuum = { \hide NoteHead \override NoteHead.no-ledgers = ##t }
visible = { \undo \hide NoteHead \revert NoteHead.no-ledgers }
tamb = \markup { T }
flag = \once \override NoteHead.style = #'harmonic

fO = \markup { \italic o }
fA = \markup { \italic a }
fM = \markup { \italic m }
fI = \markup { \italic i }
fP = \markup { \italic p }

sup = \arpeggioArrowUp
sdown = \arpeggioArrowDown
strum = \arpeggio

fleft = \set fingeringOrientations = #'(left)
fdown = \set fingeringOrientations = #'(down)

global = {
  \key g \minor
  \time 2/4
  \set fingeringOrientations = #'(left)
  \set stringNumberOrientations = #'(down)
  \mergeDifferentlyHeadedOn
  \mergeDifferentlyDottedOn
}

melody = {  
  \global
  \voiceOne
  \tupletUp
  \slurDown
  \set tupletSpannerDuration = #(ly:make-moment 1 4)
  \override TupletBracket.bracket-visibility = ##f

	g,16-3 d-0 cis-2 d-0 es-4( d-0) cis-2 d-0 | c-3 d-0 b,-1 d-0 a,-0 d-0 g,-3 d-0 | fis,-2 d-0 cis-3 d-0 es-4 d-0 cis-3 d-0 | b,-1( c-3) a,-0( b,-1) d-0 g-0 f-3( es) |
	d-0( g-3) \barre "III" { b-1 d'-1 es'-2 g'-1 f'-4( es'-2) | d'-1 b-1 a b-1 d'-1 g'-1 a'-2\glissando b'} | \barre "V" {b'-2( a'-1) fis'-4 d'-3 c'-1( d'-3) fis'-4 a'-1} | \barre "III" { a'-3( g'-1) d'-1 b-1 } \barre "V" { a-3 c'-1 g'-4( f'-2) } |
	\barre "III" { f'-4( es'-2) b-1 a-3 cis-2( es-4) g-3 b-1 } | a-1 fis-3 d-4 fis-3 cis-2 fis-3 d-4 fis-3 | \barre "III" { g-3 d'-1 cis'-4 d'-1 es'-2( d') cis'-4 d' | c'-4 d'-1 b-1 d'-1 a-4 d'-1 g-3 d'-1 } |
	\barre "III" { fis-2 d'-1 cis'-4 d'-1 es'-3( d') c'-4 d' } | b-2( c'-4) a-1\glissando b \barre "III" { d'-1 g'-1 f'-4 es'-2 | d'-1 b-1 g-3( d-0) } cis'-1\glissando d' f'-4 es'-2 | r b-2 g-4 b-2 ges-3 b-1 f-3 b-4 |
	e-2 b-4 g-0 b-4 f-3 b-4 e-2 b-4 | e-1 b-4 d b-4 cis-1 a-4 g-0 a-4 | fis-3 d-0( \barre "II" { fis-3) g-1 d'-2 fis'-1 a'-4\glissando } d'' | d''-4\glissando c'' a'-1 c''-4 fis'-3 a'-1 d'-2 fis'-3 |
	es'-4( c'-1) a-1 c'-4 b-2( g-0) e-1 cis-3 | d-0 a,-0 fis,-3 a,-0 d,-0( fis,-3) a,-0 d-0 | d,-0( fis,-1) a,-0 d-0 es-3 g-2 a-4 es'-0 | es'-1( c'-1) b-2 a-1 c'-4 b-2 a-1 g-4 |
	fis-3( g-4) a-1 c'-4 b-4( a-3) b-4 cis-1 | d4 r \mark \markup { \musicglyph #"scripts.coda" } \bar "||"  g,16-3 d-0 \barre "III" { d'-1 b-1 } c'-1 a-2 fis-4( d-0) | b g( d) b,-1 a,-0( c-3) e-1 g-0 |
	
	b-2( a-1) c'-4( b-2) d'-3( c'-1) es'-4( d'-2) | cis'-1 b-2 g-4 b-2 d( \barre "III" { g-2) b-1 d'-1 } | g'-3 fis'-2 f'-1( e'-0) es'-4( c'-1) a-2( g-0) | fis-3 \barre "II" { g d' fis' } \barre "X" { a'-1 d''-1 c''-4 d''} |
	b' d'' a' d'' g' d'' fis' d'' | \barre "V" { g, d' c''( b') } \barre "III" {  c es' b'( a') | cis b a'( g') } d-0 a-2 g'-4( fis'-3) | as-1 h-0 g'-4( f'-3) g-0 h-0 f'-1( e'-0) |
	es'-1 c'-3 g-2 c' es-2 g-1 \barre "V" { d'-3( c'-1) | es'-4( d'-3) c'-1 b-4 a-3( g-0) fis-4 g-0 } | b-2( a-1) fis-3( d-0) \barre "II" { c a fis' d' } | \barre "I" { b, b g' d' } a,-0 c'-3 a'-4 d'-1 |
	\barre "III" { g,-2 b-1 b'-4 d'-1 } \barre "I" { f,-2 b-3 f'-1 d'-4 | e,-2 b-3 g'-4 c'-4 } es,-1 g-0 cis'-2 b-3 | d, g-4 cis'-1 b-2 d' a fis a | d, c'-4 fis'-1 es'-3 \barre "III" { g' d' b d' } |
	d, es'-4 a'-1 fis'-3 b'-2 g'-4 d'-3 g' | d, g'-4 cis''-1 b'-3 \barre "X" { d'' a' fis' a' | \flag d fis' d'' a' \stemDown fis''-4( d''-1) } a''-4( fis''-2) \stemUp | d''-3 fis''-2 c''-1 fis''-2 b'-3 fis''-2 a'-3 fis''-4 |
	d'-1 b'-3 g''-4 b' cis'-1 g'-3 es''-2 g' | c'-3 fis'-2 \barre "X" { d''-1 fis'-1 c'-1 fis'-2 es''-3 fis'} | b-1 g'-1 \barre "VIII" { d''-3 g' fis-2 es'-1 c''-1 es' } | g d' \barre "V" { b' d' d c' a' c' } |
	es b \barre "I" { g' b h,-2 as g' as } | c g es' g b,-1 d'-3 g'-4 d' | a,-0 es'-3 g'-2 es' g,-4 b-2 cis'-1 b | \barre "II" { fis,-3 a d'\< a fis' d' a'( fis')\! } |
	\barre "III" { g,-3 b\< d' b g' d' b'-4( g')\! } | a,-0 \barre "VI" { cis'-1 b'-1 g'-3 } \barre "V" { d c'-1 a'-1 fis'-3 } | g'-3 d'-1 b-2 g-0 \barre "VII" { f-2 d' h' g' } | \barre "VI" { es es' c'' g' } d-0 f'-3 d''-4 g'-1 | 
	\barre "VIII" { c es' es'' g' c es' c es' } | r4 \barre "X" { a16-3 f'-1 es''-2 c''-1 } | b-1 f'-2 \barre "VIII" { d''-3 b'-4 c'-2 es' c'' es' } | d' b'-3 g''-4 b' e'-2 b'-3 g''-4 b' |
	\barre "X" { g' a' f'' a' d f' d f' | c' g'-3 es''-2 g' cis'-2 g'-3 a'-1 g' | d'-3 g'-4 a'-1 g' d'' a' fis'-2 a' } | \barre "VII" { d' fis' c'-4 fis' a-2 fis'-1 a fis' } |
	\barre "III" { g b g' b  f h-2 as'-3 h } | \barre "I" { es c' g' c'} h,-2 d'-3 g'-4( f'-1) | c-1 g-3 es'-2 g a,-0 g-0 c-3 g | es-4 g-3 es'-2 g cis-1 g-3 b'-4 es'-2 |
	d-0 d'-2 fis'-3 a'-1 \barre "X" { c''-4 d''-1 h'-3 d'' | b'-2 d''-1 a'-3 d'' g' d'' fis' d'' } | \barre "VIII" { h-2( d'-4) f'-3 g'-1 fis'-4 g' f' g' | es'-1 g'-1 d'-4 g' c'-3 g'-1 h-2 g' |
	c'( e') g' c'' h'-4 c''-1 b'-4 c''-1 | a'-3 c'' g'-1 c'' f'-3 c'' e'-2 c'' } | a-2( c'-4) \barre "VI" { es'-3 f'-1 e'-4 f' es'-3 f' | d'-2 f' c'-4 f' b-3 f' a-2 f' |
	b d' f' b' a'-4 b'-1 as'-4 b' | g'-3 b' f'-1 b' es'-3 b' d'-2 b' } | des'-1 g'-3 es''-2 g' c'-3 as'-2 es''-4 as' | \barre "VIII" { b as'-2 es''-4( d''-3) } \barre "VI" { as f' d''-4( c''-2) } |
	\barre "V" { g e' c''( b') } \barre "IV" { ges es' b'( a') } | \barre "III" { f c' b'-4( as'-2) } b,-3 des'-1 a'-4 des' | h,-3 d'-1 as'-4 d' c-3 es'-1 es''-4 as'-2 | c''-4( b'-2) a'-1 g' fis'-3( g'-4) a'-1 c''-4 |
	b'-2( a'-1) g'-4 fis'-3 g' a' b'( g') | \barre "III" { g' f' es' d' es' f' g'( f') } | es'-2( d'-1) c'-3 d' es'-2( d'-1) f'-4( es') | d, d'-2 cis'-1 d' es'-2( d') c'-4( b-2) |
	a-1(_\markup{ \tiny{\italic{Hrajte od začátku až k symbolu „Coda“}}} b-2) c'-4( a-1) fis-3( d) c-2( a,) \mark \markup { \musicglyph #"scripts.coda" } \bar "||" f-1 g-0 d''-4 g h-2 g f-1 g | e-1 g des''-4 g b-2 g e-1 g | es-1 g c''-4 g a-2 g a g |
	\barre "VII" { fis a d' fis' a'-4 c'' b'-2 a' } | c''-4( b'-2) a'-1 g'-4 fis'-3( g'-4) a'-1 b'-2 | \barre "I" { g'-3( f'-1) es'-4 d'-3 } c'-1( h-0) c' d'-3 | a-2 d-0 cis-4 d c-3 d b,-1 d |
	a,-0 d-0 g,-3 d fis,-3 a-1 es'-4 a | \barre "III" { g, b g' d' } a, a fis' c' | h, g f' d' c as es' c' | \barre "III" { d g d' b } a, es-1 c'-2 es |
	d g b-1 g d, d a-1 fis-3 | r d-0 a,-0 d b, d a, d | r d a, d b, d d, d | 
	g,-4 d a, d b-2 d d d | g g d d g g d d | \barre "V" { <g'-4 b-3>2^\fermata } \bar "|."
}

basses = {
  \global
   \voiceTwo
   \stemDown
   \slurUp

	g,2 | c8 b, a, g, | fis,2 | s2 | s2 | s2 | d,2 | g,-2 | c4 cis16 s8. | s8 d8 cis d | g2 | c'8 b a g |
	fis2 | s | s | d'8-1 g ges f | e4 f8 e | e d cis4 | s2 | d | s2 | s | s | s | s | d16 a, fis, a, d,4 | s2 | s
	s | s | s | s | s | g,4 c | cis d | s2 | s | s | s | s |
	g,4 f, | e, es, | d,2 | d, | d, | d, | \flag d_\markup{\teeny XII} | s | d'4 cis' | c' c' | b fis | g d | es h, | c b, | a, g, | fis,2 | g, | a,4 s | g' f | es d |
	c4-2 c8 c | \barre "VIII" { c'16-2( d'-4) c'( b-1) } a4 | b c' | d' e' | g' d8 d | c'4 cis' | d' d'' | d' a8 a | g4 f | es h, | c a,8 c | es4 cis |
	d c''8 h' | b' a' g' fis' | s4 fis'8 f' | es' d' c' h | s s h' b' | a' g' f' e' | s s e' es' | d' c' b a | s s a' as' | g' f' es' d' | des'4 c' | b as | g ges | f b, | h, c | d2 |
	g | c' | a, | d,~ | d, | f4 h8 f | e4 b | es a | s d | g2 | es,4 a, | s2 | 
	a,8 g, fis,4 | g, a, | h, c | d a, | d d, | \slurDown <g g,>2( | q) \slurUp | g,8 a, b,\glissando d | s2 | <d-1 g,-1>2_\fermata |
}

\paper
{
    #(define fonts (make-pango-font-tree "Georgia" "Arial" "Courier New" 1 ) )
    system-system-spacing #'basic-distance = #15
}

\score {
  \new Staff \with {
    midiInstrument = "acoustic guitar (nylon)"
  } {
      <<
          \new Voice { \clef "treble_8" \melody }
          \new Voice { \clef "treble_8" \basses }
      >>
  }
  \layout { }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 100 4)
    }
  }
}
