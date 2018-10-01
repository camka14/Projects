import re
from collections import Counter
import unicodedata
from nltk.corpus import words

def word_read(text): return re.findall(r'\w+', text.lower())

WORDS = Counter(word_read(open('Affiliate Research/Big.txt','r', encoding='utf-8').read()))

def P(word, N=sum(WORDS.values())):
    "Probability of `word`."
    return WORDS[word] / N

def correct(word):
    "Most probable spelling correction for word."
    return max(candidates(word), key=P)

def candidates(word):
    "Generate possible spelling corrections for word."
    answer = (known([word]) or known(edits1(word)) or known(edits2(word)) or [word])
    return answer

with open('Affiliate Research/english-words.txt') as dic:
    dictionary = set(word for line in dic for word in line.split())

def known(words_list):
    "The subset of `words` that appear in the dictionary of WORDS."
    return set(w for w in words_list if w in dictionary)

def edits1(word):
    "All edits that are one edit away from `word`."
    letters    = 'abcdefghijklmnopqrstuvwxyz'
    splits     = [(word[:i], word[i:])    for i in range(len(word) + 1)]
    deletes    = [L + R[1:]               for L, R in splits if R]
    transposes = [L + R[1] + R[0] + R[2:] for L, R in splits if len(R)>1]
    replaces   = [L + c + R[1:]           for L, R in splits if R for c in letters]
    inserts    = [L + c + R               for L, R in splits for c in letters]
    return set(deletes + transposes + replaces + inserts)

def edits2(word):
    "All edits that are two edits away from `word`."
    return set(e2 for e1 in edits1(word) for e2 in edits1(e1))

def correct_match(match):
    word = match.group()
    def case_of(text):
        return (str.upper if text.isupper() else str.lower if text.islower() else str.title if text.istitle() else str)
    return case_of(word)(correct(word.lower()))
def correct_text_generic(text):
    return re.sub('[a-zA-Z]+',correct_match,text)
