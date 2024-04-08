####
# Nikolay S.
# Test CC Nums
#####

import re
import sys

PATTERN = r"^(?!.*(\d)(?:-?\1){3})(4|5|6)\d{3}(-?\d{4}){3}$"
def validate(number):
    # validating number
    if re.match(PATTERN, number):
        print("Valid")
    else:
        print("Invalid")


user_input = input("")
if int(user_input) > 100:
    print("Warning: Header integer is out of range:", user_input)
    sys.exit(1)


for cc_nums in range(0, int(user_input)):
    # get input for cc number
    cc_number = input("")
    # call validating func
    validate(cc_number)
