\version "2.19.48"
\language "deutsch"

\include "/home/glorfindel/Music/lilypond/openlilylib/debugging-layout/display-control-points/display-curve-control-points.ly"

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

#(define-markup-command (main-tempo layout props text) (markup?)
  "Print a nicey tempo indication."
  (interpret-markup layout props
    #{\markup { \typewriter \fontsize #7 #text }#}))

#(define-markup-command (sup-a layout props text) (markup?)
  "Add a small superscript 'a'."
  (interpret-markup layout props
    #{\markup { \concat{{#text} \small\raise #1 \underline "a"} } #}))

% Octavization functions
#(define (octave-up m t)
 (let* ((octave (1- t))
      (new-note (ly:music-deep-copy m))
      (new-pitch (ly:make-pitch
	(+ t (ly:pitch-octave (ly:music-property m 'pitch)))
        (ly:pitch-notename (ly:music-property m 'pitch))
        (ly:pitch-alteration (ly:music-property m 'pitch)))))
  (set! (ly:music-property new-note 'pitch) new-pitch)
  new-note))

#(define (octavize-chord elements t)
 (cond ((null? elements) elements)
     ((eq? (ly:music-property (car elements) 'name) 'NoteEvent)
       (cons (car elements)
             (cons (octave-up (car elements) t)
                   (octavize-chord (cdr elements) t))))
     (else (cons (car elements) (octavize-chord (cdr elements ) t)))))

#(define (octavize music t)
 (if (eq? (ly:music-property music 'name) 'EventChord)
       (ly:music-set-property! music 'elements (octavize-chord
(ly:music-property music 'elements) t)))
 music)

makeOctaves = #(define-music-function (parser location arg mus) (integer? ly:music?)
	(music-map (lambda (x) (octavize x arg)) (event-chord-wrap! mus)))

% Shorten note stems / revert them.
tinystems = #(define-music-function (parser location how) (list?) #{ \override Stem.details.beamed-lengths = #how #} )
normstems = \revert Stem.details

force-merge = \once\override NoteColumn.ignore-collision = ##t

% Move all markups between \movetext and \freezetext.
movetext = #(define-music-function (parser location how) (pair?) #{ \override TextScript.extra-offset = #how #} )
freezetext = \movetext #'(0 . 0)

% More manageable alias for \acciaccatura
priraz = #(define-music-function (parser location music) (ly:music?) #{ \acciaccatura #music #} )

% \empty = next note stems won't have visible heads; the same for all between \emptyOn & \emptyOff
empty = { \once \hide NoteHead \once \override NoteHead.no-ledgers = ##t }
emptyOn = { \hide NoteHead \override NoteHead.no-ledgers = ##t }
emptyOff = { \undo \hide NoteHead \revert NoteHead.no-ledgers }

% Symbol for "tambora".
tamb = \markup { T }

% Harmonics (diamond notes): for the next note / for all between \flagOn & \flagOff
flag = \once \override NoteHead.style = #'harmonic-mixed
flagOn = \override NoteHead.style = #'harmonic-mixed
flagOff = \revert NoteHead.style

% Crosses instead of note heads (tambora) for all between \crossOn & \crossOff
crossOn = \override NoteHead.style = #'cross
crossOff = \revert NoteHead.style

% Harmonic fret indications
ffXII = \markup{\tiny XII}
ffVII = \markup{\tiny VII}
ffV = \markup{\tiny V}
ffIV = \markup{\tiny IX}
ffIX = \markup{\tiny IX}

% Short notation for staff changes. \s{l,r}h automagically set stems down on the upper and up on the lower staff.
lh = \change Staff = "LH"
rh = \change Staff = "RH"
slh = { \change Staff = "LH" \stemUp }
srh = { \change Staff = "RH" \stemDown }

% Small notes for romantic piano concertoes.
mininotes = \set fontSize = #-4

coda = \mark\markup\fontsize #4 \musicglyph #"scripts.coda"
segno = \mark\markup\musicglyph #"scripts.segno"
coda-ending = \mark\markup\large{\magnify #2 \musicglyph #"scripts.coda" \lower #.6 \italic "Coda"}

segno-coda = \markup\right-align\fontsize #2 \line{\musicglyph #"scripts.segno" "—" \musicglyph #"scripts.coda"}
dc-coda = \markup\right-align\fontsize #1 \sans\bold\line{ "D. C. al" \raise #.8 \musicglyph #"scripts.coda" }
ds-coda = \markup\right-align\fontsize #1 \sans\bold\line{ "D. S. al" \raise #.8 \musicglyph #"scripts.coda" }
dc = \markup\right-align\bold\sans\fontsize #1 "D. C."
dc-fine = \markup\right-align\bold\sans\fontsize #1 "D. C. al Fine"
ds-fine = \markup\right-align\bold\sans\fontsize #1 "D. S. al Fine"
fine = \markup\right-align\bold\sans\fontsize #1 "Fine"


rit = \tempo\markup\sans\bold "Rit."
rall = \tempo\markup\sans\bold "Rall."
accel = \tempo\markup\sans\bold "Accel."
a-tempo = \tempo\markup\sans\bold "A tempo"
tempo-primo = \tempo\markup{\override #'(word-space . 0) \typewriter \fontsize #6 \line{"T" \raise #1 \underline "o" " I" \raise #1 \underline "o"}}

% 8va and 15ma with nice text
osm = \set Staff.ottavation = \markup{\concat{ { \override #'(font-name . "Monky Business")\large\sans\bold "8" } \small\raise #1 \underline"a"}}
osmvb = \set Staff.ottavation = \markup{\concat{ {\override #'(font-name . "Monky Business") \large\sans\bold "8" } \small\raise #1 \underline"a" \italic " bassa"}}
patnact = \set Staff.ottavation = \markup{\concat{ { \override #'(font-name . "Monky Business")\large\sans\bold "15" } \small\raise #1 \underline"ma"}}

arm-osm = \set Staff.ottavation = \markup{\italic "arm." \concat{ { \override #'(font-name . "Monky Business")\large\sans\bold "8" } \small\raise #1 \underline"a"}}

ignore-osm = \set Voice.middleCPosition = #1
unignore-osm = \unset Voice.middleCPosition

% Right-hand guitar fingerings
fO = \markup { \italic o }
fA = \markup { \italic a }
fM = \markup { \italic m }
fI = \markup { \italic i }
fP = \markup { \italic p }

% Shorthands for various guitar strums.
sup = \arpeggioArrowUp
sdown = \arpeggioArrowDown
strum = \arpeggio
tightstrum = \once\override Arpeggio.padding = #-1

% Shorthands for setting direction of fingerings.
fleft = \set fingeringOrientations = #'(left)
fright = \set fingeringOrientations = #'(right)
fdown = \set fingeringOrientations = #'(down)
fup = \set fingeringOrientations = #'(up)

% The following macros are taken from the sources of Michiel Sikma:

% \trillSpanDown
%
% Ensures trill spanners appear at the bottom of the staff.
trillSpanDown = \override TrillSpanner.direction = #-1

% \trillSpanUp
%
% Ensures trill spanners appear at the top of the staff.
trillSpanUp = \override TrillSpanner.direction = #1

% \sharpTrill
%
% Override trill spanners to have a sharp sign. Undo with \regularTrill.
% Using \once does not work for trill spanners that cross over to
% the next line, hence the need to use a separate \regularTrill command.
sharpTrill = \override TrillSpanner.bound-details.left.text = \markup { 
	\halign #4.75 \raise #0.97 \teeny \sharp \musicglyph #"scripts.trill"
}

% \flatTrill
%
% Override trill spanners to have a flat sign. Undo with \regularTrill.
% Using \once does not work for trill spanners that cross over to
% the next line, hence the need to use a separate \regularTrill command.
flatTrill = \override TrillSpanner.bound-details.left.text = \markup { 
	\halign #5.30 \raise #0.65 \teeny \flat \musicglyph #"scripts.trill"
}

% \regularTrill
%
% Revert the trill spanners back to having a standard trill symbol.
regularTrill = \override TrillSpanner.bound-details.left.text = \markup { 
	\musicglyph #"scripts.trill"
}

% \textCresc <string>
%
% Creates a crescendo with custom text.
textCresc =
#(define-music-function (parser location mymarkup) (markup?)
   (make-music 'CrescendoEvent
               'span-direction START
               'span-type 'text
               'span-text mymarkup))

% \textCrescEnd <string>
%
% Creates another crescendo with custom text, but without dashed line.
textCrescEnd =
#(define-music-function (parser location mymarkup) (markup?)
   (make-music 'CrescendoEvent
               'span-direction START
               'span-type 'text
               'tweaks '((dash-period . -1))
               'span-text mymarkup))

% As above, with a decrescendo.
textDecresc =
#(define-music-function (parser location mymarkup) (markup?)
   (make-music 'DecrescendoEvent
               'span-direction START
               'span-type 'text
               'span-text mymarkup))
textDecrescEnd =
#(define-music-function (parser location mymarkup) (markup?)
   (make-music 'DecrescendoEvent
               'span-direction START
               'span-type 'text
               'tweaks '((dash-period . -1))
               'span-text mymarkup))

% End of the stolen macros.

globalstyle = {
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\override Glissando.minimum-length = #4
	\override Glissando.springs-and-rods = #ly:spanner::set-spacing-rods
	\override TupletBracket.bracket-visibility = ##t
%	\override Staff.TimeSignature.break-visibility = ##(#f #t #t)
	\override Beam.breakable = ##t
	\set Staff.extraNatural = ##f
	\override Fingering.staff-padding = #'()
	\override MultiMeasureRest.staff-position = #2
}

\paper {
		#(define fonts
			(set-global-fonts
				#:music "ross"
				#:brace "ross"
				#:roman "EB Garamond"
				#:sans "Linux Libertine O"
				#:typewriter "Lovers Quarrel"
				#:factor (/ staff-height pt 20)
			)
		)

		system-system-spacing.basic-distance = #20
		indent = #12
		left-margin = #5
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

		ragged-last = ##t
}

\layout {

		\override Hairpin.thickness = #1.5
		\override Slur.thickness = #1.2
		\override Tie.thickness = #1.2
		\override PhrasingSlur.thickness = #1.2
		\override Score.StaffSymbol.thickness = #1.4
		\override PianoPedalBracket.thickness = #1.5
}
