import re

pattern = r"^(?!.*(\d)(?:-?\1){3})(4|5|6)\d{3}(-?\d{4}){3}$"
def validate(number):
    #print("Validating:", number)
    if re.match(pattern, number):
        #print(f"CC number: {number} is valid!")
        print("Valid")
    else:
        print("Invalid")


# with open('cc_data.txt', 'r') as file:
#     # get cc num from list
#     counter = 0
#     for c_num in file:
#         # case for file header
#         if counter == 0:
#             counter += 1
#             if 0 < int(c_num) < 100:
#                 # header within valid range
#                 #print("Header integer:", c_num)
#                 pass
#             else:
#                 print("Warning: Header integer is out of range:", c_num)
#         # call validating func
#         else:
#             validate(c_num.strip())

# read input for bum lines
#user_input = input("Enter number of following cc numbers: ")
user_input = input("")
if int(user_input) > 100:
    print("Warning: Header integer is out of range:", user_input)
    exit(1)



for cc_nums in range(0, int(user_input)):
    #cc_number = input("Enter cc number for validation: ")
    cc_number = input("")
    #print(f"You entered: {cc_number}")
    # call validating func
    validate(cc_number)