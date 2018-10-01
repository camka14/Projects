import nltk, unicodedata, itertools, string, Text_Normalizer

sent_tokens, word_tokens = Text_Normalizer.normalize('web scrape.txt', None, remove_characters = True, expand_contractions = True,
                                        remove_repeated_characters = False, spell_check = False, lemmatize_text = False, remove_stopwords = True,
                                        sent_tok = True, word_tok = True, lower = True)
sent_final_tokens = Text_Normalizer.normalize('web scrape.txt', None, remove_characters = True, expand_contractions = True,
                                        remove_repeated_characters = False, spell_check = False, lemmatize_text = False, remove_stopwords = False,
                                        sent_tok = True, word_tok = False, lower = True)


def computeTF(sent_tokens):
    import numpy
    tf_dict = {}
    for sent in sent_tokens:
        sent_freq_dict = {}
        sent = nltk.word_tokenize(sent)
        for word in sent:
            if word not in sent_freq_dict:
                sent_freq_dict[word] = 0
            if word not in tf_dict:
                tf_dict[word] = []
            sent_freq_dict[word] += 1.0
        for word in sent:
            tf_dict[word].append(sent_freq_dict[word]/float(len(word_tokens)))
    for word in tf_dict:
        tf_dict[word] = numpy.mean(tf_dict[word])
    return tf_dict


def computeIDF(sent_tokens, word_tokens):
    import math
    idf_dict = {}
    word_set = set(word_tokens)
    N = len(sent_tokens)
    sent_tokens = [nltk.word_tokenize(sent) for sent in sent_tokens]
    for sent in sent_tokens:
        for word in word_set:
            if word not in idf_dict:
                idf_dict[word] = 0
            if word in sent:
                idf_dict[word] += 1
    for word in idf_dict:
        idf_dict[word] = math.log10(N/float(idf_dict[word]))
    return idf_dict


tf = computeTF(sent_tokens)
idf = computeIDF(sent_tokens, word_tokens)


sent_word_tokens = [nltk.word_tokenize(sent) for sent in sent_final_tokens]
sent_score = {}
word_score_dict = {}
count = 0
for sent in sent_word_tokens:
    count+=1
    sent_score[count] = []
    for word in sent:
        if word not in word_score_dict and word in tf:
            word_score_dict[word] = tf[word]*idf[word]
        if word in tf:
            sent_score[count].append(word_score_dict[word])
for sent in sent_score:
    sent_score[sent] = sum(sent_score[sent])/len(sent_score[sent])
sent_order = sorted(sent_score, key = lambda sent: sent_score[sent], reverse = True)
with open('Summary.txt', 'w') as f:
    for sent in sent_order:
        f.write(' '.join(sent_word_tokens[sent-1])+'\n')
