\include "custom.ly"

\header {
	title = ""
	subtitle = ""
	composer = ""
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\time 2/4
	\key a \minor
	\globalstyle
}

kl-rh = {
	\global

	\times 4/6 { r16\ff \shape #'((0 . -3) (1 . 2) (-2 . 4) (0 . -3)) Slur h,( dis a h dis' } \times 4/7 { \clef "treble" a' h' dis'' a'' h'' dis''' a''' } |
	h''8) r <a' h' dis'' a''>\fz e'-. |
%	<e'' a'' e'''> \ottava #1 \osm \shape #'((0 . 0) (3 . 2) (4.5 . 4) (-1 . -12)) Slur e''''~( \times 4/7 { 16 dis''''16 e'''' d'''' c'''' h''' a''' } |
	\set subdivideBeams = ##t \set baseMoment = #(ly:make-moment 1/8)
	%\times 4/7 { gis'''32 f''' e''' d''' c''' h'' \ottava #0 a'' } \times 4/7 { gis'' f'' e'' d'' c'' h' a' } \once\override TupletBracket.positions = #'(-11 . -12) \times 4/7 { gis' f' e' d' c' \slh h a } \times 4/6 { gis f e d c h, } |
	%\voiceOne a,8)\fp
}

kl-lh = {
	\global

	\slurDown \stemUp
	\times 4/6 { f,,16( h,, f, h, dis a } \times 4/7 { h \clef "treble" dis' a' h' dis'' a'' h'' } |
	\stemNeutral
	dis'''8) r \clef "bass"<f h dis'>8 <e, e>-. \clef "treble" |
%	<c' e' a' c''> r r4 |
	%\clef "bass" <e h d' gis'>8\strum r8 r4 |
	%\voiceTwo a,,8
}

\paper
{
	page-breaking = #ly:one-line-breaking
}

\score {
	\new PianoStaff \with {
		\consists #Span_stem_engraver
	} {
		\set PianoStaff.connectArpeggios = ##t
		<<
			\new Staff = "RH" { <<
				\new Voice { \clef "bass" \kl-rh }
			>> }
			\new Staff = "LH" {
				\new Voice { \clef "bass" \kl-lh }
			}
		>>
	}

	\layout
	{
		\context
		{
			\Staff \RemoveEmptyStaves
			\override VerticalAxisGroup.remove-first = ##t

%			\displayControlPoints
		}
	}
}
