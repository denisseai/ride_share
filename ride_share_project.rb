# Program that will calculate and display information regarding the trips/rides
# a driver has completed.

# Hash of arrays will hold the hard coded information regarding each trip
drivers_stats = {
  DR0001: [
    {date: "3rd Feb 2016", cost: 10, rider_id: "RD0003", rating: 3},
    {date: "3rd Feb 2016", cost: 30, rider_id: "RD0015", rating: 4},
    {date: "5th Feb 2016", cost: 45, rider_id: "RD0003", rating: 2} 
  ],
  DR0002: [
    {date: "3rd Feb 2016", cost: 25, rider_id: "RD0073", rating: 5},
    {date: "4th Feb 2016", cost: 15, rider_id: "RD0013", rating: 1},
    {date: "5th Feb 2016", cost: 35, rider_id: "RD0066", rating: 3} 
  ],
  DR0003: [
    {date: "4th Feb 2016", cost: 5, rider_id: "RD0066", rating: 5},
    {date: "5th Feb 2016", cost: 50, rider_id: "RD0003", rating: 2}
  ],
  DR0004: [
    {date: "3rd Feb 2016", cost: 5, rider_id: "RD0022", rating: 5},
    {date: "4th Feb 2016", cost: 10, rider_id: "RD0022", rating: 4},
    {date: "5th Feb 2016", cost: 20, rider_id: "RD0073", rating: 5}
  ]  
}
# Arrays to hold trip's information
trip_cost = []
trip_rating = []
total_trip_cost = []
trip_ratings = []

# Gather all the information per ride and store in designated arrays

puts "\nThe results are as follow:"
# Find all trip/ride cost and rating per driver
drivers_stats.each do |driver_id, rides|
rides.each do |ride_info|
  trip_cost << ride_info[:cost]
  trip_rating << ride_info[:rating]
end
# Calculate and display number of rides done
puts "\nDriver #{driver_id} had a total of #{drivers_stats[driver_id].length} rides"
# Calculate and display amount of money made for the rides
puts "Making a grand total of $#{trip_cost.sum} for all the awsome rides"
# Calculate and display the average rating for driver
puts "Their average rating is #{'%.2f' % (trip_rating.sum.to_f/trip_rating.length)}"

# Calculate and store in arrays for later use
trip_ratings << '%.2f' % ((trip_rating.sum.to_f/trip_rating.length))
total_trip_cost << (trip_cost.sum)

# Clear the arrays for next driver
trip_cost.clear
trip_rating.clear
end 

# Calculate and display driver with highest average rating
puts "\nThe driver with the highest average rating was:"
puts "Driver DR000#{trip_ratings.index(trip_ratings.max) + 1} with an average rating of #{trip_ratings.max}" 

# Calculate and display driver with most money
puts "\nThe driver with highest earnings was:" 
puts "Driver DR000#{total_trip_cost.index(total_trip_cost.max) + 1} with earnings of $#{total_trip_cost.max}"

# For each driver calculate and display on which day they make the most money
daily_trips = {}
puts "\nThe following is the date with the highest earning for each driver:"
drivers_stats.each_key do |driver|
drivers_stats[driver].each do |ride|
  trip_date = ride[:date]
  if daily_trips.has_key? trip_date
    daily_trips[trip_date] += ride[:cost]
  else
    daily_trips[trip_date] = ride[:cost]
  end
end
max = daily_trips.max_by{|date, total| total}
puts "Driver #{driver} made the most amount of money on #{max.first}"
daily_trips.clear
end