import pytextrank
import unicodedata
import Text_Normalizer
import re
from nltk import word_tokenize
from gensim.summarization import summarize, keywords

Text_Normalizer.normalize('Affiliate Research/web scrape.txt', 'Affiliate Research/keyphrases.txt',  remove_characters = True, expand_contractions = True,
              remove_repeated_characters = False, spell_check = False, lemmatize_text = False,
              remove_stopwords = True, sent_tok = True, word_tok = True)
with open('keyphrases.txt', 'r', encoding='utf-8') as f:
    text = f.read()
    text = unicodedata.normalize('NFKD', text).encode('ascii', 'ignore').decode('utf-8', 'ignore')
    text = ' '.join(word_tokenize(text))
    summarized = summarize(text, ratio=0.05)
    keywords = keywords(text, lemmatize=True)
with open('summary.txt', 'w') as f:
    f.write(summarized)
with open('keywords.txt', 'w') as f:
    f.write(keywords)
