from robot.api.deco import library
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn


# Resource        Initialize.robot


@library
class Customlib:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("hello")

    @keyword
    def add_items_to_cart_at_checkout(self, productslist):
        variable_val = BuiltIn().get_variable_value("${PRODUCT_BODY_FIELDS}")
        products_title = self.selLib.get_webelements(variable_val)
        i = 1
        for products in products_title:
            print(f"value of i is: {i}")
            if products.text in productslist:
                product_value = BuiltIn().get_variable_value("${PRODUCT_ADD_BUTTON}")
                run_time_loc = product_value.replace("HelloWorld", str(i))
                self.selLib.click_button(run_time_loc)

            i = i + 1


