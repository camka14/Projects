import nltk, unicodedata, itertools, string, Text_Normalizer

sent_tokens = Text_Normalizer.normalize('web scrape.txt', 'keyphrases.txt', remove_characters = True, expand_contractions = True,
                                        remove_repeated_characters = False, spell_check = True, lemmatize_text = False, remove_stopwords = False,
                                        sent_tok = True, word_tok = False)

def word_freq(sent_tokens):
    word_tokens = [nltk.word_tokenize(sent) for sent in sent_tokens]
    word_freq_dict = {}
    for sent in word_tokens:
        for word in sent:
            if word not in word_freq_dict:
                word_freq_dict[word] = 0
            word_freq_dict += 1
    return word_freq_dict

word_freq_dict = word_freq(sent_tokens)
print(word_freq_dict)
