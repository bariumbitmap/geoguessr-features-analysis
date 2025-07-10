# GeoGuessr features analysis

In [GeoGuessr](https://www.geoguessr.com/),
it can be difficult to know which clues are most prevalent.
This is a hand-tagged date set from 140 no-moving rounds
of [A Community World](https://www.geoguessr.com/maps/62a44b22040f04bd36e8a914),

## Rationale and methodology

GeoGuessr players determine location of random Google Streetview locations
through a combination of clues,
both in-world clues like utility poles and national flags
and meta clues like Google car and camera generation.
However, there is very little information on the prevalence of these clues,
such as how often a round will contain a flag or utility pole.
This prevalence may be useful for players
who wish to know what features to focus on learning about
(although see caveats below).

GeoGuessr has three modes in competitive solo duels:
Moving; No Move; and No Moving, Panning, or Zooming (NMPZ).
This dataset only examines No Move rounds.
This is because Moving rounds vary greatly in available information since players can move freely,
whereas No Move rounds are fixed to a single panorama but allow panning and zooming.
NMPZ rounds could be examined but are more difficult to analyze
because [the available information varies by monitor aspect ratio](https://old.reddit.com/r/geoguessr/comments/1aorc3h/nmpz_isnt_fair_the_viewport_gives_a_clear/).
The dataset uses rounds from the map A Community World (ACW),
because it is a hand-picked map
that is [well-regarded in the community](https://old.reddit.com/r/geoguessr/comments/vbouxn/a_community_world_appreciation/)
and because it is the [map used for No Move rounds](https://www.geoguessr.com/multiplayer/how-it-works)
in the Gold and Master divisions for ranked solo duels.

## Findings summary

Percent prevalence from 140 rounds of A Community World:

| # | Feature | Prevalence |
| --- | --- | --- |
| 0 | Discernible Google car/blur? | 100% |
| 1 | Discernible camera generation? | 100% |
| 2 | Road direction? | 100% |
| 3 | Trees/ grass/ vegetation? | 100% |
| 4 | Copyright watermark? | 100% |
| 5 | Dirt/ soil? | 96% |
| 6 | Discernible solar azimuth? | 95% |
| 7 | Discernible driving side? | 84% |
| 8 | Utility poles? | 81% |
| 9 | Wall(s)? | 81% |
| 10 | Buildings/ roofs? | 80% |
| 11 | Fence(s)? | 78% |
| 12 | Other motor vehicle(s)? | 76% |
| 13 | Discernible shadow direction? | 75% |
| 14 | Sign fronts? | 71% |
| 15 | Hills/ mountains? | 71% |
| 16 | License plate(s)? | 66% |
| 17 | Writing? | 62% |
| 18 | Visible road markings? | 61% |
| 19 | Sign backs? | 54% |
| 20 | Bollards / delineator posts? | 40% |
| 21 | Person(s)? | 40% |
| 22 | Curb(s)? | 36% |
| 23 | Water? | 30% |
| 24 | Animal(s)? | 23% |
| 25 | Guardrail(s)? | 20% |
| 26 | Flag(s)? | 13% |
| 27 | Area code(s)? | 9% |
| 28 | Rift(s)? | 8% |
| 29 | Chevron sign(s)? | 8% |
| 31 | Stop sign front? | 4% |
| 32 | Snow? | 4% |
| 33 | Fire hydrant? | 3% |
| 34 | Readable domain name(s)? | 2% |



## Limitations and caveats

1. **Prevalence is not the same as utility.** For example, vegetation of some kind may be present in nearly every round, but this may not translate into useful information; a lawn in the western United States may look very similar to a lawn in the eastern United States. Similarly, a utility pole may be present but too far away or too obscured by trees to distinguish any identifying features.

2. **Sample size is small.** 140 rounds is a starting point, but is not enough to get a round in each [country or territory present in the street view locations](https://docs.google.com/spreadsheets/d/e/2PACX-1vRvb0sYBusg6FmOIjg8Hxy_6oMTsr5Z1A1dMDSnrZBv8pcPQiFoyg7oegnm6VZRoR76PzFldvKAvqQ2/pubhtml) for [A Community World](https://sites.google.com/view/acwgg/home), much less represent a significant percentage of the 106,915 locations. Confidence intervals and other statistical measures could be useful for better understanding this limitation (see future work).

3. **Observational errors are likely present in manual tagging.** While I have tried to accurately tag each round, this requires careful inspection of the details of each panorama. It is easy to miss features such as fences that are far away, and some are necessarily a judgment call such as the presence or absence of hills.

## Future work

1. **Confidence intervals and other statistical measures.** As these percentage feature prevalences are based on a simple random sample with replacement, they should be amenable to statistical techniques such as [confidence intervals](https://en.wikipedia.org/wiki/Confidence_interval) or [credible intervals](https://en.wikipedia.org/wiki/Credible_interval).

2. **More features.** While this data set includes many of the most commonly used clues to identify a location, there are many other potential additions, such as rooftop water tanks, wheelie bins for trash or recycling, and currency abbreviations.

3. **Larger sample size.** Statistical measures will help ascertain the additional utility of larger samples. Larger samples will also allow exploration of country-specific clues.

4. **Other maps.** For example, [A Varied World](https://www.geoguessr.com/maps/64ce812adc7614680516ff8c) is used for Masters division No Move solo duels, and is a handpicked map with a [different distibution of countries](https://docs.google.com/spreadsheets/d/1SuH2UW_eGiZ8xDeBNuQijCSzRKs1PWomylL2tQk_a0I/edit?pli=1&gid=477571445#gid=477571445) and so potentially different distribution of features.
