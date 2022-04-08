import pandas as pd
import numpy as np
import re
import unicodedata
import spellcheck
import spacy
import nltk
from contractions import contractions
from nltk.corpus import wordnet
from nltk.stem import WordNetLemmatizer
from nltk.tokenize.toktok import ToktokTokenizer

tokenizer = ToktokTokenizer()
lemmatizer = WordNetLemmatizer()

#Character removal
def remove_char(text, keep_apostrophes=True):
    fix_periods = []
    for sent in text:
        sent = sent.strip()
        if keep_apostrophes:
            PATTERN = r'[|$|&|*|%|@|(|)|~|-|>|<|_|\n]'
            filtered_text = re.sub(PATTERN, '', sent)
            temp = (re.sub('(?<=\s)[.](?=[^\s])', '', filtered_text))
            fix_periods.append(re.sub('(?<=[.,])(?=[^\s])', ' ', temp))
        else:
            PATTERN = r'[^a-zA-Z0-9 ]'
            filtered_text = re.sub(PATTERN, '', sent)
            fix_periods = re.sub('(?<=[.,])(?=[^\s])', ' ', filtered_text)
            fix_periods.append(re.sub('(?<=[.,])(?=[^\s])', ' ', filtered_text))
    return fix_periods

#Contraction expansion
def expand_contra(text, contraction_mapping):
    contractions_pattern = re.compile('({})'.format('|'.join(contraction_mapping.keys())), flags=re.IGNORECASE|re.DOTALL)
    def expand_match(contraction):
        match = contraction.group(0)
        first_char = match[0]
        expanded_contraction = contraction_mapping.get(match) if contraction_mapping.get(match) else contraction_mapping.get(match.lower())
        expanded_contraction = first_char+expanded_contraction[1:]
        return expanded_contraction
    expanded_text = []
    for sent in text:
        expanded_text.append(contractions_pattern.sub(expand_match, sent))
    return expanded_text

def remove_repeated_char(text):
    with open('english-words.txt') as dic:
        dictionary = set(word for line in dic for word in line.split())
    final_text = []
    for sent in text:
        tokens = nltk.word_tokenize(sent)
        repeat_pattern = re.compile(r'(\w*)(\w)\2(\w*)')
        match_substitution = r'\1\2\3'
        def replace(old_word):
            if old_word in dictionary:
                return old_word
            new_word = repeat_pattern.sub(match_substitution, old_word)
            new_word = re.sub('.','',new_word)
            return replace(new_word) if new_word != old_word else new_word
        correct_tokens = [replace(word) for word in tokens]
        correct_text = ' '.join(correct_tokens)
        final_text.append(correct_text)
    return final_text

#lemmatizis text
def lemma(text):
    word_tokens = [sent for sent in text]
    tagged = nltk.pos_tag(word_tokens)
    def get_wordnet_pos(treebank_tag):
        if treebank_tag.startswith('J'):
            return wordnet.ADJ
        elif treebank_tag.startswith('V'):
            return wordnet.VERB
        elif treebank_tag.startswith('N'):
            return wordnet.NOUN
        elif treebank_tag.startswith('R'):
            return wordnet.ADV
        else:
            return wordnet.NOUN

    pos = [get_wordnet_pos(word[1]) for word in tagged]
    word = [word[0] for word in tagged]
    text_list = []
    for i in range(len(word)):
        text_list.append(lemmatizer.lemmatize(word[i],pos[i]))
    text_final = ' '.join(text_list)

    return text_final

#removes unnecessary words
def remove_stop(text, is_lower_case=False):
    final_text = []
    for sent in text:
        tokens = nltk.word_tokenize(sent)
        stopword_list = nltk.corpus.stopwords.words('english')
        if is_lower_case:
            filtered_tokens = [token for token in tokens if token not in stopword_list]
        else:
            filtered_tokens = [token for token in tokens if token.lower() not in stopword_list]
        filtered_text = ' '.join(filtered_tokens)
        final_text.append(filtered_text)
    return final_text

def normalize(path_r, path_w, remove_characters = True, expand_contractions = True,
              remove_repeated_characters = True, spell_check = True, lemmatize_text = True,
              remove_stopwords = True, sent_tok = False, word_tok = False, lower = False):

    with open(path_r, 'r', encoding='utf-8')as copy:
        doc = copy.read()
    doc = unicodedata.normalize('NFKD', doc).encode('ascii', 'ignore').decode('utf-8', 'ignore')
    doc = nltk.sent_tokenize(doc)
    if remove_characters:
        doc = remove_char(doc)
        print('Finished filtering unnecessary characters')
    if expand_contractions:
        doc = expand_contra(doc, contractions)
        print('Finished expanding contractions')
    if remove_repeated_characters:
        doc = remove_repeated_char(doc)
        print('Finished removing repeated characters')
    if spell_check:
        doc = ' '.join(doc)
        doc = spellcheck.correct_text_generic(doc)
        doc = nltk.sent_tokenize(doc)
        print('Finished spellchecking')
    if lemmatize_text:
        doc = lemma(doc)
        print('Finished lemmatizing text')
    if remove_stopwords:
        doc = remove_stop(doc)
        # print('Finished stopwords removal')
    doc = ' '.join(doc)
    doc = re.sub(r' +', ' ', doc)
    if lower:
        doc.lower()
    if path_w:
        with open(path_w, 'w', encoding='utf-8') as new:
            new.write(doc)
    if sent_tok and word_tok:
        doc1 = nltk.sent_tokenize(doc)
        doc2 = nltk.word_tokenize(doc)
        return doc1, doc2
    elif sent_tok and not word_tok:
        doc = nltk.sent_tokenize(doc)
        print('Finished sentence tokenizing')
        return doc
    elif word_tok and not sent_tok:
        doc = nltk.word_tokenize(doc)
        print('Finished word tokenizing')
        return doc
    else:
        return doc
