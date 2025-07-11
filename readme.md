# GeoGuessr features analysis

## Abstract

In the game of [GeoGuessr](https://www.geoguessr.com/),
many visual features can be used to identify a location,
but it can be difficult to know which features are most prevalent.
I present a hand-tagged data set of 140 no-moving rounds
from [A Community World](https://www.geoguessr.com/maps/62a44b22040f04bd36e8a914);
this data set shows which features are most prevalent for this sample of map locations.
I also show that solar azimuth
is a relatively reliable method for distinguishing northern and southern hemispheres
(useful and correct in 81% of sampled rounds)
and that some features are of limited utility due to low prevalence,
such as fire hydrants (3%) and domain names (2%).

## Rationale and methodology

[GeoGuessr](https://en.wikipedia.org/wiki/GeoGuessr)
players determine the location of [Google Street View](https://en.wikipedia.org/wiki/Google_Street_View)
locations by visually identifying features in the panoramic photograph,
both in-world features (e.g. utility poles and national flags)
and meta features (e.g. Google car and camera generation).
However, there is little quantitative information on the prevalence of these features,
such as how often a round will contain a flag or utility pole.
This prevalence may be useful for players
who wish to know what features to focus on learning about
(although see [caveats](#limitations-and-caveats) below).

GeoGuessr uses ranked solo duels to determine ELO rating and overall progression along the division ladder.
GeoGuessr has three game modes in [ranked solo duels](https://www.geoguessr.com/multiplayer/how-it-works):
Moving; No Move; and No Moving, Panning, or Zooming (NMPZ).
This dataset only examines No Move rounds.
This is because Moving rounds vary greatly in available information since players can move freely to different photo panoramas,
whereas No Move rounds are fixed to a single panorama but allow panning and zooming.
NMPZ rounds could be examined but are more difficult to analyze
because [the available information varies by monitor aspect ratio](https://old.reddit.com/r/geoguessr/comments/1aorc3h/nmpz_isnt_fair_the_viewport_gives_a_clear/).
The dataset uses rounds from the map [A Community World](https://www.geoguessr.com/maps/62a44b22040f04bd36e8a914) (ACW),
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

A lot of these are in line with existing knowledge and well-established strategies:
the Google car meta is powerful because it is present in every single round
and is often distinctive to each country or region.
Utility poles and buildings are also commonly present and distinctive to countries
and regions, so they are widely known to be useful.
Fire hydrants are rare, hence seldom mentioned in guides like [plonkit.net](https://www.plonkit.net/),
except when unusually distinctive [such as in Croatia](https://www.plonkit.net/croatia).

There are a few that surprised me personally:
domain names are rare, only 3 of 140 rounds, or about 2%.
Additionally, only national domains were present (.de, .id, .pl,
no .com or .net domains),
and only two of the three domain names matched the country
(.id was in Indonesia and .pl was in Poland, but .de was in a location in Russia).
Flags (13%), area codes (9%), and fronts of stop signs (4%) are also less common than I expected.
Fences are surprisingly common (78%),
and while they are used by master-level players to distinguish countries,
the [plonkit.net](https://www.plonkit.net/) guides (aimed at beginner and intermediate level players)
generally only use fences to distinguish regions within countries.
This suggests that fences may deserve more careful study by players of intermediate skill,
even if they are not as distinctive to each country as e.g. bollards/delineator posts are.
Finally, the solar azimuth (i.e. whether the sun is to the north or the south in the sky) is easier to discern than I expected, even in cloudy or overcast conditions (azimuth is discernible in 95% of rounds when shadow direction is only discernible in 75% of rounds).
This also provides an opportunity to validate the utility of this feature,
as there are only two possibilities (north or south)
that directly result in a southern or northern hemisphere,
which is easy to validate.
The results are:

| Outcome       | Percentage |
| ------------- | ---------- |
| indeterminate | 5%         |
| mismatch      | 14%        |
| match         | 81%        |

This means that the sun's compass position is not only a prevalent source of information,
it is also a relatively reliable source of information,
correctly identifying hemisphere in more than 4 out of 5 rounds.

## Limitations and caveats

While this data set does establish a baseline prevalence
for a number of commonly used features,
there are limitations both for this approach generally
and for this data set in particular.

1. **Prevalence is not the same as utility.** For example, vegetation of some kind may be present in nearly every round, but this may not translate into useful information; a lawn in the northwestern United States may look very similar to a lawn in the northeastern United States. Similarly, license plates are a prevalent feature, but are automatically blurred in Google Street View coverage for privacy reasons, making them significantly harder to use for regional or national identification. Even when present and visible behind the blur, license plates may but too far away or too generic to discern any identifying features. This kind of classification of the utility of a feature is a much more complicated assessment than simple presence or absence (and is frankly beyond my skill level), so I have not attempted this here, except when validation is straightforward as for solar azimuth and northern/southern hemisphere.

2. **Sample size is small.** 140 rounds is a starting point, but is not nearly enough to get a round in each [country or territory present in the street view locations](https://docs.google.com/spreadsheets/d/e/2PACX-1vRvb0sYBusg6FmOIjg8Hxy_6oMTsr5Z1A1dMDSnrZBv8pcPQiFoyg7oegnm6VZRoR76PzFldvKAvqQ2/pubhtml) for [A Community World](https://sites.google.com/view/acwgg/home), much less represent a significant percentage of the 106,915 total locations for the map. Confidence intervals and other statistical measures could be useful for better understanding this limitation (see [future work](#future-work)).

3. **Observational errors are likely present in manual tagging.** While I have done my best to accurately tag each round, this requires careful inspection of the details of each panorama. It is easy to miss features such as fences that are far away, and some are necessarily a judgment call such as the presence or absence of hills.

## Future work

1. **Confidence intervals and other statistical measures.** As these feature prevalences are based on a simple random sample with replacement, they should be amenable to statistical techniques such as [confidence intervals](https://en.wikipedia.org/wiki/Confidence_interval) or [credible intervals](https://en.wikipedia.org/wiki/Credible_interval).

2. **More features.** While this data set includes many of the most commonly used clues to identify a location, there are many other potential features to consider, such as rooftop water tanks, wheelie bins for trash or recycling, and currency symbols/abbreviations.

3. **Larger sample size.** Statistical measures will help ascertain the additional utility of larger samples, in terms of e.g. narrowing confidence intervals. Larger samples will also allow exploration of correlations between features and countries.

4. **Other maps.** For example, [A Varied World](https://www.geoguessr.com/maps/64ce812adc7614680516ff8c) is used for Masters division No Move solo duels, and is a handpicked map with a [different distibution of countries](https://docs.google.com/spreadsheets/d/1SuH2UW_eGiZ8xDeBNuQijCSzRKs1PWomylL2tQk_a0I/edit?pli=1&gid=477571445#gid=477571445) and so potentially different distribution of features.
