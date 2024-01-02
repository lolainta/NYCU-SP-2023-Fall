#!/usr/bin/env python3
import time
import os

from selenium.webdriver import Chrome
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.common.exceptions import TimeoutException, WebDriverException

TIMEOUT = 5


def browse(path):
    options = Options()
    options.headless = True
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--no-expose-wasm')
    options.add_argument('--js-flags=--jitless')
    
    chrome = Chrome(options=options)
    chrome.set_page_load_timeout(TIMEOUT)
    chrome.set_script_timeout(TIMEOUT)

    try:
        # login
        base_url = 'http://web'
        username, password = 'admin', os.getenv('ADMIN_PASSWORD')

        chrome.get(base_url + "/login")
        chrome.find_element('name','username').send_keys(username)
        chrome.find_element('name','password').send_keys(password)
        # input[type="submit"]
        chrome.find_element(By.CSS_SELECTOR, 'input[type="submit"]').click()
        
        # visit
        chrome.get(base_url + path)
        time.sleep(TIMEOUT)
    except (TimeoutException, WebDriverException) as e:
        print(e)
    finally:
        chrome.quit()