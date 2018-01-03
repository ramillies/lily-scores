\version "2.18.0"
\language "deutsch"

\header {
  title = "Serenata Capricho Español"
  composer = "Antonio Sinopoli"
  poet = "6a muta in D"
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
extStrum = \override Arpeggio.positions = #'(-4 . 4)
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
fright = \set fingeringOrientations = #'(right)
fdown = \set fingeringOrientations = #'(down)

global = {
  \key d \minor
  \time 4/4
  \set fingeringOrientations = #'(left)
  \set stringNumberOrientations = #'(down)
  \mergeDifferentlyHeadedOn
  \mergeDifferentlyDottedOn
  \override Score.BarNumber.self-alignment-X = #LEFT
  \override Glissando.breakable = ##t
  \override Glissando.after-line-breaking = ##t
}

lining = {
	\global
	s1 \noBreak s1 \noBreak s1 \break
	\repeat unfold 4 { s2. \noBreak } s \break
	s1 \noBreak s2. \noBreak s1 \noBreak s2. \break
	s \noBreak s \noBreak s \noBreak s \break
	\repeat unfold 3 { s \noBreak } s \break
	\repeat unfold 3 { s \noBreak } s \break
	\repeat unfold 5 { s \noBreak } s \break
	\repeat unfold 2 { s \noBreak } s \break
	\repeat unfold 2 { s \noBreak } s \break

}
melody = {  
  \global
  \voiceOne
  \tupletUp
  \slurUp
  \set tupletSpannerDuration = #(ly:make-moment 1 4)
  \override TupletBracket.bracket-visibility = ##f
  \extStrum
  \set Score.tempoHideNote = ##t

	\tempo "Allegro" \tempo 4 = 75
	<a'-1 e'-1 cis'-2 a-3>2\strum \acciaccatura{<g''-1>16. <a''-3>32} b''32[( a'' g'' f'' e'' f'' g'' f'' e'' d'' cis'' d'' e'' d'' cis'' b']) | \slurDown
	a'2-2 \acciaccatura{<g-1>16. <a-3>32} b32[( a g f e f g f e d cis d e d cis b,]) |
	r8 cis-3 e-1 g \acciaccatura{b8} a2^\fermata \bar "||"
	\time 3/4 d8[ \times 2/3 { a'16( f' d') } s8 <a' f'>] s8 <g'-4 cis'-2> | d,8[ \times 2/3 { a'16( f' d') } s8 <a' f'>] s8 <g'-4 cis'-2> | 
	\barre "VIII" { f8[ \times 2/3 { <c''-1>16( <a'-4> <f'-3>) } } s8 <c'' a'>8] s <b' e'> | \barre "V" { f8[ \times 2/3 { <a'-1>16( <f'-2> <c'-1>) } s8 <a' f'>]} s <g' cis'> | d,[ \times 2/3 { a'16( f' d') } s8 <a' f'>] s cis' \bar "||"
	\time 4/4 d'8[ <a-2>16 <f-3> s8 a] d,[ a16-2 b cis'-3 d'-4 e'8 ] | \time 3/4 f'8-1[ d'16-4 a-2 s8 d' e' <cis' a>] |
	\time 4/4 d'8-4[ a16-2 f-3 s8 a-2] d,[ d'16 e' f' g' a'8] |
	\time 3/4 \barre "V" { c''8[ <e'-1>16 <c'-1> s8 e' <b'-2> <g'-4 c'-1>] | a'8[ f'16 c' s8 f' a' <f' c'>] } | \barre "IV" { gis'8-1 e'16-2 d'-4 gis8 <e' d'> gis' <e' d'> } |
	<< { a'4~ a'8[ g'16. a'32] } \\ {\extStrum \stemUp <e' cis' a>2\strum } >> \acciaccatura { b'16.-2 c''32-4 } \times 4/6 { b'16( a' g' f' g' a') } | 
	<< { a'8[ g'16. a'32] } \\ {\extStrum \stemUp <e' cis' a>4\strum } >> \acciaccatura { b'16.-2 c''32-4 } b'32[( a' g' f' e' f' g' f' e' d' cis' d' e' d' cis' b)] |
	\barre "IX" { a2 \times 4/6 { a16( <cis'-2> <e'-1> <a'-1> <cis''-1> <e''-4>) } }
	\repeat volta 2 { \barre "X" { <d''-1 f'-1>16[ f''-4 c'' d'' e' a']~ a'[ d''-1 e''-3 f''-4 e'' d''] } | 
	\barre "IX" { <e'-1 cis''-1>[ e''-4 a'-2 d''-3 e' a']~ a'[ e' f' g' f' e'] } | }
	\barre "X" { <d''-1 a'-1 f'-1>16[ a' f' a' d'' a'] } \barre "VIII" { <c''-1 g'-1>[ g' e' g' c' g'] } |
	\barre "VII" {  <b'-1 f'-1 d'-2>[ f' d' f' b' f'] } <a'~ e' cis' a>4.\strum \bar "||" a'8 g'16. a'32 \acciaccatura { b'16.-2 c''32-4 } b'32[( a' g' f' e' f' g' f' e' d' cis' d' e' d' cis' b)]
	a4 \acciaccatura{<g-1>16. <a-3>32} b32[( a g f e f g f e d cis d e d cis b,]) |
	r2 a4\glissando \bar "||" \tempo "Adagio" \tempo 4 = 50 d'2 r8 cis'32 d' e' cis' \glissando | a4 <a-1 f-2>4. a8\glissando | d'4 d' r8 cis'32 d' e' d'\glissando |
	a4 <a-1 f-2>4. f'8\glissando | a'4 <a'-1 f'-2 d'-4>4. g'16 a' | \acciaccatura{b'16. c''32} b'16 a' b' c''\glissando d''4 <a' f' d'>~ |
	q8 <g'-4>16 <a'-1> \acciaccatura {b'16. c''32} b'16 a' b' c'' d''8. e''16 | \acciaccatura{g''16 g''} f'' e'' f'' e'' b'8. c''16 \acciaccatura{d'' e''} d'' cis'' d'' e''^\fermata \bar "||"

	\tempo "Allegro" \tempo 4 = 75
	a,8[ \times 2/3 { a16 cis' e' } a'8] g16[ g'32 a' \acciaccatura{b'16 c''} b' a' g' f'] |
	a,8[ \times 2/3 { a16 cis' e' } a'8] g16[ g'32 a' \acciaccatura{b'16 c''} b' a' g' f'] |
	e'[ f' g' f' e' d'] cis'[ d' e' d' cis' b] \bar "||"
	a8 cis' <e' cis'-2> <g' e'>^\fermata f'[ e'] \bar "||"
	\tempo "Lento" \tempo 4 = 35
	a4 \acciaccatura{<g-1>16. <a-3>32} b32[( a g f e f g f e d cis d e d cis b,]) | r4 <cis' g e> <d' a f> \bar "|."
}

