import pandas as pd
import numpy as np
import text_normalizer as tn
import model_evaluation_utils as meu
from afinn import Afinn

afn = Afinn(emoticons=True)

np.set_printoptions(precision=2, linewidth=80)

dataset = pd.read_csv(r'movie_reviews.csv')

reviews = np.array(dataset['review'])
sentiments = np.array(dataset['sentiment'])

test_reviews = reviews[35000:]
test_sentiments = sentiments[35000:]
sample_review_ids = [7626, 3533, 13010]

norm_test_reviews = tn.normalize_corpus(test_reviews)

for review, sentiment in zip(test_reviews[sample_review_ids], test_sentiments[sample_review_ids]):
    print('REVIEW:',review)
    print('Actual Sentiment:', sentiment)
    print('Predicted Sentiment plarity:', afn.score(review))
    print('-'*60)

sentiment_polarity = [afn.score(review) for review in test_reviews]
predicted_sentiments = ['positive' if score>= 1.0 else 'negative' for score in sentiment_polarity]
meu.display_model_performance_metrics(true_labels=test_sentiments, predicted_labels=predicted_sentiments, classes=['positive','negative'])
