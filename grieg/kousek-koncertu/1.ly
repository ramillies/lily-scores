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

	\times 8/13 { r16\ff \shape #'((0 . -3) (1 . 2) (-2 . 4) (0 . -3)) Slur h,( dis a h dis' \clef "treble" a' h' dis'' a'' h'' dis''' a''' } |
	h''8) r <a' h' dis'' a''>\fz e'-. |
%	<e'' a'' e'''> \ottava #1 \osm e''''~( \times 4/7 { 16 dis''''16 e'''' d'''' c'''' h''' a''' } |
	%\times 16/27 { gis''' f''' e''' d''' c''' h'' \ottava #0 a'' gis'' f'' e'' d'' c'' h' a' gis' f' e' d' c' \slh h a gis f e d c h, } |
	%\voiceOne a,8)\fp
}

kl-lh = {
	\global

	\slurDown
	\times 8/13 { f,,16( h,, f, h, dis a h \clef "treble" dis' a' h' dis'' a'' h'' } |
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
