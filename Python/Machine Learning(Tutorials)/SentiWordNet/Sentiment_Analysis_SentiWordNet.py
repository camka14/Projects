import pandas as pd
import numpy as np
import spacy
import text_normalizer as tn
from nltk.corpus import sentiwordnet as swn
import model_evaluation_utils as meu
from afinn import Afinn

"""Start at Page 352"""

afn = Afinn(emoticons=True)

np.set_printoptions(precision=2, linewidth=80)

dataset = pd.read_csv(r'movie_reviews.csv')

def analyze_setiment_sentiwordnet_lexicon(review, verbose=False):

    tagged_text = [(token.text, token.tag_) for token in tn.nlp(review)]
    pos_score = neg_score = token_count = obj_score = 0

    for word, tag in tagged_text:
        ss_set = None
        if 'NN' in tag and list(swn.senti_synsets(word, 'n')):
            ss_set = list(swn.senti_synsets(word, 'n'))[0]
        elif 'VB' in tag and list(swn.senti_synsets(word, 'v')):
            ss_set = list(swn.senti_synsets(word, 'v'))[0]
        elif 'JJ' in tag and list(swn.senti_synsets(word, 'a')):
            ss_set = list(swn.senti_synsets(word, 'a'))[0]
        elif 'RB' in tag and list(swn.senti_synsets(word, 'r')):
            ss_set = list(swn.senti_synsets(word, 'r'))[0]
        if ss_set:
            pos_score += ss_set.pos_score()
            neg_score += ss_set.neg_score()
            obj_score += ss_set.obj_score()
            token_count += 1

    final_score = pos_score - neg_score
    norm_final_score = round(float(final_score)/token_count,2)
    final_sentiment = 'positive' if norm_final_score >= 0 else 'negative'
    if verbose:
        norm_obj_score = round(float(obj_score)/token_count, 2)
        norm_pos_score = round(float(pos_score)/token_count, 2)
        norm_neg_score = round(float(neg_score)/token_count, 2)
        sentiment_frame = pd.DataFrame([[final_sentiment, norm_obj_score, norm_pos_score, norm_neg_score, norm_final_score]], columns=pd.MultiIndex(levels=[['SENTIMENT STATS:'],['Predicted Sentiment', 'Objectivity', 'Positive', 'Negative', 'Overall']], labels=[[0,0,0,0,0],[0,1,2,3,4]]))
        print(sentiment_frame)
    return final_sentiment

dataset = pd.read_csv(r'movie_reviews.csv')

reviews = np.array(dataset['review'])
sentiments = np.array(dataset['sentiment'])

test_reviews = reviews[35000:]
test_sentiments = sentiments[35000:]
sample_review_ids = [7626, 3533, 13010]

for review, sentiment in zip(test_reviews[sample_review_ids], test_sentiments[sample_review_ids]):
    print('REVIEW:',review)
    print('Actual Sentiment:', sentiment)
    pred = analyze_setiment_sentiwordnet_lexicon(review, verbose=True)
    print('-'*60)