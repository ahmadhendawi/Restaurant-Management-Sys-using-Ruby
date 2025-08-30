#arrays 
usernames = ["ahmad"]
passwords = ["1234"]
categories = Array.new(10)
category_count = 4
meals = Array.new(100)
prices = Array.new(100)
meal_categories = Array.new(100)
meal_count = 10
order_meals = Array.new(50)
order_prices = Array.new(50)
order_count = 0
default_categories = ["Appetizers", "Main Course", "Desserts" , "Beverages"]
default_meals = ["Water", "Cola", "Natural Juice ", "Burger", "Pizza" ,
    "Pasta", "Cake", "Cookies", "Fries", "Garlic bread"]
default_prices = [ 1.0, 2.0, 3.0 , 5.5, 6.5, 6.0, 3.0, 1.5, 1.5, 2.0 ]
default_mealcategories = ["Beverages", "Beverages", "Beverages", "Main Course", "Main Course",
    "Main Course", "Desserts", "Desserts", "Appetizers", "Appetizers"]
#filling arrays with default values
meals = default_meals
prices = default_prices
meal_categories = default_mealcategories
categories = default_categories
#methods
def login(usernames, passwords)
  puts "Welcome to the Restaurant Management System"
  print "Enter username: "
  username = gets.chomp
  print "Enter password: "
  password = gets.chomp
  while !usernames.include?(username) || !passwords.include?(password)
    puts "Invalid username or password. Please try again."
    print "Enter username: "
    username = gets.chomp
    print "Enter password: "
    password = gets.chomp
  end
  puts "Login successful!"
  return true
end
def displaymenu(categories, meals, meal_categories, prices)
  #loop over categories and then loop over meals to display them under their categories
  categories.each do |category|
    puts "\n--- #{category} ---"
    meals.each_with_index do |meal , j|
      if meal_categories[j] == category
        puts "#{meal} - $#{prices[j]}"
      end
    end
  end
  puts "\n ========================="
end

def addmealcategory(categories)
  #adds a new meal category to the categories array
  print "Enter new meal category name: "
  new_category = gets.chomp
  categories << new_category
  puts "Category '#{new_category}' added successfully."
  puts "\n ========================="
end

def addmeal(meals, prices, meal_categories,categories)
  #adds a new meal to the meals array with its price and category to be displayed in menu as well
  puts "enter a meal name: "
  meal_name= gets.chomp
  puts "enter a meal price: "
  meal_price= gets.chomp.to_f
  puts "enter a meal category: "
  meal_category= gets.chomp
  meals << meal_name
  prices << meal_price
  meal_categories << meal_category
  categories << meal_category
  puts "#{meal_name} added successfully."
  puts "\n ========================="
end

def createorder(order_meals, meals)
  puts "Enter your meal names to add to order and type 'done' when finished:"
  meal_name = gets.chomp.capitalize
  while meal_name.downcase != "done"
    if meals.include?(meal_name)
    order_meals << meal_name
    puts "#{meal_name} is added to order."
    else
      puts "#{meal_name} is not available in the menu."
    end
    meal_name = gets.chomp.capitalize
  end
  puts "Order created successfully."
  puts "\n ========================="
end

def createinvoice(order_count, order_meals, meals, prices)
  #generates a bill using the ordered meals and their prices
 puts "\n\t ---Invoice---"
 puts "Hendawiest Restaurant\n----------------------"
 total = 0.0
  order_meals.each do |ordered_meal|
    #find index of ordered meal in meals array to get its price
    index = meals.index(ordered_meal) #index of meal in meals array
    if index #if meal is found in meals array then get its price and add to total
      price = prices[index]
      total += price
      puts "#{ordered_meal} - $#{price}"
      puts "----------------------"
      puts "Your total bill is: $#{total}"
    end
  end
end

login(usernames, passwords)#login method call

  choice = 0 #main menu loop
while choice != 6
  puts "\n ---Main Menu---"
  puts "1. Display menu"
  puts "2. Add Meal Category"
  puts "3. Add Meal"
  puts "4. Create Order"
  puts "5. Create Invoice"
  puts "6. Exit"
   print "Enter your choice: "
  choice = gets.chomp.to_i

  if choice == 1
    displaymenu(categories, meals, meal_categories, prices,)
  elsif choice == 2
     addmealcategory(categories)
  elsif choice == 3
     addmeal(meals, prices, meal_categories,categories)
  elsif choice == 4
     createorder(order_meals, meals)
  elsif choice == 5
     createinvoice(order_count, order_meals, meals, prices)
  elsif choice == 6
    puts "Exiting the system. Goodbye!"
    break
  else
    puts "Invalid choice. Please try again."
  end
end
