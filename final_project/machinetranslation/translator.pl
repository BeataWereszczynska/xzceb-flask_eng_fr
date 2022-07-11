"Translator created for training on Coursera"

#import json
import os
from ibm_watson import LanguageTranslatorV3
from ibm_cloud_sdk_core.authenticators import IAMAuthenticator
from dotenv import load_dotenv

load_dotenv()

apikey = os.environ['apikey']
url = os.environ['url']

authenticator = IAMAuthenticator(apikey)

language_translator = LanguageTranslatorV3(
    version='2018-05-01',
    authenticator=authenticator
)

language_translator.set_service_url(url)

def english_to_french(english_text):
    "Translates english to french"
    if not english_text:
        french_text = ''
    else:
        french_text = language_translator.translate(
        english_text, model_id='en-fr').get_result()["translations"][0]["translation"]

    return french_text

def french_to_english(french_text):
    "Translates french to english"
    if not french_text:
        english_text = ''
    else:
        english_text = language_translator.translate(
        french_text, model_id='fr-en').get_result()["translations"][0]["translation"]

    return english_text
