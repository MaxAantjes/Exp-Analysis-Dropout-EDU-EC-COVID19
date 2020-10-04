README
================
Max Aantjes
04/10/2020

  - [Introduction](#introduction)
  - [Objectives](#objectives)
  - [Data Source](#data-source)
  - [Results](#results)
      - [Explorative Data Analysis](#explorative-data-analysis)
      - [OLS Regression Analysis](#ols-regression-analysis)
  - [Policy Implications](#policy-implications)
  - [References](#references)

## Introduction

As a result of COVID-19, a high number of students in the Latin American
school system are transitioning from private education to public
education. This repository provides a brief analysis of the potential
effect of this transition in Ecuador and explores potential policy
recommendations. In particular, it investigates the relationship between
Student Teacher Ratios (ST ratio) in public schools and the proportion
of students enrolled in different types of education institutions
(public, private and mixed). Here, an increase of the ST ratio is
assumed to have a negative effect on the quality of education.

  - **Brief Paper**: A short paper which provides (i) the context of the
    analysis; (ii) the detailed presentation of the results and
    conclusion of the analysis; and (iii) the sources used. This file is
    available [here](-).
  - **Appendix**: A code and text file which (i) contains all code to
    generate the results; (ii) gives justifications for the performed
    computations where relevant; (iii) lists the variables used and
    their interpretations in code book tables. This file is available
    [here](-).

The subsequent sections provide a short summary of the data set used and
the results. For more detailed information, the reader is referred to
the files above, as well as the references made within those files.

## Objectives

The analysis consists of two complementary parts:

  - **Explorative Analysis**: This part aims to answer the following
    questions: How have ST ratios varied historically? How have they
    reacted to fluctuations in student enrollment in different types of
    education? How is enrollment in different types of education
    distributed across Ecuador?

  - **OLS Regression**: Based on the explorative analysis, the
    relationship between private education enrollment and ST ratio in
    public education is explored. As we are dealing with census data (no
    time-regression), null-hypotheses are not relevant here.

## Data Source

The data used is the AMIE survey conducted by INEC (non-summarised).
This annual survey collects census data on the number of students and
teachers at each Ecuadorian primary and secondary institution. Code
books and methodology documents are available in this [online
repository](https://educacion.gob.ec/amie/). The data collection period
spanned from 2009 to 2019. Data was collected at both the start and end
of the academic year. As we are not concerned with drop outs, only the
start of the academic year data will be considered in this analysis.

## Results

### Explorative Data Analysis

Figure 1 demonstrates that the student teacher ratios steadily increased
from 2010 to 2014 in public schools, after which they dropped again.
Figure 2 indicates that the increase in the ST ratio was paired with an
increase in the number public students, as well as a small decrease in
private school students. Figure 3 indicates that during this time, the
number of public school teachers stagnated. In other words, teacher
supply in the public school sector seems to be highly inelastic to an
increase in the demand for teachers (a rise in the number of students).
This suggests that a transition of students from private schools to
public schools will cause a rise in the ST ratio in public schools
unless the government intervenes more than it has done in prior years.

![Figure 1](Figure_1.png)

![Figure 2 and 3](Figure_2_3.png)

Figure 4 graphs the mean proportion of private education enrollment of
cantons in 10 ordered deciles in 2009. It demonstrates that, with the 4
bottom deciles having no private schools at all, the bottom 6 deciles
having less than 10% of students enrolled in education and the top
decile having on average 28% of students enrolled in private education.
This means that a transition from private to public education will
impact some cantons more than others. This variance leads to two
conclusions:

1)  Regression analysis can be performed to test whether cantons with
    higher proportions of private education enrollment actually have
    higher ST ratios in public schools;  
2)  Government policy regarding the transition from private to public
    education should focus on particular areas.

![Figure 4](Figure_4.png)

### OLS Regression Analysis

In cantons with positive private school enrolment, there is a strong
positive relationship between the log of purely private education
enrolment and the ST ratio in public schools (see Figure 6). The
coefficient equals 1.982377. This means that if an area A’s proportion
of private students is 100% higher than that of area B (e.g. 5% and
10%), then we expect the ST ratio to be 1 unit higher in area A, or in
other words, for there to be 1 more student for every teacher in area B.

The R squared value equals 0.27, meaning 27% of the variation of ST
ratios (of cantons with positive private education enrollment) can be
explained by the OLS model. Furthermore, OLS appears to be an
appropriate message, as the residuals are homoskedastic.

![Figure 6](Figure_6.png)

However, this positive relationship disappears if the same regression is
performed on the sum of the proportion of students in private **and
mixed** education. Mixed institutions (*Instituciones fiscomisionales*)
are private religious schools which receive subsidies for teacher
salaries and often partially or fully wave fees for disadvantaged
students (IADB, 2018, p.9). This raises the question if there is a
potential confounding variable which explains the positive relationship
found above.

One possible confounding variable is the size of the student population.
It seems plausible that ST ratios are higher in crowded cities, with
larger student populations. It is also plausible that mixed institutions
are located in low population areas, since there tend to be lower income
and (perhaps) a stronger influence of the Catholic church. For similar
reasons, private institutions might concentrate in higiher population
areas.

Figure 9, proves this assumption. It plots the ST ratio in public
schools in a canton against the total number of students in the canton.
Cantons with a high level of mixed institutions (blue) are associated
with low numbers of students and a low ST ratio. Cantons with a high
level of private institutions (red) are associated with high numbers of
students and a high ST ratio.

![Figure 9](Figure_9.png)

The conclusion we can draw from the data is thus not the effect of
private education enrollment on ST ratios. Instead, it is the effect of
population size on the type of educational institutions that are
prevalent in the area.

## Policy Implications

There are at least two policy conclusions that can be drawn from the
results:

1.  The number of teachers in public education tend to be unresponsive
    to the demand of teachers. Given the increase of public school
    enrollment in Ecuador, this means government should introduce new
    policies to encourage public teacher hiring.  
2.  Policy makers should be aware of the different types of private
    education in Latin America and their concentration. Purely private
    institutions (instituciones fiscales) tend to concentrate in large
    cities, where ST ratios also tend to be high. Semi-private
    institutions (instituciones fiscomisionales) tend to concentrate in
    lesser populated areas, where ST ratios tend to be low. To avoid a
    rise in ST ratios, government policy should thus focus on reducing
    the transition to public institutions from **purely** private
    institutions.

## References

IADB (2018). *Private schooling in Latin America*. Available from:
\[<https://publications.iadb.org/publications/english/document/Private-Schooling-in-Latin-America-Trends-and-Public-Policies.pdf>\]
