\version "2.18.0"
\language "deutsch"

\header {
%  title = "Undae"
%  subtitle = "(„Vlny“)"
  composer = "Darek"
%  arranger = "přepsal Darek Cidlinský (16. IX. 2014)"
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
  \key e \minor
  \time 4/4
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
  \set Score.tempoHideNote = ##t

	\tempo 4 = 70
	\repeat unfold 2 { r8 \times 4/5 { g32( h e' h g) } s4 r8 \times 4/5 { g32( h e' h g) } s4 | }
	<h g'>8 \times 4/5 { g32( h g' h g) } s4 <c' fis'>8 \times 4/5 { a32( c' fis' c' a) } s4 | e'8 \times 4/5 { g32( h e' h g) } s4 r8 \times 4/5 { a32( h fis' h a) } s4 |
	r8 \times 4/5 { b32( c' e' c' b) } s4 \barre "VII" { r8 \times 4/5 { dis'32( fis' h' fis' dis') } s4 | r8 \times 4/5 { dis'32( fis' h' fis' dis') } s2 s8 } \tempo 4 = 100 e''8 |
	e''16( dis'') dis''( fis'') fis''( e'') e''( c'') c''( h') h'( a') a'( g') g' e' | r8 \times 4/5 { e'32( g' h' g' e') } r8 e''16( f'') g''( f'') e''( dis'') c''( dis'') h'( c'') | a'( h') g'( a') fis'( g') e'8 
	r8 \times 4/5 { e'32( g' h' g' e') } s4 |

}

basses = {
  \global
   \voiceTwo
   \stemDown
   \slurUp

	<h, e>4 e, <ais, e> e, | <h, e> e, <c e> e, | e e, dis e, | <e h,> e, <dis h,> fis, | <e c> g, <h fis> h, | <h fis> h,2._\fermata | s1 | h4 e, s2 | s h4 e, |
}

\paper
{
    #(define fonts (make-pango-font-tree "Georgia" "Arial" "Courier New" 1 ) )
    system-system-spacing #'basic-distance = #15
}

\score {
  \new Staff \with {
    midiInstrument = "acoustic guitar (steel)"
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
