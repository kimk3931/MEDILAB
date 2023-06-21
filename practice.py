# # Try/Except
# list = [4,5,5,4]

# OBJECT ORIENTED
# An object has state and behaviours
# States = properties/attributes that define an object -color,height,name, etc - (doesn't have brackets)
# Behaviour =what does the object do - the functionalities
# Examples: move(),eat(),
# In programming states - properties & behaviour are functions/method

class Fish():
    # contructor of properties
    def __init__(self):
        self.name = "Nemo"
        self.age = 1
        self.color = "yellow"
        self.weight = 4
# A function inside a class is a method
    def swim(self, lake) : #parameter
        message = (self.name, "can swim.",lake) 
        return message
    
    def jump(self) :
        message = self.name, "can jump"
        return message 
        
#  Call the Object/Instantiate
fish = Fish()
print(fish.age)
# print(fish.swim("L. Nakuru"))
message = fish.swim("L.Nakuru") #argument
print(type (message))
print(message)

bookings =[{
    'x':10,
    'y':15
}, {
    'x':100,
    'y':200
}]

for booking in bookings:
    member = {
        'b':78
    }
    # add key
    booking['z'] = member
    print(bookings)

