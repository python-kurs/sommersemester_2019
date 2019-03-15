from selenium.webdriver import Firefox
from selenium.webdriver.firefox.options import Options
import os
from time import sleep

OER_SITE = "https://oer.uni-marburg.de/login.php?target=crs_1153&cmd=force_login&lang=de"
MYUSERNAME = os.environ["SECRETUSERNAME"]
MYPW = os.environ["SECRETPW"]

opts = Options()
opts.set_headless()

browser = Firefox(options=opts) #executable_path = "/home/ro/Downloads/geckodriver")
browser.get(OER_SITE)

loginname = browser.find_element_by_id("username")
loginpw = browser.find_element_by_id("password")

loginname.send_keys(MYUSERNAME)
loginpw.send_keys(MYPW)

login_button = browser.find_element_by_name("cmd[doStandardAuthentication]")
login_button.click()

browser.get("https://oer.uni-marburg.de/ilias.php?baseClass=ilHTLMEditorGUI&ref_id=1156")

def delete_all():
    #select all files
    select_all = browser.find_element_by_class_name("ilTableSelectAll")
    select_all.find_element_by_tag_name("input").click()
    #click löschen
    delete = browser.find_element_by_class_name("ilTableCommandRow")
    delete.find_element_by_tag_name("input").click()
    ##confirm delete
    delete = browser.find_element_by_class_name("ilTableCommandRowTop")
    delete.find_element_by_name("cmd[deleteFile]").click()

    return

delete_all()
#delete_all()
#delete_all()

new_file = browser.find_element_by_id("new_file")
#get file_location with os path join
file_location = "./oer.zip"
new_file.send_keys(file_location)

upload_button = browser.find_element_by_name("cmd[uploadFile]")
upload_button.click()

sleep(180)

browser.refresh()

#click menu which contains unzip command
browser.find_element_by_id("ilAdvSelListAnchorText_asl").click()
unzip = browser.find_element_by_link_text("Entzippen")
unzip.click()

#log out
user_dropdown = browser.find_element_by_id("userlog")
user_dropdown.find_element_by_class_name("dropdown-toggle").click()
browser.find_element_by_link_text("Abmelden").click()

