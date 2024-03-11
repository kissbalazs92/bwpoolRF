from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from webdriver_manager.microsoft import EdgeChromiumDriverManager

def get_chrome_driver_path():
    return ChromeDriverManager().install()

def get_firefox_driver_path():
    return GeckoDriverManager().install()

def get_edge_driver_path():
    return EdgeChromiumDriverManager().install()