basses = {
  \global
   \voiceTwo
   \stemDown
   \slurUp

   a,2-0~ a, | a, s | a,4 s2 s4 |
   \time 3/4 d,4 a8 d' e g | d,4 a8 d' e g | f4 c'8 f' g b | f4 a8 c' e g | d,4 a8 d' a, g | \slurDown \time 4/4 d,4( a,8 f d,4) s | \slurUp
   \time 3/4 d,4 f8 a a,4 | \time 4/4 d,4 a,8 f d,4 s \bar "||" 
   \time 3/4 e4 g8-1 c' e4 | f4 a8 c'8 f4 | e gis-3 r | a,2 s4 | a,2 s4 | a,2 s4
   \repeat volta 2 { d,4 s8 d f' a' | a,4 s8 a, cis' cis' } | s4. <e'-2 c'-3> | d a, | a4 s2 | a,2. | a,4 \flag a'^\markup{\tiny VII} s | d,2 s4 | d,4 <d-4>4. s8 |
  s4 <a-1 f-3> r4 | d, d4. r8 | d,4 d e | g d, d | e g d, | s2. |
  a,4 <e' cis' a>8 g4. | a,4 <e' cis' a>8 g4. | e cis | a,4 <g-1> cis'8 cis' | a,2 s4 | a, a, d, |

}

\paper
{
    #(define fonts (make-pango-font-tree "Georgia" "Arial" "Courier New" 1 ) )
    system-system-spacing #'basic-distance = #10
    indent = #10
    left-margin = #5
    right-margin = #5
    top-margin = #3
    bottom-margin = #6

	page-count = #1
}

\score {
  \new Staff \with {
    midiInstrument = "acoustic guitar (nylon)"
    instrumentName = "Kytara"
  } {
      <<
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
