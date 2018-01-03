\version "2.18.2"

#(set-global-staff-size 19)

\header {
    title = \markup\fontsize #3 \sans\bold "Выйду ночью в поле с конём"
    tagline = ##f
}

global = {
    \key bes \major
    \time 4/4
}

notyZenySpolecne = \relative c' {
    r1 |
    r |
    g8 f g a bes4 bes8 c |
    d2. g,8 g |
    \repeat volta 2 {
        ees'4 d c4. d8~ |
        d c bes a bes4 g8 a |
        bes bes bes c d4 a8 bes |
    }
    \alternative {
        { g2. g8 g | }
        { g1 | }
    }
    r1 |
    r1 |
}

notySopran = \relative c'' {
    r1 |
    r2 r4 g8 g8 |
    \repeat volta 2 {
        g2. r8 f8~ |
        f2 g2 |
        ees2 d4 a' |
    }
    \alternative {
        { g2. g8 g | }
        { g1 | }
    }
    g8 a bes a g4 f8 ees |
    d1 |
    g8 f g a bes4 bes8 c |
    d2. g,8 g |
    \repeat volta 2 {
        ees'4 d c4. d8~ |
        d8 c bes a bes4 g8 a |
        bes bes bes c d d a bes |
    }
    \alternative {
        { g2. g8 g | }
        { g1 | }
    }
    g8 a bes a g4 f8 ees |
    d1 |
    g8 f g a bes4 bes8 c |
    d2. g,8 g |
    ees'4 d c4. d8~ |
    d8 c bes a bes4 \oneVoice r4 |
    g2 fis |
    g1\fermata \bar "|."
}

notyAlt = \relative c' {
    g8 f g a bes4 bes8 c |
    d2. g,8 g |
    \repeat volta 2 {
        ees'4 d c4. d8~ |
        d c bes a bes4 g8 a |
        bes bes bes c d4 a8 bes |
    }
    \alternative {
        { g4. a8 b4 g8 g | }
        { g1 | }
    }
    g'8 a bes a g4 f8 ees |
    s1 |
    g8 f g a g4 g8 f |
    f2. g8 g |
    \repeat volta 2 {
        c4 bes a4. bes8~ |
        bes a g f g4 g8 a |
        g g g a fis fis fis fis |
    }
    \alternative {
        { g2. g8 g | }
        { s1 | }
    }
    g8 a bes a g4 f8 ees |
    s1 |
    g8 f g a g4 g8 a |
    bes2. g8 g |
    c4 bes a4. bes8~ |
    bes a g f g4 s4 |
    s1 |
    s1 |
}

notyMuzi = \relative c' {
    g8 a bes a g4 f8 ees |
    d1 |
    g8 f g a g4 g8 a |
    bes2. g8 g |
    \repeat volta 2 {
        c4 bes a4. bes8~ |
        bes a g f g4 g8 a |
        g g g a fis4 fis8 fis |
    }
    \alternative {
        { g2. g8 g | }
        { g1 | }
    }
    g8 a bes a g4 f8 ees |
    d1 |
    g8 f g a g4 g8 a |
    bes2. g8 g |
    \repeat volta 2 {
        c4 bes a4. bes8~ |
        bes a g f g4 g8 a |
        g g g a fis4 fis8 fis |
    }
    \alternative {
        { g2. g8 g | }
        { g1 | }
    }
    g8 a bes a g4 f8 ees |
    d1 |
    g8 f g a g4 g8 a |
    bes2. g8 g |
    \repeat volta 2 {
        c,4 c f2 |
        bes,8 bes bes bes ees4 ees8 d |
        c c c c d d d d |
    }
    \alternative {
        { g2. g8 g | }
        { g1 | }
    }
    r1 |
    r1 |
    r1 |
}

notyMuziKonec = \relative c' {
    r2. g4 |
    c,2 f2 |
    bes,2 ees4 g,8 a |
    bes bes bes c d d a bes |
    g1\fermata |
}

slovaSpolecna = \lyricmode {
	\override LyricText.font-size = #2
	Вый -- ду ноч -- ью в_по -- ле с_ко -- |
	нём. |
	Ночь -- кой тём -- ной ти -- хо пой -- |
	дём. Мы пой -- |
	\repeat volta 2 {
		дём с_ко -- нён по __ |
		по -- лю вдво -- ём. Мы пой -- |
		дём с_ко -- нён по по -- лю вдво -- |
	}
	\alternative {
		{ ём. Мы пой -- | }
		{ ём. | }
	}

	Ноч -- ью в_по -- ле звёзд бла -- го -- |
	дать. |
	Ноч -- ью ни -- ко -- го не ви -- |
	дать. Толь -- ко |
	\repeat volta 2
	{
		мы с_ко -- нём по __ |
		по -- лю и -- дём. Толь -- ко |
		мы с_ко -- нём по по -- лю и -- |
	}
	\alternative
	{
		{ дём. Толь -- ко | }
		{ дём. | }
	}

	Ся -- ду я вер -- хом на ко -- |
	ня. |
	Ты не -- си по по -- лю ме -- |
	ня. По бес -- |
	\repeat volta 2
	{
		крa -- йне -- му __ |
		по -- лю мо -- е -- му. По бес -- |
		крa -- йне -- му по по -- лю мо -- е -- |
	}
	\alternative
	{
		{ му. По бес -- | }
		{
			\set associatedVoice = "sopran"
			му. |
		}
	}

	Дай -- ка я ра -- зок пос -- мот -- |
	рю, |
	где рож -- да -- ет по -- ле за -- |
	рю. Ай брус -- |
	нич -- ный цвет; а __ |
	лый да рас -- свет |
}

slovaSopran = \lyricmode {
	\override LyricText.font-size = #2
	Толь -- ко |
	\repeat volta 2
	{
		мы по __ -- |
		лю |
		по -- лю и -- |
	}
	\alternative
	{
		{ дём. Толь -- ко | }
		{ дём. | }
	}
}

slovaKonecMuzi = \lyricmode {
	\override LyricText.font-size = #2
	А -- |
	а -- а -- |
	а -- а а -- ли |
	есть то мес -- то, а -- ли е -- го |
	нет. |
}

\paper
{
		#(define fonts
			(set-global-fonts
				#:music "ross"
				#:brace "ross"
				#:roman "EB Garamond 08"
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
}

\score {
    \new ChoirStaff <<
        \new Staff = "zenske" {
            \global \notyZenySpolecne
            <<
                \new Voice = "sopran" {
                    \voiceOne \notySopran
                }
                \new Lyrics \with { alignAboveContext = #"zenske" \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.basic-distance = #2 } {
                    \lyricsto "sopran" {
                        \slovaSopran
                    }
                }
                \new Voice = "alt" {
                    \voiceTwo \notyAlt
                }
            >>
        }
        \new Lyrics = "slovaSpolecna"
        \new Staff = "muzske" {
            \new Voice = "muzi" {
                \clef bass
                \global \notyMuzi
            }
            \new Voice = "muziKonec" {
                \notyMuziKonec
            }
        }
        \new Lyrics = "slovaKonecMuzi"
        \context Lyrics = "slovaSpolecna" {
            \lyricsto "muzi" {
                \slovaSpolecna
            }
        }
        \context Lyrics = "slovaKonecMuzi" {
            \lyricsto "muziKonec" {
                \slovaKonecMuzi
            }
        }
    >>
}
