rideshare_data = [
    {
        driver_id: "DR0004",
        trips: [
            {
                date: "3rd Feb 2016",
                cost: 5,
                rider_id: "RD0022",
                rating: 5
            },
            {
                date: "4th Feb 2016",
                cost: 10,
                rider_id: "RD0022",
                rating: 4
            },
            {
                date: "5th Feb 2016",
                cost: 20,
                rider_id: "RD0073",
                rating: 4
            }
        ]

    },
    {
        driver_id: "DR0001",
        trips: [
            {
                date: "3rd Feb 2016",
                cost: 10,
                rider_id: "RD0003",
                rating: 3
            },
            {
                date: "3rd Feb 2016",
                cost: 30,
                rider_id: "RD0015",
                rating: 4
            },
            {
                date: "5th Feb 2016",
                cost: 45,
                rider_id: "RD0003",
                rating: 2
            }
        ]
    },
    {
        driver_id: "DR0002",
        trips: [
            {
                date: "3rd Feb 2016",
                cost: 25,
                rider_id: "RD0073",
                rating: 5
            },
            {
                date: "4th Feb 2016",
                cost: 15,
                rider_id: "RD0013",
                rating: 1
            },
            {
                date: "5th Feb 2016",
                cost: 35,
                rider_id: "RD0066",
                rating: 3
            }
        ]
    },
    {
        driver_id: "DR0003",
        trips: [
            {
                date: "4th Feb 2016",
                cost: 5,
                rider_id: "RD0066",
                rating: 5
            },
            {
                date: "5th Feb 2016",
                cost: 50,
                rider_id: "RD0003",
                rating: 2
            }
        ]
    }
]

# - the number of rides each driver has given
def number_of_rides(data)
  #iterate through each driver hash
  ride_number_array = data.map do |driver|
    driver_id = driver[:driver_id]
    len_rides = driver[:trips].length
    "#{driver_id} completed a total of #{len_rides} trips"
  end
end

puts number_of_rides(rideshare_data)

# - total amount of money each driver made
def total_money(data)
  data.map do |driver|
    driver_id = driver[:driver_id]
    cost = 0
    driver[:trips].each do |i|
      trip_cost = i[:cost]
      cost += trip_cost
    end
    "#{driver_id} made a total of #{cost}"
  end
end

puts total_money(rideshare_data)

# - average rating for each driver
def average_rating(data)
  data.map do |driver|
    driver_id = driver[:driver_id]
    total = 0
    driver[:trips].each do |i|
      rating = i[:rating]
      total += rating
    end
    average = total / driver[:trips].length
    "#{driver_id} has an average rating of #{average}"
  end
end

puts average_rating(rideshare_data)

# - which driver made the most money?
def most_money(data)
  top_driver = ""
  top_cost = 0
  data.each do |driver|
    driver_id = driver[:driver_id]
    cost = 0
    driver[:trips].each do |i|
      trip_cost = i[:cost]
      cost += trip_cost
    end
    if cost > top_cost
      top_cost = cost
      top_driver = driver_id
    end
  end
  return "#{top_driver} made the most money"
end

puts most_money(rideshare_data)

# - Which driver has the highest average rating?
def highest_rating(data)
  top_rating_driver = ""
  highest_average = 0
  data.each do |driver|
    overall_rating = 0
    driver_id = driver[:driver_id]
    rating = 0
    driver[:trips].each do |i|
      trip_rating = i[:rating]
      overall_rating += trip_rating
    end
    average = overall_rating / driver[:trips].length
    if average > highest_average
      highest_average = average
      top_rating_driver = driver_id
    end
  end
  return "#{top_rating_driver} had the highest average rating"
end

puts highest_rating(rideshare_data)

########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# # -array of all data, hash of each driver, array of each driver's trips, hash of each trip
# Which layers are nested in each other?
# -driver hash is nested in the overall array, the array of each driver's trips is nested in the driver hash, and the hash of each individual trip is nested in the trips array.
# Which layers of data "have" within it a different layer?
# -driver, trips, individual trips
# Which layers are "next" to each other?
# -each individual trip of each driver

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have
# -overall data: array
# -driver id: hash
# -trips: array
# -individual trips: hash

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?
#
# What things (objects, nouns) are represented or described in this file? We can think of at least six different things.
# answer: The things described in this file are driver id, date, cost, rider id, rating. All of these objects are strings
# From the things you listed in the previous question, all of those things have relationships to each other. (an ID belongs to a person, for instance. As an abstract, unrelated example a VIN belongs to a vehicle, and a vehicle has a VIN.) Consider the relationships between the pieces of data.
# answer: Driver id is associated with the rest of the data (date, cost, rider_id, rating). Rider id and rating are associated with both the rider and the driver. The data is organized by driver and date, then the rider, cost and rating are related to those pieces of information.
# Lastly, in this assignment, we will rearrange all of the data into one data structure (with a lot of nested layers), that can be held in one variable. List some ideas: considering all of the relationships listed in the last question, what piece of data can contain the others at the top-most level? (Compared to the json example before, think about what the top-most layer of the hash and what that represented.) There is more than one correct answer, so just list out the options at this moment.
# answer: I think the top most level could be organized by driver id, since all of the other pieces of data are related to the driver id. In this case, there could be a nested hash where the id is the key and a hash of the other data points are the value.
