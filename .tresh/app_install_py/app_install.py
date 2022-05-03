from selenium import webdriver
import yaml
from selenium.webdriver.common.keys import Keys

with open('./vars.yml') as vars:
    vars_dict = yaml.load(vars)

op = webdriver.ChromeOptions()
op.add_argument('--headless')
op.add_argument('--disable-gpu')
driver = webdriver.Chrome(
    executable_path='./app_install_py/chromedriver', options=op
)
driver.get("http://127.0.0.1:8080/install")

db_password = driver.find_element_by_name("db_password")
db_password.send_keys(vars_dict.get(sync_db_user_pass))
install = driver.find_element_by_class("ui primary button")
install.send_keys(Keys.RETURN)

