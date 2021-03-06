\version "2.18.0"
\language "deutsch"

\header {
  title = "Preludium c# moll"
  subtitle = "(„Moskevské zvony“)"
  poet = "6tá na cis"
  composer = "Sergej Rachmaninov"
  arranger = ""
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
	\key cis \minor
	\time 4/4
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn

	\tempo "Lento"
}

melody = {  
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\set tupletSpannerDuration = #(ly:make-moment 1 4)
	\override TupletBracket.bracket-visibility = ##f

	\partial 2 s2 | s1 | r8 <cis' gis e>8 <e' h gis dis> <dis' ais g cis> a8~ <d' a fis> gis8 
}

basses = {
	\global
	\voiceTwo
	\stemDown
	\slurUp
   	
	\partial 2 <a a,>4 <gis gis,> | <cis cis,>1~ | cis,2 a,4 gis,4 

}

\paper
{
	#(define fonts
		(set-global-fonts
			#:music "ross"
			#:brace "ross"
			#:roman "EB Garamond"
			#:sans "sans-serif"
			#:typewriter "monospace"
			#:factor (/ staff-height pt 20)
		)
	)

	system-system-spacing #'basic-distance = #20
	indent = #15
	left-margin = #5
	right-margin = #5
	top-margin = #3
	bottom-margin = #6
}

\score {
  \new Staff \with {
    midiInstrument = "acoustic guitar (nylon)"
    instrumentName = "Kytara"
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
