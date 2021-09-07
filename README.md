# honestbayes

This idea didn't go anywhere.

I liked the ideas in "Nonparametric learning from Bayesian models with randomized objective functions", Lyddon, Walker and Holmes.
https://arxiv.org/abs/1806.11544

They take the idea that a weighted bootstrap gives an approximate Bayesian posterior with uninformative priors.
They then add a way to add prior information.
If you take samples from a "prior model" and include them into the bootstrap, you are including that prior model.

I had an idea of being able to do this nicely with stan models.
I was grepping and things to remove the priors from the stan model so that the stan model
could be optimised in the bootstrap section.

Anyway, it didn't go anywhere but I don't want to delete it.

